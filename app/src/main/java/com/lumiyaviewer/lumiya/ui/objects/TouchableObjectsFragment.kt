package com.lumiyaviewer.lumiya.ui.objects

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.AdapterView
import android.widget.ListAdapter
import android.widget.ListView
import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectInfo
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.util.UUID

open class TouchableObjectsFragment : Fragment(), AdapterView.OnItemClickListener {
    private static String OBJECT_UUID_KEY = "objectUUID"
    private TouchableObjectListAdapter listAdapter
    private SubscriptionData<UUID, ImmutableList<SLObjectInfo>> touchableObjects = SubscriptionData<>(UIThreadExecutor.getInstance(), Subscription.OnData() {
            TouchableObjectsFragment.this.onTouchableObjects((ImmutableList) obj)
        }

        override fun onData(obj: Any) {
            activeAgentCircuit.TouchObject(item.localID)
        }
    }

    override fun onStart() {
        super.onStart()
        UserManager userManager = ActivityUtils.getUserManager(getArguments())
        UUID objectUUID = getObjectUUID()
        if (userManager == null || objectUUID == null) {
            this.touchableObjects.unsubscribe()
        } else {
            this.touchableObjects.subscribe(userManager.getObjectsManager().touchableObjects(), objectUUID)
        }
    }

    override fun onStop() {
        this.touchableObjects.unsubscribe()
        super.onStop()
    }
}
