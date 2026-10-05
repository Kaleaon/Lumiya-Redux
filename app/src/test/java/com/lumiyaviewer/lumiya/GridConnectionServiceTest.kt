package com.lumiyaviewer.lumiya

import android.app.Application
import android.content.Intent
import android.content.pm.ServiceInfo
import androidx.test.core.app.ApplicationProvider
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.Robolectric
import org.robolectric.RobolectricTestRunner
import org.robolectric.Shadows.shadowOf
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [34], application = Application::class)
class GridConnectionServiceTest {

    @Test
    fun testForegroundServicePromotionOnStartCommand() {
        val controller = Robolectric.buildService(GridConnectionService::class.java)
        val service = controller.get()
        controller.create()

        val intent = Intent(ApplicationProvider.getApplicationContext(), GridConnectionService::class.java)
        service.onStartCommand(intent, 0, 1)

        val shadowService = shadowOf(service)
        assertEquals(R.id.online_notify_id, shadowService.lastForegroundNotificationId)
        assertNotNull(shadowService.lastForegroundNotification)

        val foregroundTypes = shadowService.lastForegroundNotificationTypes
        assertEquals(ServiceInfo.FOREGROUND_SERVICE_TYPE_REMOTE_MESSAGING, foregroundTypes)
    }
}
