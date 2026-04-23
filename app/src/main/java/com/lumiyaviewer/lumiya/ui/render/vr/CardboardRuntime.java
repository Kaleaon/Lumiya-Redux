package com.lumiyaviewer.lumiya.ui.render.vr;

import android.app.Activity;

public class CardboardRuntime implements VrRuntime {
    public static final String ID = "cardboard";

    @Override
    public String getRuntimeId() {
        return ID;
    }

    @Override
    public VrSession createSession(Activity activity, VrSession.Listener listener) {
        return new GvrVrSessionAdapter(activity, ID, listener, true);
    }
}
