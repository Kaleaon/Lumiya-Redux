package com.lumiyaviewer.lumiya.ui.notify

import android.content.Context
import androidx.fragment.app.Fragment
import com.google.common.collect.ImmutableSet
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.ui.settings.NotificationType

open class NotificationChannels private constructor() {

    private val channelManager = OreoNotificationChannelManager()

    enum class Channel(
        val channelId: String,
        val nameStringId: Int,
        val descriptionStringId: Int,
        val notificationType: NotificationType?,
        val notificationId: Int
    ) {
        OnlineStatus("onlineStatus", R.string.notify_online_status_name, R.string.notify_online_status_desc, null, R.id.online_notify_id),
        Local("localChat", R.string.notify_local_chat_name, R.string.notify_local_chat_desc, NotificationType.LocalChat, R.id.unread_notify_local_id),
        Group("groupChat", R.string.notify_group_chat_name, R.string.notify_group_chat_desc, NotificationType.Group, R.id.unread_notify_group_id),
        IM("privateIM", R.string.notify_im_name, R.string.notify_im_desc, NotificationType.Private, R.id.unread_notify_im_id)
    }

    private object InstanceHolder {
        val Instance = NotificationChannels()
    }

    companion object {
        const val MESSAGE_NOTIFICATION_GROUP = "messageNotifications"

        @JvmStatic
        fun getInstance(): NotificationChannels {
            return InstanceHolder.Instance
        }
    }

    open fun areNotificationsSystemControlled(): Boolean {
        return this.channelManager.areNotificationsSystemControlled()
    }

    open fun getChannelByType(notificationType: NotificationType): Channel? {
        return when (notificationType) {
            NotificationType.Group -> Channel.Group
            NotificationType.LocalChat -> Channel.Local
            NotificationType.Private -> Channel.IM
            else -> null
        }
    }

    open fun getChannelName(channel: Channel): String {
        return this.channelManager.getNotificationChannelName(channel)
    }

    open fun getEnabledTypes(context: Context): ImmutableSet<NotificationType> {
        return this.channelManager.getEnabledTypes(context)
    }

    open fun getNotificationSummary(context: Context, channel: Channel): String? {
        return this.channelManager.getNotificationSummary(context, channel)
    }

    open fun showSystemNotificationSettings(context: Context, fragment: Fragment?, channel: Channel): Boolean {
        return this.channelManager.showSystemNotificationSettings(context, fragment, channel)
    }

    open fun useNotificationGroups(): Boolean {
        return this.channelManager.useNotificationGroups()
    }
}
