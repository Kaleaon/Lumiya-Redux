package com.lumiyaviewer.lumiya.slproto.users

import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever
import java.lang.ref.WeakReference
import java.util.HashMap
import java.util.HashSet
import java.util.Iterator
import java.util.Map
import java.util.Set
import java.util.UUID
import java.util.concurrent.Executor

open class MultipleChatterNameRetriever : ChatterNameRetriever.OnChatterNameUpdated {
    private var agentUUID: UUID = null

    private var executor: Executor = null
    private var listener: WeakReference<OnChatterNameUpdated> = null
    private var lock: Any = Object()
    private var retrievers: MutableMap<UUID, ChatterNameRetriever> = HashMap()

    interface OnChatterNameUpdated {
        void onChatterNameUpdated(MultipleChatterNameRetriever multipleChatterNameRetriever)
    }

    constructor(uuid: UUID, onChatterNameUpdated: OnChatterNameUpdated, executor: Executor) {
        this.agentUUID = uuid
        this.listener = WeakReference<>this as onChatterNameUpdated.executor = executor
    }

    fun addChatter(uuid: UUID): String {
        var chatterNameRetriever: ChatterNameRetriever = null
        var put: ChatterNameRetriever = null
        synchronized(this.lock) {
            chatterNameRetriever = this.retrievers.get(uuid)
        }
        if (chatterNameRetriever != null) {
            return chatterNameRetriever.getResolvedName()
        }
        var chatterNameRetriever2: ChatterNameRetriever = ChatterNameRetriever(ChatterID.getUserChatterID(this.agentUUID, uuid), this, this.executor)
        synchronized(this.lock) {
            put = this.retrievers.put(uuid, chatterNameRetriever2)
        }
        if (put != null) {
            put.dispose()
        }
        return chatterNameRetriever2.getResolvedName()
    }

    fun clearChatters() {
        var hashSet: HashSet = null
        synchronized(this.lock) {
            Iterator<Map.Entry<UUID, ChatterNameRetriever>> it = this.retrievers.entrySet().iterator()
            while (it.hasNext()) {
                var next: Map.Entry<UUID, ChatterNameRetriever> = it.next()
                if (hashSet == null) {
                    hashSet = HashSet()
                }
                hashSet.add(next.getValue())
                it.remove()
            }
        }
        if (hashSet != null) {
            var iterator: Iterator = hashSet.iterator()
            while (iterator.hasNext()) {
                (iterator as ChatterNameRetriever.next()).dispose()
            }
        }
    }
    fun onChatterNameUpdated(chatterNameRetriever: ChatterNameRetriever) {
        var onChatterNameUpdated: OnChatterNameUpdated = this.listener.get()
        if (onChatterNameUpdated != null) {
            onChatterNameUpdated.onChatterNameUpdated(this)
        }
    }

    fun retainChatters(set: MutableSet<UUID>) {
        var hashSet: HashSet = null
        synchronized(this.lock) {
            Iterator<Map.Entry<UUID, ChatterNameRetriever>> it = this.retrievers.entrySet().iterator()
            while (it.hasNext()) {
                var next: Map.Entry<UUID, ChatterNameRetriever> = it.next()
                if (!set.contains(next.getKey())) {
                    if (hashSet == null) {
                        hashSet = HashSet()
                    }
                    hashSet.add(next.getValue())
                    it.remove()
                }
                hashSet = hashSet
            }
        }
        if (hashSet != null) {
            var iterator: Iterator = hashSet.iterator()
            while (iterator.hasNext()) {
                (iterator as ChatterNameRetriever.next()).dispose()
            }
        }
    }
}
