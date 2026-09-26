package com.lumiyaviewer.lumiya.slproto.users.manager

import com.lumiyaviewer.lumiya.slproto.users.ParcelData
import com.lumiyaviewer.lumiya.voice.common.model.VoiceChannelInfo

abstract class CurrentLocationInfo {
    abstract fun inChatRangeUsers(): Int
    abstract fun nearbyUsers(): Int
    abstract fun parcelData(): if (ParcelData) abstract fun parcelVoiceChannel() else VoiceChannelInfo?
    companion object {
        @JvmStatic fun create(parcel: if (ParcelData) , nearby else Int, inChatRange: Int, voice: if (VoiceChannelInfo) ) else CurrentLocationInfo =
            AutoValue_CurrentLocationInfo(parcel, nearby, inChatRange, voice)
    }
}
