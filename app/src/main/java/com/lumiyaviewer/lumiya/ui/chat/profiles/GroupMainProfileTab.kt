package com.lumiyaviewer.lumiya.ui.chat.profiles

import android.content.ClipData
import android.content.DialogInterface
import android.os.Bundle
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout
import androidx.appcompat.app.AlertDialog
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.CheckBox
import android.widget.EditText
import android.widget.TextView
import android.widget.Toast
import com.google.common.base.Strings
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.messages.AgentDataUpdate
import com.lumiyaviewer.lumiya.slproto.messages.GroupProfileReply
import com.lumiyaviewer.lumiya.slproto.messages.GroupRoleDataReply
import com.lumiyaviewer.lumiya.slproto.messages.GroupTitlesReply
import com.lumiyaviewer.lumiya.slproto.modules.groups.AvatarGroupList
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.chat.AvatarPickerForInvite
import com.lumiyaviewer.lumiya.ui.chat.ChatterPicView
import com.lumiyaviewer.lumiya.ui.common.ChatterReloadableFragment
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.common.ImageAssetView
import com.lumiyaviewer.lumiya.ui.common.LoadingLayout
import com.lumiyaviewer.lumiya.ui.common.loadmon.LoadableMonitor
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.util.Iterator
import java.util.UUID
import java.util.concurrent.atomic.AtomicInteger

open class GroupMainProfileTab : ChatterReloadableFragment(), LoadableMonitor.OnLoadableDataChangedListener {
    private SubscriptionData<UUID, GroupProfileReply> groupProfile = SubscriptionData<>(UIThreadExecutor.getInstance())
    private SubscriptionData<UUID, AvatarGroupList> myGroupList = SubscriptionData<>(UIThreadExecutor.getInstance())
    private SubscriptionData<UUID, GroupTitlesReply> groupTitles = SubscriptionData<>(UIThreadExecutor.getInstance())
    private SubscriptionData<UUID, AgentDataUpdate> agentDataUpdate = SubscriptionData<>(UIThreadExecutor.getInstance())
    private SubscriptionData<UUID, GroupRoleDataReply> groupRoles = SubscriptionData<>(UIThreadExecutor.getInstance())
    private SubscriptionData<UUID, SLAgentCircuit> agentCircuit = SubscriptionData<>(UIThreadExecutor.getInstance(), Subscription.OnData() {
            GroupMainProfileTab.this.onAgentCircuit((SLAgentCircuit) obj)
        }

        override fun onData(obj: Any) {
                this.agentCircuit.get().getModules().groupManager.ActivateGroup(UUIDPool.ZeroUUID)
            }
        } catch (SubscriptionData.DataNotReadyException e) {
            Debug.Warning(e)
        }
    }

    open fun onAgentCircuit(agentCircuit: SLAgentCircuit) {
        View view = getView()
        if (view != null) {
            internal fun for(int[]{R.id.show_in_profile_checkbox: int i : new, R.id.active_group_checkbox, R.id.group_profile_contribution_button, R.id.group_join_button, R.id.group_leave_button, R.id.group_invite_button, R.id.group_change_role_button}):  {
                view.findViewById(i).setEnabled(this.agentCircuit.hasData())
            }
        }
    }

    open fun onChangeRoleClicked(view: View) {
        int i = 0
        try {
            this.agentCircuit.assertHasData()
            UUID uuid = this.groupProfile.get().GroupData_Field.GroupID
            CharSequence[] charSequenceArr = arrayOfNulls<CharSequence>(this.groupTitles.get().GroupData_Fields.size()]
            int i2 = 0
            while (i < this.groupTitles.get().GroupData_Fields.size()) {
                charSequenceArr[i] = SLMessage.stringFromVariableOEM(this.groupTitles.get().GroupData_Fields.get(i).Title)
                int i3 = this.groupTitles.get().GroupData_Fields.get(i).Selected ? i : i2
                i++
                i2 = i3
            }
            AtomicInteger atomicInteger = AtomicInteger(i2)
            AlertDialog.Builder builder = AlertDialog.Builder(getActivity())
            builder.setTitle(R.string.select_group_role_title).setSingleChoiceItems(charSequenceArr, i2, DialogInterface.OnClickListener() {
                    ((AtomicInteger) atomicInteger).set(i4)
                }

                override fun onClick(dialogInterface: DialogInterface, i4: Int) {

                    override fun onClick(dialogInterface: DialogInterface, i: Int) {
                        GroupTitlesReply.GroupData groupData = (GroupTitlesReply.GroupData) it.next()
                        if (groupData.Selected) {
                            str = SLMessage.stringFromVariableOEM(groupData.Title)
                            }
                        }
                    }
                }
                ((TextView) view.findViewById(R.id.group_membership_role)).setText(str)
                view.findViewById(R.id.membership_settings_card_view).setVisibility(View.VISIBLE)
                ((TextView) view.findViewById(R.id.land_contribution_text)).setText(avatarGroupEntry.Contribution != 0 ? getString(R.string.format_land_contribution, Integer.valueOf(avatarGroupEntry.Contribution)) : getString(R.string.no_land_contributed))
                ((CheckBox) view.findViewById(R.id.show_in_profile_checkbox)).setChecked(avatarGroupEntry.ListInProfile)
                ((CheckBox) view.findViewById(R.id.active_group_checkbox)).setChecked(this.agentDataUpdate.get().AgentData_Field.ActiveGroupID == (this.groupProfile.get().GroupData_Field.GroupID))
            }
        } catch (SubscriptionData.DataNotReadyException e) {
            Debug.Warning(e)
        }
    }

    override protected fun onShowUser(chatterID: ChatterID) {
        View view = getView()
        this.loadableMonitor.unsubscribeAll()
        this.agentCircuit.unsubscribe()
        if (this.userManager == null || !(chatterID is ChatterID.ChatterIDGroup)) {
            if (view != null) {
                ((TextView) view.findViewById(R.id.text_profile_group_key)).setText("")
                return
            }
            return
        }
        UUID chatterUUID = ((ChatterID.ChatterIDGroup) chatterID).getChatterUUID()
        if (view != null) {
            ((TextView) view.findViewById(R.id.text_profile_group_key)).setText(chatterUUID.toString())
        }
        this.agentCircuit.subscribe(UserManager.agentCircuits(), chatterID.agentUUID)
        this.groupProfile.subscribe(this.userManager.getCachedGroupProfiles().getPool(), chatterUUID)
        this.myGroupList.subscribe(this.userManager.getAvatarGroupLists().getPool(), chatterID.agentUUID)
        this.agentDataUpdate.subscribe(this.userManager.getAgentDataUpdates().getPool(), chatterID.agentUUID)
        this.groupRoles.subscribe(this.userManager.getGroupRoles().getPool(), chatterUUID)
    }
}
