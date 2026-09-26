package com.lumiyaviewer.lumiya.slproto.users.manager

import android.content.Context
import com.google.common.base.Strings
import com.google.common.primitives.Booleans
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.ui.chat.ChatterDisplayInfo
import com.lumiyaviewer.lumiya.ui.chat.contacts.ChatterItemViewBuilder

open class ChatterDisplayData : ChatterDisplayInfo, Comparable<ChatterDisplayData> {
    var chatterID: ChatterID = null
    var displayName: String = ""
    var distanceToUser: Float = 0.0f
    var isOnline: Boolean = false

    private var lastMessage: SLChatEvent = null
    private var unreadCount: Int = 0
    private var voiceActive: Boolean = false

    constructor(chatterID: ChatterID, displayName: String, isOnline: Boolean, unreadCount: Int, chatEvent: SLChatEvent, distanceToUser: Float, voiceActive: Boolean) {
        this.chatterID = chatterID
        this.displayName = displayName
        this.isOnline = isOnline
        this.unreadCount = unreadCount
        this.lastMessage = chatEvent
        this.distanceToUser = distanceToUser
        this.voiceActive = voiceActive
    }
    fun buildView(context: Context, chatterItemViewBuilder: ChatterItemViewBuilder, userManager: UserManager) {
        chatterItemViewBuilder.setLabel(this.displayName)
        chatterItemViewBuilder.setThumbnailChatterID(this.chatterID, this.displayName)
        chatterItemViewBuilder.setOnlineStatusIcon(this.isOnline, this.isOnline)
        chatterItemViewBuilder.setUnreadCount(this.unreadCount)
        chatterItemViewBuilder.setVoiceActive(this.voiceActive)
        if (this.lastMessage != null) {
            chatterItemViewBuilder.setLastMessage(this.lastMessage.getPlainTextMessage(context, userManager, true).toString())
        } else {
            chatterItemViewBuilder.setLastMessage(null)
        }
        chatterItemViewBuilder.setDistance(this.distanceToUser)
    }
    fun compareTo(chatterDisplayData: ChatterDisplayData): Int {
        var compare: Int = Booleans.compare(Strings.isNullOrEmpty(this.displayName), Strings.isNullOrEmpty(chatterDisplayData.displayName))
        if (compare != 0) {
        return compare
        }
        var compareTo: Int = (if (this.displayName != null) this.displayName else "").compareTo(if (chatterDisplayData.displayName != null) chatterDisplayData.displayName else "")
        return if (compareTo != 0) compareTo else this.chatterID.compareTo(chatterDisplayData.chatterID)
    }
    fun getChatterID(userManager: UserManager): ChatterID {
        return this.chatterID
    }
    fun getDisplayName(): String {
        return this.displayName
    }

    fun withDisplayName(str: String): ChatterDisplayData {
        return ChatterDisplayData(this.chatterID, str, this.isOnline, this.unreadCount, this.lastMessage, this.distanceToUser, this.voiceActive)
    }

    fun withDistanceToUser(f: Float): ChatterDisplayData {
        return ChatterDisplayData(this.chatterID, this.displayName, this.isOnline, this.unreadCount, this.lastMessage, f, this.voiceActive)
    }

    fun withOnlineStatus(z: Boolean): ChatterDisplayData {
        return ChatterDisplayData(this.chatterID, this.displayName, z, this.unreadCount, this.lastMessage, this.distanceToUser, this.voiceActive)
    }

    fun withUnreadInfo(unreadMessageInfo: UnreadMessageInfo): ChatterDisplayData {
        return ChatterDisplayData(this.chatterID, this.displayName, this.isOnline, unreadMessageInfo.unreadCount(), unreadMessageInfo.lastMessage(), this.distanceToUser, this.voiceActive)
    }

    fun withVoiceActive(z: Boolean): ChatterDisplayData {
        return ChatterDisplayData(this.chatterID, this.displayName, this.isOnline, this.unreadCount, this.lastMessage, this.distanceToUser, z)
    }
}
