package com.lumiyaviewer.lumiya.voice.common.messages

import android.os.Bundle
import com.lumiyaviewer.lumiya.voice.common.VoicePluginMessage

class VoiceEnableMic : VoicePluginMessage {
    @JvmField
    val enableMic: Boolean

    constructor(bundle: Bundle) {
        this.enableMic = bundle.getBoolean("enableMic")
    }

    constructor(enableMic: Boolean) {
        this.enableMic = enableMic
    }

    override fun toBundle(): Bundle = Bundle().apply {
        putBoolean("enableMic", enableMic)
    }
}
