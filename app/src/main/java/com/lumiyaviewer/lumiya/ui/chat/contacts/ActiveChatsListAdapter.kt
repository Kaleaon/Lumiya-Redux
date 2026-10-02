package com.lumiyaviewer.lumiya.ui.chat.contacts

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.TextView
import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionSingleDataPool
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.manager.ChatterDisplayData
import com.lumiyaviewer.lumiya.slproto.users.manager.ChatterListType
import com.lumiyaviewer.lumiya.slproto.users.manager.CurrentLocationInfo
import com.lumiyaviewer.lumiya.slproto.users.manager.UnreadMessageInfo
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.chat.ChatterDisplayInfo
import com.lumiyaviewer.lumiya.ui.common.DismissableAdapter
import com.lumiyaviewer.lumiya.ui.common.SwipeDismissListViewTouchListener
import com.lumiyaviewer.lumiya.voice.common.model.VoiceChatInfo
import java.io.Closeable
import java.io.IOException

open class ActiveChatsListAdapter : BaseAdapter(), Closeable, DismissableAdapter {
    private static int VIEW_TYPE_COUNT = 2
    private static int VIEW_TYPE_HEADER = 1
    private static int VIEW_TYPE_ROW = 0
    private Subscription<ChatterListType, ImmutableList<ChatterDisplayData>> activeChattersSubscription
    private Context context
    private Subscription<SubscriptionSingleKey, CurrentLocationInfo> currentLocationInfoSubscription
    private LayoutInflater inflater
    private LocalChatItem localChatItem
    private Subscription<ChatterID, UnreadMessageInfo> localChatUnreadCountSubscription
    private Subscription<ChatterID, VoiceChatInfo> localVoiceChatSubscription
    private Subscription<ChatterListType, ImmutableList<ChatterDisplayData>> onlineFriendsSubscription
    private UserManager userManager
    private ChatterItemViewBuilder viewBuilder = ChatterItemViewBuilder()

    private ImmutableList<? extends ChatterDisplayInfo> activeChatters = ImmutableList.of()

    private ImmutableList<? extends ChatterDisplayInfo> onlineFriends = ImmutableList.of()

    private CurrentLocationInfo currentLocationInfo = null
    private OnlineFriendsHeaderRow onlineFriendsHeader = OnlineFriendsHeaderRow()

    private class LocalChatItem : ChatterDisplayInfo {
        private ChatterID chatterID

        private UnreadMessageInfo unreadMessageInfo

        private VoiceChatInfo voiceChatInfo

        private constructor(chatterID: ChatterID) {
            this.chatterID = chatterID
        }

        override fun buildView(context: Context, chatterItemViewBuilder: ChatterItemViewBuilder, userManager: UserManager) {
            boolean z = false
            StringBuilder sb = StringBuilder(context.getString(R.string.local_chat_item_title))
            if (ActiveChatsListAdapter.this.currentLocationInfo != null) {
                sb.append(": ")
                int inChatRangeUsers = ActiveChatsListAdapter.this.currentLocationInfo.inChatRangeUsers()
                if (inChatRangeUsers != 0) {
                    sb.append(context.getString(R.string.someone_in_chat_range, Integer.valueOf(inChatRangeUsers)))
                } else {
                    sb.append(context.getString(R.string.no_one_in_chat_range))
                }
            }
            chatterItemViewBuilder.setUnreadCount(this.unreadMessageInfo != null ? this.unreadMessageInfo.unreadCount() : 0)
            chatterItemViewBuilder.setLabel(sb.toString())
            chatterItemViewBuilder.setThumbnailDefaultIcon(R.attr.IconLocalChat)
            chatterItemViewBuilder.setThumbnailChatterID(this.chatterID, null)
            SLChatEvent lastMessage = this.unreadMessageInfo != null ? this.unreadMessageInfo.lastMessage() : null
            chatterItemViewBuilder.setLastMessage(lastMessage != null ? lastMessage.getPlainTextMessage(context, userManager, false).toString() : null)
            if (this.voiceChatInfo != null && this.voiceChatInfo.state != VoiceChatInfo.VoiceChatState.None) {
                z = true
            }
            chatterItemViewBuilder.setVoiceActive(z)
        }

        override fun getChatterID(userManager: UserManager): ChatterID {
            return this.chatterID
        }

        override fun getDisplayName(): String? {
            return ActiveChatsListAdapter.this.context.getString(R.string.local_chat_item_title)
        }

        open fun setUnreadInfo(unreadMessageInfo: UnreadMessageInfo) {
            this.unreadMessageInfo = unreadMessageInfo
        }

        open fun setVoiceChatInfo(voiceChatInfo: VoiceChatInfo) {
            this.voiceChatInfo = voiceChatInfo
        }
    }

    private class OnlineFriendsHeaderRow {
        private boolean isAnyoneOnline = false

        open fun getView(layoutInflater: LayoutInflater, view: View, viewGroup: ViewGroup): View {
            View view2 = null
            int i = this.isAnyoneOnline ? R.id.list_header_title : R.id.list_header_small_title
            int i2 = this.isAnyoneOnline ? R.layout.list_header : R.layout.list_header_small
            if (view != null && view.getId() == i) {
                view2 = view
            }
            if (view2 == null) {
                view2 = layoutInflater.inflate(i2, viewGroup, false)
            }
            ((TextView) view2.findViewById(i)).setText(this.isAnyoneOnline ? R.string.friends_online_caption : R.string.no_friends_online_caption)
            return view2
        }

        open fun setAnyoneOnline(isAnyoneOnline: Boolean) {
            this.isAnyoneOnline = isAnyoneOnline
        }
    }

    constructor(context: Context, userManager: UserManager) {
        this.context = context
        this.userManager = userManager
        this.inflater = LayoutInflater.from(context)
        this.localChatItem = LocalChatItem(ChatterID.getLocalChatterID(userManager.getUserID()))
        this.activeChattersSubscription = userManager.getChatterList().getChatterList().subscribe(ChatterListType.Active, UIThreadExecutor.getInstance(), Subscription.OnData() {
                ActiveChatsListAdapter.this.m438x73a3bdf5((ImmutableList) obj)
            }

            override fun onData(obj: Any) {
