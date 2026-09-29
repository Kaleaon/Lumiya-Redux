package com.lumiyaviewer.lumiya.slproto.users.manager

import com.lumiyaviewer.lumiya.slproto.users.ParcelData
import com.lumiyaviewer.lumiya.voice.common.model.VoiceChannelInfo

class AutoValue_CurrentLocationInfo : CurrentLocationInfo() {
    private var inChatRangeUsers: Int = 0
    private var nearbyUsers: Int = 0
    private var parcelData: ParcelData? = null
    private var parcelVoiceChannel: VoiceChannelInfo? = null

    constructor(parcelData: ParcelData, nearbyUsers: Int, inChatRangeUsers: Int, voiceChannelInfo: VoiceChannelInfo) {
        this.parcelData = parcelData
        this.nearbyUsers = nearbyUsers
        this.inChatRangeUsers = inChatRangeUsers
        this.parcelVoiceChannel = voiceChannelInfo
    }

    fun equals(obj: Any): Boolean {
        if (obj == this) {
        return true
        }
        if (!(obj is CurrentLocationInfo)) {
        return false
        }
        var currentLocationInfo: CurrentLocationInfo = obj as CurrentLocationInfo
        if (if (this.parcelData != null) this.parcelData.equals(currentLocationInfo.parcelData()) else currentLocationInfo.parcelData() == null) {
            if (this.nearbyUsers == currentLocationInfo.nearbyUsers() && this.inChatRangeUsers == currentLocationInfo.inChatRangeUsers()) {
                return if (this.parcelVoiceChannel == null) currentLocationInfo.parcelVoiceChannel() == null else this.parcelVoiceChannel.equals(currentLocationInfo.parcelVoiceChannel())
            }
        }
        return false
    }

    fun hashCode(): Int {
        return (((((((if (this.parcelData == null) 0 else this.parcelData.hashCode()) ^ 1000003) * 1000003) ^ this.nearbyUsers) * 1000003) ^ this.inChatRangeUsers) * 1000003) ^ (if (this.parcelVoiceChannel != null) this.parcelVoiceChannel.hashCode() else 0)
    }
    fun inChatRangeUsers(): Int {
        return this.inChatRangeUsers
    }
    fun nearbyUsers(): Int {
        return this.nearbyUsers
    }
    fun parcelData(): ParcelData {
        return this.parcelData
    }
    fun parcelVoiceChannel(): VoiceChannelInfo {
        return this.parcelVoiceChannel
    }

    fun toString(): String {
        return "CurrentLocationInfo{parcelData=" + this.parcelData + ", nearbyUsers=" + this.nearbyUsers + ", inChatRangeUsers=" + this.inChatRangeUsers + ", parcelVoiceChannel=" + this.parcelVoiceChannel + "}"
    }
}
