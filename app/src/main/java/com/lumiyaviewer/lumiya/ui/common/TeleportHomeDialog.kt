package com.lumiyaviewer.lumiya.ui.common

import android.app.Activity
import androidx.appcompat.app.AlertDialog
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.utils.UUIDPool

object TeleportHomeDialog {
    @JvmStatic
    fun show(activity: Activity) {
        val userManager = ActivityUtils.getUserManager(activity.intent) ?: return
        val activeAgentCircuit = userManager.activeAgentCircuit ?: return
        if (!activeAgentCircuit.modules.rlvController.canTeleportToLocation()) {
            return
        }
        AlertDialog.Builder(activity)
            .setMessage(R.string.teleport_home_confirm_title)
            .setPositiveButton("Yes") { dialog, _ ->
                TeleportProgressDialog(activity, userManager, R.string.teleporting_progress_message).show()
                activeAgentCircuit.TeleportToLandmarkAsset(UUIDPool.ZeroUUID)
                dialog.dismiss()
            }
            .setNegativeButton("No") { dialog, _ -> dialog.cancel() }
            .setCancelable(true)
            .create()
            .show()
    }
}
