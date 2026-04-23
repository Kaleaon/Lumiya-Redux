package com.lumiyaviewer.lumiya.ui.render.vr;

import android.view.View;
import android.view.View.OnTouchListener;
import javax.microedition.khronos.egl.EGLConfig;

public interface VrSession {
    interface Renderer {
        void onDrawEye(VrEye eye);

        void onFinishFrame();

        void onNewFrame(VrPose pose);

        void onRendererShutdown();

        void onSurfaceChanged(int width, int height);

        void onSurfaceCreated(EGLConfig config);
    }

    interface Listener {
        void onApiStatusChanged(int status);

        void onRecentered();
    }

    interface InputListener {
        void onInputUpdated(VrInputState inputState);

        void onConnectionStateChanged(int state);
    }

    View getView();

    void setRenderer(Renderer renderer);

    void setOnTriggerListener(Runnable runnable);

    void setOnTouchListener(OnTouchListener listener);

    void setInputListener(InputListener listener);

    void onStart();

    void onStop();

    void onResume();

    void onPause();

    void onDestroy();

    void recenterHeadTracker();

    float getInterpupillaryDistance();

    boolean hasMagnet();
}
