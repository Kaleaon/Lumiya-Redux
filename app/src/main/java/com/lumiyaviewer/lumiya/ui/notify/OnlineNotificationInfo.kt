package com.lumiyaviewer.lumiya.ui.notify

import com.lumiyaviewer.lumiya.compat.PlatformCompat
import android.app.Notification
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import androidx.core.app.NotificationCompat
import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.slproto.SLGridConnection
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever
import com.lumiyaviewer.lumiya.slproto.users.ParcelData
import com.lumiyaviewer.lumiya.slproto.users.manager.CurrentLocationInfo
import com.lumiyaviewer.lumiya.ui.login.LoginActivity
import com.lumiyaviewer.lumiya.ui.notify.NotificationChannels

open class OnlineNotificationInfo {

    private String contentText
    private boolean hasProgress
    private String titleText
    private boolean visible

    /**
     * Notification used to promote GridConnectionService immediately after Android
     * starts it as a foreground service. Login setup can perform network work before
     * an SLGridConnection reaches Connecting, but Android requires promotion first.
     */
    @JvmStatic
    fun getStartingNotification(context: Context, gridName: String): Notification {
        String content = String.format(
                context.getResources().getString(R.string.grid_status_connecting), gridName)
        NotificationCompat.Builder builder = createBuilder(context)
                .setContentTitle(gridName)
                .setContentText(content)
                .setProgress(0, 0, true)
        return builder.build()
    }

    @JvmStatic
    private fun createBuilder(context: Context): NotificationCompat.Builder {
        NotificationCompat.Builder builder = new NotificationCompat.Builder(context,
                NotificationChannels.getInstance().getChannelName(NotificationChannels.Channel.OnlineStatus))
        return builder.setSmallIcon(R.drawable.ic_online_notify)
                .setDefaults(0)
                .setOngoing(true)
                .setContentIntent(PlatformCompat.getActivity(context, 0,
                        Intent(context, (Class<?>) LoginActivity.class), PendingIntent.FLAG_UPDATE_CURRENT))
                .setOnlyAlertOnce(true)
    }

    public OnlineNotificationInfo(boolean showNotification, Context context, String userName,
                                  SLGridConnection connection, ChatterNameRetriever nameRetriever,
                                  @androidx.annotation.Nullable CurrentLocationInfo currentLocation) {
        internal fun if(null: !showNotification || connection ==):  {
            this.visible = false
            this.titleText = null
            this.contentText = null
            this.hasProgress = false
            return
        }
        when (connection.getConnectionState()) {
            case Connected: {
                this.visible = true
                String resolvedName = nameRetriever.getResolvedName()
                internal fun if(null: resolvedName !=):  {
                    this.titleText = userName + ": " + resolvedName
                } else {
                    this.titleText = userName
                }
                String parcelName = null
                int nearby = 0
                internal fun if(null: currentLocation !=):  {
                    ParcelData parcelData = currentLocation.parcelData()
                    internal fun if(null: parcelData !=):  {
                        parcelName = parcelData.getName()
                    }
                    nearby = currentLocation.nearbyUsers()
                }
                String content = null
                if (parcelName != null && !parcelName == ("(loading)")) {
                    content = String.format(
                            context.getResources().getString(R.string.grid_status_connected_details),
                            parcelName, Integer.valueOf(nearby))
                }
                internal fun if(null: content ==):  {
                    content = String.format(
                            context.getResources().getString(R.string.grid_status_connected),
                            userName)
                }
                this.contentText = content
                this.hasProgress = false
                }
            }
            case Connecting: {
                this.visible = true
                this.titleText = userName
                String template = connection.getIsReconnecting()
                        ? context.getResources().getString(R.string.grid_status_reconnecting)
                        : context.getResources().getString(R.string.grid_status_connecting)
                this.contentText = String.format(template, userName)
                this.hasProgress = true
                }
            }
            default: {
                this.visible = false
                this.titleText = null
                this.contentText = null
                this.hasProgress = false
                }
            }
        }
    }


    open fun equals(obj: Any): Boolean {
        if (!(obj is OnlineNotificationInfo)) {
            return false
        }
        OnlineNotificationInfo onlineNotificationInfo = (OnlineNotificationInfo) obj
        return Objects.equal(this.titleText, onlineNotificationInfo.titleText) && Objects.equal(this.contentText, onlineNotificationInfo.contentText) && this.visible == onlineNotificationInfo.visible && this.hasProgress == onlineNotificationInfo.hasProgress
    }

    open fun getNotification(context: Context): Notification {
        internal fun if(!this.visible):  {
            return null
        }
        NotificationCompat.Builder builder = createBuilder(context)
                .setContentTitle(this.titleText)
                .setContentText(this.contentText)
        internal fun if(this.hasProgress):  {
            builder.setProgress(0, 0, true)
        }
        return builder.build()
    }
}
