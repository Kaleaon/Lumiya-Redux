package com.lumiyaviewer.lumiya.ui.chat.profiles

import android.app.AlertDialog
import android.content.DialogInterface
import android.os.Bundle
import androidx.fragment.app.FragmentActivity
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout
import android.text.Editable
import android.text.TextWatcher
import android.view.LayoutInflater
import android.view.Menu
import android.view.MenuInflater
import android.view.MenuItem
import android.view.View
import android.view.ViewGroup
import android.widget.Checkable
import android.widget.CheckedTextView
import android.widget.EditText
import android.widget.TextView
import com.google.common.base.Objects
import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.messages.GroupProfileReply
import com.lumiyaviewer.lumiya.slproto.messages.GroupRoleDataReply
import com.lumiyaviewer.lumiya.slproto.modules.groups.AvatarGroupList
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.SLGroupInfo
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.common.BackButtonHandler
import com.lumiyaviewer.lumiya.ui.common.ChatterFragment
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.common.LoadingLayout
import com.lumiyaviewer.lumiya.ui.common.loadmon.LoadableMonitor
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.util.UUID

open class GroupRoleDetailsFragment : ChatterFragment(), LoadableMonitor.OnLoadableDataChangedListener, BackButtonHandler {
    private static String ROLE_ID_KEY = "role_id"
    private static ImmutableList<RolePermission> rolePermissions

    private UUID RoleID
    private MenuItem deleteMenuItem
    private MenuItem undoMenuItem
    private SubscriptionData<UUID, GroupRoleDataReply> groupRoles = SubscriptionData<>(UIThreadExecutor.getInstance())
    private SubscriptionData<UUID, GroupProfileReply> groupProfile = SubscriptionData<>(UIThreadExecutor.getInstance())
    private SubscriptionData<UUID, SLAgentCircuit> agentCircuit = SubscriptionData<>(UIThreadExecutor.getInstance())
    private SubscriptionData<UUID, AvatarGroupList> myGroupList = SubscriptionData<>(UIThreadExecutor.getInstance())
    private LoadableMonitor loadableMonitor = LoadableMonitor(this.groupRoles, this.groupProfile, this.myGroupList).withOptionalLoadables(this.agentCircuit).withDataChangedListener(this)
    private boolean hasChanged = false
    private TextWatcher textChangedListener = TextWatcher() {
        override fun afterTextChanged(editable: Editable) {
            GroupRoleDetailsFragment.this.updateUnsavedChanges()
        }

        override fun beforeTextChanged(charSequence: CharSequence, i: Int, i2: Int, i3: Int) {
        }

        override fun onTextChanged(charSequence: CharSequence, i: Int, i2: Int, i3: Int) {
        }
    }
    private View.OnClickListener permCheckboxClickListener = View.OnClickListener() {
            GroupRoleDetailsFragment.this.m496x4277c5d5(view)
        }

        override fun onClick(view: View) {
            String stringFromVariableOEM = SLMessage.stringFromVariableOEM(selectedRoleData.Name)
            String stringFromVariableOEM2 = SLMessage.stringFromVariableOEM(selectedRoleData.Title)
            String stringFromVariableOEM3 = SLMessage.stringFromVariableOEM(selectedRoleData.Description)
            str = stringFromVariableOEM
            str2 = stringFromVariableOEM2
            j = selectedRoleData.Powers
            str3 = stringFromVariableOEM3
        }
        return (Objects.equal(str, ((TextView) view.findViewById(R.id.role_name_edit)).getText().toString()) && Objects.equal(str2, ((TextView) view.findViewById(R.id.role_title_edit)).getText().toString()) && Objects.equal(str3, ((TextView) view.findViewById(R.id.role_description_edit)).getText().toString()) && j == getSelectedPowers(j, (ViewGroup) view.findViewById(R.id.role_permission_list_layout))) ? false : true
    }

    private fun askForSavingChanges(runnable: Runnable) {
        View view = getView()
        if (view == null) {
            runnable.run()
            return
        }
        GroupRoleDataReply.RoleData selectedRoleData = getSelectedRoleData()
        long defaultPowers = selectedRoleData == null ? getDefaultPowers() : selectedRoleData.Powers
        String charSequence = ((TextView) view.findViewById(R.id.role_name_edit)).getText().toString()
        String charSequence2 = ((TextView) view.findViewById(R.id.role_title_edit)).getText().toString()
        String charSequence3 = ((TextView) view.findViewById(R.id.role_description_edit)).getText().toString()
        long selectedPowers = getSelectedPowers(defaultPowers, (ViewGroup) view.findViewById(R.id.role_permission_list_layout))
        AlertDialog.Builder builder = AlertDialog.Builder(getContext())
        builder.setMessage(getString(R.string.save_changes_question)).setCancelable(true).setPositiveButton("Yes", DialogInterface.OnClickListener() {
                GroupRoleDetailsFragment.this.m499x4287a0c8((String) charSequence, (String) charSequence2, (String) charSequence3, selectedPowers, (Runnable) runnable, dialogInterface, i)
            }

            override fun onClick(dialogInterface: DialogInterface, i: Int) {

                override fun onClick(dialogInterface: DialogInterface, i: Int) {