package com.lumiyaviewer.lumiya.ui.render.vr;

import android.app.Activity;
import android.view.View;
import com.lumiyaviewer.lumiya.Debug;
import javax.microedition.khronos.egl.EGLConfig;

public class OpenXrRuntime implements VrRuntime {
    public static final String ID = "openxr";

    @Override
    public String getRuntimeId() {
        return ID;
    }

    @Override
    public VrSession createSession(Activity activity, VrSession.Listener listener) {
        Debug.Printf("VR runtime: OpenXR selected but not fully ported, using no-op session fallback.", new Object[0]);
        return new NoOpVrSession(activity);
    }

    private static final class NoOpVrSession implements VrSession {
        private final View placeholderView;

        private NoOpVrSession(Activity activity) {
            this.placeholderView = new View(activity);
        }

        @Override
        public View getView() {
            return this.placeholderView;
        }

        @Override
        public void setRenderer(Renderer renderer) {
            renderer.onSurfaceCreated((EGLConfig) null);
            renderer.onSurfaceChanged(1, 1);
        }

        @Override
        public void setOnTriggerListener(Runnable runnable) {
        }

        @Override
        public void setOnTouchListener(View.OnTouchListener listener) {
            this.placeholderView.setOnTouchListener(listener);
        }

        @Override
        public void setInputListener(InputListener listener) {
            listener.onConnectionStateChanged(0);
            listener.onInputUpdated(VrInputState.EMPTY);
        }

        @Override
        public void onStart() {
        }

        @Override
        public void onStop() {
        }

        @Override
        public void onResume() {
        }

        @Override
        public void onPause() {
        }

        @Override
        public void onDestroy() {
        }

        @Override
        public void recenterHeadTracker() {
        }

        @Override
        public float getInterpupillaryDistance() {
            return 0.0f;
        }

        @Override
        public boolean hasMagnet() {
            return false;
        }
    }
}
