package com.lumiyaviewer.lumiya.ui.notify;

import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.Context;
import android.content.Intent;
import android.media.AudioAttributes;
import androidx.annotation.RequiresApi;
import androidx.fragment.app.Fragment;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableSet;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.LumiyaApp;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.ui.media.NotificationSounds;
import com.lumiyaviewer.lumiya.ui.notify.NotificationChannels;
import com.lumiyaviewer.lumiya.ui.settings.NotificationType;
import java.util.EnumMap;
import java.util.Map;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

@RequiresApi(api = 26)
public class OreoNotificationChannelManager implements NotificationChannelManager {
    private final ImmutableMap<NotificationChannels.Channel, NotificationChannelSettings> channelSettings;
    private final Object lock = new Object();
    private final Map<NotificationChannels.Channel, NotificationChannel> channels = new EnumMap(NotificationChannels.Channel.class);

    private static class NotificationChannelSettings {
        final int importance;
        final NotificationType notificationType;
        final boolean showBadge;

        private NotificationChannelSettings(int importance, boolean showBadge, NotificationType notificationType) {
            this.importance = importance;
            this.showBadge = showBadge;
            this.notificationType = notificationType;
        }

        /* synthetic */ NotificationChannelSettings(int i, boolean z, NotificationType notificationType, NotificationChannelSettings notificationChannelSettings) {
            this(i, z, notificationType);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public OreoNotificationChannelManager() {
        int i = 3;
        boolean z = true;
        this.channelSettings = ImmutableMap.of(NotificationChannels.Channel.OnlineStatus, new NotificationChannelSettings(2, false, null, null), NotificationChannels.Channel.Local, new NotificationChannelSettings(i, z, NotificationType.LocalChat, null), NotificationChannels.Channel.Group, new NotificationChannelSettings(i, z, NotificationType.Group, null), NotificationChannels.Channel.IM, new NotificationChannelSettings(4, z, NotificationType.Private, null));
    }

    @Override
    public boolean areNotificationsSystemControlled() {
        return true;
    }

    @Override
    @Nonnull
    public ImmutableSet<NotificationType> getEnabledTypes(Context context) {
        NotificationChannels notificationChannels = NotificationChannels.getInstance();
        NotificationManager notificationManager = (NotificationManager) context.getSystemService("notification");
        ImmutableSet.Builder builder = ImmutableSet.builder();
        for (NotificationType notificationType : NotificationType.VALUES) {
            NotificationChannel notificationChannel = notificationManager.getNotificationChannel(getNotificationChannelName(notificationChannels.getChannelByType(notificationType)));
            if (notificationChannel != null && notificationChannel.getImportance() > 0) {
                builder.add(notificationType);
            }
        }
        return builder.build();
    }

    @Override
    @Nonnull
    public String getNotificationChannelName(@Nonnull NotificationChannels.Channel channel) {
        String id;
        synchronized (this.lock) {
            NotificationChannel notificationChannel = this.channels.get(channel);
            if (notificationChannel != null) {
                id = notificationChannel.getId();
            } else {
                Context context = LumiyaApp.getContext();
                NotificationManager notificationManager = (NotificationManager) context.getSystemService("notification");
                NotificationChannelSettings notificationChannelSettings = this.channelSettings.get(channel);
                NotificationChannel notificationChannel2 = new NotificationChannel(channel.channelId, context.getString(channel.nameStringId), notificationChannelSettings.importance);
                notificationChannel2.setDescription(context.getString(channel.descriptionStringId));
                if (notificationChannelSettings.notificationType != null) {
                    AudioAttributes.Builder builder = new AudioAttributes.Builder();
                    builder.setContentType(4);
                    builder.setUsage(5);
                    notificationChannel2.setSound(NotificationSounds.defaultSounds.get(notificationChannelSettings.notificationType).getUri(), builder.build());
                }
                notificationChannel2.setShowBadge(notificationChannelSettings.showBadge);
                Debug.Printf("Notifications: Creating new notification channel with id '%s'", channel.channelId);
                notificationManager.createNotificationChannel(notificationChannel2);
                this.channels.put(channel, notificationChannel2);
                id = channel.channelId;
            }
        }
        return id;
    }

    @Override
    @Nullable
    public String getNotificationSummary(Context context, @Nonnull NotificationChannels.Channel channel) {
        NotificationChannel notificationChannel = ((NotificationManager) context.getSystemService("notification")).getNotificationChannel(getNotificationChannelName(channel));
        if (notificationChannel == null) {
            return null;
        }
        switch (notificationChannel.getImportance()) {
            case 0:
                return context.getString(R.string.notification_summary_importance_disabled);
            case 1:
                return context.getString(R.string.notification_summary_importance_min);
            case 2:
                return context.getString(R.string.notification_summary_importance_low);
            case 3:
            default:
                return context.getString(R.string.notification_summary_importance_default);
            case 4:
            case 5:
                return context.getString(R.string.notification_summary_importance_high);
        }
    }

    @Override
    public boolean showSystemNotificationSettings(Context context, @Nullable Fragment fragment, @Nonnull NotificationChannels.Channel channel) {
        Intent intent = new Intent("android.settings.CHANNEL_NOTIFICATION_SETTINGS");
        intent.putExtra("android.provider.extra.CHANNEL_ID", getNotificationChannelName(channel));
        intent.putExtra("android.provider.extra.APP_PACKAGE", context.getPackageName());
        if (fragment != null) {
            fragment.startActivityForResult(intent, 11);
            return true;
        }
        context.startActivity(intent);
        return true;
    }

    @Override
    public boolean useNotificationGroups() {
        return true;
    }
}
