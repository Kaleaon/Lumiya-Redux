package com.lumiyaviewer.lumiya.slproto.users.manager;

import com.lumiyaviewer.lumiya.react.Subscription;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.voice.common.model.VoiceChatInfo;
import javax.annotation.Nonnull;

class ChatterSubscription {

    @Nonnull
    private final SortedChatterList chatterList;

    @Nonnull
    ChatterDisplayData displayData;

    @Nonnull
    private final Subscription<ChatterID, UnreadMessageInfo> unreadCountSubscription;

    @Nonnull
    private final Subscription<ChatterID, VoiceChatInfo> voiceChatInfoSubscription;
    private final Subscription.OnData<VoiceChatInfo> onVoiceStatusChanged = new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            ChatterSubscription.this.onVoiceChatInfoChanged((VoiceChatInfo) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    };
    private final Subscription.OnData<UnreadMessageInfo> onUnreadCount = new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            ChatterSubscription.this.onUnreadCountChanged((UnreadMessageInfo) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    };
    boolean isValid = true;

    ChatterSubscription(@Nonnull SortedChatterList sortedChatterList, @Nonnull ChatterID chatterID, @Nonnull UserManager userManager) {
        this.chatterList = sortedChatterList;
        this.displayData = new ChatterDisplayData(chatterID, null, false, 0, null, Float.NaN, false);
        this.unreadCountSubscription = userManager.getChatterList().getActiveChattersManager().getUnreadCounts().subscribe(chatterID, this.onUnreadCount);
        this.voiceChatInfoSubscription = userManager.getVoiceChatInfo().subscribe(chatterID, this.onVoiceStatusChanged);
        sortedChatterList.addChatter(this.displayData);
    }

    public void onUnreadCountChanged(UnreadMessageInfo unreadMessageInfo) {
        if (unreadMessageInfo != null) {
            setChatterDisplayData(this.displayData.withUnreadInfo(unreadMessageInfo));
        }
    }

    public void onVoiceChatInfoChanged(VoiceChatInfo voiceChatInfo) {
        boolean z = false;
        ChatterDisplayData chatterDisplayData = this.displayData;
        if (voiceChatInfo != null && voiceChatInfo.state != VoiceChatInfo.VoiceChatState.None) {
            z = true;
        }
        setChatterDisplayData(chatterDisplayData.withVoiceActive(z));
    }

    public void dispose() {
        unsubscribe();
        this.chatterList.removeChatter(this.displayData);
    }

    void setChatterDisplayData(@Nonnull ChatterDisplayData chatterDisplayData) {
        ChatterDisplayData displayData = this.displayData;
        this.displayData = chatterDisplayData;
        this.chatterList.replaceChatter(displayData, this.displayData);
    }

    public void unsubscribe() {
        this.unreadCountSubscription.unsubscribe();
        this.voiceChatInfoSubscription.unsubscribe();
    }
}
