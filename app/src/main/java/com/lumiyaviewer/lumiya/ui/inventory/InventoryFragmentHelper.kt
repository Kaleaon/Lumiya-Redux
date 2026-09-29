package com.lumiyaviewer.lumiya.ui.inventory

import android.app.AlertDialog
import android.app.Dialog
import android.content.Context
import android.content.DialogInterface
import android.content.SharedPreferences
import androidx.preference.PreferenceManager
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentActivity
import android.view.View
import android.widget.Button
import android.widget.EditText
import com.google.common.base.Strings
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.inventory.SLAssetType
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventory
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.ParcelData
import com.lumiyaviewer.lumiya.slproto.users.manager.CurrentLocationInfo
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.avapicker.AvatarPickerForShare
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.common.TeleportProgressDialog
import java.util.UUID

open class InventoryFragmentHelper {
    static int SORT_ORDER_ALPHA = 1
    private static String SORT_ORDER_KEY = "inventorySortOrder"
    public static int SORT_ORDER_NEWEST_FIRST = 0

    private Fragment fragment

    constructor(fragment: Fragment) {
        this.fragment = fragment
    }

    private fun ViewTexture(uuid: UUID) {
        UserManager userManager = getUserManager()
        FragmentActivity activity = this.fragment.getActivity()
        if (activity == null || userManager == null) {
            return
        }
        DetailsActivity.showEmbeddedDetails(activity, TextureViewFragment.class, TextureViewFragment.makeArguments(userManager.getUserID(), uuid))
    }

    private fun getActiveAgentCircuit(): SLAgentCircuit? {
        UserManager userManager = getUserManager()
        if (userManager != null) {
            return userManager.getActiveAgentCircuit()
        }
        return null
    }

    private fun getContext(): Context {
        return this.fragment.getContext()
    }

    @JvmStatic
    fun getSortOrder(context: Context): Int {
        if (context != null) {
            return PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext()).getInt(SORT_ORDER_KEY, 0)
        }
        return 0
    }

    private fun getUserManager(): UserManager? {
        UserManager userManager = UserManager.getUserManager(ActivityUtils.getActiveAgentID(this.fragment.getArguments()))
        if (userManager != null) {
            return userManager
        }
        FragmentActivity activity = this.fragment.getActivity()
        if (activity != null) {
            return UserManager.getUserManager(ActivityUtils.getActiveAgentID(activity.getIntent()))
        }
        return null
    }




    @JvmStatic
    internal fun setSortOrder(context: Context, i: Int) {
        SharedPreferences.Editor edit = PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext()).edit()
        edit.putInt(SORT_ORDER_KEY, i)
        edit.apply()
    }

    private fun showRezDialog(sLInventoryEntry: SLInventoryEntry) {
        AlertDialog.Builder builder = AlertDialog.Builder(getContext())
        builder.setMessage(getContext().getString(R.string.rez_confirm_title)).setCancelable(true).setPositiveButton("Yes", DialogInterface.OnClickListener() {
                InventoryFragmentHelper.this.m629x89731ef0((SLInventoryEntry) sLInventoryEntry, dialogInterface, i)
            }

            override fun onClick(dialogInterface: DialogInterface, i: Int) {