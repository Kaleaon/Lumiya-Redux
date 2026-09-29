package com.lumiyaviewer.lumiya.slproto.users.manager

import com.google.common.collect.ImmutableMap
import com.lumiyaviewer.lumiya.ui.settings.NotificationType
import java.util.UUID

class AutoValue_UnreadNotifications : UnreadNotifications() {
    private var agentUUID: UUID? = null
    private var notificationGroups: ImmutableMap<NotificationType, UnreadNotificationInfo>? = null

    constructor(uuid: UUID, immutableMap: ImmutableMap<NotificationType, UnreadNotificationInfo>) {
        if (uuid == null) {
            throw NullPointerException("Null agentUUID")
        }
        this.agentUUID = uuid
        if (immutableMap == null) {
            throw NullPointerException("Null notificationGroups")
        }
        this.notificationGroups = immutableMap
    }
    fun agentUUID(): UUID {
        return this.agentUUID
    }

    fun equals(obj: Any): Boolean {
        if (obj == this) {
        return true
        }
        if (!(obj is UnreadNotifications)) {
        return false
        }
        var unreadNotifications: UnreadNotifications = obj as UnreadNotifications
        if (this.agentUUID.equals(unreadNotifications.agentUUID())) {
            return this.notificationGroups.equals(unreadNotifications.notificationGroups())
        }
        return false
    }

    fun hashCode(): Int {
        return ((this.agentUUID.hashCode() ^ 1000003) * 1000003) ^ this.notificationGroups.hashCode()
    }
    public ImmutableMap<NotificationType, UnreadNotificationInfo> notificationGroups() {
        return this.notificationGroups
    }

    fun toString(): String {
        return "UnreadNotifications{agentUUID=" + this.agentUUID + ", notificationGroups=" + this.notificationGroups + "}"
    }
}
