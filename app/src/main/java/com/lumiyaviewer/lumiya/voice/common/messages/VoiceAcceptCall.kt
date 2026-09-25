package com.lumiyaviewer.lumiya.voice.common.messages

import android.os.Bundle
import com.lumiyaviewer.lumiya.voice.common.VoicePluginMessage
import com.lumiyaviewer.lumiya.voice.common.model.VoiceChannelInfo

class VoiceAcceptCall : VoicePluginMessage {
    @JvmField
    val sessionHandle: String?
    @JvmField
    val voiceChannelInfo: VoiceChannelInfo

    constructor(bundle: Bundle) {
        this.sessionHandle = bundle.getString("sessionHandle")
        this.voiceChannelInfo = VoiceChannelInfo(bundle.getBundle("voiceChannelInfo"))
    }

    constructor(sessionHandle: String?, voiceChannelInfo: VoiceChannelInfo) {
        this.sessionHandle = sessionHandle
        this.voiceChannelInfo = voiceChannelInfo
    }

    override fun toBundle(): Bundle = Bundle().apply {
        putString("sessionHandle", sessionHandle)
        putBundle("voiceChannelInfo", voiceChannelInfo.toBundle())
    }
}
