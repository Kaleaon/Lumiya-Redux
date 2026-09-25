package com.lumiyaviewer.lumiya.voice.common.messages

import android.os.Bundle
import com.lumiyaviewer.lumiya.voice.common.VoicePluginMessage
import com.lumiyaviewer.lumiya.voice.common.model.VoiceLoginInfo

class VoiceLoginStatus : VoicePluginMessage {
    @JvmField
    val errorMessage: String?
    @JvmField
    val loggedIn: Boolean
    @JvmField
    val voiceLoginInfo: VoiceLoginInfo?

    constructor(bundle: Bundle) {
        val bundle2 = bundle.getBundle("voiceLoginInfo")
        this.voiceLoginInfo = if (bundle2 != null) VoiceLoginInfo(bundle2) else null
        this.loggedIn = bundle.getBoolean("loggedIn")
        this.errorMessage = bundle.getString("errorMessage")
    }

    constructor(voiceLoginInfo: VoiceLoginInfo?, loggedIn: Boolean, errorMessage: String?) {
        this.voiceLoginInfo = voiceLoginInfo
        this.loggedIn = loggedIn
        this.errorMessage = errorMessage
    }

    override fun toBundle(): Bundle = Bundle().apply {
        putBundle("voiceLoginInfo", voiceLoginInfo?.toBundle())
        putBoolean("loggedIn", loggedIn)
        putString("errorMessage", errorMessage)
    }
}
