package com.lumiyaviewer.lumiya.ui.login

import android.app.Activity
import android.app.ProgressDialog
import android.content.Context
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.eventbus.EventBus
import com.lumiyaviewer.lumiya.eventbus.EventHandler
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLGridConnection
import com.lumiyaviewer.lumiya.slproto.events.SLDisconnectEvent
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.util.UUID

open class LogoutDialog : ProgressDialog() {
    private static long DISCONNECT_TIMEOUT = 5000
    private UUID agentUUID
    private EventBus eventBus
    private Handler handler
    private Runnable onDisconnectTimeout

    constructor(context: Context) {
        super(context)
        this.handler = Handler(Looper.getMainLooper())
        this.eventBus = EventBus.getInstance()
        this.onDisconnectTimeout = Runnable() {
                LogoutDialog.this.m647lambda$com_lumiyaviewer_lumiya_ui_login_LogoutDialog_3137()
            }

            override fun run() {
