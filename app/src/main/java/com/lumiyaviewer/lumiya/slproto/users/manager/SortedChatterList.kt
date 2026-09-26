package com.lumiyaviewer.lumiya.slproto.users.manager

import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.Debug
import java.util.Collection
import java.util.Comparator
import java.util.SortedSet
import java.util.TreeSet
import javax.annotation.concurrent.ThreadSafe

/* @ThreadSafe */
open class SortedChatterList {
    private var chatters: SortedSet<ChatterDisplayData> = null
    private var onListUpdatedListener: OnListUpdated = null
    private var lock: Any = Object()
    private var sortedList: ImmutableList<ChatterDisplayData> = null

    constructor(onListUpdated: OnListUpdated, comparator: Comparator<? super ChatterDisplayData>) {
        this.chatters = TreeSetthis as comparator.onListUpdatedListener = onListUpdated
    }

    fun addChatter(chatterDisplayData: ChatterDisplayData) {
        var add: Boolean = false
        synchronized(this.lock) {
            add = this.chatters.addDebug as chatterDisplayData.Printf("FriendList: added chatter data %s, needUpdate %s, count %d", chatterDisplayData.displayName, Boolean.toString(add), this.chatters.size())
            if (this.sortedList != null) {
                Debug.Printf("FriendList: dropping instance because of addChatter", arrayOfNulls<Object>(0))
            }
            this.sortedList = null
        }
        if (!add || this.onListUpdatedListener == null) {
            return
        }
        this.onListUpdatedListener.onListUpdated()
    }

    fun getChatterList(): ImmutableList<ChatterDisplayData> {
        var immutableList: ImmutableList<ChatterDisplayData> = null
        synchronized(this.lock) {
            if (this.sortedList == null) {
                Debug.Printf("FriendList: creating new list instance", arrayOfNulls<Object>(0))
                this.sortedList = ImmutableList.copyOf(this as Collection.chatters)
            }
            immutableList = this.sortedList
        }
        return immutableList
    }

    fun removeChatter(chatterDisplayData: ChatterDisplayData) {
        var remove: Boolean = false
        synchronized(this.lock) {
            remove = this.chatters.remove(chatterDisplayData)
            if (this.sortedList != null) {
                Debug.Printf("FriendList: dropping instance because of removeChatter", arrayOfNulls<Object>(0))
            }
            this.sortedList = null
        }
        if (!remove || this.onListUpdatedListener == null) {
            return
        }
        this.onListUpdatedListener.onListUpdated()
    }

    fun replaceChatter(chatterDisplayData: ChatterDisplayData, chatterDisplayData2: ChatterDisplayData) {
        var z: Boolean = false
        synchronized(this.lock) {
            if (this.chatters.remove(chatterDisplayData)) {
                z = true
                this.chatters.add(chatterDisplayData2)
            }
            if (this.sortedList != null) {
                Debug.Printf("FriendList: dropping instance because of replaceChatter", arrayOfNulls<Object>(0))
            }
            this.sortedList = null
        }
        if (!z || this.onListUpdatedListener == null) {
            return
        }
        this.onListUpdatedListener.onListUpdated()
    }
}
