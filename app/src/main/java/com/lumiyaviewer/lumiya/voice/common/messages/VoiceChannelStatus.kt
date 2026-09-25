package com.lumiyaviewer.lumiya.voice.common.messages

import android.os.Bundle
import com.lumiyaviewer.lumiya.voice.common.VoicePluginMessage
import com.lumiyaviewer.lumiya.voice.common.model.VoiceChannelInfo
import com.lumiyaviewer.lumiya.voice.common.model.VoiceChatInfo

class VoiceChannelStatus : VoicePluginMessage {
    @JvmField
    val channelInfo: VoiceChannelInfo
    @JvmField
    val chatInfo: VoiceChatInfo
    @JvmField
    val errorMessage: String?

    constructor(bundle: Bundle) {
        this.channelInfo = VoiceChannelInfo(bundle.getBundle("channelInfo"))
        this.chatInfo = VoiceChatInfo.create(bundle.getBundle("chatInfo"))
        this.errorMessage = bundle.getString("errorMessage")
    }

    constructor(voiceChannelInfo: VoiceChannelInfo, voiceChatInfo: VoiceChatInfo, errorMessage: String?) {
        this.channelInfo = voiceChannelInfo
        this.chatInfo = voiceChatInfo
        this.errorMessage = errorMessage
    }

    override fun toBundle(): Bundle = Bundle().apply {
        putBundle("channelInfo", channelInfo.toBundle())
        putBundle("chatInfo", chatInfo.toBundle())
        putString("errorMessage", errorMessage)
    }
}
