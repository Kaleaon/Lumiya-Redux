package com.lumiyaviewer.lumiya.ui.minimap

import android.os.Bundle
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentManager
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.modules.SLMinimap
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.minimap.MinimapView
import java.util.UUID

open class MinimapFragment : Fragment(), MinimapView.OnUserClickListener {
    private SubscriptionData<SubscriptionSingleKey, SLMinimap.MinimapBitmap> minimapBitmap = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
            MinimapFragment.this.onMinimapBitmap((SLMinimap.MinimapBitmap) obj)
        }

        override fun onData(obj: Any) {
        }
        View view = getView()
        if (view != null) {
            ((MinimapView) view.findViewById(R.id.minimapView)).setSelectedUser(uuid)
        }
    }
}
