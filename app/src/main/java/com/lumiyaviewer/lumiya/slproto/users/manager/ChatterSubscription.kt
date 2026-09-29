package com.lumiyaviewer.lumiya.slproto.users.manager

import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.voice.common.model.VoiceChatInfo

open class ChatterSubscription {

    private var chatterList: SortedChatterList? = null

    var displayData: ChatterDisplayData? = null

    private var unreadCountSubscription: Subscription<ChatterID, UnreadMessageInfo>? = null

    private var voiceChatInfoSubscription: Subscription<ChatterID, VoiceChatInfo>? = null
    private var onVoiceStatusChanged: Subscription.OnData<VoiceChatInfo> = Subscription.OnData() {
        private /* synthetic */ void $m$0(Object obj) {
            ChatterSubscription.this.onVoiceChatInfoChanged(obj as VoiceChatInfo)
        }
        fun onData(obj: Any) {
            $m$0(obj)
        }
    }
    private var onUnreadCount: Subscription.OnData<UnreadMessageInfo> = Subscription.OnData() {
        private /* synthetic */ void $m$0(Object obj) {
            ChatterSubscription.this.onUnreadCountChanged(obj as UnreadMessageInfo)
        }
        fun onData(obj: Any) {
            $m$0(obj)
        }
    }
    var isValid: Boolean = true

    constructor(sortedChatterList: SortedChatterList, chatterID: ChatterID, userManager: UserManager) {
        this.chatterList = sortedChatterList
        this.displayData = ChatterDisplayData(chatterID, null, false, 0, null, Float.NaN, false)
        this.unreadCountSubscription = userManager.getChatterList().getActiveChattersManager().getUnreadCounts().subscribe(chatterID, this.onUnreadCount)
        this.voiceChatInfoSubscription = userManager.getVoiceChatInfo().subscribe(chatterID, this.onVoiceStatusChanged)
        sortedChatterList.addChatter(this.displayData)
    }

    fun onUnreadCountChanged(unreadMessageInfo: UnreadMessageInfo) {
        if (unreadMessageInfo != null) {
            setChatterDisplayData(this.displayData.withUnreadInfo(unreadMessageInfo))
        }
    }

    fun onVoiceChatInfoChanged(voiceChatInfo: VoiceChatInfo) {
        var z: Boolean = false
        var chatterDisplayData: ChatterDisplayData = this.displayData
        if (voiceChatInfo != null && voiceChatInfo.state != VoiceChatInfo.VoiceChatState.None) {
            z = true
        }
        setChatterDisplayData(chatterDisplayData.withVoiceActive(z))
    }

    fun dispose() {
        unsubscribe()
        this.chatterList.removeChatter(this.displayData)
    }

    fun setChatterDisplayData(chatterDisplayData: ChatterDisplayData) {
        var displayData: ChatterDisplayData = this.displayData
        this.displayData = chatterDisplayData
        this.chatterList.replaceChatter(displayData, this.displayData)
    }

    fun unsubscribe() {
        this.unreadCountSubscription.unsubscribe()
        this.voiceChatInfoSubscription.unsubscribe()
    }
}
