package com.lumiyaviewer.lumiya.voice.common.messages

import android.net.Uri
import android.os.Bundle
import com.lumiyaviewer.lumiya.BuildConfig
import com.lumiyaviewer.lumiya.voice.common.VoicePluginMessage
import com.lumiyaviewer.lumiya.voice.common.model.VoiceChannelInfo
import java.util.UUID

class VoiceRinging : VoicePluginMessage {
    @JvmField
    val agentUUID: UUID?
    @JvmField
    val sessionHandle: String
    @JvmField
    val voiceChannelInfo: VoiceChannelInfo

    constructor(uri: Uri) {
        this.sessionHandle = uri.getQueryParameter("sessionHandle")!!
        val queryParameter = uri.getQueryParameter("agentUUID")
        this.agentUUID = if (queryParameter != null) UUID.fromString(queryParameter) else null
        this.voiceChannelInfo = VoiceChannelInfo(uri)
    }

    constructor(bundle: Bundle) {
        this.sessionHandle = bundle.getString("sessionHandle")!!
        this.voiceChannelInfo = VoiceChannelInfo(bundle.getBundle("voiceChannelInfo"))
        val string = bundle.getString("agentUUID")
        this.agentUUID = if (string != null) UUID.fromString(string) else null
    }

    constructor(sessionHandle: String, voiceChannelInfo: VoiceChannelInfo, uuid: UUID?) {
        this.sessionHandle = sessionHandle
        this.voiceChannelInfo = voiceChannelInfo
        this.agentUUID = uuid
    }

    override fun toBundle(): Bundle = Bundle().apply {
        putString("sessionHandle", sessionHandle)
        putBundle("voiceChannelInfo", voiceChannelInfo.toBundle())
        putString("agentUUID", agentUUID?.toString())
    }

    fun toUri(): Uri {
        val appendQueryParameter = Uri.Builder()
            .scheme(BuildConfig.APPLICATION_ID)
            .authority("voice")
            .appendQueryParameter("sessionHandle", sessionHandle)
        if (agentUUID != null) {
            appendQueryParameter.appendQueryParameter("agentUUID", agentUUID.toString())
        }
        voiceChannelInfo.appendToUri(appendQueryParameter)
        return appendQueryParameter.build()
    }
}
