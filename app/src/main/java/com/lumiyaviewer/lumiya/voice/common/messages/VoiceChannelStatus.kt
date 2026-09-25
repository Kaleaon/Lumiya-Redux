package com.lumiyaviewer.lumiya.voice.common.messages

import com.lumiyaviewer.lumiya.voice.common.model.VoiceChannelInfo
import com.lumiyaviewer.lumiya.voice.common.model.VoiceChatInfo

class VoiceChannelStatus(
    @JvmField val channelInfo: VoiceChannelInfo,
    @JvmField val chatInfo: VoiceChatInfo,
    @JvmField val errorMessage: String?
)
