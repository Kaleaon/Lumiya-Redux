package com.lumiyaviewer.lumiya.voice.common.model;

import java.util.UUID;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public class VoiceLoginInfo {

    @Nonnull
    public final UUID agentUUID;

    @Nullable
    public final String voiceServerType;

    @Nullable
    public final String provisionCapURL;

    @Nullable
    public final String signalingCapURL;

    public VoiceLoginInfo(@Nonnull UUID agentUUID, @Nullable String voiceServerType,
                          @Nullable String provisionCapURL, @Nullable String signalingCapURL) {
        this.agentUUID = agentUUID;
        this.voiceServerType = voiceServerType;
        this.provisionCapURL = provisionCapURL;
        this.signalingCapURL = signalingCapURL;
    }

    public boolean isWebRTC() {
        return "webrtc".equals(voiceServerType);
    }

    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        VoiceLoginInfo other = (VoiceLoginInfo) obj;
        if (!agentUUID.equals(other.agentUUID)) return false;
        if (voiceServerType != null ? !voiceServerType.equals(other.voiceServerType) : other.voiceServerType != null) return false;
        if (provisionCapURL != null ? !provisionCapURL.equals(other.provisionCapURL) : other.provisionCapURL != null) return false;
        return signalingCapURL != null ? signalingCapURL.equals(other.signalingCapURL) : other.signalingCapURL == null;
    }

    public int hashCode() {
        int result = agentUUID.hashCode();
        result = 31 * result + (voiceServerType != null ? voiceServerType.hashCode() : 0);
        result = 31 * result + (provisionCapURL != null ? provisionCapURL.hashCode() : 0);
        result = 31 * result + (signalingCapURL != null ? signalingCapURL.hashCode() : 0);
        return result;
    }
}
