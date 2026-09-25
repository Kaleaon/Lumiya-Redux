package com.lumiyaviewer.lumiya.voice.common.messages

import android.os.Bundle
import com.lumiyaviewer.lumiya.voice.common.VoicePluginMessage
import com.lumiyaviewer.lumiya.voice.common.model.VoiceAudioDevice

class VoiceSetAudioProperties : VoicePluginMessage {
    @JvmField
    val audioDevice: VoiceAudioDevice?
    @JvmField
    val speakerVolume: Float
    @JvmField
    val speakerVolumeValid: Boolean

    constructor(speakerVolume: Float, speakerVolumeValid: Boolean, voiceAudioDevice: VoiceAudioDevice?) {
        this.speakerVolume = speakerVolume
        this.speakerVolumeValid = speakerVolumeValid
        this.audioDevice = voiceAudioDevice
    }

    constructor(bundle: Bundle) {
        this.speakerVolumeValid = bundle.containsKey("speakerVolume")
        this.speakerVolume = if (!speakerVolumeValid) Float.NaN else bundle.getFloat("speakerVolume")
        this.audioDevice = if (bundle.containsKey("audioDevice")) {
            try {
                VoiceAudioDevice.valueOf(bundle.getString("audioDevice")!!)
            } catch (e: IllegalArgumentException) {
                null
            }
        } else {
            null
        }
    }

    override fun toBundle(): Bundle = Bundle().apply {
        if (speakerVolumeValid) {
            putFloat("speakerVolume", speakerVolume)
        }
        if (audioDevice != null) {
            putString("audioDevice", audioDevice.name)
        }
    }
}
