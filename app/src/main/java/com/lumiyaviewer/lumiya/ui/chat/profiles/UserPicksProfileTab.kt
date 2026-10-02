package com.lumiyaviewer.lumiya.ui.chat.profiles

import android.R
import android.app.AlertDialog
import android.content.Context
import android.content.DialogInterface
import android.os.Bundle
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.AdapterView
import android.widget.BaseAdapter
import android.widget.ListAdapter
import android.widget.ListView
import android.widget.TextView
import com.google.common.base.Optional
import com.google.common.base.Strings
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.messages.AvatarPicksReply
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.ParcelData
import com.lumiyaviewer.lumiya.slproto.users.manager.AvatarPickKey
import com.lumiyaviewer.lumiya.slproto.users.manager.CurrentLocationInfo
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.common.ChatterReloadableFragment
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.common.LoadingLayout
import com.lumiyaviewer.lumiya.ui.common.loadmon.LoadableMonitor
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.util.UUID

open class UserPicksProfileTab : ChatterReloadableFragment(), LoadableMonitor.OnLoadableDataChangedListener {
    private SubscriptionData<UUID, AvatarPicksReply> avatarPicks = SubscriptionData<>(UIThreadExecutor.getInstance())
    private LoadableMonitor loadableMonitor = LoadableMonitor(this.avatarPicks).withDataChangedListener(this)
    private PicksAdapter picksAdapter

    private class PicksAdapter : BaseAdapter() {
        private LayoutInflater inflater
        private AvatarPicksReply picksReply

        private constructor(context: Context) {
            this.picksReply = null
            this.inflater = LayoutInflater.from(context)
        }

            this(context)
        }

        override fun getCount(): Int {
            if (this.picksReply != null) {
                return this.picksReply.Data_Fields.size()
            }
            return 0
        }

        override fun getItem(i: Int): AvatarPicksReply.Data {
            if (this.picksReply == null || i < 0 || i >= this.picksReply.Data_Fields.size()) {
                return null
            }
            return this.picksReply.Data_Fields.get(i)
        }

        override fun getItemId(i: Int): Long {
            return i
        }

        override fun getView(i: Int, view: View, viewGroup: ViewGroup): View {
            if (view == null) {
                view = this.inflater.inflate(R.layout.simple_list_item_1, viewGroup, false)
            }
            AvatarPicksReply.Data item = getItem(i)
            if (item != null) {
                ((TextView) view.findViewById(R.id.text1)).setText(SLMessage.stringFromVariableUTF(item.PickName))
            }
            return view
        }

        override fun hasStableIds(): Boolean {
            return false
        }

        internal fun setData(avatarPicksReply: AvatarPicksReply) {
            this.picksReply = avatarPicksReply
            notifyDataSetChanged()
        }
    }

    open fun onAddNewPick(view: View) {
        if (this.userManager == null || !(this.chatterID is ChatterID.ChatterIDUser)) {
            return
        }
        CurrentLocationInfo currentLocationInfoSnapshot = this.userManager.getCurrentLocationInfoSnapshot()
        ParcelData parcelData = currentLocationInfoSnapshot != null ? currentLocationInfoSnapshot.parcelData() : null
        SLAgentCircuit activeAgentCircuit = this.userManager.getActiveAgentCircuit()
        if (parcelData == null || activeAgentCircuit == null) {
            return
        }
        int count = this.picksAdapter != null ? this.picksAdapter.getCount() : 0
        AlertDialog.Builder builder = AlertDialog.Builder(getContext())
        String str = (String) Optional.fromNullable(Strings.emptyToNull(parcelData.getName())).or(getString(com.lumiyaviewer.lumiya.R.string.name_loading_title))
        builder.setMessage(getString(com.lumiyaviewer.lumiya.R.string.create_pick_question, str)).setCancelable(true).setPositiveButton("Yes", DialogInterface.OnClickListener() {
                UserPicksProfileTab.this.m532xd71354a5((SLAgentCircuit) activeAgentCircuit, (String) str, (ParcelData) parcelData, count, dialogInterface, i)
            }

            override fun onClick(dialogInterface: DialogInterface, i: Int) {
