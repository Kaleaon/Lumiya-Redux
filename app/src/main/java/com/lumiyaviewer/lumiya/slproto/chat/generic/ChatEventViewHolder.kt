package com.lumiyaviewer.lumiya.slproto.chat.generic

import android.content.Context
import android.text.format.DateUtils
import android.view.View
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.render.avatar.AnimationSequenceInfo
import com.lumiyaviewer.lumiya.ui.chat.ChatterPicView
import com.lumiyaviewer.lumiya.ui.chat.HasUserPicClickHandler
import java.lang.ref.WeakReference

open class ChatEventViewHolder(view: View, adapter: RecyclerView.Adapter<*>) : RecyclerView.ViewHolder(view) {
    protected val adapter: WeakReference<RecyclerView.Adapter<*>>
    val bubbleView: View?
    val chatSourceIcon: ChatterPicView?
    val chatSourceIconRight: ChatterPicView?
    val textView: TextView?
    val timestampView: TextView?
    private var updateTimestamp: Long = 0L

    fun interface Factory {
        fun createViewHolder(view: View, adapter: RecyclerView.Adapter<*>): ChatEventViewHolder
    }

    init {
        this.updateTimestamp = 0L
        this.adapter = WeakReference(adapter)
        this.timestampView = view.findViewById(R.id.chatMessageTimestamp)
        this.textView = view.findViewById(R.id.chatMessageTextView)
        this.bubbleView = view.findViewById(R.id.chatMessageBubble)
        this.chatSourceIcon = view.findViewById(R.id.chatMessageSourceIcon)
        this.chatSourceIconRight = view.findViewById(R.id.chatMessageSourceIconRight)
        val userPicClickListener: View.OnClickListener? =
            (adapter as? HasUserPicClickHandler)?.getUserPicClickListener()
        if (userPicClickListener != null) {
            this.chatSourceIcon?.setOnClickListener(userPicClickListener)
            this.chatSourceIconRight?.setOnClickListener(userPicClickListener)
        }
    }

    fun requestAdapterUpdate() {
        val adapter = this.adapter.get()
        if (adapter != null) {
            adapter.notifyItemChanged(getAdapterPosition())
        }
    }

    fun setupTimestampUpdate(context: Context, updateTimestamp: Long) {
        this.updateTimestamp = updateTimestamp
        updateTimestamp(context)
    }

    fun updateTimestamp(context: Context) {
        if (this.timestampView != null) {
            if (this.updateTimestamp == 0L) {
                this.timestampView.visibility = View.GONE
                return
            }
            val currentTimeMillis = System.currentTimeMillis()
            this.timestampView.text = if (currentTimeMillis < this.updateTimestamp + AnimationSequenceInfo.MAX_ANIMATION_LENGTH)
                context.getString(R.string.now)
            else
                DateUtils.getRelativeTimeSpanString(this.updateTimestamp, currentTimeMillis, AnimationSequenceInfo.MAX_ANIMATION_LENGTH, 262144)
            this.timestampView.visibility = View.VISIBLE
        }
    }
}
