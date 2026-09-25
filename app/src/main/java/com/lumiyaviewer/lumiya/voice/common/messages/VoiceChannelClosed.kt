package com.lumiyaviewer.lumiya.voice.common.messages

import android.os.Bundle
import com.lumiyaviewer.lumiya.voice.common.VoicePluginMessage
import com.lumiyaviewer.lumiya.voice.common.model.VoiceChannelInfo

class VoiceChannelClosed : VoicePluginMessage {
    @JvmField
    val channelInfo: VoiceChannelInfo

    constructor(bundle: Bundle) {
        this.channelInfo = VoiceChannelInfo(bundle.getBundle("channelInfo"))
    }

    constructor(voiceChannelInfo: VoiceChannelInfo) {
        this.channelInfo = voiceChannelInfo
    }

    override fun toBundle(): Bundle = Bundle().apply {
        putBundle("channelInfo", channelInfo.toBundle())
    }
}
