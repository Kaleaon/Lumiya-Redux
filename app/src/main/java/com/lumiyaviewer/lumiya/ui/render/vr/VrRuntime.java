package com.lumiyaviewer.lumiya.ui.render.vr;

import android.app.Activity;

public interface VrRuntime {
    String getRuntimeId();

    VrSession createSession(Activity activity, VrSession.Listener listener);
}
