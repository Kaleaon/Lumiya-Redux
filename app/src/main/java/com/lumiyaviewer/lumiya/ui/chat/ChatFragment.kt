package com.lumiyaviewer.lumiya.ui.chat

import android.app.AlertDialog
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
import com.lumiyaviewer.lumiya.ui.common.ChatterFragment
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.common.UserFunctionsFragment
import com.lumiyaviewer.lumiya.ui.objects.ObjectDetailsFragment
import com.lumiyaviewer.lumiya.ui.render.CardboardActivity
import com.lumiyaviewer.lumiya.ui.voice.VoiceStatusView
import com.lumiyaviewer.lumiya.voice.common.model.VoiceChatInfo
import java.util.UUID

class ChatFragment : UserFunctionsFragment(), View.OnClickListener, View.OnKeyListener, ChatRecyclerAdapter.OnAdapterDataChanged, ChatRecyclerAdapter.OnUserPicClickedListener {
    companion object {
        private const val PERMISSION_REQUEST_CODE = 500
        private const val typingTimeout = 5000L

        @JvmStatic
        fun makeSelection(chatterID: ChatterID?): Bundle {
            val makeSelection = ChatterFragment.makeSelection(chatterID)
            makeSelection.putParcelable(ChatterFragment.CHATTER_ID_KEY, chatterID)
            return makeSelection
        }
    }

    private var lastTypingEventSent: Long = 0
    private var vrMode = false

    private var layoutManager: ChatLayoutManager? = null

    private var adapter: ChatRecyclerAdapter? = null
    private var scrollToBottomNeeded = false
    private var hasMoreItems = false

    private var typingNotifiedChatter: ChatterID? = null

    private var markDisplayedChatterID: ChatterID? = null

    private var exportChatHistoryMenuItem: MenuItem? = null

    private var clearChatHistoryMenuItem: MenuItem? = null

    private val agentCircuit = SubscriptionData<UUID, SLAgentCircuit>(
        UIThreadExecutor.getInstance(),
        onData = { obj -> onAgentCircuit(obj) }
    )
    private val voiceActiveChatter = SubscriptionData<SubscriptionSingleKey, ChatterID>(
        UIThreadExecutor.getInstance(),
        onData = { obj -> onVoiceActiveChatter(obj) }
    )
    private val voiceChatInfo = SubscriptionData<ChatterID, VoiceChatInfo>(
        UIThreadExecutor.getInstance(),
        onData = { obj -> onVoiceChatInfo(obj) }
    )
    private val scrollListener = object : RecyclerView.OnScrollListener() {
        override fun onScrollStateChanged(recyclerView: RecyclerView, i: Int) {
            if (i == 0 || i == 1) {
                this@ChatFragment.scrollToBottomNeeded = false
            }
        }

        override fun onScrolled(recyclerView: RecyclerView, i: Int, i2: Int) {
            this@ChatFragment.updateVisibleRange()
        }
    }
    private var updateRunnablePosted = false
    private val mHandler = Handler(Looper.getMainLooper())
    private val updateVisibleRangeRunnable: Runnable = Runnable {
        updateRunnablePosted = false
        val view = view
        val adapter = this.adapter
        val layoutManager = this.layoutManager
        if (adapter == null || layoutManager == null || view == null) {
            return@Runnable
        }
        val recyclerView = view.findViewById<RecyclerView>(R.id.chatLogView)
        Debug.Printf("UpdateVisibleRange: pending %b, first %d, last %d", recyclerView.hasPendingAdapterUpdates(), layoutManager.findFirstVisibleItemPosition(), layoutManager.findLastVisibleItemPosition())
        if (recyclerView.hasPendingAdapterUpdates()) {
            updateRunnablePosted = true
            mHandler.post(updateVisibleRangeRunnable)
            return@Runnable
        }
        updateHasMoreItems()
        var findFirstVisibleItemPosition = layoutManager.findFirstVisibleItemPosition()
        var findLastVisibleItemPosition = layoutManager.findLastVisibleItemPosition()
        if (scrollToBottomNeeded) {
            findLastVisibleItemPosition = adapter.itemCount - 1
        }
        adapter.setVisibleRange(findFirstVisibleItemPosition, findLastVisibleItemPosition)
    }
    private var scrollToBottomRunnablePosted = false
    private var scrollToBottomForceDown = false
    private val scrollToBottomRunnable: Runnable = Runnable {
        scrollToBottomRunnablePosted = false
        val view = view
        if (view != null) {
            val recyclerView = view.findViewById<RecyclerView>(R.id.chatLogView)
            if (recyclerView.hasPendingAdapterUpdates()) {
                scrollToBottomRunnablePosted = true
                mHandler.post(scrollToBottomRunnable)
                return@Runnable
            }
            val adapter = this.adapter
            val layoutManager = this.layoutManager
            if (adapter == null || layoutManager == null) {
                return@Runnable
            }
            if (scrollToBottomForceDown && adapter.hasMoreItemsAtBottom()) {
                scrollToBottomNeeded = false
                adapter.restartAtBottom()
            }
            val itemCount = adapter.itemCount
            if (itemCount > 0) {
                layoutManager.setScrollMode(scrollToBottomForceDown)
                recyclerView.smoothScrollToPosition(itemCount - 1)
                scrollToBottomNeeded = true
                scrollToBottomForceDown = false
            }
        }
    }
    private val textWatcher = object : TextWatcher {
        override fun afterTextChanged(editable: Editable?) {
        }

        override fun beforeTextChanged(charSequence: CharSequence?, i: Int, i2: Int, i3: Int) {
        }

        override fun onTextChanged(charSequence: CharSequence?, i: Int, i2: Int, i3: Int) {
            if ((charSequence?.length ?: 0) != 0) {
                setTypingNotify(true)
            } else {
                setTypingNotify(false)
            }
        }
    }

    private fun clearChatHistory() {
        AlertDialog.Builder(requireContext()).setMessage(R.string.clear_chat_history_confirm).setCancelable(true)
            .setPositiveButton("Yes") { dialogInterface, _ ->
                val chatterID = this.chatterID
                if (chatterID != null) {
                    val userManager = chatterID.getUserManager()
                    if (userManager != null) {
                        userManager.getChatterList().getActiveChattersManager().clearChatHistory(chatterID)
                    }
                    dialogInterface.dismiss()
                }
            }
            .setNegativeButton("No") { dialogInterface, _ -> dialogInterface.cancel() }
            .create().show()
    }

    private fun exportChatHistory() {
        val chatterID = this.chatterID
        if (chatterID != null) {
            if (ContextCompat.checkSelfPermission(requireContext(), "android.permission.WRITE_EXTERNAL_STORAGE") != 0) {
                ActivityCompat.requestPermissions(requireActivity(), arrayOf("android.permission.WRITE_EXTERNAL_STORAGE"), PERMISSION_REQUEST_CODE)
            } else {
                ExportChatHistoryTask(requireActivity()).execute(chatterID)
            }
        }
    }

    fun onAgentCircuit(agentCircuit: SLAgentCircuit?) {
        val view = view
        if (view != null) {
            Debug.Printf("agentCircuit is now %s", if (agentCircuit != null) "present" else "not present")
            view.findViewById<View>(R.id.sendMessageButton).visibility = if (agentCircuit == null || vrMode) View.GONE else View.VISIBLE
            view.findViewById<View>(R.id.chat_speak_button).visibility = if (agentCircuit == null || !vrMode) View.GONE else View.VISIBLE
        }
    }

    fun onVoiceActiveChatter(chatterID: ChatterID?) {
        val userManager = this.userManager
        if (chatterID == null || userManager == null || !vrMode) {
            voiceChatInfo.unsubscribe()
        } else {
            voiceChatInfo.subscribe(userManager.getVoiceChatInfo(), chatterID)
        }
        updateVrModeControls()
    }

    fun onVoiceChatInfo(voiceChatInfo: VoiceChatInfo?) {
        updateVrModeControls()
    }

    private fun scrollToBottom(z: Boolean) {
        if (view == null || scrollToBottomRunnablePosted) {
            return
        }
        scrollToBottomNeeded = true
        scrollToBottomRunnablePosted = true
        scrollToBottomForceDown = scrollToBottomForceDown || z
        mHandler.post(scrollToBottomRunnable)
    }

    private fun sendMessage() {
        setTypingNotify(false)
        val view = view
        val chatterID = this.chatterID
        if (chatterID == null || view == null) {
            return
        }
        val charSequence = view.findViewById<TextView>(R.id.sendMessageText).text.toString()
        if (charSequence == "") {
            return
        }
        val userManager = this.userManager
        if (userManager != null) {
            val activeAgentCircuit = userManager.getActiveAgentCircuit()
            if (activeAgentCircuit != null) {
                activeAgentCircuit.SendChatMessage(chatterID, charSequence)
                view.findViewById<TextView>(R.id.sendMessageText).text = ""
            }
        }
        scrollToBottom(false)
    }

    private fun sendTypingNotify(chatterID: ChatterID?, z: Boolean): Boolean {
        if (chatterID !is ChatterID.ChatterIDUser) {
            return false
        }
        val userManager = chatterID.getUserManager() ?: return false
        val activeAgentCircuit = userManager.getActiveAgentCircuit() ?: return false
        activeAgentCircuit.sendTypingNotify(chatterID.getChatterUUID(), z)
        return true
    }

    fun setTypingNotify(typingNotify: Boolean) {
        if (!typingNotify) {
            val typingNotifiedChatter = this.typingNotifiedChatter
            if (typingNotifiedChatter != null) {
                sendTypingNotify(typingNotifiedChatter, false)
                this.typingNotifiedChatter = null
            }
            return
        }
        val currentTimeMillis = System.currentTimeMillis()
        if (Objects.equal(this.chatterID, this.typingNotifiedChatter)) {
            val typingNotifiedChatter = this.typingNotifiedChatter
            if (typingNotifiedChatter == null || currentTimeMillis < this.lastTypingEventSent + typingTimeout) {
                return
            }
            this.lastTypingEventSent = currentTimeMillis
            sendTypingNotify(typingNotifiedChatter, true)
            return
        }
        val typingNotifiedChatter = this.typingNotifiedChatter
        if (typingNotifiedChatter != null) {
            sendTypingNotify(typingNotifiedChatter, false)
            this.typingNotifiedChatter = null
        }
        if (sendTypingNotify(this.chatterID, true)) {
            this.typingNotifiedChatter = this.chatterID
            this.lastTypingEventSent = currentTimeMillis
        }
    }

    private fun updateChatHistoryExists() {
        val z = this.adapter?.let { it.itemCount != 0 } ?: false
        Debug.Printf("ChatHistory: chat history exists %b", z)
        this.clearChatHistoryMenuItem?.isVisible = z
        this.exportChatHistoryMenuItem?.isVisible = z
    }

    fun updateHasMoreItems() {
        val view = view
        if (view != null) {
            this.hasMoreItems = false
            val layoutManager = this.layoutManager
            val adapter = this.adapter
            if (layoutManager != null && adapter != null) {
                val itemCount = adapter.itemCount
                var findLastVisibleItemPosition = layoutManager.findLastVisibleItemPosition()
                if (this.scrollToBottomNeeded) {
                    findLastVisibleItemPosition = adapter.itemCount - 1
                }
                if (itemCount > 1 && findLastVisibleItemPosition != -1) {
                    this.hasMoreItems = if (findLastVisibleItemPosition >= itemCount - 2) adapter.hasMoreItemsAtBottom() else true
                }
            }
            view.findViewById<View>(R.id.scroll_to_bottom_btn).visibility = if (this.hasMoreItems) View.VISIBLE else View.GONE
        }
    }

    fun updateVisibleRange() {
        if (this.adapter == null || this.layoutManager == null || view == null || this.updateRunnablePosted) {
            return
        }
        this.updateRunnablePosted = true
        mHandler.post(updateVisibleRangeRunnable)
    }

    private fun updateVrModeControls() {
        var z: Boolean
        var z2 = true
        val view = view
        if (view != null) {
            if (!this.vrMode) {
                view.findViewById<View>(R.id.chat_vr_mode_controls).visibility = View.GONE
                return
            }
            view.findViewById<View>(R.id.chat_vr_mode_controls).visibility = View.VISIBLE
            if (isVoiceLoggedIn()) {
                if (this.voiceActiveChatter.getData() != null) {
                    val data = this.voiceChatInfo.getData()
                    z = !(data == null || data.state == VoiceChatInfo.VoiceChatState.None)
                } else {
                    z = false
                }
                val chatterID = this.chatterID
                val userManager = this.userManager
                if (z) {
                    z2 = false
                } else if (chatterID == null || userManager == null) {
                    z2 = false
                } else if (chatterID is ChatterID.ChatterIDLocal) {
                    val currentLocationInfoSnapshot = userManager.getCurrentLocationInfoSnapshot()
                    if (currentLocationInfoSnapshot == null || currentLocationInfoSnapshot.parcelVoiceChannel() == null) {
                        z2 = false
                    }
                }
            } else {
                z = false
                z2 = false
            }
            view.findViewById<View>(R.id.chat_speak_button).visibility = if (z) View.GONE else View.VISIBLE
            view.findViewById<View>(R.id.chat_voice_call_button).visibility = if (z2) View.VISIBLE else View.GONE
        }
    }

    override fun onAdapterDataAddedAtEnd() {
        val layoutManager = this.layoutManager
        if (layoutManager != null && (!this.hasMoreItems || layoutManager.isSmoothScrolling || this.scrollToBottomNeeded)) {
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
        val view = view
        if (view != null) {
            val resolvedName = if (this.chatterID is ChatterID.ChatterIDLocal) "local chat" else chatterNameRetriever.getResolvedName()
            view.findViewById<EditText>(R.id.sendMessageText).hint = if (resolvedName != null) getString(R.string.chat_hint_message_format, resolvedName) else null
        }
    }

    override fun onClick(view: View) {
        when (view.id) {
            R.id.scroll_to_bottom_btn -> scrollToBottom(true)
            R.id.chat_speak_button -> {
                val activity = activity
                val chatterID = this.chatterID
                if (activity is CardboardActivity && chatterID != null) {
                    activity.startDictation(chatterID)
                }
            }
            R.id.chat_voice_call_button -> {
                val chatterID = this.chatterID
                if (chatterID != null) {
                    handleStartVoice(chatterID)
                }
            }
            R.id.sendMessageButton -> sendMessage()
        }
    }

    override fun onCreate(bundle: Bundle?) {
        super.onCreate(bundle)
        setHasOptionsMenu(true)
        val arguments = arguments
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

    override fun onCreateView(layoutInflater: LayoutInflater, viewGroup: ViewGroup?, bundle: Bundle?): View {
        super.onCreateView(layoutInflater, viewGroup, bundle)
        val inflate = layoutInflater.inflate(R.layout.chat, viewGroup, false)
        inflate.findViewById<View>(R.id.scroll_to_bottom_btn).setOnClickListener(this)
        val layoutManager = ChatLayoutManager(viewGroup!!.context, 1, false)
        this.layoutManager = layoutManager
        layoutManager.stackFromEnd = true
        val recyclerView = inflate.findViewById<RecyclerView>(R.id.chatLogView)
        recyclerView.setHasFixedSize(true)
        recyclerView.addOnScrollListener(this.scrollListener)
        recyclerView.layoutManager = layoutManager
        inflate.findViewById<View>(R.id.sendMessageButton).setOnClickListener(this)
        inflate.findViewById<View>(R.id.chat_speak_button).setOnClickListener(this)
        inflate.findViewById<View>(R.id.chat_voice_call_button).setOnClickListener(this)
        val editText = inflate.findViewById<EditText>(R.id.sendMessageText)
        editText.setOnKeyListener(this)
        editText.addTextChangedListener(this.textWatcher)
        editText.visibility = if (this.vrMode) View.GONE else View.VISIBLE
        inflate.findViewById<View>(R.id.sendMessageButton).visibility = if (this.vrMode) View.GONE else View.VISIBLE
        inflate.findViewById<View>(R.id.chat_vr_mode_controls).visibility = if (this.vrMode) View.VISIBLE else View.GONE
        return inflate
    }

    override fun onCurrentLocationChanged(currentLocationInfo: CurrentLocationInfo?) {
        super.onCurrentLocationChanged(currentLocationInfo)
        updateVrModeControls()
    }

    override fun onKey(view: View, i: Int, keyEvent: KeyEvent): Boolean {
        if (keyEvent.action == 0 && i == 66) {
            sendMessage()
            return true
        }
        if (view is TextView) {
            if (view.text.isNotEmpty()) {
                setTypingNotify(true)
            } else {
                setTypingNotify(false)
            }
        }
        return false
    }

    override fun onOptionsItemSelected(menuItem: MenuItem): Boolean {
        return when (menuItem.itemId) {
            R.id.item_chat_history_export -> {
                exportChatHistory()
                true
            }
            R.id.item_chat_history_clear -> {
                clearChatHistory()
                true
            }
            else -> super.onOptionsItemSelected(menuItem)
        }
    }

    override fun onPause() {
        val markDisplayedChatterID = this.markDisplayedChatterID
        if (markDisplayedChatterID != null) {
            val userManager = markDisplayedChatterID.getUserManager()
            if (userManager != null) {
                userManager.getChatterList().getActiveChattersManager().removeDisplayedChatter(markDisplayedChatterID)
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
        if (i == PERMISSION_REQUEST_CODE && ints.isNotEmpty() && ints[0] == 0) {
            ExportChatHistoryTask(requireActivity()).execute(this.chatterID)
        }
    }

    override fun onResume() {
        super.onResume()
        this.markDisplayedChatterID = this.chatterID
        val markDisplayedChatterID = this.markDisplayedChatterID
        if (markDisplayedChatterID != null) {
            val userManager = markDisplayedChatterID.getUserManager()
            if (userManager != null) {
                userManager.getChatterList().getActiveChattersManager().addDisplayedChatter(markDisplayedChatterID)
            }
        }
        updateVisibleRange()
        updateChatHistoryExists()
    }

    override fun onShowUser(chatterID: ChatterID?) {
        Debug.Printf("ChatFragment: displaying for user %s", chatterID)
        if (!Objects.equal(this.markDisplayedChatterID, chatterID) && isFragmentVisible()) {
            val oldMarkDisplayedChatterID = this.markDisplayedChatterID
            if (oldMarkDisplayedChatterID != null) {
                val userManager2 = oldMarkDisplayedChatterID.getUserManager()
                if (userManager2 != null) {
                    userManager2.getChatterList().getActiveChattersManager().removeDisplayedChatter(oldMarkDisplayedChatterID)
                }
            }
            this.markDisplayedChatterID = chatterID
            val newMarkDisplayedChatterID = this.markDisplayedChatterID
            if (newMarkDisplayedChatterID != null) {
                val userManager = newMarkDisplayedChatterID.getUserManager()
                if (userManager != null) {
                    userManager.getChatterList().getActiveChattersManager().addDisplayedChatter(newMarkDisplayedChatterID)
                }
            }
        }
        if (this.adapter != null) {
            this.adapter!!.stopLoading()
            this.adapter = null
        }
        val userManager = this.userManager
        if (chatterID == null || userManager == null) {
            this.agentCircuit.unsubscribe()
            this.voiceActiveChatter.unsubscribe()
            this.voiceChatInfo.unsubscribe()
        } else {
            this.agentCircuit.subscribe(UserManager.agentCircuits(), chatterID.agentUUID)
            val adapter = ChatRecyclerAdapter(activity, userManager, chatterID)
            this.adapter = adapter
            adapter.setOnUserPicClickedListener(this)
            if (this.vrMode) {
                this.voiceActiveChatter.subscribe(userManager.getVoiceActiveChatter(), SubscriptionSingleKey.Value)
            } else {
                this.voiceActiveChatter.unsubscribe()
            }
        }
        val view = view
        if (view != null) {
            val recyclerView = view.findViewById<RecyclerView>(R.id.chatLogView)
            Debug.Printf("ChatFragment: setting adapter to %s", this.adapter)
            recyclerView.adapter = this.adapter
            if (this.adapter != null) {
                this.adapter!!.startLoading(this)
            }
            val typingIndicatorView = view.findViewById<TypingIndicatorView?>(R.id.typing_indicator)
            typingIndicatorView?.setChatterID(chatterID)
            val voiceStatusView = view.findViewById<VoiceStatusView?>(R.id.voice_status_view)
            voiceStatusView?.setChatterID(chatterID)
            updateVisibleRange()
            updateChatHistoryExists()
            updateVrModeControls()
        }
        setTypingNotify(false)
    }

    override fun onUserPicClicked(chatMessageSource: ChatMessageSource) {
        val userManager = this.userManager
        if (userManager != null) {
            if (chatMessageSource.getSourceType() == ChatMessageSource.ChatMessageSourceType.User || chatMessageSource.getSourceType() == ChatMessageSource.ChatMessageSourceType.Group) {
                handleUserViewProfile(chatMessageSource.getDefaultChatter(userManager.getUserID()))
                return
            }
            if (chatMessageSource.getSourceType() == ChatMessageSource.ChatMessageSourceType.Object && chatMessageSource is ChatMessageSourceObject) {
                val data = this.agentCircuit.getData()
                if (data == null) {
                    return
                }
                val objectLocalID = data.getGridConnection().parcelInfo.getObjectLocalID(chatMessageSource.uuid)
                if (objectLocalID == -1) {
                    return
                }
                val activity = activity ?: return
                DetailsActivity.showEmbeddedDetails(activity, ObjectDetailsFragment::class.java, ObjectDetailsFragment.makeSelection(userManager.getUserID(), objectLocalID))
            }
        }
    }

    override fun onVoiceLoginStatusChanged(bool: Boolean?) {
        super.onVoiceLoginStatusChanged(bool)
        updateVrModeControls()
    }
}
