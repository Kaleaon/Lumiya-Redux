package com.lumiyaviewer.lumiya.voice.common.messages;

import android.os.Bundle;
import com.lumiyaviewer.lumiya.voice.common.VoicePluginMessage;

public class VoiceInitialize implements VoicePluginMessage {
    public final int appVersionCode;

    public VoiceInitialize(int appVersionCode) {
        this.appVersionCode = appVersionCode;
    }

    public VoiceInitialize(Bundle bundle) {
        this.appVersionCode = bundle.getInt("appVersionCode");
    }

    @Override
    public Bundle toBundle() {
        Bundle bundle = new Bundle();
        bundle.putInt("appVersionCode", this.appVersionCode);
        return bundle;
    }
}
