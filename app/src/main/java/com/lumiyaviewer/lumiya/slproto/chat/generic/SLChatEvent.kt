package com.lumiyaviewer.lumiya.slproto.chat.generic

import android.content.ClipData
import android.content.Context
import android.graphics.PorterDuff
import android.graphics.drawable.Drawable
import android.text.SpannableStringBuilder
import android.text.style.StyleSpan
import android.util.TypedValue
import android.view.LayoutInflater
import android.view.MenuItem
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.widget.PopupMenu
import androidx.recyclerview.widget.RecyclerView
import com.google.common.base.Objects
import com.google.common.base.Strings
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.GlobalOptions
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.slproto.chat.SLChatBalanceChangedEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLChatFriendshipOfferedEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLChatFriendshipResultEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLChatGroupInvitationEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLChatGroupInvitationSentEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLChatInventoryItemOfferedByGroupNoticeEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLChatInventoryItemOfferedByYouEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLChatInventoryItemOfferedEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLChatLureEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLChatLureRequestEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLChatLureRequestedEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLChatOnlineOfflineEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLChatPermissionRequestEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLChatScriptDialog
import com.lumiyaviewer.lumiya.slproto.chat.SLChatSessionMarkEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLChatSystemMessageEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLChatTextBoxDialog
import com.lumiyaviewer.lumiya.slproto.chat.SLChatTextEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLEnableRLVOfferEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLMissedVoiceCallEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLVoiceUpgradeEvent
import com.lumiyaviewer.lumiya.slproto.chat.generic.ChatEventViewHolder
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.messages.ImprovedInstantMessage
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.chat.ChatEventTimestampUpdater
import com.lumiyaviewer.lumiya.ui.chat.ChatterPicView
import java.text.DateFormat
import java.util.Date
import java.util.UUID

abstract class SLChatEvent : View.OnLongClickListener {

    @JvmStatic var CHAT_AUDIBLE_BARELY: Int = 0
    @JvmStatic var CHAT_AUDIBLE_FULLY: Int = 1
    @JvmStatic var CHAT_AUDIBLE_NOT: Int = -1
    @JvmStatic var CHAT_SOURCE_AGENT: Int = 1
    @JvmStatic var CHAT_SOURCE_OBJECT: Int = 2
    @JvmStatic var CHAT_SOURCE_SYSTEM: Int = 0
    @JvmStatic var CHAT_SOURCE_UNKNOWN: Int = 3
    @JvmStatic var CHAT_TYPE_DEBUG_MSG: Int = 6
    @JvmStatic var CHAT_TYPE_NORMAL: Int = 1
    @JvmStatic var CHAT_TYPE_OWNER: Int = 8
    @JvmStatic var CHAT_TYPE_REGION: Int = 7
    @JvmStatic var CHAT_TYPE_SHOUT: Int = 2
    @JvmStatic var CHAT_TYPE_START: Int = 4
    @JvmStatic var CHAT_TYPE_STOP: Int = 5
    @JvmStatic var CHAT_TYPE_WHISPER: Int = 0
    @JvmStatic var IM_BUSY_AUTO_RESPONSE: Int = 20
    @JvmStatic var IM_CONSOLE_AND_CHAT_HISTORY: Int = 21
    @JvmStatic var IM_FRIENDSHIP_ACCEPTED: Int = 39
    @JvmStatic var IM_FRIENDSHIP_DECLINED: Int = 40
    @JvmStatic var IM_FRIENDSHIP_OFFERED: Int = 38
    @JvmStatic var IM_FROM_TASK: Int = 19
    @JvmStatic var IM_FROM_TASK_AS_ALERT: Int = 31
    @JvmStatic var IM_GODLIKE_LURE_USER: Int = 25
    @JvmStatic var IM_GOTO_URL: Int = 28
    @JvmStatic var IM_GROUP_ELECTION_DEPRECATED: Int = 27
    @JvmStatic var IM_GROUP_INVITATION: Int = 3
    @JvmStatic var IM_GROUP_INVITATION_ACCEPT: Int = 35
    @JvmStatic var IM_GROUP_INVITATION_DECLINE: Int = 36
    @JvmStatic var IM_GROUP_MESSAGE_DEPRECATED: Int = 8
    @JvmStatic var IM_GROUP_NOTICE: Int = 32
    @JvmStatic var IM_GROUP_NOTICE_INVENTORY_ACCEPTED: Int = 33
    @JvmStatic var IM_GROUP_NOTICE_INVENTORY_DECLINED: Int = 34
    @JvmStatic var IM_GROUP_NOTICE_REQUESTED: Int = 37
    @JvmStatic var IM_GROUP_VOTE: Int = 7
    @JvmStatic var IM_INVENTORY_ACCEPTED: Int = 5
    @JvmStatic var IM_INVENTORY_DECLINED: Int = 6
    @JvmStatic var IM_INVENTORY_OFFERED: Int = 4
    @JvmStatic var IM_LURE_ACCEPTED: Int = 23
    @JvmStatic var IM_LURE_DECLINED: Int = 24
    @JvmStatic var IM_LURE_USER: Int = 22
    @JvmStatic var IM_MESSAGEBOX: Int = 1
    @JvmStatic var IM_MESSAGEBOX_COUNTDOWN: Int = 2
    @JvmStatic var IM_NEW_USER_DEFAULT: Int = 12
    @JvmStatic var IM_NOTHING_SPECIAL: Int = 0
    @JvmStatic var IM_SESSION_CONFERENCE_START: Int = 16
    @JvmStatic var IM_SESSION_GROUP_START: Int = 15
    @JvmStatic var IM_SESSION_INVITE: Int = 13
    @JvmStatic var IM_SESSION_LEAVE: Int = 18
    @JvmStatic var IM_SESSION_P2P_INVITE: Int = 14
    @JvmStatic var IM_SESSION_SEND: Int = 17
    @JvmStatic var IM_TASK_INVENTORY_ACCEPTED: Int = 10
    @JvmStatic var IM_TASK_INVENTORY_DECLINED: Int = 11
    @JvmStatic var IM_TASK_INVENTORY_OFFERED: Int = 9
    @JvmStatic var IM_TELEPORT_REQUEST: Int = 26
    @JvmStatic var IM_TYPING_START: Int = 41
    @JvmStatic var IM_TYPING_STOP: Int = 42

    protected var agentUUID: UUID = null

    protected var dbMessage: ChatMessage = null
    private var isOffline: Boolean = false
    private var originalTimestamp: Date = null

    protected var source: ChatMessageSource = null
    private var timestamp: Date = null

    enum class ChatMessageType {
        Text,
        BalanceChanged,
        InventoryItemOffered,
        InventoryItemOfferedByGroupNotice,
        InventoryItemOfferedByYou,
        FriendshipOffered,
        FriendshipResult,
        GroupInvitation,
        GroupInvitationSent,
        Lure,
        LureRequested,
        LureRequest,
        WentOnline,
        WentOffline,
        PermissionRequest,
        ScriptDialog,
        TextBoxDialog,
        EnableRLVOffer,
        SessionMark,
        SystemMessage,
        VoiceUpgrade,
        MissedVoiceCall

        Array<ChatMessageType> VALUES = valuesCustom()

        /* renamed from: values, reason: to resolve conflict with enum method */
        fun valuesCustom(): Array<ChatMessageType> {
            return values()
        }
    }

    enum class ChatMessageViewType : ChatEventViewHolder.Factory {
        VIEW_TYPE_NORMAL(R.layout.chat_message, false, ChatEventViewHolder.Factory() {
            private /* synthetic */ ChatEventViewHolder $m$0(View view, RecyclerView.Adapter adapter) {
                return SLChatEvent.ChatMessageViewType.m161x24dc691(view, adapter)
            }
            fun createViewHolder(view: View, adapter: RecyclerView.Adapter): ChatEventViewHolder {
                return $m$0(view, adapter)
            }
        }),
        VIEW_TYPE_YESNO(R.layout.chat_message_yesno, false, ChatEventViewHolder.Factory() {
            private /* synthetic */ ChatEventViewHolder $m$0(View view, RecyclerView.Adapter adapter) {
                return SLChatEvent.ChatMessageViewType.m162x24dc692(view, adapter)
            }
            fun createViewHolder(view: View, adapter: RecyclerView.Adapter): ChatEventViewHolder {
                return $m$0(view, adapter)
            }
        }),
        VIEW_TYPE_DIALOG(R.layout.chat_message_dialog, false, ChatEventViewHolder.Factory() {
            private /* synthetic */ ChatEventViewHolder $m$0(View view, RecyclerView.Adapter adapter) {
                return SLChatEvent.ChatMessageViewType.m163x24dc693(view, adapter)
            }
            fun createViewHolder(view: View, adapter: RecyclerView.Adapter): ChatEventViewHolder {
                return $m$0(view, adapter)
            }
        }),
        VIEW_TYPE_TEXTBOX(R.layout.chat_message_textbox, true, ChatEventViewHolder.Factory() {
            private /* synthetic */ ChatEventViewHolder $m$0(View view, RecyclerView.Adapter adapter) {
                return SLChatEvent.ChatMessageViewType.m164x24dc694(view, adapter)
            }
            fun createViewHolder(view: View, adapter: RecyclerView.Adapter): ChatEventViewHolder {
                return $m$0(view, adapter)
            }
        }),
        VIEW_TYPE_SESSION_MARK(R.layout.chat_message_session_mark, false, ChatEventViewHolder.Factory() {
            private /* synthetic */ ChatEventViewHolder $m$0(View view, RecyclerView.Adapter adapter) {
                return SLChatEvent.ChatMessageViewType.m165x24dc695(view, adapter)
            }
            fun createViewHolder(view: View, adapter: RecyclerView.Adapter): ChatEventViewHolder {
                return $m$0(view, adapter)
            }
        }),
        VIEW_TYPE_PLAIN(R.layout.chat_message_plain, false, ChatEventViewHolder.Factory() {
            private /* synthetic */ ChatEventViewHolder $m$0(View view, RecyclerView.Adapter adapter) {
                return SLChatEvent.ChatMessageViewType.m166x24dc696(view, adapter)
            }
            fun createViewHolder(view: View, adapter: RecyclerView.Adapter): ChatEventViewHolder {
                return $m$0(view, adapter)
            }
        })

        Array<ChatMessageViewType> VALUES = valuesCustom()
        private var alwaysInflate: Boolean
        private var resourceId: Int
        private ChatEventViewHolder.Factory viewHolderFactory

        /* renamed from: -com_lumiyaviewer_lumiya_slproto_chat_generic_SLChatEvent$ChatMessageViewType-mthref-0, reason: not valid java name */
        static /* synthetic */ ChatEventViewHolder m161x24dc691(View view, RecyclerView.Adapter adapter) {
            return ChatEventViewHolder(view, adapter)
        }

        /* renamed from: -com_lumiyaviewer_lumiya_slproto_chat_generic_SLChatEvent$ChatMessageViewType-mthref-1, reason: not valid java name */
        static /* synthetic */ ChatEventViewHolder m162x24dc692(View view, RecyclerView.Adapter adapter) {
            return ChatYesNoEventViewHolder(view, adapter)
        }

        /* renamed from: -com_lumiyaviewer_lumiya_slproto_chat_generic_SLChatEvent$ChatMessageViewType-mthref-2, reason: not valid java name */
        static /* synthetic */ ChatEventViewHolder m163x24dc693(View view, RecyclerView.Adapter adapter) {
            return ChatScriptDialogViewHolder(view, adapter)
        }

        /* renamed from: -com_lumiyaviewer_lumiya_slproto_chat_generic_SLChatEvent$ChatMessageViewType-mthref-3, reason: not valid java name */
        static /* synthetic */ ChatEventViewHolder m164x24dc694(View view, RecyclerView.Adapter adapter) {
            return ChatTextBoxViewHolder(view, adapter)
        }

        /* renamed from: -com_lumiyaviewer_lumiya_slproto_chat_generic_SLChatEvent$ChatMessageViewType-mthref-4, reason: not valid java name */
        static /* synthetic */ ChatEventViewHolder m165x24dc695(View view, RecyclerView.Adapter adapter) {
            return ChatEventViewHolder(view, adapter)
        }

        /* renamed from: -com_lumiyaviewer_lumiya_slproto_chat_generic_SLChatEvent$ChatMessageViewType-mthref-5, reason: not valid java name */
        static /* synthetic */ ChatEventViewHolder m166x24dc696(View view, RecyclerView.Adapter adapter) {
            return ChatEventViewHolder(view, adapter)
        }

        ChatMessageViewType(int resourceId, boolean alwaysInflate, ChatEventViewHolder.Factory factory) {
            this.resourceId = resourceId
            this.alwaysInflate = alwaysInflate
            this.viewHolderFactory = factory
        }

        /* renamed from: values, reason: to resolve conflict with enum method */
        fun valuesCustom(): Array<ChatMessageViewType> {
            return values()
        }
        fun createViewHolder(view: View, adapter: RecyclerView.Adapter): ChatEventViewHolder {
            return this.viewHolderFactory.createViewHolder(view, adapter)
        }

        fun getAlwaysInflate(): Boolean {
            return this.alwaysInflate
        }

        fun getResourceId(): Int {
            return this.resourceId
        }
    }

    constructor(chatMessage: ChatMessage, uuid: UUID) {
        this.dbMessage = chatMessage
        this.timestamp = chatMessage.getTimestamp()
        this.isOffline = chatMessage.getIsOffline()
        this.originalTimestamp = chatMessage.getOrigTimestamp()
        this.source = ChatMessageSource.loadFromthis as chatMessage.agentUUID = uuid
    }

    constructor(improvedInstantMessage: ImprovedInstantMessage, uuid: UUID, chatMessageSource: ChatMessageSource) {
        this.timestamp = Date()
        this.source = chatMessageSource
        this.agentUUID = uuid
        if (improvedInstantMessage == null) {
            this.isOffline = false
            this.originalTimestamp = this.timestamp
        } else if (improvedInstantMessage.MessageBlock_Field.Offline == 0 || improvedInstantMessage.MessageBlock_Field.Dialog == 9) {
            this.isOffline = false
            this.originalTimestamp = this.timestamp
        } else {
            this.isOffline = true
            this.originalTimestamp = Date(improvedInstantMessage.MessageBlock_Field.Timestamp * 1000)
        }
        this.dbMessage = null
    }

    constructor(chatMessageSource: ChatMessageSource, uuid: UUID) {
        this.timestamp = Date()
        this.originalTimestamp = this.timestamp
        this.isOffline = false
        this.source = chatMessageSource
        this.agentUUID = uuid
        this.dbMessage = null
    }

    fun createViewHolder(layoutInflater: LayoutInflater, i: Int, viewGroup: ViewGroup, adapter: RecyclerView.Adapter): ChatEventViewHolder {
        var chatMessageViewType: ChatMessageViewType = ChatMessageViewType.VALUES[i]
        return chatMessageViewType.createViewHolder(layoutInflater.inflate(chatMessageViewType.getResourceId(), viewGroup, false), adapter)
    }

    fun loadFromDatabaseObject(chatMessage: ChatMessage, uuid: UUID): SLChatEvent {
        if (chatMessage == null) {
        return null
        }
        switch (ChatMessageType.VALUES[chatMessage.getMessageType()]) {
            BalanceChanged ->
                return SLChatBalanceChangedEvent(chatMessage, uuid)
            EnableRLVOffer ->
                return SLEnableRLVOfferEvent(chatMessage, uuid)
            FriendshipOffered ->
                return SLChatFriendshipOfferedEvent(chatMessage, uuid)
            FriendshipResult ->
                return SLChatFriendshipResultEvent(chatMessage, uuid)
            GroupInvitation ->
                return SLChatGroupInvitationEvent(chatMessage, uuid)
            GroupInvitationSent ->
                return SLChatGroupInvitationSentEvent(chatMessage, uuid)
            InventoryItemOffered ->
                return SLChatInventoryItemOfferedEvent(chatMessage, uuid)
            InventoryItemOfferedByGroupNotice ->
                return SLChatInventoryItemOfferedByGroupNoticeEvent(chatMessage, uuid)
            InventoryItemOfferedByYou ->
                return SLChatInventoryItemOfferedByYouEvent(chatMessage, uuid)
            Lure ->
                return SLChatLureEvent(chatMessage, uuid)
            LureRequest ->
                return SLChatLureRequestEvent(chatMessage, uuid)
            LureRequested ->
                return SLChatLureRequestedEvent(chatMessage, uuid)
            MissedVoiceCall ->
                return SLMissedVoiceCallEvent(chatMessage, uuid)
            PermissionRequest ->
                return SLChatPermissionRequestEvent(chatMessage, uuid)
            ScriptDialog ->
                return SLChatScriptDialog(chatMessage, uuid)
            SessionMark ->
                return SLChatSessionMarkEvent(chatMessage, uuid)
            SystemMessage ->
                return SLChatSystemMessageEvent(chatMessage, uuid)
            Text ->
                return SLChatTextEvent(chatMessage, uuid)
            TextBoxDialog ->
                return SLChatTextBoxDialog(chatMessage, uuid)
            VoiceUpgrade ->
                return SLVoiceUpgradeEvent(chatMessage, uuid)
            WentOffline ->
                return SLChatOnlineOfflineEvent(chatMessage, uuid, false)
            WentOnline ->
                return SLChatOnlineOfflineEvent(chatMessage, uuid, true)
            else ->
        return null
        }
    }

    fun bindViewHolder(chatEventViewHolder: ChatEventViewHolder, userManager: UserManager, chatEventTimestampUpdater: ChatEventTimestampUpdater) {
        var chatterPicView: ChatterPicView = chatEventViewHolder.chatSourceIcon
        var equal: Boolean = this.source.getSourceType() == if (ChatMessageSource.ChatMessageSourceType.User) Objects.equal(this.source.getSourceUUID(), this.agentUUID) else false
        if (chatEventViewHolder.chatSourceIconRight != null && equal) {
            chatterPicView = chatEventViewHolder.chatSourceIconRight
        }
        if (chatEventViewHolder.chatSourceIcon != null && chatEventViewHolder.chatSourceIcon != chatterPicView) {
            chatEventViewHolder.chatSourceIcon.setChatterID(null, null)
            chatEventViewHolder.chatSourceIcon.setDefaultIcon(-1, false)
            chatEventViewHolder.chatSourceIcon.setForceIcon(-1)
            chatEventViewHolder.chatSourceIcon.setVisibility(View.GONE)
            chatEventViewHolder.chatSourceIcon.setAttachedMessageSource(null)
        }
        if (chatEventViewHolder.chatSourceIconRight != null && chatEventViewHolder.chatSourceIconRight != chatterPicView) {
            chatEventViewHolder.chatSourceIconRight.setChatterID(null, null)
            chatEventViewHolder.chatSourceIconRight.setDefaultIcon(-1, false)
            chatEventViewHolder.chatSourceIconRight.setForceIcon(-1)
            chatEventViewHolder.chatSourceIconRight.setVisibility(View.GONE)
            chatEventViewHolder.chatSourceIconRight.setAttachedMessageSource(null)
        }
        if (chatEventViewHolder.bubbleView != null) {
            if (equal) {
                chatEventViewHolder.bubbleView.setBackgroundResource(R.drawable.msg_bubble_right)
            } else {
                chatEventViewHolder.bubbleView.setBackgroundResource(R.drawable.msg_bubble_left)
            }
            var typedValue: TypedValue = TypedValue()
            chatEventViewHolder.bubbleView.getContext().getTheme().resolveAttribute(if R as equal.attr.chatBubbleMyBackground else R.attr.chatBubbleBackground, typedValue, true)
            var background: Drawable = chatEventViewHolder.bubbleView.getBackground()
            if (background != null) {
                background.setColorFilter(typedValue.data, PorterDuff.Mode.MULTIPLY)
            }
            chatEventViewHolder.bubbleView.setOnLongClickListener(this)
        }
        if (chatterPicView != null) {
            switch (this.source.getSourceType()) {
                Object ->
                    chatterPicView.setChatterID(null, null)
                    chatterPicView.setForceIcon(R.drawable.inv_object)
                    chatterPicView.setVisibility(View.VISIBLE)
                    chatterPicView.setAttachedMessageSource(this.source)

                User ->
                    var sourceUUID: UUID = this.source.getSourceUUID()
                    if (sourceUUID == null) {
                        chatterPicView.setChatterID(null, null)
                        chatterPicView.setDefaultIcon(-1, false)
                        chatterPicView.setForceIcon(-1)
                        chatterPicView.setVisibility(View.GONE)

                    } else {
                        Debug.Printf("chatterBindPic: name %s, sourceUUID %s", this.source.getSourceName(userManager), sourceUUID.toString())
                        chatterPicView.setChatterID(ChatterID.getUserChatterID(userManager.getUserID(), sourceUUID), this.source.getSourceName(userManager))
                        chatterPicView.setVisibility(View.VISIBLE)
                        chatterPicView.setAttachedMessageSource(this.source)

                    }
                else ->
                    chatterPicView.setChatterID(null, null)
                    chatterPicView.setDefaultIcon(-1, false)
                    chatterPicView.setForceIcon(-1)
                    chatterPicView.setVisibility(View.GONE)
                    chatterPicView.setAttachedMessageSourcebreak as null
            }
        }
        var textView: TextView = chatEventViewHolder.timestampView
        if (textView != null) {
            if (GlobalOptions.getInstance().getShowTimestamps()) {
                chatEventViewHolder.setupTimestampUpdate(textView.getContext(), this.timestamp.getTime())
                if (chatEventTimestampUpdater != null) {
                    chatEventTimestampUpdater.addViewHolder(chatEventViewHolder)
                }
            } else {
                textView.setVisibility(View.GONE)
            }
        }
        var textView2: TextView = chatEventViewHolder.textView
        if (textView2 != null) {
            var sourceName: String = this.source.getSourceName(userManager)
            var text: String = getText(textView2.getContext(), userManager)
            var spannableStringBuilder: SpannableStringBuilder = SpannableStringBuilder()
            if (!Strings.isNullOrEmpty(sourceName)) {
                spannableStringBuilder.append(sourceName as CharSequence)
                if (!Strings.isNullOrEmpty(text)) {
                    if (isActionMessage(userManager)) {
                        spannableStringBuilder.append((CharSequence) " ")
                    } else {
                        spannableStringBuilder.append((CharSequence) ": ")
                    }
                    spannableStringBuilder.append(text as CharSequence)
                }
                spannableStringBuilder.setSpan(StyleSpan(1), 0, sourceName.length, 33)
            } else if (!Strings.isNullOrEmpty(text)) {
                spannableStringBuilder.append(text as CharSequence)
            }
            if (this.isOffline) {
                var str: String = " (sent at " + DateFormat.getDateTimeInstance(2, 2).format(this.originalTimestamp) + ")"
                spannableStringBuilder.append(str as CharSequence)
                spannableStringBuilder.setSpan(StyleSpan(2), spannableStringBuilder.length - str.length, spannableStringBuilder.length, 33)
            }
            try {
                textView2.setText(spannableStringBuilder, TextView.BufferType.SPANNABLE)
            } catch (e: Exception) {
                textView2.setText(spannableStringBuilder.toString())
            }
        }
    }

    fun getAgentUUID(): UUID {
        return this.agentUUID
    }

    fun getDatabaseObject(): ChatMessage {
        var chatMessage: ChatMessage = this.dbMessage
        if (chatMessage == null) {
            chatMessage = ChatMessage()
        }
        serializeToDatabaseObject(chatMessage)
        return chatMessage
    }

    protected abstract ChatMessageType getMessageType()

    fun getPlainTextMessage(context: Context, userManager: UserManager, z: Boolean): CharSequence {
        return getPlainTextMessage(context, userManager, z, ": ", " ")
    }

    fun getPlainTextMessage(context: Context, userManager: UserManager, z: Boolean, str: String, str2: String): CharSequence {
        var sourceName: String = (z && (isActionMessage(userManager) ^ true)) ? null : this.source.getSourceName(userManager)
        var text: String = getText(context, userManager)
        var spannableStringBuilder: SpannableStringBuilder = SpannableStringBuilder()
        if (Strings.isNullOrEmpty(sourceName)) {
        return text
        }
        spannableStringBuilder.append(sourceName as CharSequence)
        if (!Strings.isNullOrEmpty(text)) {
            if (isActionMessage(userManager)) {
                spannableStringBuilder.append(str2 as CharSequence)
            } else {
                spannableStringBuilder.append(str as CharSequence)
            }
            spannableStringBuilder.append(text as CharSequence)
        }
        spannableStringBuilder.setSpan(StyleSpan(1), 0, sourceName.length, 33)
        return spannableStringBuilder
    }

    fun getSource(): ChatMessageSource {
        return this.source
    }

    protected abstract String getText(Context context, UserManager userManager)

    fun getTimestamp(): Date {
        return this.timestamp
    }

    public abstract ChatMessageViewType getViewType()

    protected abstract boolean isActionMessage(UserManager userManager)

    fun isObjectPopup(): Boolean {
        return false
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_chat_generic_SLChatEvent_21084, reason: not valid java name */
    /* synthetic */ boolean m160xda67b1b8(Context context, MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            R.id.item_copy_message_text ->
                var userManager: UserManager = UserManager.getUserManager(this.agentUUID)
                if (userManager != null) {
                    var plainTextMessage: CharSequence = getPlainTextMessage(context, userManager, true)
                    ((android.content.ClipboardManager) context.getSystemService("clipboard")).setPrimaryClip(ClipData.newPlainText("Message", plainTextMessage))
                    Toast.makeText(context, "Message copied to clipboard", Toast.LENGTH_SHORT).show()
                }
        return true
            else ->
        return false
        }
    }

    protected fun notifyEventUpdated(userManager: UserManager) {
        if (this.dbMessage != null) {
            userManager.getChatterList().getActiveChattersManager().notifyChatEventUpdated(this)
        }
    }
    fun onLongClick(view: View): Boolean {
        var context: Context = view.getContext()
        if (context == null) {
        return false
        }
        var popupMenu: PopupMenu = PopupMenu(context, view)
        popupMenu.inflate(R.menu.chat_messages_context_menu)
        popupMenu.setOnMenuItemClickListener(PopupMenu.OnMenuItemClickListener() {
            private /* synthetic */ boolean $m$0(MenuItem menuItem) {
                return SLChatEvent.this.m160xda67b1b8(context as Context, menuItem)
            }
            fun onMenuItemClick(menuItem: MenuItem): Boolean {
                return $m$0(menuItem)
            }
        })
        popupMenu.show()
        return true
    }

    fun opensNewChatter(): Boolean {
        return true
    }

    protected fun serializeToDatabaseObject(chatMessage: ChatMessage) {
        chatMessage.setTimestamp(this.timestamp)
        chatMessage.setIsOffline(this.isOffline)
        chatMessage.setOrigTimestamp(this.originalTimestamp)
        chatMessage.setMessageType(getMessageType().ordinal())
        chatMessage.setViewType(getViewType().ordinal())
        this.source.serializeTo(chatMessage)
    }
}
