package com.lumiyaviewer.lumiya.ui.chat

import android.os.Bundle
import androidx.fragment.app.FragmentActivity
import android.view.LayoutInflater
import android.view.View
import android.widget.ArrayAdapter
import android.widget.FrameLayout
import android.widget.Spinner
import android.widget.SpinnerAdapter
import android.widget.Toast
import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.messages.GroupProfileReply
import com.lumiyaviewer.lumiya.slproto.messages.GroupRoleDataReply
import com.lumiyaviewer.lumiya.slproto.messages.GroupTitlesReply
import com.lumiyaviewer.lumiya.slproto.modules.groups.AvatarGroupList
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.avapicker.AvatarPickerFragment
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.util.HashSet
import java.util.UUID

open class AvatarPickerForInvite : AvatarPickerFragment() {
    private static String GROUP_ID_KEY = "groupID"
    private static String GROUP_LIST_KEY = "avatarGroupList"
    private static String GROUP_PROFILE_KEY = "groupProfile"
    private static String GROUP_ROLES = "groupRoles"
    private static String GROUP_TITLES_KEY = "groupTitles"

    private class RoleEntry {
        UUID roleID
        String roleTitle

        private constructor(uuid: UUID, roleTitle: String) {
            this.roleID = uuid
            this.roleTitle = roleTitle
        }

            this(uuid, str)
        }

        open fun toString(): String {
            return this.roleTitle
        }
    }

    private fun getGroupID(): UUID {
        return UUID.fromString(getArguments().getString(GROUP_ID_KEY))
    }

    @JvmStatic
    fun makeArguments(uuid: UUID, uuid2: UUID, groupProfileReply: GroupProfileReply, avatarGroupList: AvatarGroupList, groupTitlesReply: GroupTitlesReply, groupRoleDataReply: GroupRoleDataReply): Bundle {
        Bundle makeFragmentArguments = ActivityUtils.makeFragmentArguments(uuid, null)
        makeFragmentArguments.putString(GROUP_ID_KEY, uuid2.toString())
        makeFragmentArguments.putParcelable(GROUP_PROFILE_KEY, groupProfileReply)
        makeFragmentArguments.putSerializable(GROUP_LIST_KEY, avatarGroupList)
        makeFragmentArguments.putParcelable(GROUP_TITLES_KEY, groupTitlesReply)
        makeFragmentArguments.putParcelable(GROUP_ROLES, groupRoleDataReply)
        return makeFragmentArguments
    }

    override protected fun createExtraView(layoutInflater: LayoutInflater, frameLayout: FrameLayout) {
        layoutInflater.inflate(R.layout.invite_role_picker_extra, frameLayout)
    }

    override fun getTitle(): String {
        fun getString(R.string.invite_selector_title): return
    }

    override protected fun onAvatarSelected(chatterID: ChatterID, str: String) {
        UserManager userManager
        SLAgentCircuit activeAgentCircuit
        View view = getView()
        if (view != null) {
            Object selectedItem = ((Spinner) view.findViewById(R.id.role_picker_spinner)).getSelectedItem()
            if (!(selectedItem is RoleEntry) || (userManager = chatterID.getUserManager()) == null || !(chatterID is ChatterID.ChatterIDUser) || (activeAgentCircuit = userManager.getActiveAgentCircuit()) == null) {
                return
            }
            activeAgentCircuit.getModules().groupManager.SendGroupInvite(((ChatterID.ChatterIDUser) chatterID).getChatterUUID(), getGroupID(), ((RoleEntry) selectedItem).roleID)
            Toast.makeText(getContext(), R.string.group_invitation_sent, Toast.LENGTH_LONG).show()
            FragmentActivity activity = getActivity()
            if (activity instanceof DetailsActivity) {
                ((DetailsActivity) activity).closeDetailsFragment(this)
            }
        }
    }

    override fun onStart() {
        boolean z
        boolean z2
        boolean z3
        AvatarGroupList.AvatarGroupEntry avatarGroupEntry
        super.onStart()
        GroupProfileReply groupProfileReply = (GroupProfileReply) getArguments().getParcelable(GROUP_PROFILE_KEY)
        GroupTitlesReply groupTitlesReply = (GroupTitlesReply) getArguments().getParcelable(GROUP_TITLES_KEY)
        AvatarGroupList avatarGroupList = (AvatarGroupList) getArguments().getSerializable(GROUP_LIST_KEY)
        GroupRoleDataReply groupRoleDataReply = (GroupRoleDataReply) getArguments().getParcelable(GROUP_ROLES)
        boolean z4 = false
        HashSet hashSet = HashSet()
        if (groupTitlesReply == null || groupProfileReply == null) {
            z = false
        } else {
            internal fun for(groupTitlesReply.GroupData_Fields: GroupTitlesReply.GroupData groupData :):  {
                hashSet.add(groupData.RoleID)
                z4 = groupData.RoleID == (groupProfileReply.GroupData_Field.OwnerRole) ? true : z4
            }
            z = z4
        }
        if (avatarGroupList == null || (avatarGroupEntry = avatarGroupList.Groups.get(getGroupID())) == null) {
            z2 = false
            z3 = false
        } else {
            boolean z5 = (avatarGroupEntry.GroupPowers & 256) != 0
            if ((avatarGroupEntry.GroupPowers & 128) != 0) {
                z3 = z5
                z2 = true
            } else {
                z3 = z5
                z2 = false
            }
        }
        ImmutableList.Builder builder = new ImmutableList.Builder()
        if (groupRoleDataReply != null && groupProfileReply != null) {
            internal fun for(groupRoleDataReply.RoleData_Fields: GroupRoleDataReply.RoleData roleData :):  {
                if ((z || (z3 && (roleData.RoleID == (groupProfileReply.GroupData_Field.OwnerRole) ^ true)) || roleData.RoleID == (UUIDPool.ZeroUUID)) ? true : z2 ? hashSet.contains(roleData.RoleID) : false) {
                    builder.add(RoleEntry(roleData.RoleID, SLMessage.stringFromVariableOEM(roleData.Title), null))
                }
            }
        }
        ImmutableList build = builder.build()
        View view = getView()
        if (view != null) {
            ((Spinner) view.findViewById(R.id.role_picker_spinner)).setAdapter((SpinnerAdapter) ArrayAdapter(getContext(), android.R.layout.simple_spinner_dropdown_item, build))
        }
    }
}
