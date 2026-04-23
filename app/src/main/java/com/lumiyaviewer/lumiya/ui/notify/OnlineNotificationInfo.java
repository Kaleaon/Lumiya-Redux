package com.lumiyaviewer.lumiya.ui.notify;

import android.app.Notification;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import androidx.core.app.NotificationCompat;
import com.google.common.base.Objects;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.slproto.SLGridConnection;
import com.lumiyaviewer.lumiya.slproto.avatar.SLMoveEvents;
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever;
import com.lumiyaviewer.lumiya.slproto.users.ParcelData;
import com.lumiyaviewer.lumiya.slproto.users.manager.CurrentLocationInfo;
import com.lumiyaviewer.lumiya.ui.login.LoginActivity;
import com.lumiyaviewer.lumiya.ui.notify.NotificationChannels;

/* loaded from: classes.dex */
public class OnlineNotificationInfo {

    private final String contentText;
    private final boolean hasProgress;
    private final String titleText;
    private final boolean visible;

    public OnlineNotificationInfo(boolean showNotification, Context context, String userName,
                                  SLGridConnection connection, ChatterNameRetriever nameRetriever,
                                  @androidx.annotation.Nullable CurrentLocationInfo currentLocation) {
        if (!showNotification || connection == null) {
            this.visible = false;
            this.titleText = null;
            this.contentText = null;
            this.hasProgress = false;
            return;
        }
        switch (connection.getConnectionState()) {
            case Connected: {
                this.visible = true;
                String resolvedName = nameRetriever.getResolvedName();
                if (resolvedName != null) {
                    this.titleText = userName + ": " + resolvedName;
                } else {
                    this.titleText = userName;
                }
                String parcelName = null;
                int nearby = 0;
                if (currentLocation != null) {
                    ParcelData parcelData = currentLocation.parcelData();
                    if (parcelData != null) {
                        parcelName = parcelData.getName();
                    }
                    nearby = currentLocation.nearbyUsers();
                }
                String content = null;
                if (parcelName != null && !parcelName.equals("(loading)")) {
                    content = String.format(
                            context.getResources().getString(R.string.grid_status_connected_details),
                            parcelName, Integer.valueOf(nearby));
                }
                if (content == null) {
                    content = String.format(
                            context.getResources().getString(R.string.grid_status_connected),
                            userName);
                }
                this.contentText = content;
                this.hasProgress = false;
                break;
            }
            case Connecting: {
                this.visible = true;
                this.titleText = userName;
                String template = connection.getIsReconnecting()
                        ? context.getResources().getString(R.string.grid_status_reconnecting)
                        : context.getResources().getString(R.string.grid_status_connecting);
                this.contentText = String.format(template, userName);
                this.hasProgress = true;
                break;
            }
            default: {
                this.visible = false;
                this.titleText = null;
                this.contentText = null;
                this.hasProgress = false;
                break;
            }
        }
    }


    public boolean equals(Object obj) {
        if (!(obj instanceof OnlineNotificationInfo)) {
            return false;
        }
        OnlineNotificationInfo onlineNotificationInfo = (OnlineNotificationInfo) obj;
        return Objects.equal(this.titleText, onlineNotificationInfo.titleText) && Objects.equal(this.contentText, onlineNotificationInfo.contentText) && this.visible == onlineNotificationInfo.visible && this.hasProgress == onlineNotificationInfo.hasProgress;
    }

    public Notification getNotification(Context context) {
        if (!this.visible) {
            return null;
        }
        NotificationCompat.Builder builder = new NotificationCompat.Builder(context, NotificationChannels.getInstance().getChannelName(NotificationChannels.Channel.OnlineStatus));
        builder.setSmallIcon(R.drawable.ic_online_notify).setContentTitle(this.titleText).setContentText(this.contentText).setDefaults(0).setOngoing(true).setContentIntent(PendingIntent.getActivity(context, 0, new Intent(context, (Class<?>) LoginActivity.class), SLMoveEvents.AGENT_CONTROL_AWAY)).setOnlyAlertOnce(true);
        if (this.hasProgress) {
            builder.setProgress(0, 0, true);
        }
        return builder.build();
    }
}
