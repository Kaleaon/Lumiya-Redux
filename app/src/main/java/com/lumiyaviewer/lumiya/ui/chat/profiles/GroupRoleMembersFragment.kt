package com.lumiyaviewer.lumiya.ui.chat.profiles

import android.app.AlertDialog
import android.content.Context
import android.content.DialogInterface
import android.os.Bundle
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout
import androidx.recyclerview.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageButton
import android.widget.TextView
import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.dao.GroupRoleMember
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.messages.GroupProfileReply
import com.lumiyaviewer.lumiya.slproto.messages.GroupTitlesReply
import com.lumiyaviewer.lumiya.slproto.modules.groups.AvatarGroupList
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever
import com.lumiyaviewer.lumiya.slproto.users.manager.GroupManager
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.chat.ChatterPicView
import com.lumiyaviewer.lumiya.ui.common.ChatterFragment
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.common.LoadingLayout
import com.lumiyaviewer.lumiya.ui.common.loadmon.LoadableMonitor
import com.lumiyaviewer.lumiya.utils.UUIDPool
import de.greenrobot.dao.query.LazyList
import java.util.Iterator
import java.util.UUID

open class GroupRoleMembersFragment : ChatterFragment(), LoadableMonitor.OnLoadableDataChangedListener {
    private static String ROLE_ID_KEY = "role_id"

    private UUID RoleID
    private SubscriptionData<UUID, SLAgentCircuit> agentCircuit = SubscriptionData<>(UIThreadExecutor.getInstance())
    private SubscriptionData<UUID, GroupProfileReply> groupProfile = SubscriptionData<>(UIThreadExecutor.getInstance())
    private SubscriptionData<UUID, AvatarGroupList> myGroupList = SubscriptionData<>(UIThreadExecutor.getInstance())
    private SubscriptionData<UUID, GroupTitlesReply> groupTitles = SubscriptionData<>(UIThreadExecutor.getInstance())
    private SubscriptionData<UUID, UUID> groupRoleMemberList = SubscriptionData<>(UIThreadExecutor.getInstance(), Subscription.OnData() {
            GroupRoleMembersFragment.this.onGroupRoleMemberList((UUID) obj)
        }

        override fun onData(obj: Any) {
            return 0
        }

        override fun onBindViewHolder(memberViewHolder: MemberViewHolder, i: Int) {
            if (this.data == null || i < 0 || i >= this.data.size()) {
                return
            }
            memberViewHolder.bindToData(this.data.get(i), this.canDeleteMembers, this.canDeleteMyself)
        }

        override fun onCreateViewHolder(viewGroup: ViewGroup, i: Int): MemberViewHolder {
            return GroupRoleMembersFragment.this.MemberViewHolder(this.layoutInflater.inflate(R.layout.group_role_member_list_item, viewGroup, false), GroupRoleMembersFragment.this.userManager.getUserID())
        }

        override fun onViewRecycled(memberViewHolder: MemberViewHolder) {
            memberViewHolder.recycle()
        }

        open fun setData(lazyList: LazyList<GroupRoleMember>, canDeleteMembers: Boolean, canDeleteMyself: Boolean) {
            this.data = lazyList
            this.canDeleteMembers = canDeleteMembers
            this.canDeleteMyself = canDeleteMyself
            notifyDataSetChanged()
        }
    }

    private class MemberViewHolder : RecyclerView.ViewHolder(), ChatterNameRetriever.OnChatterNameUpdated, View.OnClickListener {
        private UUID agentUUID
        private ChatterID.ChatterIDUser boundChatterID
        private boolean canDelete
        private ChatterNameRetriever chatterNameRetriever
        private ImageButton roleMemberRemoveButton
        private TextView userNameTextView
        private ChatterPicView userPicView

        internal constructor(view: View, uuid: UUID) {
            super(view)
            this.canDelete = false
            this.boundChatterID = null
            this.chatterNameRetriever = null
            this.agentUUID = uuid
            this.userNameTextView = (TextView) view.findViewById(R.id.userNameTextView)
            this.userPicView = (ChatterPicView) view.findViewById(R.id.userPicView)
            this.roleMemberRemoveButton = (ImageButton) view.findViewById(R.id.role_member_remove_button)
            this.roleMemberRemoveButton.setOnClickListener(this)
        }

        internal fun bindToData(groupRoleMember: GroupRoleMember, z: Boolean, canDelete: Boolean) {
            ChatterID.ChatterIDUser userChatterID = groupRoleMember != null ? ChatterID.getUserChatterID(this.agentUUID, groupRoleMember.getUserID()) : null
            if (!Objects.equal(userChatterID, this.boundChatterID)) {
                if (this.chatterNameRetriever != null) {
                    this.chatterNameRetriever.dispose()
                    this.chatterNameRetriever = null
                }
                this.userNameTextView.setText((CharSequence) null)
                this.boundChatterID = userChatterID
                if (userChatterID != null) {
                    this.chatterNameRetriever = ChatterNameRetriever(this.boundChatterID, this, UIThreadExecutor.getInstance())
                    this.userPicView.setChatterID(userChatterID, this.chatterNameRetriever.getResolvedName())
                } else {
                    this.userPicView.setChatterID(null, null)
                }
            }
            if (z) {
                canDelete = true
            } else if (!this.agentUUID == (this.boundChatterID.getChatterUUID())) {
                canDelete = false
            }
            this.canDelete = canDelete
            this.roleMemberRemoveButton.setVisibility(this.canDelete ? View.VISIBLE : View.GONE)
        }

        override fun onChatterNameUpdated(chatterNameRetriever: ChatterNameRetriever) {
            if (chatterNameRetriever != null) {
                this.userNameTextView.setText(chatterNameRetriever.getResolvedName())
                this.userPicView.setChatterID(chatterNameRetriever.chatterID, chatterNameRetriever.getResolvedName())
            }
        }

        override fun onClick(view: View) {
            when (view.getId()) {
                R.id.role_member_remove_button -> {
                    if (this.boundChatterID != null && this.canDelete) {
                        GroupRoleMembersFragment.this.removeMemberFromRole(this.boundChatterID)
                        }
                    }
                    }
            }
        }

        internal fun recycle() {
            if (this.chatterNameRetriever != null) {
                this.chatterNameRetriever.dispose()
                this.chatterNameRetriever = null
            }
            this.boundChatterID = null
            this.userPicView.setChatterID(null, null)
        }
    }

    private fun getMyGroupEntry(): AvatarGroupList.AvatarGroupEntry? {
        if (!(this.chatterID is ChatterID.ChatterIDGroup)) {
            return null
        }
        try {
            return this.myGroupList.get().Groups.get(((ChatterID.ChatterIDGroup) this.chatterID).getChatterUUID())
        } catch (SubscriptionData.DataNotReadyException e) {
            return null
        }
    }

    private fun getMyGroupPowers(): Long {
        AvatarGroupList.AvatarGroupEntry myGroupEntry = getMyGroupEntry()
        if (myGroupEntry != null) {
            return myGroupEntry.GroupPowers
        }
        return 0L
    }

    @JvmStatic
    fun makeSelection(chatterID: ChatterID, uuid: UUID): Bundle {
        Bundle makeSelection = ChatterFragment.makeSelection(chatterID)
        if (uuid != null) {
            makeSelection.putString(ROLE_ID_KEY, uuid.toString())
        }
        return makeSelection
    }

    open fun onGroupRoleMemberList(uuid: UUID) {
        if (this.userManager == null || !(this.chatterID is ChatterID.ChatterIDGroup) || this.RoleID == null) {
            return
        }
        this.roleMembers.subscribe(this.userManager.getChatterList().getGroupManager().getGroupRoleMemberList(), GroupManager.GroupRoleMembersQuery.create(((ChatterID.ChatterIDGroup) this.chatterID).getChatterUUID(), this.RoleID, uuid))
    }

    open fun removeMemberFromRole(chatterIDUser: ChatterID.ChatterIDUser) {
        AlertDialog.Builder(getContext()).setTitle(R.string.remove_member_from_role_confirm).setPositiveButton(R.string.yes_remove, DialogInterface.OnClickListener() {
                GroupRoleMembersFragment.this.m505xdf854965((ChatterID.ChatterIDUser) chatterIDUser, dialogInterface, i)
            }

            override fun onClick(dialogInterface: DialogInterface, i: Int) {
                    z = true
                    }
                }
            }
            if (z) {
                this.canAddMembers = true
            }
        }
        if ((myGroupPowers & 512) != 0) {
            GroupProfileReply groupProfileReply = this.groupProfile.getData()
            if ((groupProfileReply == null || this.RoleID == null) ? false : this.RoleID == (groupProfileReply.GroupData_Field.OwnerRole)) {
                z2 = false
            } else {
                z2 = true
                z3 = false
            }
        } else {
            z3 = false
            z2 = false
        }
        View view = getView()
        if (view != null) {
            view.findViewById(R.id.add_role_member_button).setVisibility(this.canAddMembers ? View.VISIBLE : View.GONE)
        }
        if (this.adapter != null) {
            this.adapter.setData(this.roleMembers.getData(), z2, z3)
        }
    }

    override protected fun onShowUser(chatterID: ChatterID) {
        this.loadableMonitor.unsubscribeAll()
        this.RoleID = UUIDPool.getUUID(getArguments().getString(ROLE_ID_KEY))
        if (this.userManager == null || !(chatterID is ChatterID.ChatterIDGroup)) {
            return
        }
        UUID chatterUUID = ((ChatterID.ChatterIDGroup) chatterID).getChatterUUID()
        Debug.Printf("GroupRoleMemberList: subscribing for group %s", chatterUUID)
        this.agentCircuit.subscribe(UserManager.agentCircuits(), chatterID.agentUUID)
        this.groupProfile.subscribe(this.userManager.getCachedGroupProfiles().getPool(), chatterUUID)
        this.myGroupList.subscribe(this.userManager.getAvatarGroupLists().getPool(), chatterID.agentUUID)
        this.groupRoleMemberList.subscribe(this.userManager.getChatterList().getGroupManager().getGroupRoleMembers(), chatterUUID)
    }
}
