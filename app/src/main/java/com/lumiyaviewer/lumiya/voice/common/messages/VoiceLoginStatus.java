package com.lumiyaviewer.lumiya.voice.common.messages;

import android.os.Bundle;
import com.lumiyaviewer.lumiya.voice.common.VoicePluginMessage;
import com.lumiyaviewer.lumiya.voice.common.model.VoiceLoginInfo;
import javax.annotation.Nullable;

public class VoiceLoginStatus implements VoicePluginMessage {

    @Nullable
    public final String errorMessage;
    public final boolean loggedIn;

    @Nullable
    public final VoiceLoginInfo voiceLoginInfo;

    public VoiceLoginStatus(Bundle bundle) {
        Bundle bundle2 = bundle.getBundle("voiceLoginInfo");
        this.voiceLoginInfo = bundle2 != null ? new VoiceLoginInfo(bundle2) : null;
        this.loggedIn = bundle.getBoolean("loggedIn");
        this.errorMessage = bundle.getString("errorMessage");
    }

    public VoiceLoginStatus(@Nullable VoiceLoginInfo voiceLoginInfo, boolean loggedIn, @Nullable String errorMessage) {
        this.voiceLoginInfo = voiceLoginInfo;
        this.loggedIn = loggedIn;
        this.errorMessage = errorMessage;
    }

    @Override
    public Bundle toBundle() {
        Bundle bundle = new Bundle();
        bundle.putBundle("voiceLoginInfo", this.voiceLoginInfo != null ? this.voiceLoginInfo.toBundle() : null);
        bundle.putBoolean("loggedIn", this.loggedIn);
        bundle.putString("errorMessage", this.errorMessage);
        return bundle;
    }
}
