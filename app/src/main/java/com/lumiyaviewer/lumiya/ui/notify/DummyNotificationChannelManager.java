package com.lumiyaviewer.lumiya.ui.notify;

import android.content.Context;
import android.os.Build;
import androidx.fragment.app.Fragment;
import com.google.common.collect.ImmutableSet;
import com.lumiyaviewer.lumiya.ui.notify.NotificationChannels;
import com.lumiyaviewer.lumiya.ui.settings.NotificationType;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public class DummyNotificationChannelManager implements NotificationChannelManager {
    public static final String DEFAULT_NOTIFICATION_CHANNEL = "miscellaneous";
    private static final ImmutableSet<NotificationType> allChannels = ImmutableSet.of(NotificationType.LocalChat, NotificationType.Group, NotificationType.Private);

    @Override
    public boolean areNotificationsSystemControlled() {
        return false;
    }

    @Override
    @Nonnull
    public ImmutableSet<NotificationType> getEnabledTypes(Context context) {
        return allChannels;
    }

    @Override
    @Nonnull
    public String getNotificationChannelName(@Nonnull NotificationChannels.Channel channel) {
        return "miscellaneous";
    }

    @Override
    @Nullable
    public String getNotificationSummary(Context context, @Nonnull NotificationChannels.Channel channel) {
        return null;
    }

    @Override
    public boolean showSystemNotificationSettings(Context context, @Nullable Fragment fragment, @Nonnull NotificationChannels.Channel channel) {
        return false;
    }

    @Override
    public boolean useNotificationGroups() {
        return Build.VERSION.SDK_INT >= 24;
    }
}
