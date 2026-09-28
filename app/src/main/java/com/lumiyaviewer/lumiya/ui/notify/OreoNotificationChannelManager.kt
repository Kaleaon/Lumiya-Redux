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

open class OreoNotificationChannelManager {

    private class NotificationChannelSettings(
        val importance: Int,
        val showBadge: Boolean,
        val notificationType: NotificationType?
    )

    private val channelSettings: ImmutableMap<NotificationChannels.Channel, NotificationChannelSettings>
    private val lock = Object()
    private val channels: MutableMap<NotificationChannels.Channel, NotificationChannel> =
        EnumMap(NotificationChannels.Channel::class.java)

    init {
        val i = 3
        val z = true
        channelSettings = ImmutableMap.of(
            NotificationChannels.Channel.OnlineStatus, NotificationChannelSettings(2, false, null),
            NotificationChannels.Channel.Local, NotificationChannelSettings(i, z, NotificationType.LocalChat),
            NotificationChannels.Channel.Group, NotificationChannelSettings(i, z, NotificationType.Group),
            NotificationChannels.Channel.IM, NotificationChannelSettings(4, z, NotificationType.Private)
        )
    }

    open fun areNotificationsSystemControlled(): Boolean {
        return true
    }

    open fun getEnabledTypes(context: Context): ImmutableSet<NotificationType> {
        val notificationChannels = NotificationChannels.getInstance()
        val notificationManager = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        val builder = ImmutableSet.builder<NotificationType>()
        for (notificationType in NotificationType.VALUES) {
            val channel = notificationChannels.getChannelByType(notificationType) ?: continue
            val notificationChannel = notificationManager.getNotificationChannel(getNotificationChannelName(channel))
            if (notificationChannel != null && notificationChannel.importance > 0) {
                builder.add(notificationType)
            }
        }
        return builder.build()
    }

    open fun getNotificationChannelName(channel: NotificationChannels.Channel): String {
        val id: String
        synchronized(this.lock) {
            val notificationChannel = this.channels[channel]
            if (notificationChannel != null) {
                id = notificationChannel.id
            } else {
                val context = LumiyaApp.getContext()
                val notificationManager = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
                val notificationChannelSettings = this.channelSettings[channel]!!
                val notificationChannel2 = NotificationChannel(channel.channelId, context.getString(channel.nameStringId), notificationChannelSettings.importance)
                notificationChannel2.description = context.getString(channel.descriptionStringId)
                if (notificationChannelSettings.notificationType != null) {
                    val audioBuilder = AudioAttributes.Builder()
                    audioBuilder.setContentType(4)
                    audioBuilder.setUsage(5)
                    val sound = NotificationSounds.defaultSounds[notificationChannelSettings.notificationType]
                    notificationChannel2.setSound(sound?.getUri(), audioBuilder.build())
                }
                notificationChannel2.setShowBadge(notificationChannelSettings.showBadge)
                Debug.Printf("Notifications: Creating new notification channel with id '%s'", channel.channelId)
                notificationManager.createNotificationChannel(notificationChannel2)
                this.channels[channel] = notificationChannel2
                id = channel.channelId
            }
        }
        return id
    }

    open fun getNotificationSummary(context: Context, channel: NotificationChannels.Channel): String? {
        val notificationManager = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        val notificationChannel = notificationManager.getNotificationChannel(getNotificationChannelName(channel))
            ?: return null
        return when (notificationChannel.importance) {
            0 -> context.getString(R.string.notification_summary_importance_disabled)
            1 -> context.getString(R.string.notification_summary_importance_min)
            2 -> context.getString(R.string.notification_summary_importance_low)
            4, 5 -> context.getString(R.string.notification_summary_importance_high)
            else -> context.getString(R.string.notification_summary_importance_default)
        }
    }

    open fun showSystemNotificationSettings(context: Context, fragment: Fragment?, channel: NotificationChannels.Channel): Boolean {
        val intent = Intent("android.settings.CHANNEL_NOTIFICATION_SETTINGS")
        intent.putExtra("android.provider.extra.CHANNEL_ID", getNotificationChannelName(channel))
        intent.putExtra("android.provider.extra.APP_PACKAGE", context.packageName)
        if (fragment != null) {
            @Suppress("DEPRECATION")
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
