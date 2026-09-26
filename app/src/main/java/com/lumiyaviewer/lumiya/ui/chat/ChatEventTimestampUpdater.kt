package com.lumiyaviewer.lumiya.ui.chat

import android.content.Context
import android.os.Handler
import android.os.Looper
import com.lumiyaviewer.lumiya.slproto.chat.generic.ChatEventViewHolder
import java.util.Collections
import java.util.WeakHashMap

class ChatEventTimestampUpdater(private val context: Context) {
    private val mHandler = Handler(Looper.getMainLooper())
    private var updateRunnablePosted = false
    private val viewHolders: MutableSet<ChatEventViewHolder> = Collections.newSetFromMap(WeakHashMap())
    private lateinit var updateRunnable: Runnable

    init {
        updateRunnable = Runnable {
            updateRunnablePosted = false
            for (chatEventViewHolder in viewHolders) {
                chatEventViewHolder.updateTimestamp(context)
            }
            if (viewHolders.isNotEmpty()) {
                updateRunnablePosted = true
                mHandler.postDelayed(updateRunnable, TIMESTAMP_UPDATE_INTERVAL)
            }
        }
    }

    fun addViewHolder(chatEventViewHolder: ChatEventViewHolder) {
        viewHolders.add(chatEventViewHolder)
        if (updateRunnablePosted) {
            return
        }
        updateRunnablePosted = true
        mHandler.postDelayed(updateRunnable, TIMESTAMP_UPDATE_INTERVAL)
    }

    fun removeViewHolder(chatEventViewHolder: ChatEventViewHolder) {
        viewHolders.remove(chatEventViewHolder)
    }

    companion object {
        private const val TIMESTAMP_UPDATE_INTERVAL = 60000L
    }
}
