package com.lumiyaviewer.lumiya.ui.notify

import android.content.Context
import androidx.fragment.app.Fragment
import com.google.common.collect.ImmutableSet
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.ui.settings.NotificationType

open class NotificationChannels {

    public static String MESSAGE_NOTIFICATION_GROUP = "messageNotifications"
    private OreoNotificationChannelManager channelManager

    enum class Channel {
        OnlineStatus("onlineStatus", R.string.notify_online_status_name, R.string.notify_online_status_desc, null, R.id.online_notify_id),
        Local("localChat", R.string.notify_local_chat_name, R.string.notify_local_chat_desc, NotificationType.LocalChat, R.id.unread_notify_local_id),
        Group("groupChat", R.string.notify_group_chat_name, R.string.notify_group_chat_desc, NotificationType.Group, R.id.unread_notify_group_id),
        IM("privateIM", R.string.notify_im_name, R.string.notify_im_desc, NotificationType.Private, R.id.unread_notify_im_id)


        public String channelId
        public int descriptionStringId
        public int nameStringId
        public int notificationId

        public NotificationType notificationType

        internal fun Channel(channelId: String, nameStringId: Int, descriptionStringId: Int, notificationType: NotificationType, notificationId: Int):  {
            this.channelId = channelId
            this.nameStringId = nameStringId
            this.descriptionStringId = descriptionStringId
            this.notificationType = notificationType
            this.notificationId = notificationId
        }

    }

    private class InstanceHolder {
        private static NotificationChannels Instance = NotificationChannels(null)

        private constructor() {
        }
    }

    internal fun NotificationChannels(): private {
        this.channelManager = OreoNotificationChannelManager()
    }

        this()
    }

    @JvmStatic
    fun getInstance(): NotificationChannels {
        return InstanceHolder.Instance
    }

    open fun areNotificationsSystemControlled(): Boolean {
        return this.channelManager.areNotificationsSystemControlled()
    }

    open fun getChannelByType(notificationType: NotificationType): Channel {
        internal fun switch(notificationType):  {
            Group -> {
                return Channel.Group
            LocalChat -> {
                return Channel.Local
            Private -> {
                return Channel.IM
            else -> {
                return null
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

    open fun showSystemNotificationSettings(context: Context, fragment: Fragment, channel: Channel): Boolean {
        return this.channelManager.showSystemNotificationSettings(context, fragment, channel)
    }

    open fun useNotificationGroups(): Boolean {
        return this.channelManager.useNotificationGroups()
    }
}
