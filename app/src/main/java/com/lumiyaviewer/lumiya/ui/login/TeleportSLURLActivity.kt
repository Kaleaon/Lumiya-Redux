package com.lumiyaviewer.lumiya.ui.login

import android.annotation.SuppressLint
import android.content.DialogInterface
import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity
import android.view.View
import android.widget.TextView
import com.lumiyaviewer.lumiya.GridConnectionService
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLGridConnection
import com.lumiyaviewer.lumiya.slproto.SLURL
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.common.TeleportProgressDialog
import java.util.UUID

open class TeleportSLURLActivity : AppCompatActivity(), View.OnClickListener {
    private SLURL slurl = null


    override fun onClick(view: View) {
        SLGridConnection gridConnection
        SLAgentCircuit activeAgentCircuit
        when (view.getId()) {
            R.id.buttonTeleport -> {
                boolean z = false
                if (this.slurl != null && (gridConnection = GridConnectionService.getGridConnection()) != null) {
                    UUID activeAgentUUID = gridConnection.getActiveAgentUUID()
                    UserManager userManager = activeAgentUUID != null ? UserManager.getUserManager(activeAgentUUID) : null
                    if (userManager != null && (activeAgentCircuit = userManager.getActiveAgentCircuit()) != null && activeAgentCircuit.getModules().worldMap.TeleportToRegionByName(this.slurl.getLocationName(), this.slurl.getLocationX(), this.slurl.getLocationY(), this.slurl.getLocationZ())) {
                        TeleportProgressDialog(this, userManager, R.string.teleporting_progress_message).show()
                        z = true
                    }
                }
                if (!z) {
                    new AlertDialog.Builder(this).setMessage(R.string.teleport_unable).setCancelable(true).setPositiveButton("OK", new DialogInterface.OnClickListener() {
                            TeleportSLURLActivity.this.m648xe44220a6(dialogInterface, i)
                        }

                        override fun onClick(dialogInterface: DialogInterface, i: Int) {