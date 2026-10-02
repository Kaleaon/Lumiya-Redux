package com.lumiyaviewer.lumiya.ui.chat.profiles

import android.R
import android.content.Context
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
import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.modules.groups.AvatarGroupList
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.common.ChatterReloadableFragment
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.common.LoadingLayout
import com.lumiyaviewer.lumiya.ui.common.loadmon.LoadableMonitor
import java.util.UUID

open class UserGroupsProfileTab : ChatterReloadableFragment(), LoadableMonitor.OnLoadableDataChangedListener {
    private GroupsAdapter groupsAdapter
    private SubscriptionData<UUID, AvatarGroupList> avatarGroups = SubscriptionData<>(UIThreadExecutor.getInstance())
    private LoadableMonitor loadableMonitor = LoadableMonitor(this.avatarGroups).withDataChangedListener(this)

    private class GroupsAdapter : BaseAdapter() {
        private ImmutableList<AvatarGroupList.AvatarGroupEntry> avatarGroupList
        private LayoutInflater inflater

        private constructor(context: Context) {
            this.avatarGroupList = null
            this.inflater = LayoutInflater.from(context)
        }

            this(context)
        }

        override fun getCount(): Int {
            if (this.avatarGroupList != null) {
                return this.avatarGroupList.size()
            }
            return 0
        }

        override fun getItem(i: Int): AvatarGroupList.AvatarGroupEntry {
            if (this.avatarGroupList == null || i < 0 || i >= this.avatarGroupList.size()) {
                return null
            }
            return this.avatarGroupList.get(i)
        }

        override fun getItemId(i: Int): Long {
            return i
        }

        override fun getView(i: Int, view: View, viewGroup: ViewGroup): View {
            if (view == null) {
                view = this.inflater.inflate(R.layout.simple_list_item_1, viewGroup, false)
            }
            AvatarGroupList.AvatarGroupEntry item = getItem(i)
            if (item != null) {
                ((TextView) view.findViewById(R.id.text1)).setText(item.GroupName)
            }
            return view
        }

        override fun hasStableIds(): Boolean {
            return false
        }

        internal fun setData(avatarGroupList: AvatarGroupList) {
            ImmutableList.Builder builder = ImmutableList.Builder()
            builder.addAll((Iterable) avatarGroupList.Groups.values())
            this.avatarGroupList = builder.build()
            notifyDataSetChanged()
        }
    }


    override fun onCreateView(layoutInflater: LayoutInflater, viewGroup: ViewGroup, bundle: Bundle): View? {
        View inflate = layoutInflater.inflate(com.lumiyaviewer.lumiya.R.layout.user_profile_tab_groups, viewGroup, false)
        this.groupsAdapter = GroupsAdapter(layoutInflater.getContext(), null)
        ((ListView) inflate.findViewById(com.lumiyaviewer.lumiya.R.id.groups_list_view)).setAdapter((ListAdapter) this.groupsAdapter)
        ((ListView) inflate.findViewById(com.lumiyaviewer.lumiya.R.id.groups_list_view)).setOnItemClickListener(AdapterView.OnItemClickListener() {
                UserGroupsProfileTab.this.m518x4b4ac4f6(adapterView, view, i, j)
            }

            override fun onItemClick(adapterView: AdapterView, view: View, i: Int, j: Long) {
