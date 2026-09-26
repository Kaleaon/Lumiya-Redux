package com.lumiyaviewer.lumiya.slproto.users.manager

import com.google.common.base.Optional
import com.google.common.base.Strings
import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.ui.settings.NotificationType
import java.util.Collection
import java.util.List
import java.util.UUID

abstract class UnreadNotificationInfo {

    abstract class ObjectPopupMessage {
        fun create(str: String, str2: String): ObjectPopupMessage {
            return AutoValue_UnreadNotificationInfo_ObjectPopupMessage(Strings.nullToEmpty(str), Strings.nullToEmpty(str2))
        }

        public abstract String message()

        public abstract String objectName()
    }

    abstract class ObjectPopupNotification {
        private ObjectPopupNotification empty = AutoValue_UnreadNotificationInfo_ObjectPopupNotification(0, 0, Optional.absent())

        fun create(i: Int, i2: Int, objectPopupMessage: ObjectPopupMessage): ObjectPopupNotification {
            return (i == 0 && i2 == 0 && objectPopupMessage == null) ? empty : AutoValue_UnreadNotificationInfo_ObjectPopupNotification(i, i2, Optional.fromNullable(objectPopupMessage))
        }

        public abstract int freshObjectPopupsCount()

        fun isEmpty(): Boolean {
            return equals(empty)
        }

        public abstract Optional<ObjectPopupMessage> lastObjectPopup()

        public abstract int objectPopupsCount()
    }

    abstract class UnreadMessageSource {
        fun create(chatterID: ChatterID, str: String, list: MutableList<SLChatEvent>, i: Int): UnreadMessageSource {
            return AutoValue_UnreadNotificationInfo_UnreadMessageSource(chatterID, Optional.fromNullable(str), if (list != null) ImmutableList.copyOf(list as Collection) else ImmutableList.of(), i)
        }

        public abstract ChatterID chatterID()

        public abstract Optional<String> chatterName()

        public abstract ImmutableList<SLChatEvent> unreadMessages()

        public abstract int unreadMessagesCount()

        fun withMessages(list: MutableList<SLChatEvent>): UnreadMessageSource {
            return AutoValue_UnreadNotificationInfo_UnreadMessageSource(chatterID(), chatterName(), if (list != null) ImmutableList.copyOf(list as Collection) else ImmutableList.of(), unreadMessagesCount())
        }
    }

    fun create(uuid: UUID, i: Int, list: MutableList<UnreadMessageSource>, notificationType: NotificationType, i2: Int, notificationType2: NotificationType, unreadMessageSource: UnreadMessageSource, objectPopupNotification: ObjectPopupNotification): UnreadNotificationInfo {
        return AutoValue_UnreadNotificationInfo(uuid, i, if (list != null) ImmutableList.copyOf(list as Collection) else ImmutableList.of(), Optional.fromNullable(notificationType), i2, Optional.fromNullable(notificationType2), Optional.fromNullable(unreadMessageSource), objectPopupNotification)
    }

    public abstract UUID agentUUID()

    public abstract int freshMessagesCount()

    public abstract Optional<NotificationType> mostImportantFreshType()

    public abstract Optional<NotificationType> mostImportantType()

    public abstract ObjectPopupNotification objectPopupInfo()

    public abstract Optional<UnreadMessageSource> singleFreshSource()

    public abstract int totalUnreadCount()

    public abstract ImmutableList<UnreadMessageSource> unreadSources()
}
