package com.lumiyaviewer.lumiya.voice.common.messages

import android.os.Bundle
import com.lumiyaviewer.lumiya.voice.common.VoicePluginMessage

class VoiceInitializeReply : VoicePluginMessage {
    @JvmField
    val appVersionOk: Boolean
    @JvmField
    val errorMessage: String?
    @JvmField
    val pluginVersionCode: Int

    constructor(pluginVersionCode: Int, errorMessage: String?, appVersionOk: Boolean) {
        this.pluginVersionCode = pluginVersionCode
        this.errorMessage = errorMessage
        this.appVersionOk = appVersionOk
    }

    constructor(bundle: Bundle) {
        this.pluginVersionCode = bundle.getInt("pluginVersionCode")
        this.errorMessage = bundle.getString("errorMessage")
        this.appVersionOk = bundle.getBoolean("appVersionOk")
    }

    override fun toBundle(): Bundle = Bundle().apply {
        putInt("pluginVersionCode", pluginVersionCode)
        putString("errorMessage", errorMessage)
        putBoolean("appVersionOk", appVersionOk)
    }
}
