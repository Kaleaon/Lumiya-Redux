package com.lumiyaviewer.lumiya.voice.common.messages

import android.os.Bundle
import com.lumiyaviewer.lumiya.voice.common.VoicePluginMessage
import com.lumiyaviewer.lumiya.voice.common.model.Voice3DPosition
import com.lumiyaviewer.lumiya.voice.common.model.VoiceChannelInfo

class VoiceSet3DPosition : VoicePluginMessage {
    @JvmField
    val listenerPosition: Voice3DPosition
    @JvmField
    val speakerPosition: Voice3DPosition
    @JvmField
    val voiceChannelInfo: VoiceChannelInfo

    constructor(bundle: Bundle) {
        this.voiceChannelInfo = VoiceChannelInfo(bundle.getBundle("voiceChannelInfo"))
        this.speakerPosition = Voice3DPosition(bundle.getBundle("speakerPosition"))
        this.listenerPosition = Voice3DPosition(bundle.getBundle("listenerPosition"))
    }

    constructor(voiceChannelInfo: VoiceChannelInfo, voice3DPosition: Voice3DPosition, listenerPosition: Voice3DPosition) {
        this.voiceChannelInfo = voiceChannelInfo
        this.speakerPosition = voice3DPosition
        this.listenerPosition = listenerPosition
    }

    override fun toBundle(): Bundle = Bundle().apply {
        putBundle("voiceChannelInfo", voiceChannelInfo.toBundle())
        putBundle("speakerPosition", speakerPosition.toBundle())
        putBundle("listenerPosition", listenerPosition.toBundle())
    }
}
