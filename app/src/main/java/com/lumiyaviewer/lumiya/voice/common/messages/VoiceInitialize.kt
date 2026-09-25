package com.lumiyaviewer.lumiya.voice.common.messages

import android.os.Bundle
import com.lumiyaviewer.lumiya.voice.common.VoicePluginMessage

class VoiceInitialize : VoicePluginMessage {
    @JvmField
    val appVersionCode: Int

    constructor(appVersionCode: Int) {
        this.appVersionCode = appVersionCode
    }

    constructor(bundle: Bundle) {
        this.appVersionCode = bundle.getInt("appVersionCode")
    }

    override fun toBundle(): Bundle = Bundle().apply {
        putInt("appVersionCode", appVersionCode)
    }
}
