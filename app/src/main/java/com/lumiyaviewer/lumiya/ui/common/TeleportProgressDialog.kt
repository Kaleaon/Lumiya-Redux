package com.lumiyaviewer.lumiya.ui.common

import android.app.AlertDialog
import android.app.ProgressDialog
import android.content.Context
import android.content.DialogInterface
import android.content.Intent
import android.os.Handler
import android.os.Looper
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.eventbus.EventHandler
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.events.SLTeleportResultEvent
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.chat.ChatNewActivity
import java.util.UUID

open class TeleportProgressDialog(context: Context, private val userManager: UserManager?, i: Int) :
    ProgressDialog(context), DialogInterface.OnCancelListener {

    private val mHandler: Handler = Handler(Looper.getMainLooper())

    init {
        setMessage(context.getString(i))
        setCancelable(true)
        isIndeterminate = true
        setOnCancelListener(this)
    }

    companion object {
        @JvmStatic
        fun TeleportToLandmark(context: Context, userManager: UserManager?, uuid: UUID, z: Boolean) {
            val activeAgentCircuit = userManager?.getActiveAgentCircuit()
            if (userManager == null || activeAgentCircuit == null || !activeAgentCircuit.getModules().rlvController.canTeleportToLandmark()) {
                return
            }
            val runnable = Runnable {
                if (activeAgentCircuit.getModules().rlvController.canTeleportToLandmark()) {
                    activeAgentCircuit.TeleportToLandmarkAsset(uuid)
                    TeleportProgressDialog(context, userManager, R.string.teleporting_progress_message).show()
                }
            }
            if (!z) {
                runnable.run()
                return
            }
            val builder = AlertDialog.Builder(context)
            builder.setMessage(context.getString(R.string.teleport_confirm_title)).setCancelable(true)
                .setPositiveButton("Yes") { dialogInterface, _ ->
                    dialogInterface.dismiss()
                    runnable.run()
                }
                .setNegativeButton("No") { dialogInterface, _ ->
                    dialogInterface.cancel()
                }
            builder.create().show()
        }
    }

    @EventHandler
    fun handleTeleportResult(teleportResultEvent: SLTeleportResultEvent) {
        val isShowing = isShowing
        Debug.Log("TeleportResult: success = " + teleportResultEvent.success)
        try {
            dismiss()
        } catch (e: Exception) {
            Debug.Warning(e)
        }
        if (teleportResultEvent.success) {
            val intent = Intent(context, ChatNewActivity::class.java)
            if (this.userManager != null) {
                ActivityUtils.setActiveAgentID(intent, this.userManager.getUserID())
            }
            intent.addFlags(335577088)
            context.startActivity(intent)
            return
        }
        if (isShowing) {
            val builder = AlertDialog.Builder(context)
            builder.setTitle(context.getString(R.string.teleport_failed_dialog_title))
            builder.setMessage(teleportResultEvent.message)
            builder.setCancelable(true)
            builder.create().show()
        }
    }

    override fun onCancel(dialogInterface: DialogInterface) {
        if (this.userManager != null) {
            try {
                val activeAgentCircuit = this.userManager.getActiveAgentCircuit()
                if (activeAgentCircuit != null) {
                    activeAgentCircuit.getModules().worldMap.CancelPendingTeleports()
                }
            } catch (e: Exception) {
                Debug.Warning(e)
            }
        }
    }

    override fun onStart() {
        super.onStart()
        if (this.userManager != null) {
            this.userManager.getEventBus().subscribe(this, null, this.mHandler)
        }
    }

    override fun onStop() {
        if (this.userManager != null) {
            this.userManager.getEventBus().unsubscribe(this)
        }
        super.onStop()
    }
}
