package com.lumiyaviewer.lumiya.ui.render.vr

import android.app.Activity
import android.view.View
import com.google.vr.sdk.base.Eye
import com.google.vr.sdk.base.GvrView
import com.google.vr.sdk.base.HeadTransform
import com.google.vr.sdk.base.Viewport
import com.google.vr.sdk.controller.Controller
import com.google.vr.sdk.controller.ControllerManager
import com.lumiyaviewer.lumiya.Debug
import javax.microedition.khronos.egl.EGLConfig

internal class GvrVrSessionAdapter(
    activity: Activity,
    private val runtimeId: String,
    listener: VrSession.Listener,
    asyncReprojectionEnabled: Boolean
) : VrSession {

    private val gvrView: GvrView = GvrView(activity)
    private val controllerManager: ControllerManager
    private val controller: Controller?
    private var inputListener: VrSession.InputListener? = null
    @Volatile
    private var controllerConnectionState: Int = 0

    init {
        gvrView.setDistortionCorrectionEnabled(true)
        gvrView.setAsyncReprojectionEnabled(asyncReprojectionEnabled)

        controllerManager = ControllerManager(activity, object : ControllerManager.EventListener {
            override fun onApiStatusChanged(status: Int) {
                listener.onApiStatusChanged(status)
            }

            override fun onRecentered() {
                listener.onRecentered()
            }
        })

        controller = controllerManager.controller
        if (controller != null) {
            controller.setEventListener(object : Controller.EventListener() {
                override fun onConnectionStateChanged(state: Int) {
                    super.onConnectionStateChanged(state)
                    controllerConnectionState = state
                    inputListener?.onConnectionStateChanged(state)
                }

                override fun onUpdate() {
                    super.onUpdate()
                    val ctrl = controller ?: return
                    ctrl.update()
                    inputListener?.onInputUpdated(
                        VrInputState(
                            ctrl.appButtonState,
                            ctrl.isTouching,
                            ctrl.touch.x,
                            ctrl.touch.y,
                            controllerConnectionState
                        )
                    )
                }
            })
        } else {
            Debug.Printf("VR runtime: %s controller manager returned null controller", runtimeId)
        }
    }

    override fun getView(): View = gvrView

    override fun setRenderer(renderer: VrSession.Renderer) {
        gvrView.setRenderer(object : GvrView.StereoRenderer {
            override fun onNewFrame(headTransform: HeadTransform) {
                renderer.onNewFrame(object : VrPose {
                    override fun getQuaternion(out: FloatArray, offset: Int) {
                        headTransform.getQuaternion(out, offset)
                    }

                    override fun getTranslation(out: FloatArray, offset: Int) {
                        headTransform.getTranslation(out, offset)
                    }

                    override fun getHeadView(out: FloatArray, offset: Int) {
                        headTransform.getHeadView(out, offset)
                    }

                    override fun getEulerAngles(out: FloatArray, offset: Int) {
                        headTransform.getEulerAngles(out, offset)
                    }

                    override fun getRightVector(out: FloatArray, offset: Int) {
                        headTransform.getRightVector(out, offset)
                    }
                })
            }

            override fun onDrawEye(eye: Eye) {
                renderer.onDrawEye(object : VrEye {
                    override fun getType(): Int {
                        return if (eye.type == 1) VrEye.TYPE_LEFT else VrEye.TYPE_RIGHT
                    }

                    override fun getViewport(out: IntArray, offset: Int) {
                        eye.viewport.getAsArray(out, offset)
                    }

                    override fun getPerspective(near: Float, far: Float): FloatArray {
                        return eye.getPerspective(near, far)
                    }

                    override fun isProjectionChanged(): Boolean {
                        return eye.projectionChanged
                    }
                })
            }

            override fun onFinishFrame(viewport: Viewport) {
                renderer.onFinishFrame()
            }

            override fun onSurfaceChanged(width: Int, height: Int) {
                renderer.onSurfaceChanged(width, height)
            }

            override fun onSurfaceCreated(config: EGLConfig) {
                renderer.onSurfaceCreated(config)
            }

            override fun onRendererShutdown() {
                renderer.onRendererShutdown()
            }
        })
    }

    override fun setOnTriggerListener(runnable: Runnable) {
        gvrView.setOnCardboardTriggerListener(runnable)
    }

    override fun setOnTouchListener(listener: View.OnTouchListener) {
        gvrView.setOnTouchListener(listener)
    }

    override fun setInputListener(listener: VrSession.InputListener) {
        inputListener = listener
    }

    override fun onStart() {
        controllerManager.start()
    }

    override fun onStop() {
        controllerManager.stop()
    }

    override fun onResume() {
        gvrView.onResume()
    }

    override fun onPause() {
        gvrView.onPause()
    }

    override fun onDestroy() {
        gvrView.setOnCardboardTriggerListener(null)
        gvrView.shutdown()
    }

    override fun recenterHeadTracker() {
        gvrView.recenterHeadTracker()
    }

    override fun getInterpupillaryDistance(): Float {
        return gvrView.interpupillaryDistance
    }

    override fun hasMagnet(): Boolean {
        return gvrView.gvrViewerParams.hasMagnet
    }
}
