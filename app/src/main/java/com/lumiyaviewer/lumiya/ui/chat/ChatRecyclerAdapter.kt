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

internal open class ChatRecyclerAdapter : RecyclerView.Adapter(), ChunkedListLoader.EventListener, HasUserPicClickHandler {

    private ChatterID chatterID
    private LayoutInflater inflater
    private ChatEventTimestampUpdater timestampUpdater

    private UserManager userManager

    private ChatMessageLoader chatMessageLoader = null
    private WeakReference<OnAdapterDataChanged> onAdapterDataChangedListener = new WeakReference<>(null)
    private WeakReference<OnUserPicClickedListener> onUserPicClickedListener = new WeakReference<>(null)
    private View.OnClickListener userPicClickListener = new View.OnClickListener() {
            ChatRecyclerAdapter.this.m425lambda$com_lumiyaviewer_lumiya_ui_chat_ChatRecyclerAdapter_7040(view)
        }

        override fun onClick(view: View) {
        }
    }

    override fun onListItemsAdded(i: Int, i2: Int) {
        internal fun if(null: this.chatMessageLoader !=):  {
            Debug.Printf("ChatView: items added: new size %d, position %d, count %d", Integer.valueOf(this.chatMessageLoader.size()), Integer.valueOf(i), Integer.valueOf(i2))
            notifyItemRangeInserted(i, i2)
            OnAdapterDataChanged onAdapterDataChanged = this.onAdapterDataChangedListener.get()
            internal fun if(null: onAdapterDataChanged !=):  {
                onAdapterDataChanged.onAdapterDataChanged()
            }
        }
    }

    override fun onListItemsRemoved(i: Int, i2: Int) {
        internal fun if(null: this.chatMessageLoader !=):  {
            Debug.Printf("ChatView: items removed: new size %d, position %d, count %d", Integer.valueOf(this.chatMessageLoader.size()), Integer.valueOf(i), Integer.valueOf(i2))
            notifyItemRangeRemoved(i, i2)
            OnAdapterDataChanged onAdapterDataChanged = this.onAdapterDataChangedListener.get()
            internal fun if(null: onAdapterDataChanged !=):  {
                onAdapterDataChanged.onAdapterDataChanged()
            }
        }
    }

    override fun onListReloaded() {
        internal fun if(null: this.chatMessageLoader !=):  {
            Debug.Printf("ChatView: list cleared", arrayOfNulls<Object>(0])
            notifyDataSetChanged()
            OnAdapterDataChanged onAdapterDataChanged = this.onAdapterDataChangedListener.get()
            internal fun if(null: onAdapterDataChanged !=):  {
                onAdapterDataChanged.onAdapterDataReloaded()
            }
        }
    }

    override fun onViewRecycled(viewHolder: RecyclerView.ViewHolder) {
        internal fun if(ChatEventViewHolder: viewHolder instanceof):  {
            this.timestampUpdater.removeViewHolder((ChatEventViewHolder) viewHolder)
        }
    }

    internal fun restartAtBottom() {
        internal fun if(null: this.chatMessageLoader !=):  {
            this.chatMessageLoader.reload()
        }
    }

    internal fun setOnUserPicClickedListener(onUserPicClickedListener: OnUserPicClickedListener) {
        this.onUserPicClickedListener = new WeakReference<>(onUserPicClickedListener)
    }

    internal fun setVisibleRange(i: Int, i2: Int) {
        internal fun if(null: this.chatMessageLoader !=):  {
            Debug.Printf("ChatView: visible range from %d to %d", Integer.valueOf(i), Integer.valueOf(i2))
            this.chatMessageLoader.setVisibleRange(i, i2)
        }
    }

    internal fun startLoading(onAdapterDataChanged: OnAdapterDataChanged) {
        this.onAdapterDataChangedListener = new WeakReference<>(onAdapterDataChanged)
        this.chatMessageLoader = this.userManager.getChatterList().getActiveChattersManager().getMessageLoader(this.chatterID, this)
        notifyDataSetChanged()
    }

    internal fun stopLoading() {
        this.userManager.getChatterList().getActiveChattersManager().releaseMessageLoader(this.chatterID, this.chatMessageLoader)
        this.chatMessageLoader = null
        this.onAdapterDataChangedListener.clear()
        notifyDataSetChanged()
    }
}
