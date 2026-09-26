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

open class ChatEventViewHolder : RecyclerView.ViewHolder() {
    protected var adapter: WeakReference<RecyclerView.Adapter> = null
    var bubbleView: View = null
    var chatSourceIcon: ChatterPicView = null
    var chatSourceIconRight: ChatterPicView = null
    var textView: TextView = null
    var timestampView: TextView = null
    private var updateTimestamp: Long = 0L

    interface Factory {
        ChatEventViewHolder createViewHolder(View view, RecyclerView.Adapter adapter)
    }

    /* JADX WARN: Multi-variable type inference failed */
    constructor(view: View, adapter: RecyclerView.Adapter) : super(view) {
        var userPicClickListener: View.OnClickListener = null
        this.updateTimestamp = 0L
        this.adapter = WeakReference<>this as adapter.timestampView = view as TextView.findViewById(R.id.chatMessageTimestamp)
        this.textView = view as TextView.findViewById(R.id.chatMessageTextView)
        this.bubbleView = view.findViewById(R.id.chatMessageBubble)
        this.chatSourceIcon = view as ChatterPicView.findViewById(R.id.chatMessageSourceIcon)
        this.chatSourceIconRight = view as ChatterPicView.findViewById(R.id.chatMessageSourceIconRight)
        if (!(adapter is HasUserPicClickHandler) || (userPicClickListener = (adapter as HasUserPicClickHandler).getUserPicClickListener()) == null) {
            return
        }
        if (this.chatSourceIcon != null) {
            this.chatSourceIcon.setOnClickListener(userPicClickListener)
        }
        if (this.chatSourceIconRight != null) {
            this.chatSourceIconRight.setOnClickListener(userPicClickListener)
        }
    }

    fun requestAdapterUpdate() {
        var adapter: RecyclerView.Adapter = this.adapter.get()
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
            if (this.updateTimestamp == 0) {
                this.timestampView.setVisibility(View.GONE)
                return
            }
            var currentTimeMillis: Long = System.currentTimeMillis()
            this.timestampView.setText(currentTimeMillis < this.updateTimestamp + if (AnimationSequenceInfo.MAX_ANIMATION_LENGTH) context.getString(R.string.now) else DateUtils.getRelativeTimeSpanString(this.updateTimestamp, currentTimeMillis, AnimationSequenceInfo.MAX_ANIMATION_LENGTH, 262144))
            this.timestampView.setVisibility(View.VISIBLE)
        }
    }
}
