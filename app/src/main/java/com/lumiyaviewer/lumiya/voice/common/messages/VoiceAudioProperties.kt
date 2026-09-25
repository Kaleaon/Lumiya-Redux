package com.lumiyaviewer.lumiya.voice.common.messages

import android.os.Bundle
import com.lumiyaviewer.lumiya.voice.common.VoicePluginMessage
import com.lumiyaviewer.lumiya.voice.common.model.VoiceBluetoothState

class VoiceAudioProperties : VoicePluginMessage {
    @JvmField
    val bluetoothState: VoiceBluetoothState
    @JvmField
    val speakerVolume: Float
    @JvmField
    val speakerphoneOn: Boolean

    constructor(speakerVolume: Float, speakerphoneOn: Boolean, voiceBluetoothState: VoiceBluetoothState) {
        this.speakerVolume = speakerVolume
        this.speakerphoneOn = speakerphoneOn
        this.bluetoothState = voiceBluetoothState
    }

    constructor(bundle: Bundle) {
        this.speakerVolume = bundle.getFloat("speakerVolume")
        this.speakerphoneOn = bundle.getBoolean("speakerphoneOn")
        this.bluetoothState = try {
            VoiceBluetoothState.valueOf(bundle.getString("bluetoothState")!!)
        } catch (e: IllegalArgumentException) {
            VoiceBluetoothState.Error
        }
    }

    override fun toBundle(): Bundle = Bundle().apply {
        putFloat("speakerVolume", speakerVolume)
        putBoolean("speakerphoneOn", speakerphoneOn)
        putString("bluetoothState", bluetoothState.name)
    }
}
