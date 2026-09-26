package com.lumiyaviewer.lumiya.media

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import com.lumiyaviewer.lumiya.StreamingMediaService

open class AudioIntentReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action == "android.media.AUDIO_BECOMING_NOISY") {
            context.startService(Intent(context, StreamingMediaService::class.java).apply {
                action = "com.lumiyaviewer.lumiya.ACTION_STOP_MEDIA"
            })
        }
    }
}
