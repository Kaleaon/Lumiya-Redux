package com.lumiyaviewer.lumiya.ui.notify;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.app.Notification;
import android.app.Application;
import android.content.Context;
import androidx.test.core.app.ApplicationProvider;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 34, application = Application.class)
public class OnlineNotificationInfoTest {

    @Test
    public void startingNotificationIsUsableForForegroundPromotion() {
        Context context = ApplicationProvider.getApplicationContext();

        Notification notification =
                OnlineNotificationInfo.getStartingNotification(context, "Second Life");

        assertNotNull(notification);
        assertEquals("Second Life", notification.extras.getString(Notification.EXTRA_TITLE));
        assertEquals("Connecting to Second Life...",
                notification.extras.getString(Notification.EXTRA_TEXT));
        assertTrue(notification.extras.getBoolean(Notification.EXTRA_PROGRESS_INDETERMINATE));
        assertTrue((notification.flags & Notification.FLAG_ONGOING_EVENT) != 0);
    }
}
