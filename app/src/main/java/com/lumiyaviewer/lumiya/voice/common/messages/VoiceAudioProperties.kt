package com.lumiyaviewer.lumiya.voice.common.messages

import com.lumiyaviewer.lumiya.voice.common.model.VoiceBluetoothState

class VoiceAudioProperties(
    @JvmField val speakerVolume: Float,
    @JvmField val speakerphoneOn: Boolean,
    @JvmField val bluetoothState: VoiceBluetoothState
)
