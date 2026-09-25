package com.lumiyaviewer.lumiya.voice.common.messages

import android.os.Bundle
import com.lumiyaviewer.lumiya.voice.common.VoicePluginMessage
import com.lumiyaviewer.lumiya.voice.common.model.VoiceChannelInfo

class VoiceConnectChannel : VoicePluginMessage {
    @JvmField
    val channelCredentials: String?
    @JvmField
    val voiceChannelInfo: VoiceChannelInfo

    constructor(bundle: Bundle) {
        this.voiceChannelInfo = VoiceChannelInfo(bundle.getBundle("voiceChannelInfo"))
        this.channelCredentials = bundle.getString("channelCredentials")
    }

    constructor(voiceChannelInfo: VoiceChannelInfo, channelCredentials: String?) {
        this.voiceChannelInfo = voiceChannelInfo
        this.channelCredentials = channelCredentials
    }

    override fun toBundle(): Bundle = Bundle().apply {
        putBundle("voiceChannelInfo", voiceChannelInfo.toBundle())
        putString("channelCredentials", channelCredentials)
    }
}
