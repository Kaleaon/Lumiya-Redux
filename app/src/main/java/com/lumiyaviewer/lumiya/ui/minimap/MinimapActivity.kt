package com.lumiyaviewer.lumiya.ui.minimap

import android.os.Bundle
import androidx.fragment.app.FragmentManager
import androidx.fragment.app.FragmentTransaction
import androidx.appcompat.app.ActionBar
import android.view.View
import android.view.ViewGroup
import android.widget.FrameLayout
import android.widget.LinearLayout
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.databinding.SplitTwoPanelsBinding
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.users.ParcelData
import com.lumiyaviewer.lumiya.slproto.users.manager.CurrentLocationInfo
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.ConnectedActivity
import java.util.UUID

open class MinimapActivity : ConnectedActivity() {
    private SubscriptionData<SubscriptionSingleKey, CurrentLocationInfo> currentLocationInfo = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
            MinimapActivity.this.onCurrentLocationInfo((CurrentLocationInfo) obj)
        }

        override fun onData(obj: Any) {
            setActivityTitle(name, getString(R.string.nearby_users_format, arrayOfNulls<Object>(]{Integer.valueOf(currentLocationInfo.nearbyUsers())}))
        }
    }

    private fun setActivityTitle(str: String, str2: String) {
        ActionBar supportActionBar = getSupportActionBar()
        if (supportActionBar != null) {
            supportActionBar.setTitle(str)
            supportActionBar.setSubtitle(str2)
        }
        setTitle(str)
    }

    override protected fun onCreate(bundle: Bundle) {
        super.onCreate(bundle)
        this.binding = SplitTwoPanelsBinding.inflate(getLayoutInflater())
        setContentView(this.binding.getRoot())
        this.detailsLayout = this.binding.detailsWithOnlineStatus
        this.selectorLayout = this.binding.selector
        this.splitMainLayout = this.binding.splitMainLayout
        this.splitObjectPopupsLeftSpacer = this.binding.splitObjectPopupsLeftSpacer
        if (getResources().getConfiguration().orientation == 2) {
            this.splitMainLayout.setOrientation(0)
            LinearLayout.LayoutParams layoutParams = (LinearLayout.LayoutParams) this.selectorLayout.getLayoutParams()
            layoutParams.width = -2
            layoutParams.height = -1
            layoutParams.weight = 0.0f
            this.selectorLayout.setLayoutParams(layoutParams)
            LinearLayout.LayoutParams layoutParams2 = (LinearLayout.LayoutParams) this.detailsLayout.getLayoutParams()
            layoutParams2.width = -1
            layoutParams2.height = -1
            layoutParams2.weight = 1.0f
            this.detailsLayout.setLayoutParams(layoutParams2)
        } else {
            this.splitMainLayout.setOrientation(1)
            LinearLayout.LayoutParams layoutParams3 = (LinearLayout.LayoutParams) this.selectorLayout.getLayoutParams()
            layoutParams3.width = -1
            layoutParams3.height = -2
            layoutParams3.weight = 0.0f
            this.selectorLayout.setLayoutParams(layoutParams3)
            LinearLayout.LayoutParams layoutParams4 = (LinearLayout.LayoutParams) this.detailsLayout.getLayoutParams()
            layoutParams4.width = -1
            layoutParams4.height = -1
            layoutParams4.weight = 1.0f
            this.detailsLayout.setLayoutParams(layoutParams4)
            this.splitObjectPopupsLeftSpacer.setVisibility(View.GONE)
        }
        UUID activeAgentID = ActivityUtils.getActiveAgentID(getIntent())
        FragmentManager supportFragmentManager = getSupportFragmentManager()
        if (supportFragmentManager == null || activeAgentID == null) {
            finish()
            return
        }
        FragmentTransaction beginTransaction = supportFragmentManager.beginTransaction()
        if (supportFragmentManager.findFragmentById(R.id.selector) == null) {
            beginTransaction.add(R.id.selector, MinimapFragment.newInstance(activeAgentID))
        }
        if (supportFragmentManager.findFragmentById(R.id.details) == null) {
            beginTransaction.add(R.id.details, NearbyPeopleMinimapFragment.newInstance(activeAgentID))
        }
        beginTransaction.commit()
    }

    override protected fun onStart() {
        super.onStart()
        UserManager userManager = ActivityUtils.getUserManager(getIntent())
        if (userManager != null) {
            this.currentLocationInfo.subscribe(userManager.getCurrentLocationInfo(), SubscriptionSingleKey.Value)
        } else {
            this.currentLocationInfo.unsubscribe()
        }
    }

    override protected fun onStop() {
        this.currentLocationInfo.unsubscribe()
        super.onStop()
    }

    override protected fun onDestroy() {
        this.binding = null
        this.detailsLayout = null
        this.selectorLayout = null
        this.splitMainLayout = null
        this.splitObjectPopupsLeftSpacer = null
        super.onDestroy()
    }
}
