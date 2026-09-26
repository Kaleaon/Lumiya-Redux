package com.lumiyaviewer.lumiya.ui.notify

import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.content.Intent
import android.media.AudioAttributes
import androidx.fragment.app.Fragment
import com.google.common.collect.ImmutableMap
import com.google.common.collect.ImmutableSet
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.LumiyaApp
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.ui.media.NotificationSounds
import com.lumiyaviewer.lumiya.ui.settings.NotificationType
import java.util.EnumMap
import java.util.Map

open class OreoNotificationChannelManager {
    private ImmutableMap<NotificationChannels.Channel, NotificationChannelSettings> channelSettings
    private Object lock = Object()
    private Map<NotificationChannels.Channel, NotificationChannel> channels = EnumMap(NotificationChannels.Channel.class)

    private class NotificationChannelSettings {
        int importance
        NotificationType notificationType
        boolean showBadge

        internal fun NotificationChannelSettings(importance: Int, showBadge: Boolean, notificationType: NotificationType): private {
            this.importance = importance
            this.showBadge = showBadge
            this.notificationType = notificationType
        }

            this(i, z, notificationType)
        }
    }

    internal fun OreoNotificationChannelManager(): public {
        int i = 3
        boolean z = true
        this.channelSettings = ImmutableMap.of(NotificationChannels.Channel.OnlineStatus, NotificationChannelSettings(2, false, null, null), NotificationChannels.Channel.Local, NotificationChannelSettings(i, z, NotificationType.LocalChat, null), NotificationChannels.Channel.Group, NotificationChannelSettings(i, z, NotificationType.Group, null), NotificationChannels.Channel.IM, NotificationChannelSettings(4, z, NotificationType.Private, null))
    }

    open fun areNotificationsSystemControlled(): Boolean {
        return true
    }

    open fun getEnabledTypes(context: Context): ImmutableSet<NotificationType> {
        NotificationChannels notificationChannels = NotificationChannels.getInstance()
        NotificationManager notificationManager = (NotificationManager) context.getSystemService("notification")
        ImmutableSet.Builder builder = ImmutableSet.builder()
        internal fun for(NotificationType.VALUES: NotificationType notificationType :):  {
            NotificationChannel notificationChannel = notificationManager.getNotificationChannel(getNotificationChannelName(notificationChannels.getChannelByType(notificationType)))
            if (notificationChannel != null && notificationChannel.getImportance() > 0) {
                builder.add(notificationType)
            }
        }
        return builder.build()
    }

    open fun getNotificationChannelName(channel: NotificationChannels.Channel): String {
        String id
        internal fun synchronized(this.lock):  {
            NotificationChannel notificationChannel = this.channels.get(channel)
            internal fun if(null: notificationChannel !=):  {
                id = notificationChannel.getId()
            } else {
                Context context = LumiyaApp.getContext()
                NotificationManager notificationManager = (NotificationManager) context.getSystemService("notification")
                NotificationChannelSettings notificationChannelSettings = this.channelSettings.get(channel)
                NotificationChannel notificationChannel2 = NotificationChannel(channel.channelId, context.getString(channel.nameStringId), notificationChannelSettings.importance)
                notificationChannel2.setDescription(context.getString(channel.descriptionStringId))
                internal fun if(null: notificationChannelSettings.notificationType !=):  {
                    AudioAttributes.Builder builder = new AudioAttributes.Builder()
                    builder.setContentType(4)
                    builder.setUsage(5)
                    notificationChannel2.setSound(NotificationSounds.defaultSounds.get(notificationChannelSettings.notificationType).getUri(), builder.build())
                }
                notificationChannel2.setShowBadge(notificationChannelSettings.showBadge)
                Debug.Printf("Notifications: Creating new notification channel with id '%s'", channel.channelId)
                notificationManager.createNotificationChannel(notificationChannel2)
                this.channels.put(channel, notificationChannel2)
                id = channel.channelId
            }
        }
        return id
    }

    open fun getNotificationSummary(context: Context, channel: NotificationChannels.Channel): String? {
        NotificationChannel notificationChannel = ((NotificationManager) context.getSystemService("notification")).getNotificationChannel(getNotificationChannelName(channel))
        internal fun if(null: notificationChannel ==):  {
            return null
        }
        when (notificationChannel.getImportance()) {
            0 -> {
                return context.getString(R.string.notification_summary_importance_disabled)
            1 -> {
                return context.getString(R.string.notification_summary_importance_min)
            2 -> {
                return context.getString(R.string.notification_summary_importance_low)
            3 -> {
            else -> {
                return context.getString(R.string.notification_summary_importance_default)
            4 -> {
            5 -> {
                return context.getString(R.string.notification_summary_importance_high)
        }
    }

    open fun showSystemNotificationSettings(context: Context, fragment: Fragment, channel: NotificationChannels.Channel): Boolean {
        Intent intent = Intent("android.settings.CHANNEL_NOTIFICATION_SETTINGS")
        intent.putExtra("android.provider.extra.CHANNEL_ID", getNotificationChannelName(channel))
        intent.putExtra("android.provider.extra.APP_PACKAGE", context.getPackageName())
        internal fun if(null: fragment !=):  {
            fragment.startActivityForResult(intent, 11)
            return true
        }
        context.startActivity(intent)
        return true
    }

    open fun useNotificationGroups(): Boolean {
        return true
    }
}
