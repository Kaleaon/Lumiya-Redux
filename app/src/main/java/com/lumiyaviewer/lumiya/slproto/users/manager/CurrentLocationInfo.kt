package com.lumiyaviewer.lumiya.slproto.users.manager

import com.lumiyaviewer.lumiya.slproto.users.ParcelData
import com.lumiyaviewer.lumiya.voice.common.model.VoiceChannelInfo

abstract class CurrentLocationInfo {
    abstract fun inChatRangeUsers(): Int
    abstract fun nearbyUsers(): Int
    abstract fun parcelData(): ParcelData?
    abstract fun parcelVoiceChannel(): VoiceChannelInfo?
    companion object {
        @JvmStatic fun create(parcel: ParcelData?, nearby: Int, inChatRange: Int, voice: VoiceChannelInfo?): CurrentLocationInfo =
            AutoValue_CurrentLocationInfo(parcel, nearby, inChatRange, voice)
    }
}
