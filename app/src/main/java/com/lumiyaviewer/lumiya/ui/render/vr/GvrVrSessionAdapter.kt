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

internal class GvrVrSessionAdapter : VrSession {
    private String runtimeId
    private GvrView gvrView
    private ControllerManager controllerManager
    private Controller controller
    private VrSession.InputListener inputListener
    private volatile int controllerConnectionState

    internal constructor(activity: Activity, runtimeId: String, listener: VrSession.Listener, asyncReprojectionEnabled: Boolean) {
        this.runtimeId = runtimeId
        this.gvrView = GvrView(activity)
        this.gvrView.setDistortionCorrectionEnabled(true)
        this.gvrView.setAsyncReprojectionEnabled(asyncReprojectionEnabled)
        this.controllerManager = ControllerManager(activity, new ControllerManager.EventListener() {
            override fun onApiStatusChanged(i: Int) {
                listener.onApiStatusChanged(i)
            }

            override fun onRecentered() {
                listener.onRecentered()
            }
        })
        this.controller = this.controllerManager.getController()
        internal fun if(null: this.controller !=):  {
            this.controller.setEventListener(new Controller.EventListener() {
                override fun onConnectionStateChanged(i: Int) {
                    super.onConnectionStateChanged(i)
                    GvrVrSessionAdapter.this.controllerConnectionState = i
                    internal fun if(null: GvrVrSessionAdapter.this.inputListener !=):  {
                        GvrVrSessionAdapter.this.inputListener.onConnectionStateChanged(i)
                    }
                }

                override fun onUpdate() {
                    super.onUpdate()
                    internal fun if(null: GvrVrSessionAdapter.this.controller ==):  {
                        return
                    }
                    GvrVrSessionAdapter.this.controller.update()
                    internal fun if(null: GvrVrSessionAdapter.this.inputListener !=):  {
                        GvrVrSessionAdapter.this.inputListener.onInputUpdated(VrInputState(GvrVrSessionAdapter.this.controller.appButtonState, GvrVrSessionAdapter.this.controller.isTouching, GvrVrSessionAdapter.this.controller.touch.x, GvrVrSessionAdapter.this.controller.touch.y, GvrVrSessionAdapter.this.controllerConnectionState))
                    }
                }
            })
            return
        }
        Debug.Printf("VR runtime: %s controller manager returned null controller", runtimeId)
    }

    override fun getView(): View {
        return this.gvrView
    }

    override fun setRenderer(renderer: Renderer) {
        this.gvrView.setRenderer(new GvrView.StereoRenderer() {
            override fun onNewFrame(headTransform: HeadTransform) {
                renderer.onNewFrame(VrPose() {
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
                renderer.onDrawEye(VrEye() {
                    override fun getType(): Int {
                        return eye.getType() == 1 ? TYPE_LEFT : TYPE_RIGHT
                    }

                    override fun getViewport(out: IntArray, offset: Int) {
                        eye.getViewport().getAsArray(out, offset)
                    }

                    override fun getPerspective(near: Float, far: Float): FloatArray {
                        return eye.getPerspective(near, far)
                    }

                    override fun isProjectionChanged(): Boolean {
                        return eye.getProjectionChanged()
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
        this.gvrView.setOnCardboardTriggerListener(runnable)
    }

    override fun setOnTouchListener(listener: View.OnTouchListener) {
        this.gvrView.setOnTouchListener(listener)
    }

    override fun setInputListener(listener: InputListener) {
        this.inputListener = listener
    }

    override fun onStart() {
        this.controllerManager.start()
    }

    override fun onStop() {
        this.controllerManager.stop()
    }

    override fun onResume() {
        this.gvrView.onResume()
    }

    override fun onPause() {
        this.gvrView.onPause()
    }

    override fun onDestroy() {
        this.gvrView.setOnCardboardTriggerListener(null)
        this.gvrView.shutdown()
    }

    override fun recenterHeadTracker() {
        this.gvrView.recenterHeadTracker()
    }

    override fun getInterpupillaryDistance(): Float {
        return this.gvrView.getInterpupillaryDistance()
    }

    override fun hasMagnet(): Boolean {
        return this.gvrView.getGvrViewerParams().getHasMagnet()
    }
}
