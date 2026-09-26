package com.lumiyaviewer.lumiya.voice.common.model

import android.net.Uri
import android.os.Bundle
import com.google.common.base.Objects
import java.util.UUID
import javax.annotation.Nonnull
import javax.annotation.Nullable

class VoiceChannelInfo {
    val isConference: Boolean
    val isSpatial: Boolean
    val voiceChannelURI: String?

    constructor(uri: Uri) {
        voiceChannelURI = uri.getQueryParameter("voiceChannelURI")
        isSpatial = Objects.equal(uri.getQueryParameter("isSpatial"), "true")
        isConference = Objects.equal(uri.getQueryParameter("isConference"), "true")
    }

    constructor(bundle: Bundle) {
        voiceChannelURI = bundle.getString("voiceChannelURI")
        isSpatial = bundle.getBoolean("isSpatial")
        isConference = bundle.getBoolean("isConference")
    }

    constructor(voiceChannelURI: String?, isSpatial: Boolean, isConference: Boolean) {
        this.voiceChannelURI = voiceChannelURI
        this.isSpatial = isSpatial
        this.isConference = isConference
    }

    @Nullable
    fun getAgentUUID(): UUID? {
        if (voiceChannelURI == null || isSpatial) return null
        return try {
            UUID.fromString(voiceChannelURI)
        } catch (e: IllegalArgumentException) {
            null
        }
    }

    fun appendToUri(builder: Uri.Builder) {
        builder.appendQueryParameter("voiceChannelURI", voiceChannelURI)
        builder.appendQueryParameter("isSpatial", if (isSpatial) "true" else "false")
        builder.appendQueryParameter("isConference", if (isConference) "true" else "false")
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (other == null || javaClass != other.javaClass) return false
        other as VoiceChannelInfo
        if (isSpatial != other.isSpatial || isConference != other.isConference) return false
        return if (voiceChannelURI == null) other.voiceChannelURI == null else voiceChannelURI == other.voiceChannelURI
    }

    override fun hashCode(): Int {
        return ((((voiceChannelURI?.hashCode() ?: 0) * 31) + if (isSpatial) 1 else 0) * 31) + if (isConference) 1 else 0
    }

    fun toBundle(): Bundle = Bundle().apply {
        putString("voiceChannelURI", voiceChannelURI)
        putBoolean("isSpatial", isSpatial)
        putBoolean("isConference", isConference)
    }

    companion object {
        /** Spatial parcel channel: "{regionUUID}-{parcelLocalId}" */
        @JvmStatic
        fun forParcel(@Nonnull regionUUID: UUID, parcelLocalId: Int): VoiceChannelInfo =
            VoiceChannelInfo("$regionUUID-$parcelLocalId", true, true)

        /** Non-spatial P2P call: "{agentUUID}" */
        @JvmStatic
        fun forUser(@Nonnull agentUUID: UUID): VoiceChannelInfo =
            VoiceChannelInfo(agentUUID.toString(), false, false)

        /** Estate-wide spatial channel */
        @JvmStatic
        fun forEstate(): VoiceChannelInfo =
            VoiceChannelInfo("Estate", true, true)
    }
}
