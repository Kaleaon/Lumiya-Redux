package com.lumiyaviewer.lumiya.ui.chat

import android.content.Context
import androidx.recyclerview.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.chat.generic.ChatEventViewHolder
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource
import com.lumiyaviewer.lumiya.slproto.users.manager.ChatMessageLoader
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.utils.wlist.ChunkedListLoader
import java.lang.ref.WeakReference
import java.util.concurrent.Executor

class ChatRecyclerAdapter(context: Context, private val userManager: UserManager, private val chatterID: ChatterID) :
    RecyclerView.Adapter<RecyclerView.ViewHolder>(), ChunkedListLoader.EventListener, HasUserPicClickHandler {

    private val inflater: LayoutInflater = LayoutInflater.from(context)
    private val timestampUpdater: ChatEventTimestampUpdater = ChatEventTimestampUpdater(context)

    private var chatMessageLoader: ChatMessageLoader? = null
    private var onAdapterDataChangedListener: WeakReference<OnAdapterDataChanged?> = WeakReference(null)
    private var onUserPicClickedListener: WeakReference<OnUserPicClickedListener?> = WeakReference(null)
    private val userPicClickListener = View.OnClickListener { view ->
        val onUserPicClickedListener = this.onUserPicClickedListener.get()
        if (onUserPicClickedListener != null && view is ChatterPicView) {
            val attachedMessageSource = view.getAttachedMessageSource()
            if (attachedMessageSource != null) {
                onUserPicClickedListener.onUserPicClicked(attachedMessageSource)
            }
        }
    }

    interface OnAdapterDataChanged {
        fun onAdapterDataAddedAtEnd()

        fun onAdapterDataChanged()

        fun onAdapterDataReloaded()
    }

    interface OnUserPicClickedListener {
        fun onUserPicClicked(chatMessageSource: ChatMessageSource)
    }

    init {
        setHasStableIds(true)
    }

    override fun getItemCount(): Int {
        val chatMessageLoader = this.chatMessageLoader
        if (chatMessageLoader != null) {
            return chatMessageLoader.size()
        }
        return 0
    }

    override fun getItemId(i: Int): Long {
        val chatMessageLoader = this.chatMessageLoader
        if (chatMessageLoader != null) {
            return chatMessageLoader.get(i).getId()
        }
        return -1L
    }

    override fun getItemViewType(i: Int): Int {
        val chatMessageLoader = this.chatMessageLoader
        if (chatMessageLoader != null) {
            return chatMessageLoader.get(i).getViewType()
        }
        return 0
    }

    override val listEventsExecutor: Executor
        get() = UIThreadExecutor.getSerialInstance()

    override fun getUserPicClickListener(): View.OnClickListener {
        return this.userPicClickListener
    }

    fun hasMoreItemsAtBottom(): Boolean {
        val chatMessageLoader = this.chatMessageLoader
        if (chatMessageLoader != null) {
            return chatMessageLoader.hasMoreItemsAtBottom()
        }
        return false
    }

    override fun onBindViewHolder(viewHolder: RecyclerView.ViewHolder, i: Int) {
        val chatMessageLoader = this.chatMessageLoader ?: return
        val loadFromDatabaseObject = SLChatEvent.loadFromDatabaseObject(chatMessageLoader.get(i), userManager.getUserID()) ?: return
        if (viewHolder !is ChatEventViewHolder) {
            return
        }
        loadFromDatabaseObject.bindViewHolder(viewHolder, this.userManager, this.timestampUpdater)
    }

    override fun onCreateViewHolder(viewGroup: ViewGroup, i: Int): RecyclerView.ViewHolder {
        return SLChatEvent.createViewHolder(this.inflater, i, viewGroup, this)
    }

    override fun onListItemAddedAtEnd() {
        if (this.chatMessageLoader == null) return
        val onAdapterDataChanged = this.onAdapterDataChangedListener.get() ?: return
        onAdapterDataChanged.onAdapterDataAddedAtEnd()
    }

    override fun onListItemChanged(i: Int) {
        if (this.chatMessageLoader != null) {
            Debug.Printf("ChatView: item changed: position %d", i)
            notifyItemChanged(i)
            val onAdapterDataChanged = this.onAdapterDataChangedListener.get()
            onAdapterDataChanged?.onAdapterDataChanged()
        }
    }

    override fun onListItemsAdded(i: Int, i2: Int) {
        val chatMessageLoader = this.chatMessageLoader
        if (chatMessageLoader != null) {
            Debug.Printf("ChatView: items added: new size %d, position %d, count %d", chatMessageLoader.size(), i, i2)
            notifyItemRangeInserted(i, i2)
            val onAdapterDataChanged = this.onAdapterDataChangedListener.get()
            onAdapterDataChanged?.onAdapterDataChanged()
        }
    }

    override fun onListItemsRemoved(i: Int, i2: Int) {
        val chatMessageLoader = this.chatMessageLoader
        if (chatMessageLoader != null) {
            Debug.Printf("ChatView: items removed: new size %d, position %d, count %d", chatMessageLoader.size(), i, i2)
            notifyItemRangeRemoved(i, i2)
            val onAdapterDataChanged = this.onAdapterDataChangedListener.get()
            onAdapterDataChanged?.onAdapterDataChanged()
        }
    }

    override fun onListReloaded() {
        if (this.chatMessageLoader != null) {
            Debug.Printf("ChatView: list cleared")
            notifyDataSetChanged()
            val onAdapterDataChanged = this.onAdapterDataChangedListener.get()
            onAdapterDataChanged?.onAdapterDataReloaded()
        }
    }

    override fun onViewRecycled(viewHolder: RecyclerView.ViewHolder) {
        if (viewHolder is ChatEventViewHolder) {
            this.timestampUpdater.removeViewHolder(viewHolder)
        }
    }

    fun restartAtBottom() {
        this.chatMessageLoader?.reload()
    }

    fun setOnUserPicClickedListener(onUserPicClickedListener: OnUserPicClickedListener) {
        this.onUserPicClickedListener = WeakReference(onUserPicClickedListener)
    }

    fun setVisibleRange(i: Int, i2: Int) {
        val chatMessageLoader = this.chatMessageLoader
        if (chatMessageLoader != null) {
            Debug.Printf("ChatView: visible range from %d to %d", i, i2)
            chatMessageLoader.setVisibleRange(i, i2)
        }
    }

    fun startLoading(onAdapterDataChanged: OnAdapterDataChanged) {
        this.onAdapterDataChangedListener = WeakReference(onAdapterDataChanged)
        this.chatMessageLoader = this.userManager.getChatterList().getActiveChattersManager().getMessageLoader(this.chatterID, this)
        notifyDataSetChanged()
    }

    fun stopLoading() {
        this.userManager.getChatterList().getActiveChattersManager().releaseMessageLoader(this.chatterID, this.chatMessageLoader)
        this.chatMessageLoader = null
        this.onAdapterDataChangedListener.clear()
        notifyDataSetChanged()
    }
}
