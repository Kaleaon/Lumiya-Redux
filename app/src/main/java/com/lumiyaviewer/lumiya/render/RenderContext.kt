package com.lumiyaviewer.lumiya.render

import android.graphics.Bitmap
import android.opengl.GLES10
import android.opengl.GLES11
import android.opengl.GLES20
import android.opengl.GLES30
import android.opengl.Matrix
import androidx.core.os.EnvironmentCompat
import com.google.common.base.Strings
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.GlobalOptions
import com.lumiyaviewer.lumiya.LumiyaApp
import com.lumiyaviewer.lumiya.openjpeg.OpenJPEG
import com.lumiyaviewer.lumiya.render.backend.RenderBackend
import com.lumiyaviewer.lumiya.render.backend.RenderBackendFactory
import com.lumiyaviewer.lumiya.render.drawable.DrawableFaceTexture
import com.lumiyaviewer.lumiya.render.caps.GpuCapabilities
import com.lumiyaviewer.lumiya.render.glres.GLAsyncLoadQueue
import com.lumiyaviewer.lumiya.render.glres.GLLoadQueue
import com.lumiyaviewer.lumiya.render.glres.GLQuery
import com.lumiyaviewer.lumiya.render.glres.GLResourceManager
import com.lumiyaviewer.lumiya.render.glres.GLSyncLoadQueue
import com.lumiyaviewer.lumiya.render.glres.textures.GLLoadedTexture
import com.lumiyaviewer.lumiya.render.shaders.AvatarProgram
import com.lumiyaviewer.lumiya.render.shaders.BoundingBoxProgram
import com.lumiyaviewer.lumiya.render.shaders.FXAAProgram
import com.lumiyaviewer.lumiya.render.shaders.FlexiPrimProgram
import com.lumiyaviewer.lumiya.render.shaders.PrimProgram
import com.lumiyaviewer.lumiya.render.shaders.QuadProgram
import com.lumiyaviewer.lumiya.render.shaders.RawShaderProgram
import com.lumiyaviewer.lumiya.render.shaders.RiggedMeshProgram
import com.lumiyaviewer.lumiya.render.shaders.RiggedMeshProgram30
import com.lumiyaviewer.lumiya.render.shaders.ShaderCompileException
import com.lumiyaviewer.lumiya.render.shaders.ShaderPreprocessor
import com.lumiyaviewer.lumiya.render.shaders.SkyCloudsProgram
import com.lumiyaviewer.lumiya.render.shaders.SkyProgram
import com.lumiyaviewer.lumiya.render.shaders.StarsProgram
import com.lumiyaviewer.lumiya.render.shaders.WaterProgram
import com.lumiyaviewer.lumiya.slproto.avatar.SLSkeletonBoneID
import com.lumiyaviewer.lumiya.slproto.mesh.MeshData
import com.lumiyaviewer.lumiya.slproto.mesh.MeshRiggingData
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import com.lumiyaviewer.lumiya.slproto.windlight.WindlightDay
import com.lumiyaviewer.lumiya.slproto.windlight.WindlightPreset
import com.lumiyaviewer.rawbuffers.DirectByteBuffer
import java.nio.Buffer
import java.util.LinkedList
import javax.microedition.khronos.egl.EGL
import javax.microedition.khronos.egl.EGL10
import javax.microedition.khronos.egl.EGLConfig
import javax.microedition.khronos.egl.EGLContext
import javax.microedition.khronos.egl.EGLDisplay

class RenderContext(
    eglConfig: EGLConfig,
    val gpuCapabilities: GpuCapabilities,
    avatarCountLimit: Int,
    terrainTextures: Boolean,
    fontSize: Int,
    useExternalTextures: Boolean,
    renderer: Any?
) {
    val hasGL20: Boolean
    val hasGL11: Boolean
    val hasGL30: Boolean
    val hasVBO: Boolean
    val useVBO: Boolean
    val useFXAA: Boolean

    val avatarProgram: AvatarProgram?
    val boundingBox: BoundingBox?
    val boundingBoxProgram: BoundingBoxProgram?
    val crosshairTexture: GLLoadedTexture?
    var curPrimProgram: PrimProgram? = null
    var drawDistance: Float = 0f
    val drawableStore: DrawableStore
    val extTextureProgram: RawShaderProgram?
    val flexiPrimOpaqueProgram: FlexiPrimProgram?
    val flexiPrimProgram: FlexiPrimProgram?
    val fxaaProgram: FXAAProgram?
    private val glRenderer: String
    val glResourceManager: GLResourceManager
    private val loadQueue: GLLoadQueue
    val primOpaqueProgram: PrimProgram?
    val primProgram: PrimProgram?
    val quad: Quad
    val quadProgram: QuadProgram?
    val rawShaderProgram: RawShaderProgram?
    val renderBackend: RenderBackend
    val riggedMeshProgram: RiggedMeshProgram?
    private val riggedMeshProgram30: RiggedMeshProgram30?
    private val riggedMeshProgramOpaque30: RiggedMeshProgram30?
    private val shaderCompileErrors: Boolean
    val skyProgram: SkyProgram?
    val starsProgram: StarsProgram?
    val waterProgram: WaterProgram?
    var waterTime: Float = 0f
    val windlightPreset: WindlightPreset
    val windlightSky: WindlightSky?

    @JvmField val viewportRect = IntArray(4)
    @JvmField var FOVAngle = 60.0f
    @JvmField var aspectRatio = 1.0f
    @JvmField val nearPlane = NEAR_PLANE
    @JvmField val projectionMatrix = MatrixStack()
    @JvmField val projectionHUDMatrix = MatrixStack()
    @JvmField val modelViewMatrix = MatrixStack()
    @JvmField val objWorldMatrix = MatrixStack()
    @JvmField var scaleX = 1.0f
    @JvmField var scaleY = 1.0f
    @JvmField var scaleZ = 1.0f
    @JvmField var underWater = false
    @JvmField val windlightDay = WindlightDay()
    @JvmField val myAviPosition = LLVector3()
    @JvmField val frameCamera = LLVector3()

    private val frameKeepBuffers: MutableList<DirectByteBuffer> = LinkedList()
    private val frameKeepTextures: MutableList<OpenJPEG> = LinkedList()
    private val frameKeepBitmaps: MutableList<Bitmap> = LinkedList()

    @JvmField var currentRiggedMeshProgram: RiggedMeshProgram30? = null
    private var boundMeshRiggingData: MeshRiggingData? = null
    private var boundFaceTexture: DrawableFaceTexture? = null
    @JvmField var frameCount = 0
    private val activeOcclusionQueries = LinkedList<GLQuery>()

    private var activeProjectionMatrix: MatrixStack? = null

    private class Shaders30 private constructor(shaderPreprocessor: ShaderPreprocessor) {
        val boundingBoxProgram: BoundingBoxProgram
        val riggedMeshProgram30: RiggedMeshProgram30
        val riggedMeshProgramOpaque30: RiggedMeshProgram30

        init {
            riggedMeshProgram30 = RiggedMeshProgram30(false)
            riggedMeshProgramOpaque30 = RiggedMeshProgram30(true)
            boundingBoxProgram = BoundingBoxProgram()
            riggedMeshProgram30.Compile(shaderPreprocessor)
            riggedMeshProgramOpaque30.Compile(shaderPreprocessor)
            boundingBoxProgram.Compile(shaderPreprocessor)
        }

        companion object {
            @JvmStatic
            fun create(shaderPreprocessor: ShaderPreprocessor): Shaders30 = Shaders30(shaderPreprocessor)
        }
    }

    init {
        glRenderer = Strings.nullToEmpty(gpuCapabilities.glRenderer)
        var gl30 = gpuCapabilities.selectedTier != GpuCapabilities.CompatibilityTier.TIER_C
        val reportsEs11 = gpuCapabilities.reportsEs11
        val supportsVbo = gpuCapabilities.supportsVbo
        hasGL20 = gl30
        hasGL11 = reportsEs11
        hasVBO = supportsVbo
        useVBO = gl30 || gpuCapabilities.supportsEs3 || (reportsEs11 && supportsVbo)
        useFXAA = if (gl30) GlobalOptions.getInstance().useFXAA else false

        var compileErrors: Boolean
        if (gl30) {
            val gpuDetection = GPUDetection(glRenderer)
            Debug.AlwaysPrintf(
                "Detected GPU family '%s', version '%s', numeric version %d",
                gpuDetection.detectedFamily.or(EnvironmentCompat.MEDIA_UNKNOWN),
                gpuDetection.detectedVersion.or(EnvironmentCompat.MEDIA_UNKNOWN),
                gpuDetection.detectedNumericVersion
            )
            val hashMap = HashMap<String, String>()
            hashMap["__NUM_BASE_JOINTS__"] = 26.toString()
            hashMap["__NUM_BASE_BONE_VECTORS__"] = 156.toString()
            hashMap["__MAX_RIGGED_MESH_BONES__"] = (SLSkeletonBoneID.VALUES.size + 47).toString()
            hashMap["__MAX_RIGGED_MESH_JOINTS__"] = MeshData.MAX_RIGGED_MESH_JOINTS.toString()
            if (gpuDetection.detectedFamily.or("") == GPUDetection.GPU_FAMILY_ADRENO) {
                hashMap["__ADRENO__"] = ""
                if (gpuCapabilities.quirkDisableEs3Shaders) {
                    gl30 = false
                }
            }
            val shaderPreprocessor = ShaderPreprocessor(hashMap)
            primProgram = PrimProgram(false)
            primOpaqueProgram = PrimProgram(true)
            waterProgram = WaterProgram()
            avatarProgram = AvatarProgram()
            flexiPrimProgram = FlexiPrimProgram(false)
            flexiPrimOpaqueProgram = FlexiPrimProgram(true)
            riggedMeshProgram = RiggedMeshProgram(false)
            fxaaProgram = FXAAProgram()
            skyProgram = if (GlobalOptions.getInstance().renderClouds) SkyCloudsProgram() else SkyProgram()
            quadProgram = QuadProgram()
            starsProgram = StarsProgram()
            if (useExternalTextures) {
                extTextureProgram = RawShaderProgram(true)
                rawShaderProgram = RawShaderProgram(false)
            } else {
                extTextureProgram = null
                rawShaderProgram = null
            }
            Debug.Printf("Renderer: Going to compile shaders.")
            compileErrors = try {
                compileShaders(shaderPreprocessor)
                false
            } catch (e: ShaderCompileException) {
                Debug.Warning(e)
                true
            }
            Debug.AlwaysPrintf("Renderer: Shaders compiled, errors: %b.", compileErrors)
            if (gl30) {
                val shaders30 = try {
                    Shaders30.create(shaderPreprocessor)
                } catch (e: ShaderCompileException) {
                    Debug.Printf("Renderer: 3.0 shaders failed to compile: ${e.message}")
                    null
                }
                if (shaders30 != null) {
                    Debug.AlwaysPrintf("Renderer: 3.0 shaders compiled.")
                    riggedMeshProgram30 = shaders30.riggedMeshProgram30
                    riggedMeshProgramOpaque30 = shaders30.riggedMeshProgramOpaque30
                    boundingBoxProgram = shaders30.boundingBoxProgram
                } else {
                    Debug.AlwaysPrintf("Renderer: 3.0 shaders did not compile.")
                    riggedMeshProgram30 = null
                    riggedMeshProgramOpaque30 = null
                    boundingBoxProgram = null
                    gl30 = false
                }
            } else {
                riggedMeshProgram30 = null
                riggedMeshProgramOpaque30 = null
                boundingBoxProgram = null
            }
        } else {
            primProgram = null
            primOpaqueProgram = null
            waterProgram = null
            avatarProgram = null
            flexiPrimProgram = null
            flexiPrimOpaqueProgram = null
            riggedMeshProgram = null
            riggedMeshProgram30 = null
            riggedMeshProgramOpaque30 = null
            boundingBoxProgram = null
            fxaaProgram = null
            skyProgram = null
            quadProgram = null
            starsProgram = null
            extTextureProgram = null
            rawShaderProgram = null
            compileErrors = false
        }
        hasGL30 = gl30
        shaderCompileErrors = compileErrors
        quad = Quad()
        glResourceManager = GLResourceManager()
        windlightPreset = WindlightPreset()
        loadQueue = createLoadQueue(eglConfig)
        drawableStore = DrawableStore(loadQueue, gl30, avatarCountLimit, terrainTextures, fontSize, renderer)
        boundingBox = if (compileErrors || !gl30) null else BoundingBox(this)
        windlightSky = if (useExternalTextures) WindlightSky(this) else null
        renderBackend = RenderBackendFactory.createBackend()
        renderBackend.onContextInitialized(this)
        crosshairTexture = if (supportsVbo) {
            GLLoadedTexture.loadFromAssets(this, LumiyaApp.getContext(), "misc/crosshair.png")
        } else null
    }

    private fun compileShaders(shaderPreprocessor: ShaderPreprocessor) {
        if (hasGL20) {
            primProgram!!.Compile(shaderPreprocessor)
            primOpaqueProgram!!.Compile(shaderPreprocessor)
            waterProgram!!.Compile(shaderPreprocessor)
            avatarProgram!!.Compile(shaderPreprocessor)
            flexiPrimProgram!!.Compile(shaderPreprocessor)
            flexiPrimOpaqueProgram!!.Compile(shaderPreprocessor)
            riggedMeshProgram!!.Compile(shaderPreprocessor)
            fxaaProgram!!.Compile(shaderPreprocessor)
            skyProgram!!.Compile(shaderPreprocessor)
            starsProgram!!.Compile(shaderPreprocessor)
            quadProgram!!.Compile(shaderPreprocessor)
            extTextureProgram?.Compile(shaderPreprocessor)
            rawShaderProgram?.Compile(shaderPreprocessor)
        }
    }

    private fun clearRiggingMeshData() {
        boundMeshRiggingData = null
    }

    private fun createLoadQueue(eglConfig: EGLConfig): GLLoadQueue {
        Debug.Printf("TexLoad: creating load queue.")
        if (hasGL20 && !gpuCapabilities.quirkDisableAsyncLoadQueue) {
            val egl = EGLContext.getEGL()
            if (egl is EGL10) {
                try {
                    val display = egl.eglGetCurrentDisplay()
                    if (display != null && display != EGL10.EGL_NO_DISPLAY) {
                        return GLAsyncLoadQueue(this, egl, egl.eglGetCurrentDisplay(), eglConfig, hasGL30)
                    }
                } catch (e: InstantiationException) {
                    Debug.Warning(e)
                }
            }
        }
        return GLSyncLoadQueue()
    }

    private fun initPrimProgram(primProgram: PrimProgram, useWindlight: Boolean) {
        renderBackend.useProgram(primProgram.getHandle())
        renderBackend.setUniform1i(primProgram.sTexture, 0)
        primProgram.SetupLighting(this, if (useWindlight) windlightPreset else null)
    }

    internal fun clearFrameKeeps() {
        frameKeepTextures.clear()
        frameKeepBuffers.clear()
        frameKeepBitmaps.clear()
    }

    fun keepBuffer(directByteBuffer: DirectByteBuffer) {
        frameKeepBuffers.add(directByteBuffer)
    }

    fun keepTexture(bitmap: Bitmap) {
        frameKeepBitmaps.add(bitmap)
    }

    fun keepTexture(openJPEG: OpenJPEG) {
        frameKeepTextures.add(openJPEG)
    }

    internal fun runLoadQueue() {
        loadQueue.RunLoadQueue(this)
    }

    internal fun stopLoadQueue() {
        loadQueue.StopLoadQueue()
    }

    fun bindFaceTexture(drawableFaceTexture: DrawableFaceTexture?) {
        if (boundFaceTexture !== drawableFaceTexture) {
            boundFaceTexture = drawableFaceTexture
            val glDraw = drawableFaceTexture?.GLDraw(this) ?: false
            curPrimProgram?.setTextureEnabled(glDraw)
            if (!glDraw) {
                renderBackend.unbindTexture2D()
            }
        }
    }

    fun bindRiggingMeshData(meshRiggingData: MeshRiggingData?) {
        if (boundMeshRiggingData !== meshRiggingData) {
            meshRiggingData?.SetupBuffers30(this)
            boundMeshRiggingData = meshRiggingData
        }
    }

    fun clearFaceTexture() {
        boundFaceTexture = null
    }

    fun clearRiggedMeshProgram() {
        currentRiggedMeshProgram = null
        curPrimProgram = null
        GLES30.glBindVertexArray(0)
        renderBackend.unbindTexture2D()
        renderBackend.useProgram(0)
        clearRiggingMeshData()
        clearFaceTexture()
    }

    fun enqueueOcclusionQuery(glQuery: GLQuery) {
        activeOcclusionQueries.add(glQuery)
    }

    internal fun getActiveProjectionMatrix(): MatrixStack? = activeProjectionMatrix

    internal fun getShaderCompileErrors(): Boolean = shaderCompileErrors

    fun glBindArrayBuffer(i: Int) {
        if (hasGL20) GLES20.glBindBuffer(34962, i) else GLES11.glBindBuffer(34962, i)
    }

    fun glBindElementArrayBuffer(i: Int) {
        if (hasGL20) GLES20.glBindBuffer(34963, i) else GLES11.glBindBuffer(34963, i)
    }

    fun glBufferArrayData(size: Int, buffer: Buffer, dynamic: Boolean) {
        val usage = if (dynamic) 35048 else 35044
        if (hasGL20) GLES20.glBufferData(34962, size, buffer, usage)
        else GLES11.glBufferData(34962, size, buffer, usage)
    }

    fun glBufferElementArrayData(size: Int, buffer: Buffer, dynamic: Boolean) {
        val usage = if (dynamic) 35048 else 35044
        if (hasGL20) GLES20.glBufferData(34963, size, buffer, usage)
        else GLES11.glBufferData(34963, size, buffer, usage)
    }

    fun glGenBuffers(count: Int, buffers: IntArray, offset: Int) {
        if (hasGL20) GLES20.glGenBuffers(count, buffers, offset)
        else GLES11.glGenBuffers(count, buffers, offset)
    }

    fun glModelApplyMatrix(uniformLocation: Int) {
        if (hasGL20) {
            modelViewMatrix.glApplyUniformMatrix(uniformLocation)
        }
    }

    fun glModelMultMatrixf(floats: FloatArray, offset: Int) {
        if (!hasGL20) {
            GLES10.glMultMatrixf(floats, offset)
        }
        modelViewMatrix.glMultMatrixf(floats, offset)
    }

    fun glModelPopMatrix() {
        if (!hasGL20) {
            GLES10.glPopMatrix()
        }
        modelViewMatrix.glPopMatrix()
    }

    fun glModelPushAndMultMatrixf(floats: FloatArray, offset: Int) {
        if (!hasGL20) {
            GLES10.glPushMatrix()
            GLES10.glMultMatrixf(floats, offset)
        }
        modelViewMatrix.glPushAndMultMatrixf(floats, offset)
    }

    fun glModelPushMatrix() {
        if (!hasGL20) {
            GLES10.glPushMatrix()
        }
        modelViewMatrix.glPushMatrix()
    }

    internal fun glModelResetIdentity() {
        modelViewMatrix.reset()
        modelViewMatrix.glLoadIdentity()
        objWorldMatrix.reset()
        objWorldMatrix.glLoadIdentity()
        scaleX = 1.0f
        scaleY = 1.0f
        scaleZ = 1.0f
    }

    internal fun glModelRotatef(angle: Float, x: Float, y: Float, z: Float) {
        if (!hasGL20) {
            GLES10.glRotatef(angle, x, y, z)
        }
        modelViewMatrix.glRotatef(angle, x, y, z)
    }

    fun glModelScalef(x: Float, y: Float, z: Float) {
        if (!hasGL20) {
            GLES10.glScalef(x, y, z)
        }
        modelViewMatrix.glScalef(x, y, z)
    }

    fun glModelTranslatef(x: Float, y: Float, z: Float) {
        if (!hasGL20) {
            GLES10.glTranslatef(x, y, z)
        }
        modelViewMatrix.glTranslatef(x, y, z)
    }

    fun glObjScaleApplyVector(uniformLocation: Int) {
        if (hasGL20) {
            renderBackend.setUniform4f(uniformLocation, scaleX, scaleY, scaleZ, 1.0f)
        }
    }

    fun glObjWorldApplyMatrix(uniformLocation: Int) {
        if (hasGL20) {
            objWorldMatrix.glApplyUniformMatrix(uniformLocation)
        }
    }

    fun glObjWorldPopMatrix() {
        if (!hasGL20) {
            GLES10.glPopMatrix()
        }
        objWorldMatrix.glPopMatrix()
    }

    fun glObjWorldPushAndLoadMatrixf(floats: FloatArray, offset: Int) {
        if (!hasGL20) {
            GLES10.glPushMatrix()
            GLES10.glLoadMatrixf(modelViewMatrix.matrixData, modelViewMatrix.matrixDataOffset)
            GLES10.glMultMatrixf(floats, offset)
        }
        objWorldMatrix.glPushAndLoadMatrixf(floats, offset)
    }

    fun glObjWorldPushAndMultMatrixf(floats: FloatArray, offset: Int) {
        if (!hasGL20) {
            GLES10.glPushMatrix()
            GLES10.glMultMatrixf(floats, offset)
        }
        objWorldMatrix.glPushAndMultMatrixf(floats, offset)
    }

    fun glObjWorldTranslatef(x: Float, y: Float, z: Float) {
        if (!hasGL20) {
            GLES10.glTranslatef(x, y, z)
        }
        objWorldMatrix.glTranslatef(x, y, z)
    }

    internal fun glPopObjectScale() {
        if (!hasGL20) {
            GLES10.glPopMatrix()
        }
        scaleX = 1.0f
        scaleY = 1.0f
        scaleZ = 1.0f
    }

    internal fun glPushObjectScale(x: Float, y: Float, z: Float) {
        if (!hasGL20) {
            GLES10.glPushMatrix()
            GLES10.glScalef(x, y, z)
        }
        scaleX *= x
        scaleY *= y
        scaleZ *= z
    }

    internal fun initAllPrimPrograms(useWindlight: Boolean) {
        if (hasGL20) {
            initPrimProgram(primProgram!!, useWindlight)
            initPrimProgram(primOpaqueProgram!!, useWindlight)
            initPrimProgram(flexiPrimProgram!!, useWindlight)
            initPrimProgram(flexiPrimOpaqueProgram!!, useWindlight)
            initPrimProgram(riggedMeshProgram!!, useWindlight)
            if (hasGL30) {
                initPrimProgram(riggedMeshProgram30!!, useWindlight)
                initPrimProgram(riggedMeshProgramOpaque30!!, useWindlight)
            }
        }
    }

    internal fun processOcclusionQueries() {
        while (true) {
            val query = activeOcclusionQueries.peekFirst() ?: return
            if (!query.checkResult()) return
            activeOcclusionQueries.removeFirst()
        }
    }

    internal fun setActiveProjectionMatrix(matrixStack: MatrixStack) {
        activeProjectionMatrix = matrixStack
        if (hasGL20) {
            modelViewMatrix.reset()
            modelViewMatrix.glLoadMatrixf(matrixStack.matrixData, matrixStack.matrixDataOffset)
        } else {
            GLES10.glMatrixMode(5889)
            GLES10.glLoadMatrixf(matrixStack.matrixData, matrixStack.matrixDataOffset)
            GLES10.glMatrixMode(5888)
            GLES10.glLoadIdentity()
            modelViewMatrix.reset()
            modelViewMatrix.glLoadIdentity()
        }
    }

    internal fun setActiveProjectionMatrix(floats: FloatArray, offset: Int) {
        modelViewMatrix.reset()
        modelViewMatrix.glLoadMatrixf(floats, offset)
    }

    internal fun setMeshCapURL(meshCapURL: String) {
        drawableStore.setMeshCapURL(meshCapURL)
    }

    fun setupRiggedMeshProgram(opaque: Boolean) {
        currentRiggedMeshProgram = if (opaque) riggedMeshProgramOpaque30 else riggedMeshProgram30
        clearRiggingMeshData()
        clearFaceTexture()
        curPrimProgram = currentRiggedMeshProgram
        renderBackend.useProgram(currentRiggedMeshProgram!!.getHandle())
        glModelApplyMatrix(currentRiggedMeshProgram!!.uMVPMatrix)
        glObjWorldApplyMatrix(currentRiggedMeshProgram!!.uObjWorldMatrix)
        glObjScaleApplyVector(currentRiggedMeshProgram!!.uObjCoordScale)
    }

    companion object {
        const val NEAR_PLANE = 0.5f
        const val UNIFORM_BLOCK_ANIMATION_DATA = 1
        const val UNIFORM_BLOCK_RIGGING_DATA = 2
        const val VIEWPORT_RECT_HEIGHT = 3
        const val VIEWPORT_RECT_LEFT = 0
        const val VIEWPORT_RECT_TOP = 1
        const val VIEWPORT_RECT_WIDTH = 2

        private val _tempGluUnProjectData = FloatArray(40)
        private const val _temp_A = 16
        private const val _temp_in = 32
        private const val _temp_m = 0
        private const val _temp_out = 36

        @JvmStatic
        fun gluUnProject(
            winX: Float, winY: Float, winZ: Float,
            model: FloatArray, modelOffset: Int,
            proj: FloatArray, projOffset: Int,
            viewport: IntArray, viewportOffset: Int,
            objPos: FloatArray, objPosOffset: Int
        ): Int {
            _tempGluUnProjectData[32] = (((winX - viewport[viewportOffset]) * 2.0f) / viewport[viewportOffset + 2]) - 1.0f
            _tempGluUnProjectData[33] = (((winY - viewport[viewportOffset + 1]) * 2.0f) / viewport[viewportOffset + 3]) - 1.0f
            _tempGluUnProjectData[34] = (2.0f * winZ) - 1.0f
            _tempGluUnProjectData[35] = 1.0f
            Matrix.multiplyMM(_tempGluUnProjectData, 16, proj, projOffset, model, modelOffset)
            Matrix.invertM(_tempGluUnProjectData, 0, _tempGluUnProjectData, 16)
            Matrix.multiplyMV(_tempGluUnProjectData, 36, _tempGluUnProjectData, 0, _tempGluUnProjectData, 32)
            if (_tempGluUnProjectData[39] == 0.0f) {
                return 0
            }
            objPos[objPosOffset] = _tempGluUnProjectData[36] / _tempGluUnProjectData[39]
            objPos[objPosOffset + 1] = _tempGluUnProjectData[37] / _tempGluUnProjectData[39]
            objPos[objPosOffset + 2] = _tempGluUnProjectData[38] / _tempGluUnProjectData[39]
            return 1
        }
    }
}
