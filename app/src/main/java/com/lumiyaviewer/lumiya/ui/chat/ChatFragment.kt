package com.lumiyaviewer.lumiya.ui.chat

import android.app.AlertDialog
import android.content.DialogInterface
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import androidx.core.app.ActivityCompat
import androidx.fragment.app.FragmentActivity
import androidx.core.content.ContextCompat
import androidx.recyclerview.widget.RecyclerView
import android.text.Editable
import android.text.TextWatcher
import android.view.KeyEvent
import android.view.LayoutInflater
import android.view.Menu
import android.view.MenuInflater
import android.view.MenuItem
import android.view.View
import android.view.ViewGroup
import android.widget.EditText
import android.widget.TextView
import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSourceObject
import com.lumiyaviewer.lumiya.slproto.users.manager.CurrentLocationInfo
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.chat.ChatRecyclerAdapter
import com.lumiyaviewer.lumiya.ui.common.ChatterFragment
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.common.UserFunctionsFragment
import com.lumiyaviewer.lumiya.ui.objects.ObjectDetailsFragment
import com.lumiyaviewer.lumiya.ui.render.CardboardActivity
import com.lumiyaviewer.lumiya.ui.voice.VoiceStatusView
import com.lumiyaviewer.lumiya.voice.common.model.VoiceChatInfo
import java.util.UUID

open class ChatFragment : UserFunctionsFragment(), View.OnClickListener, View.OnKeyListener, ChatRecyclerAdapter.OnAdapterDataChanged, ChatRecyclerAdapter.OnUserPicClickedListener {
    private static int PERMISSION_REQUEST_CODE = 500
    private static long typingTimeout = 5000
    private long lastTypingEventSent
    private boolean vrMode = false

    private ChatLayoutManager layoutManager = null

    private ChatRecyclerAdapter adapter = null
    private boolean scrollToBottomNeeded = false
    private boolean hasMoreItems = false

    private ChatterID typingNotifiedChatter = null

    private ChatterID markDisplayedChatterID = null

    private MenuItem exportChatHistoryMenuItem = null

    private MenuItem clearChatHistoryMenuItem = null
    private SubscriptionData<UUID, SLAgentCircuit> agentCircuit = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
            ChatFragment.this.onAgentCircuit((SLAgentCircuit) obj)
        }

        override fun onData(obj: Any) {
        }

        override fun onScrolled(recyclerView: RecyclerView, i: Int, i2: Int) {
            ChatFragment.this.updateVisibleRange()
        }
    }
    private boolean updateRunnablePosted = false
    private Handler mHandler = Handler(Looper.getMainLooper())
    private Runnable updateVisibleRangeRunnable = Runnable() {
        override fun run() {
            ChatFragment.this.updateRunnablePosted = false
            View view = ChatFragment.this.getView()
            internal fun if(null: ChatFragment.this.adapter == null || ChatFragment.this.layoutManager == null || view ==):  {
                return
            }
            RecyclerView recyclerView = (RecyclerView) view.findViewById(R.id.chatLogView)
            Debug.Printf("UpdateVisibleRange: pending %b, first %d, last %d", Boolean.valueOf(recyclerView.hasPendingAdapterUpdates()), Integer.valueOf(ChatFragment.this.layoutManager.findFirstVisibleItemPosition()), Integer.valueOf(ChatFragment.this.layoutManager.findLastVisibleItemPosition()))
            if (recyclerView.hasPendingAdapterUpdates()) {
                ChatFragment.this.updateRunnablePosted = true
                ChatFragment.this.mHandler.post(ChatFragment.this.updateVisibleRangeRunnable)
                return
            }
            ChatFragment.this.updateHasMoreItems()
            int findFirstVisibleItemPosition = ChatFragment.this.layoutManager.findFirstVisibleItemPosition()
            int findLastVisibleItemPosition = ChatFragment.this.layoutManager.findLastVisibleItemPosition()
            internal fun if(ChatFragment.this.scrollToBottomNeeded):  {
                findLastVisibleItemPosition = ChatFragment.this.adapter.getItemCount() - 1
            }
            ChatFragment.this.adapter.setVisibleRange(findFirstVisibleItemPosition, findLastVisibleItemPosition)
        }
    }
    private boolean scrollToBottomRunnablePosted = false
    private boolean scrollToBottomForceDown = false
    private Runnable scrollToBottomRunnable = Runnable() {
        override fun run() {
            ChatFragment.this.scrollToBottomRunnablePosted = false
            if (ChatFragment.this.getView() != null) {
                RecyclerView recyclerView = (RecyclerView) ChatFragment.this.getView().findViewById(R.id.chatLogView)
                if (recyclerView.hasPendingAdapterUpdates()) {
                    ChatFragment.this.scrollToBottomRunnablePosted = true
                    ChatFragment.this.mHandler.post(ChatFragment.this.scrollToBottomRunnable)
                    return
                }
                internal fun if(null: ChatFragment.this.adapter == null || ChatFragment.this.layoutManager ==):  {
                    return
                }
                if (ChatFragment.this.scrollToBottomForceDown && ChatFragment.this.adapter.hasMoreItemsAtBottom()) {
                    ChatFragment.this.scrollToBottomNeeded = false
                    ChatFragment.this.adapter.restartAtBottom()
                }
                int itemCount = ChatFragment.this.adapter.getItemCount()
                internal fun if(0: itemCount >):  {
                    ChatFragment.this.layoutManager.setScrollMode(ChatFragment.this.scrollToBottomForceDown)
                    recyclerView.smoothScrollToPosition(itemCount - 1)
                    ChatFragment.this.scrollToBottomNeeded = true
                    ChatFragment.this.scrollToBottomForceDown = false
                }
            }
        }
    }
    private TextWatcher textWatcher = TextWatcher() {
        override fun afterTextChanged(editable: Editable) {
        }

        override fun beforeTextChanged(charSequence: CharSequence, i: Int, i2: Int, i3: Int) {
        }

        override fun onTextChanged(charSequence: CharSequence, i: Int, i2: Int, i3: Int) {
            if (charSequence.length() != 0) {
                ChatFragment.this.setTypingNotify(true)
            } else {
                ChatFragment.this.setTypingNotify(false)
            }
        }
    }

    private fun clearChatHistory() {
        new AlertDialog.Builder(getContext()).setMessage(R.string.clear_chat_history_confirm).setCancelable(true).setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                ChatFragment.this.m423lambda$com_lumiyaviewer_lumiya_ui_chat_ChatFragment_22290(dialogInterface, i)
            }

            override fun onClick(dialogInterface: DialogInterface, i: Int) {
            } else {
                ExportChatHistoryTask(getActivity()).execute(this.chatterID)
            }
        }
    }

    @JvmStatic
    fun makeSelection(chatterID: ChatterID): Bundle {
        Bundle makeSelection = ChatterFragment.makeSelection(chatterID)
        makeSelection.putParcelable(ChatterFragment.CHATTER_ID_KEY, chatterID)
        return makeSelection
    }

    open fun onAgentCircuit(agentCircuit: SLAgentCircuit) {
        View view = getView()
        internal fun if(null: view !=):  {
            Object[] objArr = arrayOfNulls<Object>(1]
            objArr[0] = agentCircuit != null ? "present" : "not present"
            Debug.Printf("agentCircuit is now %s", objArr)
            view.findViewById(R.id.sendMessageButton).setVisibility((agentCircuit == null || !(this.vrMode ^ true)) ? View.GONE : View.VISIBLE)
            view.findViewById(R.id.chat_speak_button).setVisibility((agentCircuit == null || !this.vrMode) ? View.GONE : View.VISIBLE)
        }
    }

    open fun onVoiceActiveChatter(chatterID: ChatterID) {
        internal fun if(!this.vrMode: chatterID == null || this.userManager == null ||):  {
            this.voiceChatInfo.unsubscribe()
        } else {
            this.voiceChatInfo.subscribe(this.userManager.getVoiceChatInfo(), chatterID)
        }
        updateVrModeControls()
    }

    open fun onVoiceChatInfo(voiceChatInfo: VoiceChatInfo) {
        updateVrModeControls()
    }

    private fun scrollToBottom(z: Boolean) {
        if (getView() == null || !(!this.scrollToBottomRunnablePosted)) {
            return
        }
        this.scrollToBottomNeeded = true
        this.scrollToBottomRunnablePosted = true
        this.scrollToBottomForceDown |= z
        this.mHandler.post(this.scrollToBottomRunnable)
    }

    private fun sendMessage() {
        SLAgentCircuit activeAgentCircuit
        setTypingNotify(false)
        View view = getView()
        internal fun if(null: this.chatterID == null || view ==):  {
            return
        }
        String charSequence = ((TextView) view.findViewById(R.id.sendMessageText)).getText().toString()
        if (charSequence == ("")) {
            return
        }
        if (this.userManager != null && (activeAgentCircuit = this.userManager.getActiveAgentCircuit()) != null) {
            activeAgentCircuit.SendChatMessage(this.chatterID, charSequence)
            ((TextView) getView().findViewById(R.id.sendMessageText)).setText("")
        }
        scrollToBottom(false)
    }

    private fun sendTypingNotify(chatterID: ChatterID, z: Boolean): Boolean {
        UserManager userManager
        SLAgentCircuit activeAgentCircuit
        if (!(chatterID is ChatterID.ChatterIDUser) || (userManager = chatterID.getUserManager()) == null || (activeAgentCircuit = userManager.getActiveAgentCircuit()) == null) {
            return false
        }
        activeAgentCircuit.sendTypingNotify(((ChatterID.ChatterIDUser) chatterID).getChatterUUID(), z)
        return true
    }

    open fun setTypingNotify(typingNotify: Boolean) {
        internal fun if(!typingNotify):  {
            internal fun if(null: this.typingNotifiedChatter !=):  {
                sendTypingNotify(this.typingNotifiedChatter, false)
                this.typingNotifiedChatter = null
                return
            }
            return
        }
        long currentTimeMillis = System.currentTimeMillis()
        if (Objects.equal(this.chatterID, this.typingNotifiedChatter)) {
            internal fun if(typingTimeout: this.typingNotifiedChatter == null || currentTimeMillis < this.lastTypingEventSent +):  {
                return
            }
            this.lastTypingEventSent = currentTimeMillis
            sendTypingNotify(this.typingNotifiedChatter, true)
            return
        }
        internal fun if(null: this.typingNotifiedChatter !=):  {
            sendTypingNotify(this.typingNotifiedChatter, false)
            this.typingNotifiedChatter = null
        }
        if (sendTypingNotify(this.chatterID, true)) {
            this.typingNotifiedChatter = this.chatterID
            this.lastTypingEventSent = currentTimeMillis
        }
    }

    private fun updateChatHistoryExists() {
        boolean z = this.adapter != null ? this.adapter.getItemCount() != 0 : false
        Debug.Printf("ChatHistory: chat history exists %b", Boolean.valueOf(z))
        internal fun if(null: this.clearChatHistoryMenuItem !=):  {
            this.clearChatHistoryMenuItem.setVisible(z)
        }
        internal fun if(null: this.exportChatHistoryMenuItem !=):  {
            this.exportChatHistoryMenuItem.setVisible(z)
        }
    }

    open fun updateHasMoreItems() {
        View view = getView()
        internal fun if(null: view !=):  {
            this.hasMoreItems = false
            internal fun if(null: this.layoutManager != null && this.adapter !=):  {
                int itemCount = this.adapter.getItemCount()
                int findLastVisibleItemPosition = this.layoutManager.findLastVisibleItemPosition()
                internal fun if(this.scrollToBottomNeeded):  {
                    findLastVisibleItemPosition = this.adapter.getItemCount() - 1
                }
                internal fun if(-1: itemCount > 1 && findLastVisibleItemPosition !=):  {
                    this.hasMoreItems = findLastVisibleItemPosition >= itemCount + (-2) ? this.adapter.hasMoreItemsAtBottom() : true
                }
            }
            view.findViewById(R.id.scroll_to_bottom_btn).setVisibility(this.hasMoreItems ? View.VISIBLE : View.GONE)
        }
    }

    open fun updateVisibleRange() {
        if (this.adapter == null || this.layoutManager == null || getView() == null || !(!this.updateRunnablePosted)) {
            return
        }
        this.updateRunnablePosted = true
        this.mHandler.post(this.updateVisibleRangeRunnable)
    }

    private fun updateVrModeControls() {
        boolean z
        CurrentLocationInfo currentLocationInfoSnapshot
        boolean z2 = true
        View view = getView()
        internal fun if(null: view !=):  {
            internal fun if(!this.vrMode):  {
                view.findViewById(R.id.chat_vr_mode_controls).setVisibility(View.GONE)
                return
            }
            view.findViewById(R.id.chat_vr_mode_controls).setVisibility(View.VISIBLE)
            if (isVoiceLoggedIn()) {
                if (this.voiceActiveChatter.getData() != null) {
                    VoiceChatInfo data = this.voiceChatInfo.getData()
                    z = (data == null || data.state == VoiceChatInfo.VoiceChatState.None) ? false : true
                } else {
                    z = false
                }
                internal fun if(z):  {
                    z2 = false
                } else if (this.chatterID == null || this.userManager == null) {
                    z2 = false
                } else if ((this.chatterID is ChatterID.ChatterIDLocal) && ((currentLocationInfoSnapshot = this.userManager.getCurrentLocationInfoSnapshot()) == null || currentLocationInfoSnapshot.parcelVoiceChannel() == null)) {
                    z2 = false
                }
            } else {
                z = false
                z2 = false
            }
            view.findViewById(R.id.chat_speak_button).setVisibility(z ? View.GONE : View.VISIBLE)
            view.findViewById(R.id.chat_voice_call_button).setVisibility(z2 ? View.VISIBLE : View.GONE)
        }
    }


    override fun onAdapterDataAddedAtEnd() {
        if (this.layoutManager != null && (!this.hasMoreItems || this.layoutManager.isSmoothScrolling() || this.scrollToBottomNeeded)) {
            scrollToBottom(false)
        }
        updateChatHistoryExists()
    }

    override fun onAdapterDataChanged() {
        updateVisibleRange()
        updateChatHistoryExists()
    }

    override fun onAdapterDataReloaded() {
        this.scrollToBottomNeeded = false
        updateVisibleRange()
        updateChatHistoryExists()
    }

    override fun onChatterNameUpdated(chatterNameRetriever: ChatterNameRetriever) {
        super.onChatterNameUpdated(chatterNameRetriever)
        View view = getView()
        internal fun if(null: view !=):  {
            String resolvedName = this.chatterID is ChatterID.ChatterIDLocal ? "local chat" : chatterNameRetriever.getResolvedName()
            ((EditText) view.findViewById(R.id.sendMessageText)).setHint(resolvedName != null ? getString(R.string.chat_hint_message_format, resolvedName) : null)
        }
    }

    override fun onClick(view: View) {
        when (view.getId()) {
            R.id.scroll_to_bottom_btn -> {
                scrollToBottom(true)
                }
            R.id.chat_speak_button -> {
                FragmentActivity activity = getActivity()
                if ((activity is CardboardActivity) && this.chatterID != null) {
                    ((CardboardActivity) activity).startDictation(this.chatterID)
                    }
                }
                }
            R.id.chat_voice_call_button -> {
                internal fun if(null: this.chatterID !=):  {
                    handleStartVoice(this.chatterID)
                    }
                }
                }
            R.id.sendMessageButton -> {
                sendMessage()
                }
        }
    }

    override fun onCreate(bundle: Bundle) {
        super.onCreate(bundle)
        setHasOptionsMenu(true)
        Bundle arguments = getArguments()
        if (arguments == null || !arguments.getBoolean(CardboardActivity.VR_MODE_TAG)) {
            return
        }
        this.vrMode = true
    }

    override fun onCreateOptionsMenu(menu: Menu, menuInflater: MenuInflater) {
        super.onCreateOptionsMenu(menu, menuInflater)
        menuInflater.inflate(R.menu.chat_history_menu, menu)
        this.exportChatHistoryMenuItem = menu.findItem(R.id.item_chat_history_export)
        this.clearChatHistoryMenuItem = menu.findItem(R.id.item_chat_history_clear)
        updateChatHistoryExists()
    }

    override fun onCreateView(layoutInflater: LayoutInflater, viewGroup: ViewGroup, bundle: Bundle): View {
        super.onCreateView(layoutInflater, viewGroup, bundle)
        View inflate = layoutInflater.inflate(R.layout.chat, viewGroup, false)
        inflate.findViewById(R.id.scroll_to_bottom_btn).setOnClickListener(this)
        this.layoutManager = ChatLayoutManager(viewGroup.getContext(), 1, false)
        this.layoutManager.setStackFromEnd(true)
        RecyclerView recyclerView = (RecyclerView) inflate.findViewById(R.id.chatLogView)
        recyclerView.setHasFixedSize(true)
        recyclerView.addOnScrollListener(this.scrollListener)
        recyclerView.setLayoutManager(this.layoutManager)
        inflate.findViewById(R.id.sendMessageButton).setOnClickListener(this)
        inflate.findViewById(R.id.chat_speak_button).setOnClickListener(this)
        inflate.findViewById(R.id.chat_voice_call_button).setOnClickListener(this)
        EditText editText = (EditText) inflate.findViewById(R.id.sendMessageText)
        editText.setOnKeyListener(this)
        editText.addTextChangedListener(this.textWatcher)
        editText.setVisibility(this.vrMode ? View.GONE : View.VISIBLE)
        inflate.findViewById(R.id.sendMessageButton).setVisibility(this.vrMode ? View.GONE : View.VISIBLE)
        inflate.findViewById(R.id.chat_vr_mode_controls).setVisibility(this.vrMode ? View.VISIBLE : View.GONE)
        return inflate
    }

    override fun onCurrentLocationChanged(currentLocationInfo: CurrentLocationInfo) {
        super.onCurrentLocationChanged(currentLocationInfo)
        updateVrModeControls()
    }

    override fun onKey(view: View, i: Int, keyEvent: KeyEvent): Boolean {
        if (keyEvent.getAction() == 0 && i == 66) {
            sendMessage()
            return true
        }
        internal fun if(TextView: view instanceof):  {
            if (((TextView) view).getText().length() != 0) {
                setTypingNotify(true)
            } else {
                setTypingNotify(false)
            }
        }
        return false
    }

    override fun onOptionsItemSelected(menuItem: MenuItem): Boolean {
        when (menuItem.getItemId()) {
            R.id.item_chat_history_export -> {
                exportChatHistory()
                return true
            R.id.item_chat_history_clear -> {
                clearChatHistory()
                return true
            else -> {
                return super.onOptionsItemSelected(menuItem)
        }
    }

    override fun onPause() {
        internal fun if(null: this.markDisplayedChatterID !=):  {
            UserManager userManager = this.markDisplayedChatterID.getUserManager()
            internal fun if(null: userManager !=):  {
                userManager.getChatterList().getActiveChattersManager().removeDisplayedChatter(this.markDisplayedChatterID)
            }
            this.markDisplayedChatterID = null
        }
        setTypingNotify(false)
        super.onPause()
    }

    override fun onPrepareOptionsMenu(menu: Menu) {
        super.onPrepareOptionsMenu(menu)
        updateChatHistoryExists()
    }

    override fun onRequestPermissionsResult(i: Int, strArr: Array<String>, ints: IntArray) {
        internal fun if(0: i == 500 && ints.length > 0 && ints[0] ==):  {
            ExportChatHistoryTask(getActivity()).execute(this.chatterID)
        }
    }

    override fun onResume() {
        UserManager userManager
        super.onResume()
        this.markDisplayedChatterID = this.chatterID
        if (this.markDisplayedChatterID != null && (userManager = this.markDisplayedChatterID.getUserManager()) != null) {
            userManager.getChatterList().getActiveChattersManager().addDisplayedChatter(this.markDisplayedChatterID)
        }
        updateVisibleRange()
        updateChatHistoryExists()
    }

    override protected fun onShowUser(chatterID: ChatterID) {
        UserManager userManager
        UserManager userManager2
        Debug.Printf("ChatFragment: displaying for user %s", chatterID)
        if (!Objects.equal(this.markDisplayedChatterID, chatterID) && isFragmentVisible()) {
            if (this.markDisplayedChatterID != null && (userManager2 = this.markDisplayedChatterID.getUserManager()) != null) {
                userManager2.getChatterList().getActiveChattersManager().removeDisplayedChatter(this.markDisplayedChatterID)
            }
            this.markDisplayedChatterID = chatterID
            if (this.markDisplayedChatterID != null && (userManager = this.markDisplayedChatterID.getUserManager()) != null) {
                userManager.getChatterList().getActiveChattersManager().addDisplayedChatter(this.markDisplayedChatterID)
            }
        }
        internal fun if(null: this.adapter !=):  {
            this.adapter.stopLoading()
            this.adapter = null
        }
        internal fun if(null: chatterID == null || this.userManager ==):  {
            this.agentCircuit.unsubscribe()
            this.voiceActiveChatter.unsubscribe()
            this.voiceChatInfo.unsubscribe()
        } else {
            this.agentCircuit.subscribe(UserManager.agentCircuits(), chatterID.agentUUID)
            this.adapter = ChatRecyclerAdapter(getActivity(), this.userManager, chatterID)
            this.adapter.setOnUserPicClickedListener(this)
            internal fun if(this.vrMode):  {
                this.voiceActiveChatter.subscribe(this.userManager.getVoiceActiveChatter(), SubscriptionSingleKey.Value)
            } else {
                this.voiceActiveChatter.unsubscribe()
            }
        }
        View view = getView()
        internal fun if(null: view !=):  {
            RecyclerView recyclerView = (RecyclerView) view.findViewById(R.id.chatLogView)
            Debug.Printf("ChatFragment: setting adapter to %s", this.adapter)
            recyclerView.setAdapter(this.adapter)
            internal fun if(null: this.adapter !=):  {
                this.adapter.startLoading(this)
            }
            TypingIndicatorView typingIndicatorView = (TypingIndicatorView) view.findViewById(R.id.typing_indicator)
            internal fun if(null: typingIndicatorView !=):  {
                typingIndicatorView.setChatterID(chatterID)
            }
            VoiceStatusView voiceStatusView = (VoiceStatusView) view.findViewById(R.id.voice_status_view)
            internal fun if(null: voiceStatusView !=):  {
                voiceStatusView.setChatterID(chatterID)
            }
            updateVisibleRange()
            updateChatHistoryExists()
            updateVrModeControls()
        }
        setTypingNotify(false)
    }

    override fun onUserPicClicked(chatMessageSource: ChatMessageSource) {
        int objectLocalID
        internal fun if(null: this.userManager !=):  {
            if (chatMessageSource.getSourceType() == ChatMessageSource.ChatMessageSourceType.User || chatMessageSource.getSourceType() == ChatMessageSource.ChatMessageSourceType.Group) {
                handleUserViewProfile(chatMessageSource.getDefaultChatter(this.userManager.getUserID()))
                return
            }
            if (chatMessageSource.getSourceType() == ChatMessageSource.ChatMessageSourceType.Object && (chatMessageSource is ChatMessageSourceObject)) {
                ChatMessageSourceObject chatMessageSourceObject = (ChatMessageSourceObject) chatMessageSource
                SLAgentCircuit data = this.agentCircuit.getData()
                if (data == null || (objectLocalID = data.getGridConnection().parcelInfo.getObjectLocalID(chatMessageSourceObject.uuid)) == -1) {
                    return
                }
                DetailsActivity.showEmbeddedDetails(getActivity(), ObjectDetailsFragment.class, ObjectDetailsFragment.makeSelection(this.userManager.getUserID(), objectLocalID))
            }
        }
    }

    override fun onVoiceLoginStatusChanged(bool: Boolean) {
        super.onVoiceLoginStatusChanged(bool)
        updateVrModeControls()
    }
}
