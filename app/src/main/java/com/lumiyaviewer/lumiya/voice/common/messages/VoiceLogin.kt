package com.lumiyaviewer.lumiya.voice.common.messages

import android.os.Bundle
import com.lumiyaviewer.lumiya.voice.common.VoicePluginMessage
import com.lumiyaviewer.lumiya.voice.common.model.VoiceLoginInfo

class VoiceLogin : VoicePluginMessage {
    @JvmField
    val voiceLoginInfo: VoiceLoginInfo

    constructor(bundle: Bundle) {
        this.voiceLoginInfo = VoiceLoginInfo(bundle.getBundle("voiceLoginInfo"))
    }

    constructor(voiceLoginInfo: VoiceLoginInfo) {
        this.voiceLoginInfo = voiceLoginInfo
    }

    override fun toBundle(): Bundle = Bundle().apply {
        putBundle("voiceLoginInfo", voiceLoginInfo.toBundle())
    }
}
