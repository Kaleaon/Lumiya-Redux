package com.lumiyaviewer.lumiya.ui.objects

import android.app.ProgressDialog
import android.content.DialogInterface
import android.os.Bundle
import androidx.appcompat.app.AlertDialog
import android.view.LayoutInflater
import android.view.Menu
import android.view.MenuInflater
import android.view.MenuItem
import android.view.View
import android.view.ViewGroup
import android.widget.AdapterView
import android.widget.ListAdapter
import android.widget.ListView
import android.widget.TextView
import android.widget.Toast
import com.google.common.base.Function
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.inventory.SLAssetType
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventory
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry
import com.lumiyaviewer.lumiya.slproto.inventory.SLTaskInventory
import com.lumiyaviewer.lumiya.slproto.modules.SLModules
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectProfileData
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.FragmentWithTitle
import com.lumiyaviewer.lumiya.ui.inventory.InventoryActivity
import com.lumiyaviewer.lumiya.ui.inventory.NotecardEditActivity
import com.lumiyaviewer.lumiya.ui.objects.TaskInventoryFragment
import java.util.HashSet
import java.util.Iterator
import java.util.UUID
import java.util.concurrent.Executor

open class TaskInventoryFragment : FragmentWithTitle() {

    private static String OBJECT_LOCAL_ID_KEY = "objectLocalId"
    private static String OBJECT_UUID_KEY = "objectUUID"
    private Subscription<Integer, SLObjectProfileData> objectProfileSubscription

    private SLTaskInventory taskInventory
    private Subscription<Integer, SLTaskInventory> taskInventorySubscription

    private SLObjectProfileData objectProfileData = null
    private Subscription.OnData<SLTaskInventory> onTaskInventoryReceived = new Subscription.OnData<SLTaskInventory>() {
        override fun onData(taskInventory: SLTaskInventory) {
            TaskInventoryFragment.this.taskInventory = taskInventory
            View view = TaskInventoryFragment.this.getView()
            if (view != null) {
                ListAdapter adapter = ((ListView) view.findViewById(R.id.taskInventoryListView)).getAdapter()
                if (adapter instanceof TaskInventoryListAdapter) {
                    ((TaskInventoryListAdapter) adapter).setData(taskInventory)
                }
                ((TextView) view.findViewById(R.id.taskInventoryEmptyText)).setText(R.string.object_contents_empty)
                view.findViewById(R.id.taskInventoryLoading).setVisibility(View.GONE)
            }
        }
    }
    private Subscription.OnData<SLObjectProfileData> onObjectProfileData = new Subscription.OnData() {
            TaskInventoryFragment.this.m699x1db91107((SLObjectProfileData) obj)
        }

        override fun onData(obj: Any) {
            return null
        }

    }

    private fun canModifyObject(): Boolean {
        UserManager userManager = getUserManager()
        if (this.objectProfileData == null || userManager == null || !userManager.getUserID() == (this.objectProfileData.ownerUUID())) {
            return false
        }
        return this.objectProfileData.isModifiable()
    }

    private fun canModifyObjectContents(inventoryEntry: SLInventoryEntry): Boolean {
        UserManager userManager = getUserManager()
        if (userManager != null) {
            return userManager.getUserID() == (inventoryEntry.ownerUUID) ? (inventoryEntry.ownerMask & 16384) != 0 : (inventoryEntry.everyoneMask & 16384) != 0
        }
        return false
    }

    private fun copyAllToInventory(z: Boolean) {
        SLAgentCircuit activeAgentCircuit
        SLModules modules
        boolean z2
        boolean z3 = false
        int objectLocalID = getObjectLocalID()
        UserManager userManager = getUserManager()
        if (this.taskInventory == null || this.objectProfileData == null || userManager == null || (activeAgentCircuit = userManager.getActiveAgentCircuit()) == null || (modules = activeAgentCircuit.getModules()) == null) {
            return
        }
        SLInventory inventory = modules.inventory
        if (this.taskInventory.entries.size() == 0) {
            return
        }
        if (!userManager.getUserID() == (this.objectProfileData.ownerUUID())) {
            Toast.makeText(getActivity(), R.string.object_contents_not_owned, Toast.LENGTH_LONG).show()
            return
        }
        if (!z) {
            Iterator<SLInventoryEntry> it = this.taskInventory.entries.iterator()
            while (true) {
                z2 = z3
                if (!it.hasNext()) {
                    }
                } else {
                    z3 = (it.next().ownerMask & 32768) == 0 ? true : z2
                }
            }
            if (z2) {
                AlertDialog.Builder builder = new AlertDialog.Builder(getActivity())
                builder.setMessage(R.string.object_contents_has_no_copy).setPositiveButton(R.string.object_contents_yes_move, new DialogInterface.OnClickListener() {
                        TaskInventoryFragment.this.m697x992e5209(dialogInterface, i)
                    }

                    override fun onClick(dialogInterface: DialogInterface, i: Int) {