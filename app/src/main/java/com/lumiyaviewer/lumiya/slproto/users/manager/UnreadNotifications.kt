package com.lumiyaviewer.lumiya.slproto.users.manager

import com.google.common.collect.ImmutableList
import com.google.common.collect.ImmutableMap
import com.google.common.collect.ImmutableSet
import com.lumiyaviewer.lumiya.slproto.users.manager.UnreadNotificationInfo
import com.lumiyaviewer.lumiya.ui.settings.NotificationType
import java.util.Iterator
import java.util.Map
import java.util.UUID

abstract class UnreadNotifications {
    fun create(uuid: UUID, immutableMap: ImmutableMap<NotificationType, UnreadNotificationInfo>): UnreadNotifications {
        return AutoValue_UnreadNotifications(uuid, immutableMap)
    }

    public abstract UUID agentUUID()

    fun filter(immutableSet: ImmutableSet<NotificationType>): UnreadNotifications {
        if (immutableSet.containsAll(notificationGroups().keySet())) {
        return this
        }
        var builder: ImmutableMap.Builder = ImmutableMap.builder()
        for (entry in notificationGroups().entrySet()) {
            if (immutableSet.contains(entry.getKey())) {
                builder.put(entry)
            }
        }
        return create(agentUUID(), builder.build())
    }

    fun merge(): UnreadNotificationInfo {
        var objectPopupNotification: UnreadNotificationInfo.ObjectPopupNotification? = null
        var builder: ImmutableList.Builder? = null
        var i: Int = 0
        var notificationGroups: ImmutableMap<NotificationType, UnreadNotificationInfo> = notificationGroups()
        if (notificationGroups.isEmpty()) {
            return UnreadNotificationInfo.create(agentUUID(), 0, null, null, 0, null, null, UnreadNotificationInfo.ObjectPopupNotification.create(0, 0, null))
        }
        if (notificationGroups.size() == 1) {
            return notificationGroups.entrySet().iterator().next().getValue()
        }
        var objectPopupNotification2: UnreadNotificationInfo.ObjectPopupNotification? = null
        var notificationType: NotificationType? = null
        var notificationType2: NotificationType? = null
        var unreadMessageSource: UnreadNotificationInfo.UnreadMessageSource? = null
        var i2: Int = 0
        var i3: Int = 0
        var builder2: ImmutableList.Builder? = null
        var z: Boolean = false
        var it: Iterator<NotificationType> = NotificationType.VALUES_BY_DESCENDING_PRIORITY.iterator()
        while (true) {
            objectPopupNotification = objectPopupNotification2
            builder = builder2
            i = i2
            var z2: Boolean = z
            if (!it.hasNext()) {

            }
            var unreadNotificationInfo: UnreadNotificationInfo = notificationGroups.get(it.next())
            if (unreadNotificationInfo != null) {
                var i4: Int = unreadNotificationInfo.totalUnreadCount() + i
                if (!unreadNotificationInfo.unreadSources().isEmpty()) {
                    if (builder == null) {
                        builder = ImmutableList.builder()
                    }
                    builder.addAll(unreadNotificationInfo as Iterable.unreadSources())
                }
                var orNull: NotificationType = unreadNotificationInfo.mostImportantType().orNull()
                if (orNull != null && (notificationType == null || orNull.compareTo(notificationType) > 0)) {
                    notificationType = orNull
                }
                var orNull2: NotificationType = unreadNotificationInfo.mostImportantFreshType().orNull()
                if (orNull2 != null && (notificationType2 == null || orNull2.compareTo(notificationType2) > 0)) {
                    notificationType2 = orNull2
                }
                i3 += unreadNotificationInfo.freshMessagesCount()
                var orNull3: UnreadNotificationInfo.UnreadMessageSource = unreadNotificationInfo.singleFreshSource().orNull()
                if (orNull3 != null) {
                    if (unreadMessageSource != null || !(!z2)) {
                        orNull3 = null
                    }
                    z2 = true
                } else {
                    orNull3 = unreadMessageSource
                }
                var objectPopupInfo: UnreadNotificationInfo.ObjectPopupNotification = unreadNotificationInfo.objectPopupInfo()
                if (objectPopupInfo.isEmpty()) {
                    z = z2
                    unreadMessageSource = orNull3
                    i2 = i4
                    builder2 = builder
                    objectPopupNotification2 = objectPopupNotification
                } else {
                    unreadMessageSource = orNull3
                    builder2 = builder
                    objectPopupNotification2 = objectPopupInfo
                    z = z2
                    i2 = i4
                }
            } else {
                z = z2
                i2 = i
                builder2 = builder
                objectPopupNotification2 = objectPopupNotification
            }
        }
        return UnreadNotificationInfo.create(agentUUID(), i, if (builder != null) builder.build() else null, notificationType, i3, notificationType2, unreadMessageSource, if (objectPopupNotification != null) objectPopupNotification else UnreadNotificationInfo.ObjectPopupNotification.create(0, 0, null))
    }

    public abstract ImmutableMap<NotificationType, UnreadNotificationInfo> notificationGroups()
}
