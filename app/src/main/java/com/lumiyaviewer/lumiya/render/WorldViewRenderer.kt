package com.lumiyaviewer.lumiya.render

import android.annotation.SuppressLint
import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.Matrix
import android.graphics.Paint
import android.opengl.GLES10
import android.opengl.GLES20
import android.opengl.GLSurfaceView
import android.os.Handler
import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.GlobalOptions
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.render.avatar.DrawableAvatar
import com.lumiyaviewer.lumiya.render.avatar.DrawableAvatarStub
import com.lumiyaviewer.lumiya.render.avatar.DrawableHUD
import com.lumiyaviewer.lumiya.render.caps.GpuCapabilities
import com.lumiyaviewer.lumiya.render.glres.textures.GLExternalTexture
import com.lumiyaviewer.lumiya.render.picking.IntersectPickable
import com.lumiyaviewer.lumiya.render.picking.ObjectIntersectInfo
import com.lumiyaviewer.lumiya.render.spatial.DrawList
import com.lumiyaviewer.lumiya.render.spatial.FrustrumInfo
import com.lumiyaviewer.lumiya.render.spatial.FrustrumPlanes
import com.lumiyaviewer.lumiya.render.spatial.SpatialIndex
import com.lumiyaviewer.lumiya.render.terrain.DrawableTerrainPatch
import com.lumiyaviewer.lumiya.res.executors.PrimComputeExecutor
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLParcelInfo
import com.lumiyaviewer.lumiya.slproto.modules.SLAvatarControl
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectInfo
import com.lumiyaviewer.lumiya.slproto.types.CameraParams
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.rawbuffers.DirectByteBuffer
import java.util.Collections
import java.util.ConcurrentModificationException
import java.util.LinkedList
import java.util.UUID
import java.util.concurrent.atomic.AtomicBoolean
import java.util.concurrent.atomic.AtomicInteger
import java.util.concurrent.atomic.AtomicReference
import javax.microedition.khronos.egl.EGL10
import javax.microedition.khronos.egl.EGLConfig
import javax.microedition.khronos.egl.EGLContext
import javax.microedition.khronos.egl.EGLDisplay
import javax.microedition.khronos.opengles.GL10

@SuppressLint("InlinedApi")
class WorldViewRenderer(
    private val stateHandler: Handler,
    private val requestGL20: Boolean,
    userManager: UserManager,
    private val fontSize: Int
) : GLSurfaceView.Renderer, GLSurfaceView.EGLContextFactory {

    private var currentFrustrumInfo: FrustrumInfo? = null
    private var firstFrameTime: Long = 0
    private var lastFrameTime: Long = 0

    private val renderThreadExecutor = SynchronousExecutor()
    private val agentCircuit = SubscriptionData<UUID, SLAgentCircuit>(
        renderThreadExecutor
    ) { onAgentCircuit(it as SLAgentCircuit?) }
    private val renderContext = AtomicReference<RenderContext>()

    private var avatarControl: SLAvatarControl? = null
    private var parcelInfo: SLParcelInfo? = null

    @Volatile
    private var initialUpdateDone = false
    private val drawingEnabled = AtomicBoolean(true)
    private val firstFrameCount = AtomicInteger(EMPTY_FRAMES_COUNT)
    private var lastDrawListUpdateTime: Long = 0
    private var drawListUpdateFrameCount = 0
    private var drawPickedObject: SLObjectInfo? = null
    private var simSunHour = floatArrayOf(Float.NaN)

    @Volatile
    private var forcedTime = Float.NaN
    private val pickLock = Any()
    private var needPickObject = false
    private var needPickX = 0.0f
    private var needPickY = 0.0f
    private var pickHandler: Handler? = null
    private val touchHUDEvents: MutableList<TouchHUDEvent> = Collections.synchronizedList(LinkedList())
    private var touchHandler: Handler? = null
    private var ownAvatarHidden = false
    private var drawDistance = 20
    private var avatarCountLimit = 5
    private val cameraParams = CameraParams()
    private val responsiveModeLock = Any()
    private var isInteracting = false
    private var isFlinging = false

    @Volatile
    private var isResponsiveMode = false
    private var screenshotHandler: Handler? = null

    @Volatile
    private var displayedHUDid = 0
    private var hudScaleFactor = 1.0f
    private var hudOffsetX = 0.0f
    private var hudOffsetY = 0.0f
    private var hoverTextEnableHUDs = true
    private var hoverTextEnableObjects = false
    private var createdGL30 = false
    private var gpuCapabilities: GpuCapabilities? = null
    private var framebuffers: IntArray? = null
    private var renderbuffers: IntArray? = null
    private var colorbuffers: IntArray? = null
    private var headTransformCompat: HeadTransformCompat? = null
    private val systemFramebuffer = IntArray(1)

    private val initSpatialIndexRunnable = Runnable { initSpatialIndex() }

    private var thisFrameTime: Long = 0
    private var fpsFrameCount = 0
    private var previousFrameTime: Long = 0
    private var currentDrawList: DrawList? = null
    private val extTextureMatrix = FloatArray(64)
    private val extTextureHitVector = floatArrayOf(0.0f, 0.0f, 0.0f, 1.0f)
    private val extTextureResultVector = FloatArray(4)

    init {
        agentCircuit.subscribe(UserManager.agentCircuits(), userManager.getUserID())
    }

    private fun handleHUDTouch(
        renderContext: RenderContext,
        drawableHUD: DrawableHUD,
        touchHUDEvent: TouchHUDEvent,
        objectIntersectInfo: ObjectIntersectInfo
    ) {
        val width = renderContext.viewportRect[2].toFloat()
        val f3 = ((width / 2.0f) - touchHUDEvent.y) / width
        val f4 = ((width / 2.0f) - touchHUDEvent.x) / width
        val attachmentPoint = drawableHUD.attachmentPoint
        val f5 = attachmentPoint.position.y + f4
        val f6 = f3 + attachmentPoint.position.z
        try {
            touchHandler?.let { handler ->
                handler.sendMessage(handler.obtainMessage(MSG_SET_TOUCHED_OBJECT, objectIntersectInfo.objInfo))
            }
            agentCircuit.get().TouchObjectFace(
                objectIntersectInfo.objInfo,
                objectIntersectInfo.intersectInfo.faceID,
                0.0f, f5, f6,
                objectIntersectInfo.intersectInfo.u,
                objectIntersectInfo.intersectInfo.v,
                objectIntersectInfo.intersectInfo.s,
                objectIntersectInfo.intersectInfo.t
            )
        } catch (e: SubscriptionData.DataNotReadyException) {
            Debug.Warning(e)
        }
    }

    fun onAgentCircuit(agentCircuit: SLAgentCircuit?) {
        if (agentCircuit == null) {
            avatarControl = null
            parcelInfo = null
            return
        }
        Debug.Printf("WorldViewRenderer: got new agentCircuit.")
        initialUpdateDone = false
        avatarControl = agentCircuit.getModules()!!.avatarControl
        parcelInfo = agentCircuit.getGridConnection().parcelInfo
        initialUpdateDone = false
        val rc = renderContext.get()
        if (rc != null) {
            rc.setMeshCapURL(agentCircuit.getCaps()!!.getMeshFetchURL())
            if (parcelInfo != null) {
                PrimComputeExecutor.getInstance().execute(initSpatialIndexRunnable)
            }
        }
    }

    private fun processObjectPick() {
        val handler: Handler?
        val pickX: Float
        var pickY = Float.NaN
        var doPick = false
        synchronized(pickLock) {
            if (needPickObject) {
                needPickObject = false
                pickX = needPickX
                pickY = needPickY
                handler = pickHandler
                doPick = true
            } else {
                handler = null
                pickX = Float.NaN
            }
        }
        val rc = renderContext.get()
        if (!doPick || rc == null) return

        var best: ObjectIntersectInfo? = null
        try {
            val drawList = currentDrawList ?: return
            for (obj in drawList.objects) {
                best = tryPickObject(rc, pickX, pickY, obj, best)
            }
            for (avatar in drawList.avatars) {
                best = tryPickObject(rc, pickX, pickY, avatar, best)
            }
        } catch (e: Exception) {
            Debug.Warning(e)
        }
        if (best != null && handler != null) {
            handler.sendMessage(handler.obtainMessage(MSG_SET_PICKED_OBJECT, best))
        }
    }

    private fun setIsFlinging(flinging: Boolean) {
        var changed = false
        synchronized(responsiveModeLock) {
            if (isFlinging != flinging) {
                isFlinging = flinging
                changed = true
            }
        }
        if (changed) updateResponsive()
    }

    private fun takeScreenshot(renderContext: RenderContext, handler: Handler) {
        val w = renderContext.viewportRect[2]
        val h = renderContext.viewportRect[3]
        val directByteBuffer = DirectByteBuffer(w * h * 4)
        GLES10.glReadPixels(0, 0, w, h, 6408, 5121, directByteBuffer.asByteBuffer())
        val raw = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888)
        raw.copyPixelsFromBuffer(directByteBuffer.asByteBuffer())
        val bitmap = Bitmap.createBitmap(w, h, Bitmap.Config.RGB_565)
        val canvas = Canvas(bitmap)
        val matrix = Matrix()
        matrix.setScale(1.0f, -1.0f)
        matrix.postTranslate(0.0f, h.toFloat())
        val paint = Paint()
        paint.isAntiAlias = true
        paint.isDither = true
        canvas.drawBitmap(raw, matrix, paint)
        raw.recycle()
        paint.textSize = fontSize.toFloat()
        paint.isSubpixelText = true
        paint.textAlign = Paint.Align.LEFT
        paint.color = -1
        var y = fontSize * 2.0f
        for (str in arrayOf("Lumiya Viewer", "http://lumiyaviewer.com")) {
            canvas.drawText(str, fontSize.toFloat(), y, paint)
            y += (paint.descent() - paint.ascent()) + (fontSize * 0.5f)
        }
        handler.sendMessage(handler.obtainMessage(MSG_SCREENSHOT, bitmap))
    }

    private fun tryPickObject(
        renderContext: RenderContext,
        x: Float, y: Float,
        pickable: IntersectPickable,
        current: ObjectIntersectInfo?
    ): ObjectIntersectInfo? {
        val result = pickable.PickObject(renderContext, x, y, -0.9f)
        return if (result != null && (current == null || result.pickDepth < current.pickDepth)) result else current
    }

    private fun updateResponsive() {
        val wasResponsive: Boolean
        val nowResponsive: Boolean
        synchronized(responsiveModeLock) {
            wasResponsive = isResponsiveMode
            nowResponsive = isInteracting || isFlinging
            isResponsiveMode = nowResponsive
        }
        if (wasResponsive != nowResponsive) {
            if (nowResponsive) PrimComputeExecutor.getInstance().pause()
            else PrimComputeExecutor.getInstance().resume()
        }
    }

    override fun createContext(egl10: EGL10, eglDisplay: EGLDisplay, eglConfig: EGLConfig): EGLContext {
        Debug.Printf("EGL: createContext called.")
        Debug.Printf("EGL: creating required 3.0 context.")
        val context = egl10.eglCreateContext(
            eglDisplay, eglConfig, EGL10.EGL_NO_CONTEXT,
            intArrayOf(EGL_CONTEXT_CLIENT_VERSION, 3, 12344)
        )
        if (context != null && context != EGL10.EGL_NO_CONTEXT) {
            createdGL30 = true
            return context
        }
        createdGL30 = false
        throw IllegalStateException("OpenGL ES 3.0 context creation failed (EGL error ${egl10.eglGetError()})")
    }

    @SuppressLint("DefaultLocale")
    override fun destroyContext(egl10: EGL10, eglDisplay: EGLDisplay, eglContext: EGLContext) {
        Debug.Printf("EGL: destroyContext called.")
        onRendererShutdown()
        if (!egl10.eglDestroyContext(eglDisplay, eglContext)) {
            throw RuntimeException(String.format("EGLError code %d", egl10.eglGetError()))
        }
        Debug.Printf("EGL: destroyContext exiting.")
    }

    fun disableDrawing() {
        drawingEnabled.set(false)
    }

    fun drawCrosshair(scaleX: Float, offsetY: Float) {
        val rc = renderContext.get() ?: return
        if (rc.crosshairTexture == null) return
        GLES20.glDisable(2929)
        GLES20.glDisable(2884)
        GLES20.glEnable(3042)
        rc.renderBackend.useProgram(rc.rawShaderProgram!!.getHandle())
        GLES20.glActiveTexture(33984)
        rc.crosshairTexture.GLDraw()
        rc.renderBackend.setUniform1i(rc.rawShaderProgram.textureSampler, 0)
        android.opengl.Matrix.setIdentityM(extTextureMatrix, 0)
        rc.renderBackend.setUniformMatrix4fv(rc.rawShaderProgram.vTextureTransformMatrix, extTextureMatrix, 0)
        android.opengl.Matrix.translateM(extTextureMatrix, 0, 0.0f, 0.0f, -1.9f)
        android.opengl.Matrix.translateM(extTextureMatrix, 16, extTextureMatrix, 0, -offsetY, 0.0f, 0.0f)
        android.opengl.Matrix.scaleM(extTextureMatrix, 16, scaleX, scaleX, 1.0f)
        android.opengl.Matrix.multiplyMM(
            extTextureMatrix, 32,
            rc.projectionMatrix.matrixData, rc.projectionMatrix.matrixDataOffset,
            extTextureMatrix, 16
        )
        rc.renderBackend.setUniformMatrix4fv(rc.rawShaderProgram.uMVPMatrix, extTextureMatrix, 32)
        rc.quad.DrawSingleQuadShader(rc, rc.rawShaderProgram.vPosition, rc.rawShaderProgram.vTexCoord)
    }

    fun drawExternalTexture(
        glExternalTexture: GLExternalTexture,
        texMatrix: FloatArray,
        offset: Float, rotX: Float, rotY: Float,
        scaleX: Float, scaleY: Float,
        hitOut: FloatArray, hitOffset: Int
    ) {
        val rc = renderContext.get() ?: return
        if (rc.extTextureProgram == null) return
        glExternalTexture.update(texMatrix)
        GLES20.glDisable(2929)
        GLES20.glDisable(2884)
        GLES20.glEnable(3042)
        rc.renderBackend.useProgram(rc.extTextureProgram!!.getHandle())
        GLES20.glActiveTexture(33984)
        glExternalTexture.bind()
        rc.renderBackend.setUniform1i(rc.extTextureProgram.textureSampler, 0)
        rc.renderBackend.setUniformMatrix4fv(rc.extTextureProgram.vTextureTransformMatrix, texMatrix, 0)
        android.opengl.Matrix.setIdentityM(extTextureMatrix, 0)
        android.opengl.Matrix.rotateM(extTextureMatrix, 0, -rotX, 1.0f, 0.0f, 0.0f)
        android.opengl.Matrix.rotateM(extTextureMatrix, 0, -rotY, 0.0f, 1.0f, 0.0f)
        android.opengl.Matrix.translateM(extTextureMatrix, 0, 0.0f, 0.0f, -2.0f)
        android.opengl.Matrix.translateM(extTextureMatrix, 16, extTextureMatrix, 0, -offset, 0.0f, 0.0f)
        android.opengl.Matrix.scaleM(extTextureMatrix, 16, scaleX, scaleY, 1.0f)
        android.opengl.Matrix.multiplyMM(
            extTextureMatrix, 32,
            rc.projectionMatrix.matrixData, rc.projectionMatrix.matrixDataOffset,
            extTextureMatrix, 16
        )
        android.opengl.Matrix.invertM(extTextureMatrix, 48, extTextureMatrix, 32)
        android.opengl.Matrix.multiplyMV(extTextureResultVector, 0, extTextureMatrix, 48, extTextureHitVector, 0)
        hitOut[hitOffset] = extTextureResultVector[0]
        hitOut[hitOffset + 1] = extTextureResultVector[1]
        rc.renderBackend.setUniformMatrix4fv(rc.extTextureProgram.uMVPMatrix, extTextureMatrix, 32)
        rc.quad.DrawSingleQuadShader(rc, rc.extTextureProgram.vPosition, rc.extTextureProgram.vTexCoord)
    }

    fun enableDrawing() {
        if (drawingEnabled.getAndSet(true)) return
        firstFrameCount.set(EMPTY_FRAMES_COUNT)
    }

    private fun initSpatialIndex() {
        val pi = parcelInfo
        if (initialUpdateDone || pi == null) return
        Debug.Printf("WorldViewRenderer: making new spatial index.")
        pi.initSpatialIndex()
        pi.terrainData.updateEntireTerrain()
        renderContext.get()?.drawableStore?.spatialObjectIndex?.completeInitialUpdate()
        initialUpdateDone = true
    }

    override fun onDrawFrame(gl10: GL10) {
        onPrepareFrame(null)
        onDrawFrame(gl10, null, null, null, null, null, 0)
        onFinishFrame()
    }

    @Synchronized
    fun onDrawFrame(
        gl10: GL10,
        headTransform: HeadTransformCompat?,
        eyeOffset: FloatArray?,
        viewport: IntArray?,
        eyeView: FloatArray?,
        eyeProjection: FloatArray?,
        eyeProjectionOffset: Int
    ) {
        if (!drawingEnabled.get()) return
        val rc = renderContext.get() ?: return

        if (eyeView != null && headTransform != null) {
            rc.glModelResetIdentity()
            if (eyeProjection != null) {
                rc.setActiveProjectionMatrix(eyeProjection, eyeProjectionOffset)
            } else {
                rc.setActiveProjectionMatrix(rc.projectionMatrix)
            }
            rc.glModelMultMatrixf(eyeView, 0)
            rc.glModelRotatef((-headTransform.viewExtraYaw) + 90.0f, 0.0f, 1.0f, 0.0f)
            rc.glModelRotatef(-90.0f, 1.0f, 0.0f, 0.0f)
            rc.glModelTranslatef(-rc.frameCamera.x, -rc.frameCamera.y, -rc.frameCamera.z)
        }
        rc.renderBackend.beginFrame(rc)
        if (rc.hasGL20) {
            if (rc.useFXAA && framebuffers != null && colorbuffers != null) {
                systemFramebuffer[0] = 0
                GLES20.glGetIntegerv(36006, systemFramebuffer, 0)
                GLES20.glBindFramebuffer(36160, framebuffers!![0])
                GLES20.glBindTexture(3553, colorbuffers!![0])
                GLES20.glFramebufferTexture2D(36160, 36064, 3553, colorbuffers!![0], 0)
                if (viewport != null) {
                    GLES20.glViewport(0, 0, rc.viewportRect[2], rc.viewportRect[3])
                }
            } else if (viewport != null) {
                GLES20.glViewport(viewport[0], viewport[1], viewport[2], viewport[3])
            }
            GLES20.glEnable(2884)
            GLES20.glEnable(2929)
            GLES20.glEnable(3042)
            GLES20.glBlendFunc(770, 771)
            GLES20.glClear(256)
        } else {
            GLES10.glEnable(2884)
            GLES10.glEnable(2929)
            GLES10.glEnable(3042)
            GLES10.glEnable(3008)
            GLES10.glAlphaFunc(516, 0.4f)
            GLES10.glBlendFunc(770, 771)
            GLES10.glClear(16640)
            GLES10.glTexEnvf(8960, 8704, 8448.0f)
            if (viewport != null) {
                GLES20.glViewport(viewport[0], viewport[1], viewport[2], viewport[3])
            }
        }

        var shouldDraw = true
        val emptyFrames = firstFrameCount.get()
        if (emptyFrames > 0) {
            Debug.Log("onDrawFrame: drawing empty first frame!")
            firstFrameCount.set(emptyFrames - 1)
            shouldDraw = false
        }
        if (parcelInfo == null || !shouldDraw) {
            GLES20.glBindFramebuffer(36160, systemFramebuffer[0])
            rc.renderBackend.endFrame(rc)
            return
        }

        try {
            val drawList = currentDrawList
            val frustrum = currentFrustrumInfo
            if (drawingEnabled.get() && drawList != null && frustrum != null) {
                if (eyeView == null && eyeOffset != null) {
                    rc.glModelTranslatef(eyeOffset[0], eyeOffset[1], eyeOffset[2])
                }
                rc.initAllPrimPrograms(true)
                rc.curPrimProgram = null

                if (rc.hasGL20) GLES20.glDisable(3042)
                else { GLES10.glDisable(3042); GLES10.glDisable(3008) }

                val objects = drawList.objects
                val renderPasses = drawList.renderPasses!!
                val size = objects.size
                rc.clearFaceTexture()
                for (j in 0 until size) {
                    renderPasses[j] = objects[j].Draw(rc, 1)
                }
                rc.curPrimProgram = null
                rc.clearFaceTexture()
                DrawableTerrainPatch.GLPrepare(rc)
                for (terrain in drawList.terrain) {
                    terrain.GLDraw(rc)
                }
                rc.curPrimProgram = null
                rc.clearFaceTexture()

                if (rc.hasGL20) GLES20.glEnable(3042)
                else { GLES10.glEnable(3042); GLES10.glEnable(3008) }

                for (avatar in drawList.avatars) {
                    val isHidden = avatar == drawList.myAvatar && ownAvatarHidden
                    if (!isHidden) avatar.Draw(rc)
                }

                if (rc.hasGL20) {
                    rc.windlightSky?.GLDraw(rc, cameraParams.getHeading(), cameraParams.getTilt())
                }

                rc.curPrimProgram = null
                rc.clearFaceTexture()
                for (k in size - 1 downTo 0) {
                    if (renderPasses[k] and 2 != 0) {
                        objects[k].Draw(rc, 2)
                    }
                }

                if (rc.hasGL30) {
                    BoundingBox.PrepareOcclusionQueries(rc)
                    for (obj in objects) {
                        obj.TestOcclusion(rc, frustrum.mvpMatrix)
                    }
                    BoundingBox.EndOcclusionQueries(rc)
                }

                screenshotHandler?.let { handler ->
                    takeScreenshot(rc, handler)
                    screenshotHandler = null
                }

                val pickedObject = drawPickedObject
                if (pickedObject != null && !pickedObject.isAvatar()) {
                    for (obj in drawList.objects) {
                        obj.DrawIfPicked(rc, pickedObject)
                    }
                }

                if (!rc.hasGL20) {
                    GLES10.glMatrixMode(5889)
                    GLES10.glLoadIdentity()
                    GLES10.glMatrixMode(5888)
                }

                if (rc.hasGL20 && rc.useFXAA && colorbuffers != null) {
                    GLES20.glFinish()
                    GLES20.glBindTexture(3553, colorbuffers!![1])
                    GLES20.glFramebufferTexture2D(36160, 36064, 3553, colorbuffers!![1], 0)
                    GLES20.glClearColor(0.0f, 0.0f, 0.0f, 0.0f)
                    GLES20.glClear(16384)
                }

                rc.quad.PrepareDrawQuads(rc)
                for (avatar in drawList.avatars) {
                    val isHidden = avatar == drawList.myAvatar && ownAvatarHidden
                    if (!isHidden) avatar.DrawNameTag(rc)
                }
                for (stub in drawList.avatarStubs) {
                    stub.DrawNameTag(rc)
                }
                if (hoverTextEnableObjects) {
                    for (obj in drawList.objects) {
                        obj.DrawHoverText(rc, false)
                    }
                }
                rc.quad.EndDrawQuads(rc)
                rc.curPrimProgram = null

                if (displayedHUDid != 0) {
                    val touchEvent = if (touchHUDEvents.size >= 1) touchHUDEvents.removeAt(0) else null
                    if (rc.hasGL20) {
                        GLES20.glClear(256)
                        rc.initAllPrimPrograms(false)
                    } else {
                        GLES10.glClear(256)
                    }
                    rc.setActiveProjectionMatrix(rc.projectionHUDMatrix)
                    rc.glModelRotatef(90.0f, 0.0f, 1.0f, 0.0f)
                    rc.glModelRotatef(-90.0f, 1.0f, 0.0f, 0.0f)
                    val myAvatar = drawList.myAvatar
                    if (myAvatar != null) {
                        myAvatar.setDisplayedHUDid(displayedHUDid)
                        val drawableHUD = myAvatar.drawableHUD
                        if (drawableHUD != null) {
                            val hudIntersect = drawableHUD.Draw(rc, hudScaleFactor, hudOffsetX, hudOffsetY, touchEvent, false)
                            if (hudIntersect != null && touchEvent != null) {
                                handleHUDTouch(rc, drawableHUD, touchEvent, hudIntersect)
                            }
                            if (rc.hasGL20) {
                                GLES20.glDisable(2929)
                            } else {
                                GLES10.glDisable(2929)
                                GLES10.glMatrixMode(5889)
                                GLES10.glLoadIdentity()
                                GLES10.glMatrixMode(5888)
                            }
                            if (hoverTextEnableHUDs) {
                                rc.quad.PrepareDrawQuads(rc)
                                drawableHUD.Draw(rc, hudScaleFactor, hudOffsetX, hudOffsetY, null, true)
                                rc.quad.EndDrawQuads(rc)
                            }
                        }
                    }
                } else {
                    touchHUDEvents.clear()
                }
            }
        } catch (e: IndexOutOfBoundsException) {
            Debug.Warning(e)
        } catch (e: ConcurrentModificationException) {
            Debug.Warning(e)
        }

        if (rc.hasGL20 && rc.useFXAA && colorbuffers != null) {
            GLES20.glBindFramebuffer(36160, systemFramebuffer[0])
            if (viewport != null) {
                GLES20.glViewport(viewport[0], viewport[1], viewport[2], viewport[3])
            }
            GLES20.glDisable(2929)
            GLES20.glDisable(3042)
            rc.renderBackend.useProgram(rc.fxaaProgram!!.getHandle())
            GLES20.glBindTexture(3553, colorbuffers!![0])
            GLES20.glActiveTexture(33985)
            GLES20.glBindTexture(3553, colorbuffers!![1])
            GLES20.glTexParameteri(3553, 10240, 9728)
            GLES20.glTexParameteri(3553, 10241, 9728)
            GLES20.glTexParameteri(3553, 10242, 33071)
            GLES20.glTexParameteri(3553, 10243, 33071)
            GLES20.glActiveTexture(33984)
            rc.quad.DrawSingleQuadShader(rc, rc.fxaaProgram.vPosition, rc.fxaaProgram.vTexCoord)
        }
        rc.renderBackend.endFrame(rc)
    }

    fun onFinishFrame() {
        currentDrawList = null
        val rc = renderContext.get() ?: return
        if ((previousFrameTime > lastDrawListUpdateTime + MIN_DRAW_LIST_UPDATE_INTERVAL || drawListUpdateFrameCount <= 0) &&
            rc.drawableStore.spatialObjectIndex.updateDrawListIfNeeded()
        ) {
            lastDrawListUpdateTime = previousFrameTime
            drawListUpdateFrameCount = MIN_DRAW_LIST_UPDATE_FRAMES
        }
        if (drawListUpdateFrameCount > 0) {
            drawListUpdateFrameCount--
        }
    }

    fun onPrepareFrame(headTransform: HeadTransformCompat?) {
        headTransformCompat = headTransform
        renderThreadExecutor.runQueuedTasks()
        if (!drawingEnabled.get()) return
        val rc = renderContext.get() ?: return

        val currentTimeMillis = System.currentTimeMillis()
        val elapsed = currentTimeMillis - previousFrameTime
        if (elapsed < 33) {
            try {
                Thread.sleep(33 - elapsed)
            } catch (_: InterruptedException) {
            }
        }
        previousFrameTime = currentTimeMillis
        thisFrameTime = currentTimeMillis - firstFrameTime
        fpsFrameCount++
        if (fpsFrameCount >= 10) {
            fpsFrameCount = 0
            if (thisFrameTime != lastFrameTime) {
                Debug.Printf(
                    "Renderer: FPS %.2f frame time %d",
                    10000.0f / (thisFrameTime - lastFrameTime),
                    thisFrameTime - lastFrameTime
                )
                lastFrameTime = thisFrameTime
            }
        }
        TextureMemoryTracker.releaseFrameMemory()
        rc.clearFrameKeeps()
        rc.glResourceManager.Cleanup()
        rc.frameCount++
        if (rc.hasGL30) rc.processOcclusionQueries()

        rc.glModelResetIdentity()
        rc.setActiveProjectionMatrix(rc.projectionMatrix)
        val avatarCtrl = avatarControl
        if (avatarCtrl != null) {
            if (headTransform != null) {
                avatarCtrl.getVRCamera(headTransform, rc.myAviPosition, cameraParams)
                setIsFlinging(false)
            } else {
                setIsFlinging(avatarCtrl.getAgentAndCameraPosition(rc.myAviPosition, cameraParams))
            }
        }
        rc.frameCamera.set(cameraParams.getPosition())
        if (headTransform != null) {
            rc.glModelMultMatrixf(headTransform.headTransformMatrix, 0)
            rc.glModelRotatef((-headTransform.viewExtraYaw) + 90.0f, 0.0f, 1.0f, 0.0f)
            rc.glModelRotatef(-90.0f, 1.0f, 0.0f, 0.0f)
        } else {
            rc.glModelRotatef(-90.0f, 1.0f, 0.0f, 0.0f)
            val tilt = cameraParams.getTilt()
            if (tilt != 0.0f) rc.glModelRotatef(tilt, 1.0f, 0.0f, 0.0f)
            rc.glModelRotatef((-cameraParams.getHeading()) + 90.0f, 0.0f, 0.0f, 1.0f)
        }
        rc.glModelTranslatef(-rc.frameCamera.x, -rc.frameCamera.y, -rc.frameCamera.z)

        val frustrumInfo = if (rc.hasGL20) {
            FrustrumInfo(
                rc.frameCamera.x, rc.frameCamera.y, rc.frameCamera.z,
                drawDistance.toFloat(),
                rc.modelViewMatrix.matrixData, rc.modelViewMatrix.matrixDataOffset
            )
        } else {
            FrustrumInfo(
                rc.frameCamera.x, rc.frameCamera.y, rc.frameCamera.z,
                drawDistance.toFloat(),
                rc.modelViewMatrix.matrixData, rc.modelViewMatrix.matrixDataOffset,
                rc.projectionMatrix.matrixData, rc.projectionMatrix.matrixDataOffset
            )
        }
        if (!Objects.equal(currentFrustrumInfo, frustrumInfo)) {
            currentFrustrumInfo = frustrumInfo
            rc.drawableStore.spatialObjectIndex.setViewport(
                currentFrustrumInfo!!,
                FrustrumPlanes(currentFrustrumInfo!!.mvpMatrix)
            )
        }
        if (!isResponsiveMode) rc.runLoadQueue()

        val pi = parcelInfo
        if (pi != null) {
            rc.underWater = pi.terrainData.isUnderWater(rc.frameCamera.z)
            rc.waterTime = (thisFrameTime % 1000000) / 1000.0f
            if (rc.hasGL20) {
                val forced = forcedTime
                if (forced.isNaN()) {
                    if (pi.getSunHour(simSunHour, simSunHour[0].isNaN())) {
                        Debug.Printf("Windlight: using sim hour of %f", simSunHour[0])
                        rc.windlightDay.InterpolatePreset(rc.windlightPreset, simSunHour[0])
                    }
                } else if (simSunHour[0].isNaN() || simSunHour[0] != forced) {
                    simSunHour[0] = forced
                    Debug.Printf("Windlight: using forced hour of %f", simSunHour[0])
                    rc.windlightDay.InterpolatePreset(rc.windlightPreset, simSunHour[0])
                }
            }
        }
        currentDrawList = rc.drawableStore.spatialObjectIndex.getObjectsInFrustrum()
        val drawList = currentDrawList
        if (drawList != null) {
            for (avatar in drawList.avatars) {
                val isHidden = avatar == drawList.myAvatar && ownAvatarHidden
                if (!isHidden) avatar.RunAnimations()
            }
        }
        processObjectPick()
    }

    fun onRendererShutdown() {
        PrimComputeExecutor.getInstance().resume()
        SpatialIndex.getInstance().DisableObjectIndex(this)
        val rc = renderContext.getAndSet(null)
        if (rc != null) {
            rc.stopLoadQueue()
            rc.clearFrameKeeps()
            Debug.Printf("EGL: destroyContext: calling Flush().")
            rc.glResourceManager.Flush()
            Debug.Printf("EGL: destroyContext: returned from Flush().")
        }
        TextureMemoryTracker.releaseAllFrameMemory()
        Debug.Printf("EGL: destroyContext: calling eglDestroyContext ().")
        initialUpdateDone = false
        TextureMemoryTracker.clearActiveRenderer(this)
    }

    override fun onSurfaceChanged(gl10: GL10, width: Int, height: Int) {
        val rc = renderContext.get() ?: return
        rc.viewportRect[0] = 0
        rc.viewportRect[1] = 0
        rc.viewportRect[2] = width
        rc.viewportRect[3] = height
        if (rc.hasGL20) {
            GLES20.glViewport(0, 0, width, height)
            if (rc.useFXAA) {
                systemFramebuffer[0] = 0
                GLES20.glGetIntegerv(36006, systemFramebuffer, 0)
                GLES20.glBindFramebuffer(36160, framebuffers!![0])
                renderbuffers?.let { GLES20.glDeleteRenderbuffers(1, it, 0) }
                renderbuffers = null
                colorbuffers?.let { GLES20.glDeleteTextures(it.size, it, 0) }
                colorbuffers = null
                if (renderbuffers == null) {
                    renderbuffers = IntArray(1)
                    GLES20.glGenRenderbuffers(1, renderbuffers!!, 0)
                    GLES20.glBindRenderbuffer(36161, renderbuffers!![0])
                    GLES20.glRenderbufferStorage(36161, 33189, width, height)
                }
                if (colorbuffers == null) {
                    colorbuffers = IntArray(2)
                    GLES20.glGenTextures(colorbuffers!!.size, colorbuffers!!, 0)
                    for (i in colorbuffers!!.indices) {
                        GLES20.glBindTexture(3553, colorbuffers!![i])
                        if (i == 0) {
                            GLES20.glTexImage2D(3553, 0, 6407, width, height, 0, 6407, 33635, null)
                        } else {
                            GLES20.glTexImage2D(3553, 0, 6408, width, height, 0, 6408, 5121, null)
                        }
                        GLES20.glTexParameteri(3553, 10242, 33071)
                        GLES20.glTexParameteri(3553, 10243, 33071)
                        GLES20.glTexParameteri(3553, 10240, 9729)
                        GLES20.glTexParameteri(3553, 10241, 9729)
                    }
                }
                GLES20.glViewport(0, 0, width, height)
                GLES20.glBindRenderbuffer(36161, renderbuffers!![0])
                GLES20.glBindTexture(3553, colorbuffers!![0])
                GLES20.glFramebufferRenderbuffer(36160, 36096, 36161, renderbuffers!![0])
                GLES20.glFramebufferTexture2D(36160, 36064, 3553, colorbuffers!![0], 0)
                rc.renderBackend.useProgram(rc.fxaaProgram!!.getHandle())
                GLES20.glUniform1i(rc.fxaaProgram.textureSampler, 0)
                GLES20.glUniform1i(rc.fxaaProgram.noAAtextureSampler, 1)
                GLES20.glUniform2f(rc.fxaaProgram.texcoordOffset, 1.0f / width, 1.0f / height)
                GLES20.glUniform1f(rc.fxaaProgram.exposure, 1.08f)
                GLES20.glUniform1f(rc.fxaaProgram.gamma, 2.2f)
                GLES20.glUniform1f(rc.fxaaProgram.sharpenStrength, 0.12f)
                GLES20.glUniform1f(rc.fxaaProgram.vignetteStrength, 0.16f)
                val mvp = FloatArray(16)
                android.opengl.Matrix.setIdentityM(mvp, 0)
                android.opengl.Matrix.scaleM(mvp, 0, 2.0f, 2.0f, 1.0f)
                GLES20.glUniformMatrix4fv(rc.fxaaProgram.uMVPMatrix, 1, false, mvp, 0)
                GLES20.glBindFramebuffer(36160, systemFramebuffer[0])
            }
        } else {
            GLES10.glViewport(0, 0, width, height)
            GLES10.glMatrixMode(5889)
            GLES10.glLoadIdentity()
        }
        rc.aspectRatio = width.toFloat() / height.toFloat()
        rc.FOVAngle = 60.0f
        val tanHalf = (Math.tan((rc.FOVAngle * Math.PI) / 360.0).toFloat()) * RenderContext.NEAR_PLANE
        val dd = drawDistance.toFloat()
        Debug.Log("Renderer: Using drawDistance = $drawDistance")
        rc.projectionMatrix.reset()
        rc.projectionMatrix.glFrustumf(
            -rc.aspectRatio * tanHalf, rc.aspectRatio * tanHalf,
            -tanHalf, tanHalf, RenderContext.NEAR_PLANE, dd
        )
        rc.drawDistance = dd
        rc.projectionHUDMatrix.reset()
        rc.projectionHUDMatrix.glOrthof(
            -rc.aspectRatio, rc.aspectRatio,
            -1.0f, 1.0f, -1.0f, 1.0f
        )
        rc.windlightSky?.updateMatrix(rc)
        firstFrameTime = System.currentTimeMillis()
    }

    override fun onSurfaceCreated(gl10: GL10, eglConfig: EGLConfig) {
        onSurfaceCreated(gl10, eglConfig, false)
    }

    fun onSurfaceCreated(gl10: GL10, eglConfig: EGLConfig, useExternalTextures: Boolean) {
        TextureMemoryTracker.setActiveRenderer(this)
        drawingEnabled.set(true)
        firstFrameCount.set(EMPTY_FRAMES_COUNT)
        PrimComputeExecutor.getInstance().resume()
        gpuCapabilities = GpuCapabilities.probe(requestGL20, createdGL30)
        createdGL30 = gpuCapabilities!!.supportsEs3
        Debug.Printf(
            "Renderer: VBO support %s, GL11 %s, GL30 %s, tier %s",
            gpuCapabilities!!.supportsVbo,
            gpuCapabilities!!.reportsEs11,
            gpuCapabilities!!.supportsEs3,
            gpuCapabilities!!.selectedTier
        )
        val rc = RenderContext(
            eglConfig, gpuCapabilities!!, avatarCountLimit,
            GlobalOptions.getInstance().terrainTextures, fontSize,
            useExternalTextures, this
        )
        Debug.AlwaysPrintf("Renderer: created context, GL30 %b, GL20 %b", rc.hasGL30, rc.hasGL20)
        if (rc.hasGL20) {
            if (rc.getShaderCompileErrors()) {
                Debug.Printf("Renderer: Shaders did not compile well.")
                stateHandler.sendEmptyMessage(MSG_SHADER_COMPILE_ERROR)
                drawingEnabled.set(false)
            }
            Debug.Printf("Renderer: Basic geometry program = %d", rc.primProgram!!.getHandle())
            GLES20.glClearColor(0.1f, 0.1f, 0.5f, 1.0f)
            if (rc.useFXAA) {
                framebuffers = IntArray(1)
                GLES20.glGenFramebuffers(1, framebuffers!!, 0)
            } else {
                framebuffers = null
            }
            renderbuffers = null
            colorbuffers = null
        } else {
            GLES10.glEnableClientState(32884)
            GLES10.glClearColor(0.1f, 0.1f, 0.5f, 1.0f)
        }
        val currentCircuit = agentCircuit.getData()
        if (currentCircuit != null) {
            rc.setMeshCapURL(currentCircuit.getCaps()!!.getMeshFetchURL())
        }
        renderContext.set(rc)
        hoverTextEnableHUDs = GlobalOptions.getInstance().hoverTextEnableHUDs
        hoverTextEnableObjects = GlobalOptions.getInstance().hoverTextEnableObjects
        stateHandler.sendEmptyMessage(MSG_SURFACE_CREATED)
        PrimComputeExecutor.getInstance().execute(initSpatialIndexRunnable)
        firstFrameTime = System.currentTimeMillis()
    }

    fun pickObject(pickX: Float, pickY: Float, handler: Handler) {
        synchronized(pickLock) {
            needPickX = pickX
            needPickY = pickY
            needPickObject = true
            pickHandler = handler
        }
    }

    fun requestScreenshot(handler: Handler) {
        screenshotHandler = handler
    }

    fun setAvatarCountLimit(limit: Int) {
        avatarCountLimit = limit
        SpatialIndex.getInstance().setAvatarCountLimit(limit)
    }

    fun setDisplayedHUDid(id: Int) {
        displayedHUDid = id
    }

    fun setDrawDistance(distance: Int) {
        drawDistance = distance
        renderContext.get()?.drawDistance = distance.toFloat()
    }

    fun setDrawPickedObject(objectInfo: SLObjectInfo?) {
        drawPickedObject = objectInfo
    }

    fun setForcedTime(enabled: Boolean, time: Float) {
        forcedTime = if (enabled) time else Float.NaN
    }

    fun setHUDOffset(offsetX: Float, offsetY: Float) {
        hudOffsetX = offsetX
        hudOffsetY = offsetY
    }

    fun setHUDScaleFactor(scale: Float) {
        hudScaleFactor = scale
    }

    fun setIsInteracting(interacting: Boolean) {
        var changed = false
        synchronized(responsiveModeLock) {
            if (isInteracting != interacting) {
                isInteracting = interacting
                changed = true
            }
        }
        if (changed) updateResponsive()
    }

    fun setOwnAvatarHidden(hidden: Boolean) {
        ownAvatarHidden = hidden
    }

    fun touchHUD(x: Float, y: Float, handler: Handler) {
        touchHandler = handler
        if (displayedHUDid != 0) {
            touchHUDEvents.add(TouchHUDEvent(x, y))
        }
    }

    companion object {
        private const val EGL_CONTEXT_CLIENT_VERSION = 12440
        private const val EMPTY_FRAMES_COUNT = 1
        private const val EXT_TEXTURE_MATRIX = 0
        private const val EXT_TEXTURE_MATRIX_EYE = 16
        private const val EXT_TEXTURE_MATRIX_INVERSE = 48
        private const val EXT_TEXTURE_MATRIX_RESULT = 32
        private const val MIN_DRAW_LIST_UPDATE_FRAMES = 4
        private const val MIN_DRAW_LIST_UPDATE_INTERVAL = 100L

        const val MSG_SCREENSHOT = 5
        const val MSG_SET_PICKED_OBJECT = 1
        const val MSG_SET_TOUCHED_OBJECT = 2
        const val MSG_SHADER_COMPILE_ERROR = 4
        const val MSG_SURFACE_CREATED = 3
    }
}
