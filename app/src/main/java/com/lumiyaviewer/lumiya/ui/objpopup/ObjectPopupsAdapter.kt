package com.lumiyaviewer.lumiya.ui.objpopup

import android.content.Context
import androidx.recyclerview.widget.RecyclerView
import android.view.LayoutInflater
import android.view.ViewGroup
import com.lumiyaviewer.lumiya.slproto.chat.generic.ChatEventViewHolder
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.users.manager.SubscribableList
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.common.RecyclerSubscribableListAdapter

class ObjectPopupsAdapter(
    private val context: Context,
    subscribableList: SubscribableList<SLChatEvent>,
    private val userManager: UserManager
) : RecyclerSubscribableListAdapter<SLChatEvent>(subscribableList) {
    private val layoutInflater: LayoutInflater = LayoutInflater.from(context)

    override fun bindObjectViewHolder(viewHolder: RecyclerView.ViewHolder, chatEvent: SLChatEvent) {
        if (viewHolder is ChatEventViewHolder) {
            chatEvent.bindViewHolder(viewHolder, userManager, null)
        }
    }

    override fun createObjectViewHolder(viewGroup: ViewGroup, i: Int): RecyclerView.ViewHolder =
        SLChatEvent.createViewHolder(layoutInflater, i, viewGroup, this)

    override fun getObjectViewType(chatEvent: SLChatEvent): Int = chatEvent.viewType.ordinal
}
