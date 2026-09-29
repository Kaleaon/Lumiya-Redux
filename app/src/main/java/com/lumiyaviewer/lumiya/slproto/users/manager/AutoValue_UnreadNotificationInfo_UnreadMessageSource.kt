package com.lumiyaviewer.lumiya.slproto.users.manager

import com.google.common.base.Optional
import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.manager.UnreadNotificationInfo

class AutoValue_UnreadNotificationInfo_UnreadMessageSource : UnreadNotificationInfo.UnreadMessageSource() {
    private var chatterID: ChatterID? = null
    private var chatterName: Optional<String>? = null
    private var unreadMessages: ImmutableList<SLChatEvent>? = null
    private var unreadMessagesCount: Int = 0

    constructor(chatterID: ChatterID, optional: Optional<String>, immutableList: ImmutableList<SLChatEvent>, unreadMessagesCount: Int) {
        if (chatterID == null) {
            throw NullPointerException("Null chatterID")
        }
        this.chatterID = chatterID
        if (optional == null) {
            throw NullPointerException("Null chatterName")
        }
        this.chatterName = optional
        if (immutableList == null) {
            throw NullPointerException("Null unreadMessages")
        }
        this.unreadMessages = immutableList
        this.unreadMessagesCount = unreadMessagesCount
    }
    fun chatterID(): ChatterID {
        return this.chatterID
    }
    fun chatterName(): Optional<String> {
        return this.chatterName
    }

    fun equals(obj: Any): Boolean {
        if (obj == this) {
        return true
        }
        if (!(obj is UnreadNotificationInfo.UnreadMessageSource)) {
        return false
        }
        var unreadMessageSource: UnreadNotificationInfo.UnreadMessageSource = (UnreadNotificationInfo.UnreadMessageSource) obj
        if (this.chatterID.equals(unreadMessageSource.chatterID()) && this.chatterName.equals(unreadMessageSource.chatterName()) && this.unreadMessages.equals(unreadMessageSource.unreadMessages())) {
            return this.unreadMessagesCount == unreadMessageSource.unreadMessagesCount()
        }
        return false
    }

    fun hashCode(): Int {
        return ((((((this.chatterID.hashCode() ^ 1000003) * 1000003) ^ this.chatterName.hashCode()) * 1000003) ^ this.unreadMessages.hashCode()) * 1000003) ^ this.unreadMessagesCount
    }

    fun toString(): String {
        return "UnreadMessageSource{chatterID=" + this.chatterID + ", chatterName=" + this.chatterName + ", unreadMessages=" + this.unreadMessages + ", unreadMessagesCount=" + this.unreadMessagesCount + "}"
    }
    fun unreadMessages(): ImmutableList<SLChatEvent> {
        return this.unreadMessages
    }
    fun unreadMessagesCount(): Int {
        return this.unreadMessagesCount
    }
}
