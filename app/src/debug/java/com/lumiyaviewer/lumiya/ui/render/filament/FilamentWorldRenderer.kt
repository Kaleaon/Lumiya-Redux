package com.lumiyaviewer.lumiya.ui.render.filament

import android.content.Context
import android.os.Handler
import android.os.HandlerThread
import android.view.Choreographer
import android.view.Surface
import android.view.SurfaceView
import com.google.android.filament.Box
import com.google.android.filament.Camera
import com.google.android.filament.ColorGrading
import com.google.android.filament.Engine
import com.google.android.filament.EntityManager
import com.google.android.filament.Filament
import com.google.android.filament.IndexBuffer
import com.google.android.filament.IndirectLight
import com.google.android.filament.LightManager
import com.google.android.filament.Material
import com.google.android.filament.MaterialInstance
import com.google.android.filament.RenderableManager
import com.google.android.filament.Renderer
import com.google.android.filament.Scene
import com.google.android.filament.SwapChain
import com.google.android.filament.ToneMapper
import com.google.android.filament.VertexBuffer
import com.google.android.filament.View
import com.google.android.filament.Viewport
import com.google.android.filament.android.DisplayHelper
import com.google.android.filament.android.UiHelper
import com.lumiyaviewer.lumiya.render.scene.MeshData
import com.lumiyaviewer.lumiya.render.scene.SceneDelta
import com.lumiyaviewer.lumiya.render.scene.SceneDeltaQueue
import com.lumiyaviewer.lumiya.render.scene.SceneGeometry
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.util.concurrent.CountDownLatch
import java.util.concurrent.TimeUnit
import java.util.concurrent.atomic.AtomicInteger
import kotlin.math.PI
import kotlin.math.cos
import kotlin.math.max
import kotlin.math.sin

/**
 * Filament renderer for the developer-only world view (stage F0 of
 * docs/modernization/viewer_gap_analysis_and_filament_plan.md): region terrain
 * and sky, fed by [SceneDelta]s.
 *
 * Every Filament call happens on one "engine thread" (§4.2). The engine is
 * created with the renderer and destroyed in [destroy]; the swap chain
 * follows the surface. Surface callbacks arrive on the UI thread and wait for
 * the engine thread, so the swap chain is gone before the surface is.
 */
class FilamentWorldRenderer(context: Context, private val surfaceView: SurfaceView, private val deltas: SceneDeltaQueue) {
    private val appContext = context.applicationContext
    private val thread = HandlerThread("FilamentEngine").apply { start() }
    private val handler = Handler(thread.looper)
    private val uiHelper = UiHelper(UiHelper.ContextErrorPolicy.DONT_CHECK)

    // Engine-thread state.
    private lateinit var engine: Engine
    private lateinit var renderer: Renderer
    private lateinit var scene: Scene
    private lateinit var view: View
    private lateinit var camera: Camera
    private lateinit var displayHelper: DisplayHelper
    private lateinit var colorGrading: ColorGrading
    private var cameraEntity = 0
    private var swapChain: SwapChain? = null
    private lateinit var skyMaterial: Material
    private lateinit var terrainMaterial: Material
    private lateinit var skyInstance: MaterialInstance
    private lateinit var terrainInstance: MaterialInstance
    private var sky: GpuMesh? = null
    private var sunEntity = 0
    private var indirectLight: IndirectLight? = null
    private val terrain = HashMap<Int, TerrainEntry>()
    private var width = 1
    private var height = 1
    private var running = false
    private var destroyed = false
    private var startNanos = 0L
    private var cameraYaw = 0.0

    /** Frames rendered since creation; read by the lifecycle test. */
    val framesRendered = AtomicInteger()

    @Volatile
    var yawOffset = 0.0

    private class GpuMesh(val entity: Int, val vertexBuffer: VertexBuffer, val indexBuffer: IndexBuffer)
    private class TerrainEntry(val mesh: GpuMesh, val patch: SceneDelta.TerrainPatch)

    private val frameCallback = object : Choreographer.FrameCallback {
        override fun doFrame(frameTimeNanos: Long) {
            if (!running || destroyed) {
                return
            }
            Choreographer.getInstance().postFrameCallback(this)
            applyDeltas()
            updateCamera(frameTimeNanos)
            val chain = swapChain ?: return
            if (uiHelper.isReadyToRender && renderer.beginFrame(chain, frameTimeNanos)) {
                renderer.render(view)
                renderer.endFrame()
                framesRendered.incrementAndGet()
            }
        }
    }

    init {
        runOnEngine { createEngine() }
        uiHelper.renderCallback = object : UiHelper.RendererCallback {
            override fun onNativeWindowChanged(surface: Surface) = runOnEngine {
                swapChain?.let { engine.destroySwapChain(it) }
                swapChain = engine.createSwapChain(surface)
                surfaceView.display?.let { displayHelper.attach(renderer, it) }
            }

            override fun onDetachedFromSurface() = runOnEngine {
                displayHelper.detach()
                swapChain?.let {
                    engine.destroySwapChain(it)
                    // The surface is released when this returns; the GPU must be done with it.
                    engine.flushAndWait()
                }
                swapChain = null
            }

            override fun onResized(width: Int, height: Int) = runOnEngine {
                this@FilamentWorldRenderer.width = max(width, 1)
                this@FilamentWorldRenderer.height = max(height, 1)
                view.viewport = Viewport(0, 0, this@FilamentWorldRenderer.width, this@FilamentWorldRenderer.height)
                camera.setProjection(60.0, this@FilamentWorldRenderer.width.toDouble() / this@FilamentWorldRenderer.height, 0.5, 2000.0, Camera.Fov.VERTICAL)
            }
        }
        uiHelper.attachTo(surfaceView)
    }

    fun resume() = post {
        if (!running && !destroyed) {
            running = true
            Choreographer.getInstance().postFrameCallback(frameCallback)
        }
    }

    fun pause() = post {
        running = false
        Choreographer.getInstance().removeFrameCallback(frameCallback)
    }

    /** Releases every Filament object, the engine and the engine thread. Call from the UI thread. */
    fun destroy() {
        // Detaching triggers onDetachedFromSurface, which destroys the swap chain.
        uiHelper.detach()
        runOnEngine {
            running = false
            destroyed = true
            Choreographer.getInstance().removeFrameCallback(frameCallback)
            destroyEngine()
        }
        thread.quitSafely()
        thread.join(2000)
    }

    private fun post(block: () -> Unit) {
        handler.post(block)
    }

    /** Runs [block] on the engine thread and waits for it (UI-thread callers). */
    private fun runOnEngine(block: () -> Unit) {
        if (Thread.currentThread() === thread) {
            block()
            return
        }
        val done = CountDownLatch(1)
        var failure: Throwable? = null
        handler.post {
            try {
                block()
            } catch (t: Throwable) {
                failure = t
            } finally {
                done.countDown()
            }
        }
        if (!done.await(5, TimeUnit.SECONDS)) {
            throw IllegalStateException("Filament engine thread did not respond")
        }
        failure?.let { throw it }
    }

    private fun createEngine() {
        Filament.init()
        engine = Engine.create()
        renderer = engine.createRenderer()
        scene = engine.createScene()
        view = engine.createView()
        cameraEntity = EntityManager.get().create()
        camera = engine.createCamera(cameraEntity)
        // Exposure 1: the sky and Windlight colours are display values, not physical units.
        camera.setExposure(1.0f)
        view.scene = scene
        view.camera = camera
        colorGrading = ColorGrading.Builder().toneMapper(ToneMapper.Linear()).build(engine)
        view.colorGrading = colorGrading
        displayHelper = DisplayHelper(appContext, handler)
        renderer.clearOptions = renderer.clearOptions.apply {
            clear = true
            clearColor = doubleArrayOf(0.0, 0.0, 0.0, 1.0)
        }

        skyMaterial = loadMaterial("materials/sl_sky.filamat")
        terrainMaterial = loadMaterial("materials/sl_terrain.filamat")
        skyInstance = skyMaterial.createInstance()
        terrainInstance = terrainMaterial.createInstance()
        // Default Second Life terrain detail colours, low to high (dirt, grass, mountain, rock).
        terrainInstance.setParameter("color0", 0.36f, 0.30f, 0.22f)
        terrainInstance.setParameter("color1", 0.30f, 0.42f, 0.18f)
        terrainInstance.setParameter("color2", 0.42f, 0.40f, 0.34f)
        terrainInstance.setParameter("color3", 0.55f, 0.54f, 0.52f)
        terrainInstance.setParameter("startHeight", 20f)
        terrainInstance.setParameter("heightRange", 40f)

        sky = createMesh(SceneGeometry.skyDome(), skyInstance, priority = 0, culling = false)

        sunEntity = EntityManager.get().create()
        LightManager.Builder(LightManager.Type.DIRECTIONAL)
            .color(1f, 1f, 1f)
            .intensity(PI.toFloat())
            .direction(0f, 0f, -1f)
            .castShadows(false)
            .build(engine, sunEntity)
        scene.addEntity(sunEntity)
        setAmbient(floatArrayOf(0.3f, 0.3f, 0.35f))
        startNanos = System.nanoTime()
    }

    private fun destroyEngine() {
        for (entry in terrain.values) {
            destroyMesh(entry.mesh)
        }
        terrain.clear()
        sky?.let { destroyMesh(it) }
        sky = null
        engine.destroyEntity(sunEntity)
        EntityManager.get().destroy(sunEntity)
        indirectLight?.let { engine.destroyIndirectLight(it) }
        indirectLight = null
        engine.destroyMaterialInstance(skyInstance)
        engine.destroyMaterialInstance(terrainInstance)
        engine.destroyMaterial(skyMaterial)
        engine.destroyMaterial(terrainMaterial)
        engine.destroyColorGrading(colorGrading)
        swapChain?.let { engine.destroySwapChain(it) }
        swapChain = null
        engine.destroyView(view)
        engine.destroyScene(scene)
        engine.destroyCameraComponent(cameraEntity)
        EntityManager.get().destroy(cameraEntity)
        engine.destroyRenderer(renderer)
        engine.destroy()
    }

    private fun loadMaterial(assetPath: String): Material {
        val bytes = appContext.assets.open(assetPath).use { it.readBytes() }
        val buffer = ByteBuffer.allocateDirect(bytes.size).order(ByteOrder.nativeOrder())
        buffer.put(bytes).flip()
        return Material.Builder().payload(buffer, buffer.remaining()).build(engine)
    }

    private fun createMesh(data: MeshData, material: MaterialInstance, priority: Int, culling: Boolean): GpuMesh {
        val hasTangents = data.tangents != null
        val builder = VertexBuffer.Builder()
            .vertexCount(data.vertexCount)
            .bufferCount(if (hasTangents) 2 else 1)
            .attribute(VertexBuffer.VertexAttribute.POSITION, 0, VertexBuffer.AttributeType.FLOAT3, 0, 12)
        if (hasTangents) {
            builder.attribute(VertexBuffer.VertexAttribute.TANGENTS, 1, VertexBuffer.AttributeType.FLOAT4, 0, 16)
        }
        val vertexBuffer = builder.build(engine)
        vertexBuffer.setBufferAt(engine, 0, floatBuffer(data.positions))
        data.tangents?.let { vertexBuffer.setBufferAt(engine, 1, floatBuffer(it)) }
        val indexBuffer = IndexBuffer.Builder()
            .indexCount(data.indices.size)
            .bufferType(IndexBuffer.Builder.IndexType.USHORT)
            .build(engine)
        val indices = ByteBuffer.allocateDirect(data.indices.size * 2).order(ByteOrder.nativeOrder())
        indices.asShortBuffer().put(data.indices)
        indexBuffer.setBuffer(engine, indices)

        val entity = EntityManager.get().create()
        RenderableManager.Builder(1)
            .boundingBox(bounds(data.positions))
            .geometry(0, RenderableManager.PrimitiveType.TRIANGLES, vertexBuffer, indexBuffer, 0, data.indices.size)
            .material(0, material)
            .priority(priority)
            .culling(culling)
            .castShadows(false)
            .receiveShadows(false)
            .build(engine, entity)
        scene.addEntity(entity)
        return GpuMesh(entity, vertexBuffer, indexBuffer)
    }

    private fun destroyMesh(mesh: GpuMesh) {
        scene.removeEntity(mesh.entity)
        engine.destroyEntity(mesh.entity)
        EntityManager.get().destroy(mesh.entity)
        engine.destroyVertexBuffer(mesh.vertexBuffer)
        engine.destroyIndexBuffer(mesh.indexBuffer)
    }

    private fun applyDeltas() {
        for (delta in deltas.drain()) {
            when (delta) {
                is SceneDelta.TerrainPatch -> {
                    val old = terrain[delta.key]
                    if (old != null && old.patch.sameHeightsAs(delta)) {
                        continue
                    }
                    old?.let { destroyMesh(it.mesh) }
                    terrain[delta.key] = TerrainEntry(createMesh(SceneGeometry.terrainPatch(delta), terrainInstance, priority = 4, culling = true), delta)
                }
                is SceneDelta.Environment -> applyEnvironment(delta)
            }
        }
    }

    private fun applyEnvironment(env: SceneDelta.Environment) {
        skyInstance.setParameter("zenithColor", env.zenithColor[0], env.zenithColor[1], env.zenithColor[2])
        skyInstance.setParameter("horizonColor", env.horizonColor[0], env.horizonColor[1], env.horizonColor[2])
        skyInstance.setParameter("sunColor", env.sunColor[0], env.sunColor[1], env.sunColor[2])
        skyInstance.setParameter("sunDirection", env.sunDirection[0], env.sunDirection[1], env.sunDirection[2])
        val lights = engine.lightManager
        val light = lights.getInstance(sunEntity)
        val peak = max(env.sunColor[0], max(env.sunColor[1], env.sunColor[2]))
        if (peak > 0f) {
            lights.setColor(light, env.sunColor[0] / peak, env.sunColor[1] / peak, env.sunColor[2] / peak)
        }
        // Lit diffuse is albedo / pi * illuminance, so pi * peak shows the preset colour on a white face.
        lights.setIntensity(light, PI.toFloat() * peak)
        lights.setDirection(light, -env.sunDirection[0], -env.sunDirection[1], -env.sunDirection[2])
        setAmbient(env.ambientColor)
    }

    private fun setAmbient(color: FloatArray) {
        indirectLight?.let {
            scene.indirectLight = null
            engine.destroyIndirectLight(it)
        }
        val light = IndirectLight.Builder()
            .irradiance(1, floatArrayOf(color[0], color[1], color[2]))
            .intensity(1f)
            .build(engine)
        scene.indirectLight = light
        indirectLight = light
    }

    /** Slow orbit around the region centre; drag adds [yawOffset]. */
    private fun updateCamera(frameTimeNanos: Long) {
        val seconds = (frameTimeNanos - startNanos) / 1e9
        cameraYaw = seconds * 0.05 + yawOffset
        val eyeX = 128.0 + 150.0 * cos(cameraYaw)
        val eyeY = 128.0 + 150.0 * sin(cameraYaw)
        val eyeZ = 90.0
        camera.lookAt(eyeX, eyeY, eyeZ, 128.0, 128.0, 25.0, 0.0, 0.0, 1.0)
        sky?.let {
            val tm = engine.transformManager
            val s = 1000f
            tm.setTransform(
                tm.getInstance(it.entity),
                floatArrayOf(s, 0f, 0f, 0f, 0f, s, 0f, 0f, 0f, 0f, s, 0f, eyeX.toFloat(), eyeY.toFloat(), eyeZ.toFloat(), 1f),
            )
        }
    }

    private companion object {
        fun floatBuffer(values: FloatArray): ByteBuffer {
            val buffer = ByteBuffer.allocateDirect(values.size * 4).order(ByteOrder.nativeOrder())
            buffer.asFloatBuffer().put(values)
            return buffer
        }

        fun bounds(positions: FloatArray): Box {
            val min = floatArrayOf(Float.MAX_VALUE, Float.MAX_VALUE, Float.MAX_VALUE)
            val maxV = floatArrayOf(-Float.MAX_VALUE, -Float.MAX_VALUE, -Float.MAX_VALUE)
            for (i in positions.indices) {
                val axis = i % 3
                min[axis] = minOf(min[axis], positions[i])
                maxV[axis] = maxOf(maxV[axis], positions[i])
            }
            return Box(min, maxV)
        }
    }
}
