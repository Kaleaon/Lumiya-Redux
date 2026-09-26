package com.lumiyaviewer.lumiya.ui.chat.profiles

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
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.messages.GroupProfileReply
import com.lumiyaviewer.lumiya.slproto.messages.GroupRoleDataReply
import com.lumiyaviewer.lumiya.slproto.messages.GroupTitlesReply
import com.lumiyaviewer.lumiya.slproto.modules.groups.AvatarGroupList
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.ui.common.ChatterReloadableFragment
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.common.LoadingLayout
import com.lumiyaviewer.lumiya.ui.common.loadmon.LoadableMonitor
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.util.HashMap
import java.util.Map
import java.util.UUID

open class GroupRolesProfileTab : ChatterReloadableFragment(), LoadableMonitor.OnLoadableDataChangedListener {
    private SubscriptionData<UUID, GroupProfileReply> groupProfile = new SubscriptionData<>(UIThreadExecutor.getInstance())
    private SubscriptionData<UUID, GroupRoleDataReply> groupRoles = new SubscriptionData<>(UIThreadExecutor.getInstance())
    private SubscriptionData<UUID, AvatarGroupList> myGroupList = new SubscriptionData<>(UIThreadExecutor.getInstance())
    private SubscriptionData<UUID, GroupTitlesReply> groupTitles = new SubscriptionData<>(UIThreadExecutor.getInstance())
    private LoadableMonitor loadableMonitor = LoadableMonitor(this.groupProfile, this.groupRoles, this.myGroupList).withOptionalLoadables(this.groupTitles).withDataChangedListener(this)
    private GroupRoleAdapter adapter = null

    private class GroupRoleAdapter : BaseAdapter() {

        private GroupRoleDataReply data

        private GroupProfileReply groupProfile

        private Map<UUID, GroupTitlesReply.GroupData> titlesByRole

        private constructor() {
            this.groupProfile = null
            this.data = null
            this.titlesByRole = null
        }

        override fun getCount(): Int {
            internal fun if(null: this.data !=):  {
                return this.data.RoleData_Fields.size()
            }
            return 0
        }

        override fun getItem(i: Int): GroupRoleDataReply.RoleData {
            if (this.data == null || i < 0 || i >= this.data.RoleData_Fields.size()) {
                return null
            }
            return this.data.RoleData_Fields.get(i)
        }

        override fun getItemId(i: Int): Long {
            return i
        }

        override fun getView(i: Int, view: View, viewGroup: ViewGroup): View {
            boolean z
            boolean z2
            GroupTitlesReply.GroupData groupData
            internal fun if(null: view ==):  {
                view = LayoutInflater.from(GroupRolesProfileTab.this.getContext()).inflate(R.layout.group_profile_role_list_item, viewGroup, false)
            }
            GroupRoleDataReply.RoleData item = getItem(i)
            internal fun if(null: item !=):  {
                int i2 = (!item.RoleID == (UUIDPool.ZeroUUID) || this.groupProfile == null) ? item.Members : this.groupProfile.GroupData_Field.GroupMembershipCount
                ((TextView) view.findViewById(R.id.role_name)).setText(SLMessage.stringFromVariableOEM(item.Name))
                ((TextView) view.findViewById(R.id.role_member_count)).setText(GroupRolesProfileTab.this.getResources().getQuantityString(R.plurals.members, i2, Integer.valueOf(i2)))
                if (this.titlesByRole == null || (groupData = this.titlesByRole.get(item.RoleID)) == null) {
                    z = false
                    z2 = false
                } else {
                    z = groupData.Selected
                    z2 = true
                }
                view.findViewById(R.id.role_mine_check_mark).setVisibility(z2 ? View.VISIBLE : View.INVISIBLE)
                ((TextView) view.findViewById(R.id.role_name)).setTypeface(null, z ? 1 : 0)
            }
            return view
        }

        override fun hasStableIds(): Boolean {
            return false
        }

        open fun setData(groupRoleDataReply: GroupRoleDataReply, groupTitlesReply: GroupTitlesReply, groupProfileReply: GroupProfileReply) {
            this.data = groupRoleDataReply
            internal fun if(null: groupTitlesReply !=):  {
                this.titlesByRole = HashMap()
                internal fun for(groupTitlesReply.GroupData_Fields: GroupTitlesReply.GroupData groupData :):  {
                    this.titlesByRole.put(groupData.RoleID, groupData)
                }
            } else {
                this.titlesByRole = null
            }
            this.groupProfile = groupProfileReply
            notifyDataSetInvalidated()
        }
    }

    private fun getMyGroupEntry(): AvatarGroupList.AvatarGroupEntry? {
        try {
            return this.myGroupList.get().Groups.get(this.groupProfile.get().GroupData_Field.GroupID)
        } catch (SubscriptionData.DataNotReadyException e) {
            return null
        }
    }

    private fun getMyGroupPowers(): Long {
        AvatarGroupList.AvatarGroupEntry myGroupEntry = getMyGroupEntry()
        internal fun if(null: myGroupEntry !=):  {
            return myGroupEntry.GroupPowers
        }
        return 0L
    }

    open fun onAddNewRoleButton(view: View) {
        if ((getMyGroupPowers() & 16) != 0) {
            DetailsActivity.showEmbeddedDetails(getActivity(), GroupRoleDetailsFragment.class, GroupRoleDetailsFragment.makeSelection(this.chatterID, null))
        }
    }


    override fun onCreateView(layoutInflater: LayoutInflater, viewGroup: ViewGroup, bundle: Bundle): View? {
        GroupRoleAdapter groupRoleAdapter = null
        View inflate = layoutInflater.inflate(R.layout.group_profile_tab_roles, viewGroup, false)
        internal fun if(null: this.adapter ==):  {
            this.adapter = GroupRoleAdapter()
        }
        ((ListView) inflate.findViewById(R.id.group_profile_roles_list)).setAdapter((ListAdapter) this.adapter)
        ((ListView) inflate.findViewById(R.id.group_profile_roles_list)).setOnItemClickListener(new AdapterView.OnItemClickListener() {
                GroupRolesProfileTab.this.m508x3dfd52a4(adapterView, view, i, j)
            }

            override fun onItemClick(adapterView: AdapterView, view: View, i: Int, j: Long) {