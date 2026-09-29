package com.lumiyaviewer.lumiya.ui.notify

import android.app.Notification
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import androidx.core.app.NotificationCompat
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.compat.PlatformCompat
import com.lumiyaviewer.lumiya.slproto.SLGridConnection
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever
import com.lumiyaviewer.lumiya.slproto.users.manager.CurrentLocationInfo
import com.lumiyaviewer.lumiya.ui.login.LoginActivity

class OnlineNotificationInfo(
    showNotification: Boolean,
    context: Context,
    userName: String,
    connection: SLGridConnection?,
    nameRetriever: ChatterNameRetriever?,
    currentLocation: CurrentLocationInfo?
) {
    private val contentText: String?
    private val hasProgress: Boolean
    private val titleText: String?
    private val visible: Boolean

    init {
        when {
            !showNotification || connection == null -> {
                visible = false
                titleText = null
                contentText = null
                hasProgress = false
            }
            connection.getConnectionState() == SLGridConnection.ConnectionState.Connected -> {
                visible = true
                titleText = nameRetriever?.getResolvedName()?.let { "$userName: $it" } ?: userName
                val parcelName = currentLocation?.parcelData()?.getName()
                val nearby = currentLocation?.nearbyUsers() ?: 0
                contentText = if (parcelName != null && parcelName != "(loading)") {
                    context.getString(R.string.grid_status_connected_details, parcelName, nearby)
                } else {
                    context.getString(R.string.grid_status_connected, userName)
                }
                hasProgress = false
            }
            connection.getConnectionState() == SLGridConnection.ConnectionState.Connecting -> {
                visible = true
                titleText = userName
                val template = if (connection.getIsReconnecting()) {
                    R.string.grid_status_reconnecting
                } else {
                    R.string.grid_status_connecting
                }
                contentText = context.getString(template, userName)
                hasProgress = true
            }
            else -> {
                visible = false
                titleText = null
                contentText = null
                hasProgress = false
            }
        }
    }

    fun getNotification(context: Context): Notification? {
        if (!visible) return null
        return createBuilder(context)
            .setContentTitle(titleText)
            .setContentText(contentText)
            .apply { if (hasProgress) setProgress(0, 0, true) }
            .build()
    }

    override fun equals(other: Any?): Boolean =
        other is OnlineNotificationInfo &&
            titleText == other.titleText &&
            contentText == other.contentText &&
            visible == other.visible &&
            hasProgress == other.hasProgress

    override fun hashCode(): Int {
        var result = titleText?.hashCode() ?: 0
        result = 31 * result + (contentText?.hashCode() ?: 0)
        result = 31 * result + visible.hashCode()
        result = 31 * result + hasProgress.hashCode()
        return result
    }

    companion object {
        @JvmStatic
        fun getStartingNotification(context: Context, gridName: String): Notification =
            createBuilder(context)
                .setContentTitle(gridName)
                .setContentText(context.getString(R.string.grid_status_connecting, gridName))
                .setProgress(0, 0, true)
                .build()

        private fun createBuilder(context: Context): NotificationCompat.Builder =
            NotificationCompat.Builder(
                context,
                NotificationChannels.getInstance()
                    .getChannelName(NotificationChannels.Channel.OnlineStatus)
            )
                .setSmallIcon(R.drawable.ic_online_notify)
                .setDefaults(0)
                .setOngoing(true)
                .setContentIntent(
                    PlatformCompat.getActivity(
                        context,
                        0,
                        Intent(context, LoginActivity::class.java),
                        PendingIntent.FLAG_UPDATE_CURRENT
                    )
                )
                .setOnlyAlertOnce(true)
    }
}
