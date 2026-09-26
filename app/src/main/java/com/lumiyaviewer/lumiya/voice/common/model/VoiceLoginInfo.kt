package com.lumiyaviewer.lumiya.voice.common.model

import java.util.UUID
import javax.annotation.Nonnull
import javax.annotation.Nullable

class VoiceLoginInfo(
    @Nonnull val agentUUID: UUID,
    @Nullable val voiceServerType: String?,
    @Nullable val provisionCapURL: String?,
    @Nullable val signalingCapURL: String?
) {
    fun isWebRTC(): Boolean = "webrtc" == voiceServerType

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (other == null || javaClass != other.javaClass) return false
        other as VoiceLoginInfo
        if (agentUUID != other.agentUUID) return false
        if (voiceServerType != other.voiceServerType) return false
        if (provisionCapURL != other.provisionCapURL) return false
        return signalingCapURL == other.signalingCapURL
    }

    override fun hashCode(): Int {
        var result = agentUUID.hashCode()
        result = 31 * result + (voiceServerType?.hashCode() ?: 0)
        result = 31 * result + (provisionCapURL?.hashCode() ?: 0)
        result = 31 * result + (signalingCapURL?.hashCode() ?: 0)
        return result
    }
}
