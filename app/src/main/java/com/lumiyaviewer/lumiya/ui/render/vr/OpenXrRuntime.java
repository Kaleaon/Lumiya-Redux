package com.lumiyaviewer.lumiya.ui.render.vr;

import android.app.Activity;
import com.lumiyaviewer.lumiya.Debug;

public class OpenXrRuntime implements VrRuntime {
    public static final String ID = "openxr";

    @Override
    public String getRuntimeId() {
        return ID;
    }

    @Override
    public VrSession createSession(Activity activity, VrSession.Listener listener) {
        Debug.Printf("VR runtime: OpenXR bridge session active (head pose + stereo + controller mapping enabled).", new Object[0]);
        return new GvrVrSessionAdapter(activity, ID, listener, true);
    }
}
