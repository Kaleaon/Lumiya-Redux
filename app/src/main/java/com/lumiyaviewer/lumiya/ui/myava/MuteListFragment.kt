package com.lumiyaviewer.lumiya.ui.myava

import android.app.AlertDialog
import android.content.DialogInterface
import android.os.Bundle
import androidx.fragment.app.FragmentActivity
import android.view.LayoutInflater
import android.view.MenuItem
import android.view.View
import android.view.ViewGroup
import android.widget.AdapterView
import android.widget.ListAdapter
import android.widget.ListView
import android.widget.Toast
import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.databinding.MuteListBinding
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.modules.mutelist.MuteListEntry
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.common.FragmentWithTitle
import com.lumiyaviewer.lumiya.ui.common.SwipeDismissListViewTouchListener
import java.util.UUID

open class MuteListFragment : FragmentWithTitle() {
    private MuteListAdapter adapter
    private MuteListBinding binding
    private SubscriptionData<SubscriptionSingleKey, ImmutableList<MuteListEntry>> muteListData = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
            MuteListFragment.this.onMuteList((ImmutableList) obj)
        }

        override fun onData(obj: Any) {

            override fun onClick(dialogInterface: DialogInterface, i: Int) {
                MuteListFragment.this.doUnblock(item)
            }
        })
        binding.muteList.setOnTouchListener(swipeDismissListViewTouchListener)
        binding.muteList.setOnScrollListener(swipeDismissListViewTouchListener.makeScrollListener())
        binding.muteList.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                MuteListFragment.this.m660lambda$com_lumiyaviewer_lumiya_ui_myava_MuteListFragment_3737(adapterView, view, i, j)
            }

            override fun onItemClick(adapterView: AdapterView, view: View, i: Int, j: Long) {