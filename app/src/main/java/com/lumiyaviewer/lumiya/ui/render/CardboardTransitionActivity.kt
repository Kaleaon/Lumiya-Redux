package com.lumiyaviewer.lumiya.ui.render

import android.view.WindowManager
import android.view.Window
import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import androidx.appcompat.app.AppCompatActivity
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.render.TextureMemoryTracker
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.render.vr.VrRuntimeSelector
import java.util.UUID

open class CardboardTransitionActivity : AppCompatActivity() {
    private static int MAX_WAIT_ATTEMPTS = 15
    private static long WAIT_INTERVAL = 250
    private Handler handler = Handler(Looper.getMainLooper())
    private int waitAttempts = 0

    open fun tryToStartCardboard() {
        if (this.waitAttempts >= 15 || (!TextureMemoryTracker.hasActiveRenderer())) {
            this.handler.postDelayed(Runnable() {
                    CardboardTransitionActivity.this.m796x33a6fc46()
                }

                override fun run() {