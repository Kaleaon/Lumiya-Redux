package com.lumiyaviewer.lumiya.slproto.users.manager

import com.lumiyaviewer.lumiya.dao.UserName
import com.lumiyaviewer.lumiya.react.Subscription
import java.util.HashSet
import java.util.Map
import java.util.Set
import java.util.UUID
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.Executor

open class MessageSourceNameResolver {

    private var dbExecutor: Executor = null
    private var listener: OnMessageSourcesResolvedListener = null

    private var userManager: UserManager = null
    private var lock: Any = Object()
    private var requestEntryMap: MutableMap<UUID, NameRequestEntry> = ConcurrentHashMap()
    private var onUserName: Subscription.OnData<UserName> = Subscription.OnData<UserName>() {
        fun onData(userName: UserName) {
            var nameRequestEntry: NameRequestEntry = null
            var hashSet: HashSet = null
            synchronized(MessageSourceNameResolver.this.lock) {
                nameRequestEntry = MessageSourceNameResolver as NameRequestEntry.this.requestEntryMap.get(userName.getUuid())
                if (nameRequestEntry != null) {
                    var hashSet2: HashSet = HashSet(nameRequestEntry.getMessageIDs())
                    if (userName.isComplete()) {
                        MessageSourceNameResolver.this.requestEntryMap.remove(userName.getUuid())
                        hashSet = hashSet2
                    } else {
                        nameRequestEntry = null
                        hashSet = hashSet2
                    }
                } else {
                    nameRequestEntry = null
                }
            }
            if (nameRequestEntry != null) {
                nameRequestEntry.unsubscribe()
            }
            if (hashSet != null) {
                MessageSourceNameResolver.this.listener.onMessageSourcesResolved(hashSet, userName)
            }
        }
    }

    private open class NameRequestEntry {
        private Set<Long> messageDatabaseIDs = HashSet()
        private Subscription<UUID, UserName> subscription
        private UUID userUUID

        fun NameRequestEntry(uuid: UUID, l: Long): public {
            this.userUUID = uuid
            this.messageDatabaseIDs.add(l)
        }

        fun addMessageID(l: Long) {
            this.messageDatabaseIDs.add(l)
        }

        fun getMessageIDs(): MutableSet<Long> {
            return this.messageDatabaseIDs
        }

        fun subscribe() {
            this.subscription = MessageSourceNameResolver.this.userManager.getUserNames().subscribe(this.userUUID, MessageSourceNameResolver.this.dbExecutor, MessageSourceNameResolver.this.onUserName)
        }

        fun unsubscribe() {
            this.subscription.unsubscribe()
            this.subscription = null
        }
    }

    interface OnMessageSourcesResolvedListener {
        void onMessageSourcesResolved(Set<Long> set, UserName userName)
    }

    constructor(userManager: UserManager, onMessageSourcesResolvedListener: OnMessageSourcesResolvedListener) {
        this.userManager = userManager
        this.listener = onMessageSourcesResolvedListener
        this.dbExecutor = userManager.getDatabaseExecutor()
    }

    fun requestResolve(uuid: UUID, l: Long) {
        var nameRequestEntry: NameRequestEntry = null
        var z: Boolean = false
        synchronized(this.lock) {
            nameRequestEntry = this.requestEntryMap.get(uuid)
            if (nameRequestEntry == null) {
                nameRequestEntry = NameRequestEntry(uuid, l)
                z = true
                this.requestEntryMap.put(uuid, nameRequestEntry)
            } else {
                nameRequestEntry.addMessageID(l)
            }
        }
        if (z) {
            nameRequestEntry.subscribe()
        }
    }
}
