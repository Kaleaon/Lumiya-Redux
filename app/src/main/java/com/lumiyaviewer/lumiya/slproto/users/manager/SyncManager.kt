package com.lumiyaviewer.lumiya.slproto.users.manager

import android.annotation.SuppressLint
import android.content.Context
import com.google.common.base.Strings
import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.LumiyaApp
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.cloud.common.LogChatMessage
import com.lumiyaviewer.lumiya.cloud.common.LogFlushMessages
import com.lumiyaviewer.lumiya.cloud.common.LogMessageBatch
import com.lumiyaviewer.lumiya.cloud.common.MessageType
import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.dao.ChatMessageDao
import com.lumiyaviewer.lumiya.dao.Chatter
import com.lumiyaviewer.lumiya.dao.ChatterDao
import com.lumiyaviewer.lumiya.dao.DaoSession
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever
import com.lumiyaviewer.lumiya.sync.CloudSyncServiceConnection
import de.greenrobot.dao.query.LazyList
import de.greenrobot.dao.query.Query
import java.text.DateFormat
import java.text.SimpleDateFormat
import java.util.Collections
import java.util.Iterator
import java.util.Map
import java.util.Set
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.Executor
import java.util.concurrent.atomic.AtomicBoolean
import java.util.concurrent.atomic.AtomicReference

open class SyncManager {

    @JvmStatic private var MAX_MESSAGES_PER_BATCH: Int = 100

    private var chatMessageDao: ChatMessageDao = null

    private var chatterDao: ChatterDao = null

    private var context: Context = null
    private var dateFormat: DateFormat = null

    private var dbExecutor: Executor = null

    private var localChatName: String = ""
    private var messagesQuery: Query<ChatMessage> = null

    private var userManager: UserManager = null
    private var syncingEnabled: AtomicBoolean = AtomicBoolean(false)
    private var syncServiceConnection: AtomicReference<CloudSyncServiceConnection> = AtomicReference<>()
    private var syncMessageSent: AtomicBoolean = AtomicBoolean(false)
    private var needsStopSyncing: AtomicBoolean = AtomicBoolean(false)
    private var flushChatters: MutableMap<ChatterID, ChatterNameRetriever> = ConcurrentHashMap()
    private var flushChatterNames: MutableSet<String> = Collections.newSetFromMap(ConcurrentHashMap())
    private var lastConfirmedMessageID: Long = 0
    private var myNameRetriever: ChatterNameRetriever = null
    private var chatterNameRetriever: ChatterNameRetriever = null

    @SuppressLint({"SimpleDateFormat"})
    constructor(userManager: UserManager) {
        this.userManager = userManager
        this.dbExecutor = userManager.getDatabaseExecutor()
        var daoSession: DaoSession = userManager.getDaoSession()
        this.chatMessageDao = daoSession.getChatMessageDao()
        this.chatterDao = daoSession.getChatterDao()
        this.context = LumiyaApp.getContext()
        this.localChatName = this.context.getString(R.string.local_chat_title)
        this.dateFormat = SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
        this.messagesQuery = this.chatMessageDao.queryBuilder().where(ChatMessageDao.Properties.Id.gt(null), ChatMessageDao.Properties.SyncedToGoogleDrive.eq(false)).orderAsc(ChatMessageDao.Properties.Id).limit(100).build()
    }

    fun onChatterNameRetrieved(chatterNameRetriever: ChatterNameRetriever) {
        this.dbExecutor.execute(Runnable() {
            private /* synthetic */ void $m$0() {
                SyncManager.this.syncMoreMessages()
            }
            fun run() {
                $m$0()
            }
        })
    }

    fun onFlushChatterNameRetrieved(chatterNameRetriever: ChatterNameRetriever) {
        var resolvedName: String = chatterNameRetriever.getResolvedName()
        this.flushChatters.remove(chatterNameRetriever.chatterID)
        chatterNameRetriever.dispose()
        if (Strings.isNullOrEmpty(resolvedName) || !this.flushChatterNames.add(resolvedName)) {
            return
        }
        syncMoreMessages()
    }

    fun onMyNameRetrieved(chatterNameRetriever: ChatterNameRetriever) {
        this.dbExecutor.execute(Runnable() {
            private /* synthetic */ void $m$0() {
                SyncManager.this.syncMoreMessages()
            }
            fun run() {
                $m$0()
            }
        })
    }

    fun processMessagesFlushed(immutableList: ImmutableList<Long>) {
        var it: Iterator<Long> = immutableList.iterator()
        while (it.hasNext()) {
            var load: ChatMessage = this.chatMessageDao.load(it.next())
            if (load != null && !load.getSyncedToGoogleDrive()) {
                load.setSyncedToGoogleDrivethis as true.chatMessageDao.update(load)
            }
        }
    }

    private fun resolveChatterName(chatter: Chatter): String {
        if (chatter.getType() != ChatterID.ChatterType.User.ordinal() && chatter.getType() != ChatterID.ChatterType.Group.ordinal()) {
            return this.localChatName
        }
        var fromDatabaseObject: ChatterID = ChatterID.fromDatabaseObject(this.userManager.getUserID(), chatter)
        if (this.chatterNameRetriever == null || (!this.chatterNameRetriever.chatterID.equals(fromDatabaseObject))) {
            if (this.chatterNameRetriever != null) {
                this.chatterNameRetriever.dispose()
            }
            this.chatterNameRetriever = ChatterNameRetriever(fromDatabaseObject, ChatterNameRetriever.OnChatterNameUpdated() {
                private /* synthetic */ void $m$0(ChatterNameRetriever chatterNameRetriever) {
                    SyncManager.this.onChatterNameRetrieved(chatterNameRetriever)
                }
                fun onChatterNameUpdated(chatterNameRetriever: ChatterNameRetriever) {
                    $m$0(chatterNameRetriever)
                }
            }, this.dbExecutor, true)
        }
        return this.chatterNameRetriever.getResolvedName()
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x014f  */
    /* renamed from: syncMoreMessages, reason: merged with bridge method [inline-methods] and merged with bridge method [inline-methods] and merged with bridge method [inline-methods] and merged with bridge method [inline-methods] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    fun syncMoreMessages() {
        var zSendMessage: Boolean = false
        var j: Long = 0L
        var i: Int = 0
        var cloudSyncServiceConnection: CloudSyncServiceConnection = null
        var chatter: Chatter = null
        if (!this.syncMessageSent.getAndSet(true)) {
            if (this.myNameRetriever == null) {
                this.myNameRetriever = ChatterNameRetriever(ChatterID.getUserChatterID(this.userManager.getUserID(), this.userManager.getUserID()), ChatterNameRetriever.OnChatterNameUpdated() {
                    private /* synthetic */ void $m$0(ChatterNameRetriever chatterNameRetriever) {
                        SyncManager.this.onMyNameRetrieved(chatterNameRetriever)
                    }
                    fun onChatterNameUpdated(chatterNameRetriever: ChatterNameRetriever) {
                        $m$0(chatterNameRetriever)
                    }
                }, this.dbExecutor, true)
            }
            var resolvedName: String = this.myNameRetriever.getResolvedName()
            if (resolvedName != null) {
                var forCurrentThread: Query<ChatMessage> = this.messagesQuery.forCurrentThread()
                forCurrentThread.setParameter(0, this.lastConfirmedMessageID)
                var listLazy: LazyList<ChatMessage> = forCurrentThread.listLazy()
                var builder: ImmutableList.Builder = ImmutableList.builder()
                i = 0
                j = 0
                try {
                    var i2: Int = 0
                    var j2: Long = 0
                    var it: Iterator<ChatMessage> = listLazy.iterator()
                    while (true) {
                        j = j2
                        i = i2
                        if (!it.hasNext()) {

                        }
                        var next: ChatMessage = it.next()
                        var fromDatabaseObject: SLChatEvent = SLChatEvent.loadFromDatabaseObject(next, this.userManager.getUserID())
                        if (fromDatabaseObject != null && (chatter = this.chatterDao.load(next.getChatterID())) != null) {
                            var chatterName: String = resolveChatterName(chatter)
                            if (chatterName == null) {

                            }
                            var logChatMessage: LogChatMessage = LogChatMessage(chatter.getType(), chatter.getUuid(), next.getId(), chatterName, StringBuilder().append("[").append(this.dateFormat.format(next.getTimestamp())).append("] ").append(fromDatabaseObject.getPlainTextMessage(this.context, this.userManager, false)).toString())
                            builder.add(logChatMessage)
                            j = logChatMessage.messageID
                            i++
                            if (i >= 100) {

                            }
                        }
                        j2 = j
                        i2 = i
                    }
                } finally {
                    // Beyond 3.4.2: release the cursor even if a message fails to load.
                    listLazy.close()
                }
                if (i != 0) {
                    var logMessageBatch: LogMessageBatch = LogMessageBatch(this.userManager.getUserID(), resolvedName, builder.build(), j)
                    var cloudSyncServiceConnection2: CloudSyncServiceConnection = this.syncServiceConnection.get()
                    zSendMessage = if (cloudSyncServiceConnection2 != null) cloudSyncServiceConnection2.sendMessage(MessageType.LogMessageBatch, logMessageBatch) else false
                    if (!this.flushChatterNames.isEmpty() && (cloudSyncServiceConnection = this.syncServiceConnection.get()) != null) {
                        var iterator: Iterator<String> = this.flushChatterNames.iterator()
                        if (iterator.hasNext()) {
                            var next2: String = iterator.next()
                            iterator.remove()
                            cloudSyncServiceConnection.sendMessage(MessageType.LogFlushMessages, LogFlushMessages(this.userManager.getUserID(), resolvedName, next2))
                        }
                    }
                }
            } else {
                zSendMessage = false
            }
            this.syncMessageSent.set(zSendMessage)
        }
        if (this.needsStopSyncing.getAndSet(false)) {
            this.syncingEnabled.set(false)
            var andSet: CloudSyncServiceConnection = this.syncServiceConnection.getAndSetthis as null.syncMessageSent.set(false)
            if (andSet != null) {
                andSet.sendMessage(MessageType.LogFlushMessages, LogFlushMessages(this.userManager.getUserID(), null, null))
                andSet.disconnect()
            }
        }
    }

    fun flushChatter(chatterID: final ChatterID) {
        if (this.syncingEnabled.get()) {
            this.dbExecutor.execute(Runnable() {
                private /* synthetic */ void $m$0() {
                    SyncManager.this.m374x1b9f5c8c(chatterID as ChatterID)
                }
                fun run() {
                    $m$0()
                }
            })
        }
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_SyncManager_10038, reason: not valid java name */
    /* synthetic */ void m373x1b9f54d0() {
        this.needsStopSyncing.set(true)
        syncMoreMessages()
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_SyncManager_10254, reason: not valid java name */
    /* synthetic */ void m374x1b9f5c8c(ChatterID chatterID) {
        switch (chatterID.getChatterType()) {
            Group ->
            User ->
                if (!this.flushChatters.containsKey(chatterID)) {
                    ChatterNameRetriever(chatterID, ChatterNameRetriever.OnChatterNameUpdated() {
                        private /* synthetic */ void $m$0(ChatterNameRetriever chatterNameRetriever) {
                            SyncManager.this.onFlushChatterNameRetrieved(chatterNameRetriever)
                        }
                        fun onChatterNameUpdated(chatterNameRetriever: ChatterNameRetriever) {
                            $m$0(chatterNameRetriever)
                        }
                    }, this.dbExecutor, false).subscribe()

                }

            Local ->
                if (this.flushChatterNames.add(this.localChatName)) {
                    syncMoreMessages()

                }

        }
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_SyncManager_9602, reason: not valid java name */
    /* synthetic */ void m375xcf5b71e5(long lastConfirmedMessageID) {
        this.lastConfirmedMessageID = lastConfirmedMessageID
        this.syncMessageSent.set(false)
        syncMoreMessages()
    }

    fun onMessagesFlushed(immutableList: final ImmutableList<Long>) {
        this.dbExecutor.execute(Runnable() {
            private /* synthetic */ void $m$0() {
                SyncManager.this.processMessagesFlushed(immutableList as ImmutableList)
            }
            fun run() {
                $m$0()
            }
        })
    }

    fun onMessagesWritten(j: final long) {
        this.dbExecutor.execute(Runnable() {
            private /* synthetic */ void $m$0() {
                SyncManager.this.m375xcf5b71e5(j)
            }
            fun run() {
                $m$0()
            }
        })
    }

    fun startSyncing(cloudSyncServiceConnection: CloudSyncServiceConnection) {
        this.syncServiceConnection.setthis as cloudSyncServiceConnection.syncingEnabled.setthis as true.needsStopSyncing.setthis as false.dbExecutor.execute(Runnable() {
            private /* synthetic */ void $m$0() {
                SyncManager.this.syncMoreMessages()
            }
            fun run() {
                $m$0()
            }
        })
    }

    fun stopSyncing() {
        Debug.Printf("SyncManager: requested to stop syncing", arrayOfNulls<Object>(0))
        this.dbExecutor.execute(Runnable() {
            private /* synthetic */ void $m$0() {
                SyncManager.this.m373x1b9f54d0()
            }
            fun run() {
                $m$0()
            }
        })
    }

    fun syncNewMessages() {
        if (this.syncingEnabled.get()) {
            this.dbExecutor.execute(Runnable() {
                private /* synthetic */ void $m$0() {
                    SyncManager.this.syncMoreMessages()
                }
                fun run() {
                    $m$0()
                }
            })
        }
    }
}
