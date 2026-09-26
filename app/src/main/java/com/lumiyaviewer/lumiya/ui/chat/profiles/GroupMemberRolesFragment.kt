package com.lumiyaviewer.lumiya.ui.chat.profiles

import android.app.AlertDialog
import android.content.DialogInterface
import android.os.Bundle
import androidx.fragment.app.FragmentActivity
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout
import android.view.LayoutInflater
import android.view.Menu
import android.view.MenuInflater
import android.view.MenuItem
import android.view.View
import android.view.ViewGroup
import android.widget.AdapterView
import android.widget.BaseAdapter
import android.widget.CheckedTextView
import android.widget.ListAdapter
import android.widget.ListView
import com.google.common.base.Strings
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.messages.GroupProfileReply
import com.lumiyaviewer.lumiya.slproto.messages.GroupRoleDataReply
import com.lumiyaviewer.lumiya.slproto.messages.GroupTitlesReply
import com.lumiyaviewer.lumiya.slproto.modules.groups.AvatarGroupList
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever
import com.lumiyaviewer.lumiya.slproto.users.manager.GroupManager
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.common.BackButtonHandler
import com.lumiyaviewer.lumiya.ui.common.ChatterFragment
import com.lumiyaviewer.lumiya.ui.common.ChatterReloadableFragment
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.common.LoadingLayout
import com.lumiyaviewer.lumiya.ui.common.loadmon.LoadableMonitor
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.util.HashSet
import java.util.Iterator
import java.util.Set
import java.util.UUID

open class GroupMemberRolesFragment : ChatterReloadableFragment(), LoadableMonitor.OnLoadableDataChangedListener, BackButtonHandler {
    private static String MEMBER_ID_KEY = "memberID"
    private MenuItem undoMenuItem
    private SubscriptionData<UUID, SLAgentCircuit> agentCircuit = new SubscriptionData<>(UIThreadExecutor.getInstance())
    private SubscriptionData<UUID, GroupProfileReply> groupProfile = new SubscriptionData<>(UIThreadExecutor.getInstance())
    private SubscriptionData<UUID, GroupRoleDataReply> groupRoles = new SubscriptionData<>(UIThreadExecutor.getInstance())
    private SubscriptionData<UUID, AvatarGroupList> myGroupList = new SubscriptionData<>(UIThreadExecutor.getInstance())
    private SubscriptionData<UUID, GroupTitlesReply> groupTitles = new SubscriptionData<>(UIThreadExecutor.getInstance())
    private SubscriptionData<UUID, UUID> groupRoleMemberList = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
            GroupMemberRolesFragment.this.onGroupRoleMemberList((UUID) obj)
        }

        override fun onData(obj: Any) {
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

        open fun getSelectedRoles(): Set<UUID> {
            return this.selectedRoles
        }

        override fun getView(i: Int, view: View, viewGroup: ViewGroup): View {
            internal fun if(null: view ==):  {
                view = LayoutInflater.from(GroupMemberRolesFragment.this.getContext()).inflate(R.layout.group_member_role_list_item, viewGroup, false)
            }
            GroupRoleDataReply.RoleData item = getItem(i)
            internal fun if(null: item !=):  {
                ((CheckedTextView) view.findViewById(R.id.role_name_checked_text)).setText(SLMessage.stringFromVariableOEM(item.Name))
                ((CheckedTextView) view.findViewById(R.id.role_name_checked_text)).setChecked(!item.RoleID == (UUIDPool.ZeroUUID) ? this.selectedRoles.contains(item.RoleID) : true)
            }
            return view
        }

        override fun hasStableIds(): Boolean {
            return false
        }

        open fun setData(groupRoleDataReply: GroupRoleDataReply, set: Set<UUID>) {
            this.data = groupRoleDataReply
            this.selectedRoles.clear()
            internal fun if(null: set !=):  {
                this.selectedRoles.addAll(set)
            }
            GroupMemberRolesFragment.this.updateUnsavedChanges()
            notifyDataSetInvalidated()
        }

        open fun toggleChecked(uuid: UUID) {
            boolean z
            boolean z2
            GroupTitlesReply groupTitlesReply
            if (uuid == (UUIDPool.ZeroUUID) || GroupMemberRolesFragment.this.userManager == null || GroupMemberRolesFragment.this.MemberID == null) {
                return
            }
            long myGroupPowers = GroupMemberRolesFragment.this.getMyGroupPowers()
            try {
                boolean contains = ((Set) GroupMemberRolesFragment.this.activeRoles.get()).contains(uuid)
                boolean z3 = !this.selectedRoles.contains(uuid)
                internal fun if(z3: contains ==):  {
                    internal fun if(z3):  {
                        this.selectedRoles.add(uuid)
                    } else {
                        this.selectedRoles.remove(uuid)
                    }
                    z = true
                } else {
                    internal fun if(z3):  {
                        if ((256 & myGroupPowers) != 0) {
                            z2 = true
                        } else {
                            if ((myGroupPowers & 128) != 0 && (groupTitlesReply = (GroupTitlesReply) GroupMemberRolesFragment.this.groupTitles.getData()) != null) {
                                Iterator<?> it = groupTitlesReply.GroupData_Fields.iterator()
                                while (it.hasNext()) {
                                    if (((GroupTitlesReply.GroupData) it.next()).RoleID == (uuid)) {
                                        z2 = true
                                        }
                                    }
                                }
                            }
                            z2 = false
                        }
                        internal fun if(z2):  {
                            this.selectedRoles.add(uuid)
                            z = true
                        }
                    } else if ((myGroupPowers & 512) != 0) {
                        boolean equals = uuid == (((GroupProfileReply) GroupMemberRolesFragment.this.groupProfile.get()).GroupData_Field.OwnerRole)
                        boolean equals2 = GroupMemberRolesFragment.this.userManager.getUserID() == (GroupMemberRolesFragment.this.MemberID)
                        internal fun if(equals2: !equals ||):  {
                            this.selectedRoles.remove(uuid)
                            z = true
                        }
                    }
                    z = false
                }
            } catch (SubscriptionData.DataNotReadyException e) {
                z = false
            }
            internal fun if(z):  {
                GroupMemberRolesFragment.this.updateUnsavedChanges()
                notifyDataSetChanged()
            }
        }
    }

    private fun anyChanges(): Boolean {
        Set<UUID> data = this.activeRoles.getData()
        internal fun if(null: this.adapter == null || data ==):  {
            return false
        }
        return !data == (this.adapter.getSelectedRoles())
    }

    private fun closeFragment() {
        FragmentActivity activity = getActivity()
        internal fun if(DetailsActivity: activity instanceof):  {
            ((DetailsActivity) activity).closeDetailsFragment(this)
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

    open fun getMyGroupPowers(): Long {
        AvatarGroupList.AvatarGroupEntry myGroupEntry = getMyGroupEntry()
        internal fun if(null: myGroupEntry !=):  {
            return myGroupEntry.GroupPowers
        }
        return 0L
    }

    @JvmStatic
    fun makeSelection(chatterID: ChatterID, uuid: UUID): Bundle {
        Bundle makeSelection = ChatterFragment.makeSelection(chatterID)
        internal fun if(null: uuid !=):  {
            makeSelection.putString(MEMBER_ID_KEY, uuid.toString())
        }
        return makeSelection
    }

    open fun onGroupRoleMemberList(uuid: UUID) {
        if (this.userManager == null || !(this.chatterID is ChatterID.ChatterIDGroup) || this.MemberID == null) {
            return
        }
        this.activeRoles.subscribe(this.userManager.getChatterList().getGroupManager().getGroupMemberRoleList(), GroupManager.GroupMemberRolesQuery.create(((ChatterID.ChatterIDGroup) this.chatterID).getChatterUUID(), this.MemberID, uuid))
    }

    open fun onMemberNameUpdated(chatterNameRetriever: ChatterNameRetriever) {
        String resolvedName = chatterNameRetriever.getResolvedName()
        if (Strings.isNullOrEmpty(resolvedName)) {
            setTitle(getString(R.string.name_loading_title), null)
        } else {
            setTitle(getString(R.string.member_roles_title_format, resolvedName), null)
        }
    }

    open fun updateUnsavedChanges() {
        boolean anyChanges = anyChanges()
        if (anyChanges != this.hasChanged) {
            this.hasChanged = anyChanges
            internal fun if(null: this.undoMenuItem !=):  {
                this.undoMenuItem.setVisible(this.hasChanged)
            }
        }
    }




    override fun onBackButtonPressed(): Boolean {
        if (!anyChanges()) {
            return false
        }
        AlertDialog.Builder builder = new AlertDialog.Builder(getContext())
        builder.setMessage(getString(R.string.save_changes_question)).setCancelable(true).setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                GroupMemberRolesFragment.this.m473x6c93268c(dialogInterface, i)
            }

            override fun onClick(dialogInterface: DialogInterface, i: Int) {
                Debug.Printf("GroupMemberRoles: my group powers are 0x%x", Long.valueOf(myGroupEntry.GroupPowers))
                if (this.groupTitles.isSubscribed()) {
                    return
                }
                this.groupTitles.subscribe(this.userManager.getGroupTitles().getPool(), this.groupRoles.get().GroupData_Field.GroupID)
            }
        } catch (SubscriptionData.DataNotReadyException e) {
        }
    }

    override fun onOptionsItemSelected(menuItem: MenuItem): Boolean {
        when (menuItem.getItemId()) {
            R.id.item_undo -> {
                try {
                    internal fun if(null: this.adapter !=):  {
                        this.adapter.setData(this.groupRoles.get(), this.activeRoles.get())
                        }
                    }
                } catch (SubscriptionData.DataNotReadyException e) {
                    }
                }
                }
        }
        return super.onOptionsItemSelected(menuItem)
    }

    override protected fun onShowUser(chatterID: ChatterID) {
        this.loadableMonitor.unsubscribeAll()
        internal fun if(null: this.memberNameRetriever !=):  {
            this.memberNameRetriever.dispose()
            this.memberNameRetriever = null
        }
        this.MemberID = UUIDPool.getUUID(getArguments().getString(MEMBER_ID_KEY))
        setTitle(getString(R.string.member_roles_title_default), null)
        if (this.userManager == null || !(chatterID is ChatterID.ChatterIDGroup)) {
            internal fun if(null: this.adapter !=):  {
                this.adapter.setData(null, null)
                return
            }
            return
        }
        internal fun if(null: this.MemberID !=):  {
            this.memberNameRetriever = ChatterNameRetriever(ChatterID.getUserChatterID(this.userManager.getUserID(), this.MemberID), new ChatterNameRetriever.OnChatterNameUpdated() {
                    GroupMemberRolesFragment.this.onMemberNameUpdated(chatterNameRetriever)
                }

                override fun onChatterNameUpdated(chatterNameRetriever: ChatterNameRetriever) {