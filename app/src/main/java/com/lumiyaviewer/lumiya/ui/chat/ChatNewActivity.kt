package com.lumiyaviewer.lumiya.ui.chat

import android.content.Intent
import android.os.Bundle
import androidx.fragment.app.Fragment
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionSingleDataPool
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.ParcelData
import com.lumiyaviewer.lumiya.slproto.users.manager.CurrentLocationInfo
import com.lumiyaviewer.lumiya.slproto.users.manager.UnreadNotificationInfo
import com.lumiyaviewer.lumiya.slproto.users.manager.UnreadNotificationManager
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.chat.contacts.ChatFragmentActivityFactory
import com.lumiyaviewer.lumiya.ui.chat.profiles.ParcelPropertiesFragment
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.common.FragmentActivityFactory
import com.lumiyaviewer.lumiya.ui.common.MasterDetailsActivity
import java.util.UUID

open class ChatNewActivity : MasterDetailsActivity(), UnreadNotificationManager.NotifyCapture {
    private Subscription<SubscriptionSingleKey, CurrentLocationInfo> currentLocationInfoSubscription
    private Subscription.OnData<CurrentLocationInfo> onCurrentLocation = Subscription.OnData() {
            ChatNewActivity.this.m424lambda$com_lumiyaviewer_lumiya_ui_chat_ChatNewActivity_4384((CurrentLocationInfo) obj)
        }

        override fun onData(obj: Any) {
        }
    }

    override protected fun onStop() {
        if (this.currentLocationInfoSubscription != null) {
            this.currentLocationInfoSubscription.unsubscribe()
            this.currentLocationInfoSubscription = null
        }
        super.onStop()
    }
}
