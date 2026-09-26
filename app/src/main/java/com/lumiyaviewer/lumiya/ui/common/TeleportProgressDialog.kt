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

open class TeleportProgressDialog : ProgressDialog(), DialogInterface.OnCancelListener {
    private Handler mHandler
    private UserManager userManager

    constructor(context: Context, userManager: UserManager, i: Int) {
        super(context)
        this.mHandler = Handler(Looper.getMainLooper())
        this.userManager = userManager
        setMessage(context.getString(i))
        setCancelable(true)
        setIndeterminate(true)
        setOnCancelListener(this)
    }

    @JvmStatic
    fun TeleportToLandmark(context: Context, userManager: UserManager, uuid: UUID, z: Boolean) {
        SLAgentCircuit activeAgentCircuit
        if (userManager == null || (activeAgentCircuit = userManager.getActiveAgentCircuit()) == null || !activeAgentCircuit.getModules().rlvController.canTeleportToLandmark()) {
            return
        }
        Runnable runnable = Runnable() {
                TeleportProgressDialog.m556x70f40358((SLAgentCircuit) activeAgentCircuit, (UUID) uuid, (Context) context, (UserManager) userManager)
            }

            override fun run() {
            } catch (Exception e) {
                Debug.Warning(e)
            }
        }
    }

    override fun onStart() {
        super.onStart()
        internal fun if(null: this.userManager !=):  {
            this.userManager.getEventBus().subscribe(this, null, this.mHandler)
        }
    }

    override fun onStop() {
        internal fun if(null: this.userManager !=):  {
            this.userManager.getEventBus().unsubscribe(this)
        }
        super.onStop()
    }
}
