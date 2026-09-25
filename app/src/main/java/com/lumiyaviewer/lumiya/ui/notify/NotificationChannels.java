package com.lumiyaviewer.lumiya.ui.notify;

import android.content.Context;
import androidx.fragment.app.Fragment;
import com.google.common.collect.ImmutableSet;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.ui.settings.NotificationType;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public class NotificationChannels {

    public static final String MESSAGE_NOTIFICATION_GROUP = "messageNotifications";
    private final OreoNotificationChannelManager channelManager;

    public enum Channel {
        OnlineStatus("onlineStatus", R.string.notify_online_status_name, R.string.notify_online_status_desc, null, R.id.online_notify_id),
        Local("localChat", R.string.notify_local_chat_name, R.string.notify_local_chat_desc, NotificationType.LocalChat, R.id.unread_notify_local_id),
        Group("groupChat", R.string.notify_group_chat_name, R.string.notify_group_chat_desc, NotificationType.Group, R.id.unread_notify_group_id),
        IM("privateIM", R.string.notify_im_name, R.string.notify_im_desc, NotificationType.Private, R.id.unread_notify_im_id);


        @Nonnull
        public final String channelId;
        public final int descriptionStringId;
        public final int nameStringId;
        public final int notificationId;

        @Nullable
        public final NotificationType notificationType;

        Channel(String channelId, int nameStringId, @Nonnull int descriptionStringId, NotificationType notificationType, int notificationId) {
            this.channelId = channelId;
            this.nameStringId = nameStringId;
            this.descriptionStringId = descriptionStringId;
            this.notificationType = notificationType;
            this.notificationId = notificationId;
        }

        /* renamed from: values, reason: to resolve conflict with enum method */
        public static Channel[] valuesCustom() {
            return values();
        }
    }

    private static class InstanceHolder {
        private static final NotificationChannels Instance = new NotificationChannels(null);

        private InstanceHolder() {
        }
    }

    private NotificationChannels() {
        this.channelManager = new OreoNotificationChannelManager();
    }

    /* synthetic */ NotificationChannels(NotificationChannels notificationChannels) {
        this();
    }

    public static NotificationChannels getInstance() {
        return InstanceHolder.Instance;
    }

    public boolean areNotificationsSystemControlled() {
        return this.channelManager.areNotificationsSystemControlled();
    }

    public Channel getChannelByType(@Nonnull NotificationType notificationType) {
        switch (notificationType) {
            case Group:
                return Channel.Group;
            case LocalChat:
                return Channel.Local;
            case Private:
                return Channel.IM;
            default:
                return null;
        }
    }

    public String getChannelName(@Nonnull Channel channel) {
        return this.channelManager.getNotificationChannelName(channel);
    }

    @Nonnull
    public ImmutableSet<NotificationType> getEnabledTypes(Context context) {
        return this.channelManager.getEnabledTypes(context);
    }

    @Nullable
    public String getNotificationSummary(Context context, @Nonnull Channel channel) {
        return this.channelManager.getNotificationSummary(context, channel);
    }

    public boolean showSystemNotificationSettings(Context context, @Nullable Fragment fragment, @Nonnull Channel channel) {
        return this.channelManager.showSystemNotificationSettings(context, fragment, channel);
    }

    public boolean useNotificationGroups() {
        return this.channelManager.useNotificationGroups();
    }
}
