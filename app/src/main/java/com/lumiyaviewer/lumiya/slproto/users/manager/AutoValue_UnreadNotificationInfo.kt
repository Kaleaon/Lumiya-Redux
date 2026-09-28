package com.lumiyaviewer.lumiya.slproto.users.manager

import com.google.common.base.Optional
import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.slproto.users.manager.UnreadNotificationInfo
import com.lumiyaviewer.lumiya.ui.settings.NotificationType
import java.util.UUID

class AutoValue_UnreadNotificationInfo : UnreadNotificationInfo() {
    private var agentUUID: UUID? = null
    private var freshMessagesCount: Int = 0
    private var mostImportantFreshType: Optional<NotificationType>? = null
    private var mostImportantType: Optional<NotificationType>? = null
    private var objectPopupInfo: UnreadNotificationInfo.ObjectPopupNotification? = null
    private var singleFreshSource: Optional<UnreadNotificationInfo.UnreadMessageSource>? = null
    private var totalUnreadCount: Int = 0
    private var unreadSources: ImmutableList<UnreadNotificationInfo.UnreadMessageSource>? = null

    constructor(uuid: UUID, totalUnreadCount: Int, immutableList: ImmutableList<UnreadNotificationInfo.UnreadMessageSource>, optional: Optional<NotificationType>, freshMessagesCount: Int, mostImportantFreshType: Optional<NotificationType>, singleFreshSource: Optional<UnreadNotificationInfo.UnreadMessageSource>, objectPopupNotification: UnreadNotificationInfo.ObjectPopupNotification) {
        if (uuid == null) {
            throw NullPointerException("Null agentUUID")
        }
        this.agentUUID = uuid
        this.totalUnreadCount = totalUnreadCount
        if (immutableList == null) {
            throw NullPointerException("Null unreadSources")
        }
        this.unreadSources = immutableList
        if (optional == null) {
            throw NullPointerException("Null mostImportantType")
        }
        this.mostImportantType = optional
        this.freshMessagesCount = freshMessagesCount
        if (mostImportantFreshType == null) {
            throw NullPointerException("Null mostImportantFreshType")
        }
        this.mostImportantFreshType = mostImportantFreshType
        if (singleFreshSource == null) {
            throw NullPointerException("Null singleFreshSource")
        }
        this.singleFreshSource = singleFreshSource
        if (objectPopupNotification == null) {
            throw NullPointerException("Null objectPopupInfo")
        }
        this.objectPopupInfo = objectPopupNotification
    }
    fun agentUUID(): UUID {
        return this.agentUUID
    }

    fun equals(obj: Any): Boolean {
        if (obj == this) {
        return true
        }
        if (!(obj is UnreadNotificationInfo)) {
        return false
        }
        var unreadNotificationInfo: UnreadNotificationInfo = obj as UnreadNotificationInfo
        if (this.agentUUID.equals(unreadNotificationInfo.agentUUID()) && this.totalUnreadCount == unreadNotificationInfo.totalUnreadCount() && this.unreadSources.equals(unreadNotificationInfo.unreadSources()) && this.mostImportantType.equals(unreadNotificationInfo.mostImportantType()) && this.freshMessagesCount == unreadNotificationInfo.freshMessagesCount() && this.mostImportantFreshType.equals(unreadNotificationInfo.mostImportantFreshType()) && this.singleFreshSource.equals(unreadNotificationInfo.singleFreshSource())) {
            return this.objectPopupInfo.equals(unreadNotificationInfo.objectPopupInfo())
        }
        return false
    }
    fun freshMessagesCount(): Int {
        return this.freshMessagesCount
    }

    fun hashCode(): Int {
        return ((((((((((((((this.agentUUID.hashCode() ^ 1000003) * 1000003) ^ this.totalUnreadCount) * 1000003) ^ this.unreadSources.hashCode()) * 1000003) ^ this.mostImportantType.hashCode()) * 1000003) ^ this.freshMessagesCount) * 1000003) ^ this.mostImportantFreshType.hashCode()) * 1000003) ^ this.singleFreshSource.hashCode()) * 1000003) ^ this.objectPopupInfo.hashCode()
    }
    fun mostImportantFreshType(): Optional<NotificationType> {
        return this.mostImportantFreshType
    }
    fun mostImportantType(): Optional<NotificationType> {
        return this.mostImportantType
    }
    fun objectPopupInfo(): UnreadNotificationInfo.ObjectPopupNotification {
        return this.objectPopupInfo
    }
    fun singleFreshSource(): Optional<UnreadNotificationInfo.UnreadMessageSource> {
        return this.singleFreshSource
    }

    fun toString(): String {
        return "UnreadNotificationInfo{agentUUID=" + this.agentUUID + ", totalUnreadCount=" + this.totalUnreadCount + ", unreadSources=" + this.unreadSources + ", mostImportantType=" + this.mostImportantType + ", freshMessagesCount=" + this.freshMessagesCount + ", mostImportantFreshType=" + this.mostImportantFreshType + ", singleFreshSource=" + this.singleFreshSource + ", objectPopupInfo=" + this.objectPopupInfo + "}"
    }
    fun totalUnreadCount(): Int {
        return this.totalUnreadCount
    }
    fun unreadSources(): ImmutableList<UnreadNotificationInfo.UnreadMessageSource> {
        return this.unreadSources
    }
}
