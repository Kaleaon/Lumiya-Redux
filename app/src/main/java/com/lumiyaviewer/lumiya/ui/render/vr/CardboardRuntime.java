package com.lumiyaviewer.lumiya.ui.render.vr;

import android.app.Activity;
import android.view.View;
import com.google.vr.sdk.base.Eye;
import com.google.vr.sdk.base.GvrView;
import com.google.vr.sdk.base.HeadTransform;
import com.google.vr.sdk.base.Viewport;
import com.google.vr.sdk.controller.Controller;
import com.google.vr.sdk.controller.ControllerManager;
import javax.microedition.khronos.egl.EGLConfig;

public class CardboardRuntime implements VrRuntime {
    public static final String ID = "cardboard";

    @Override
    public String getRuntimeId() {
        return ID;
    }

    @Override
    public VrSession createSession(Activity activity, VrSession.Listener listener) {
        return new CardboardSession(activity, listener);
    }

    private static class CardboardSession implements VrSession {
        private final GvrView gvrView;
        private final ControllerManager controllerManager;
        private final Controller controller;
        private VrSession.InputListener inputListener;

        CardboardSession(Activity activity, final VrSession.Listener listener) {
            this.gvrView = new GvrView(activity);
            this.gvrView.setDistortionCorrectionEnabled(true);
            this.gvrView.setAsyncReprojectionEnabled(true);
            this.controllerManager = new ControllerManager(activity, new ControllerManager.EventListener() {
                @Override
                public void onApiStatusChanged(int i) {
                    listener.onApiStatusChanged(i);
                }

                @Override
                public void onRecentered() {
                    listener.onRecentered();
                }
            });
            this.controller = this.controllerManager.getController();
            if (this.controller != null) {
                this.controller.setEventListener(new Controller.EventListener() {
                    @Override
                    public void onConnectionStateChanged(int i) {
                        super.onConnectionStateChanged(i);
                        if (CardboardSession.this.inputListener != null) {
                            CardboardSession.this.inputListener.onConnectionStateChanged(i);
                        }
                    }

                    @Override
                    public void onUpdate() {
                        super.onUpdate();
                        if (CardboardSession.this.controller == null) {
                            return;
                        }
                        CardboardSession.this.controller.update();
                        if (CardboardSession.this.inputListener != null) {
                            CardboardSession.this.inputListener.onInputUpdated(new VrInputState(CardboardSession.this.controller.appButtonState, CardboardSession.this.controller.isTouching, CardboardSession.this.controller.touch.x, CardboardSession.this.controller.touch.y, CardboardSession.this.controller.getConnectionState()));
                        }
                    }
                });
            }
        }

        @Override
        public View getView() {
            return this.gvrView;
        }

        @Override
        public void setRenderer(final Renderer renderer) {
            this.gvrView.setRenderer(new GvrView.StereoRenderer() {
                @Override
                public void onNewFrame(final HeadTransform headTransform) {
                    renderer.onNewFrame(new VrPose() {
                        @Override
                        public void getQuaternion(float[] out, int offset) {
                            headTransform.getQuaternion(out, offset);
                        }

                        @Override
                        public void getTranslation(float[] out, int offset) {
                            headTransform.getTranslation(out, offset);
                        }

                        @Override
                        public void getHeadView(float[] out, int offset) {
                            headTransform.getHeadView(out, offset);
                        }

                        @Override
                        public void getEulerAngles(float[] out, int offset) {
                            headTransform.getEulerAngles(out, offset);
                        }

                        @Override
                        public void getRightVector(float[] out, int offset) {
                            headTransform.getRightVector(out, offset);
                        }
                    });
                }

                @Override
                public void onDrawEye(final Eye eye) {
                    renderer.onDrawEye(new VrEye() {
                        @Override
                        public int getType() {
                            return eye.getType() == 1 ? TYPE_LEFT : TYPE_RIGHT;
                        }

                        @Override
                        public void getViewport(int[] out, int offset) {
                            eye.getViewport().getAsArray(out, offset);
                        }

                        @Override
                        public float[] getPerspective(float near, float far) {
                            return eye.getPerspective(near, far);
                        }

                        @Override
                        public boolean isProjectionChanged() {
                            return eye.getProjectionChanged();
                        }
                    });
                }

                @Override
                public void onFinishFrame(Viewport viewport) {
                    renderer.onFinishFrame();
                }

                @Override
                public void onSurfaceChanged(int width, int height) {
                    renderer.onSurfaceChanged(width, height);
                }

                @Override
                public void onSurfaceCreated(EGLConfig config) {
                    renderer.onSurfaceCreated(config);
                }

                @Override
                public void onRendererShutdown() {
                    renderer.onRendererShutdown();
                }
            });
        }

        @Override
        public void setOnTriggerListener(Runnable runnable) {
            this.gvrView.setOnCardboardTriggerListener(runnable);
        }

        @Override
        public void setOnTouchListener(View.OnTouchListener listener) {
            this.gvrView.setOnTouchListener(listener);
        }

        @Override
        public void setInputListener(InputListener listener) {
            this.inputListener = listener;
        }

        @Override
        public void onStart() {
            this.controllerManager.start();
        }

        @Override
        public void onStop() {
            this.controllerManager.stop();
        }

        @Override
        public void onResume() {
            this.gvrView.onResume();
        }

        @Override
        public void onPause() {
            this.gvrView.onPause();
        }

        @Override
        public void onDestroy() {
            this.gvrView.setOnCardboardTriggerListener(null);
            this.gvrView.shutdown();
        }

        @Override
        public void recenterHeadTracker() {
            this.gvrView.recenterHeadTracker();
        }

        @Override
        public float getInterpupillaryDistance() {
            return this.gvrView.getInterpupillaryDistance();
        }

        @Override
        public boolean hasMagnet() {
            return this.gvrView.getGvrViewerParams().getHasMagnet();
        }
    }
}
