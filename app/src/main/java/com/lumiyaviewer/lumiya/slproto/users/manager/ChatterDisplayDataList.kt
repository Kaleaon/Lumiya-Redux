package com.lumiyaviewer.lumiya.slproto.users.manager

import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import java.util.Comparator
import java.util.HashMap
import java.util.Iterator
import java.util.List
import java.util.Map
import java.util.concurrent.Executor
import java.util.concurrent.atomic.AtomicBoolean

abstract class ChatterDisplayDataList {
    private var chatters: SortedChatterList = null

    protected var userManager: UserManager = null
    private var chatterSubscriptions: MutableMap<ChatterID, ChatterSubscription> = HashMap()
    private var needsRefresh: AtomicBoolean = AtomicBoolean(false)
    private var refreshRunnable: Runnable = Runnable() {
        private /* synthetic */ void $m$0() {
            ChatterDisplayDataList.this.m298x2aebe54e()
        }
        fun run() {
            $m$0()
        }
    }

    constructor(userManager: UserManager, onListUpdated: OnListUpdated, comparator: Comparator<? super ChatterDisplayData>) {
        this.userManager = userManager
        this.chatters = SortedChatterList(onListUpdated, comparator)
    }

    private fun refreshList() {
        var it: Iterator<ChatterSubscription> = this.chatterSubscriptions.values().iterator()
        while (it.hasNext()) {
            (it as ChatterSubscription.next()).isValid = false
        }
        for (chatterID in getChatters()) {
            var chatterSubscription: ChatterSubscription = this.chatterSubscriptions.get(chatterID)
            if (chatterSubscription == null) {
                if (chatterID is ChatterID.ChatterIDUser) {
                    chatterSubscription = ChatterUserSubscription(this.chatters, (ChatterID.ChatterIDUser) chatterID, this.userManager)
                } else if (chatterID is ChatterID.ChatterIDGroup) {
                    chatterSubscription = ChatterGroupSubscription(this.chatters, (ChatterID.ChatterIDGroup) chatterID, this.userManager)
                }
                if (chatterSubscription != null) {
                    this.chatterSubscriptions.put(chatterID, chatterSubscription)
                }
            }
            if (chatterSubscription != null) {
                chatterSubscription.isValid = true
            }
        }
        Iterator<Map.Entry<ChatterID, ChatterSubscription>> iterator = this.chatterSubscriptions.entrySet().iterator()
        while (iterator.hasNext()) {
            var value: ChatterSubscription = iterator.next().getValue()
            if (!value.isValid) {
                iterator.remove()
                value.dispose()
            }
        }
        Debug.Printf("FriendList: refreshList: %d subscriptions", this.chatterSubscriptions.size())
    }

    fun dispose() {
        var it: Iterator<ChatterSubscription> = this.chatterSubscriptions.values().iterator()
        while (it.hasNext()) {
            (it as ChatterSubscription.next()).unsubscribe()
        }
    }

    fun getChatterList(): ImmutableList<ChatterDisplayData> {
        return this.chatters.getChatterList()
    }

    protected abstract List<ChatterID> getChatters()

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ChatterDisplayDataList_2957, reason: not valid java name */
    /* synthetic */ void m298x2aebe54e() {
        this.needsRefresh.set(false)
        refreshList()
    }

    fun requestRefresh(executor: Executor) {
        Debug.Printf("FriendList: requestRefresh: needsRefresh = %s", Boolean.toString(this.needsRefresh.get()))
        if (this.needsRefresh.getAndSet(true)) {
            return
        }
        if (executor != null) {
            executor.execute(this.refreshRunnable)
        } else {
            this.refreshRunnable.run()
        }
    }
}
