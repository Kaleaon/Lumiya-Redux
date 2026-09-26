package com.lumiyaviewer.lumiya.slproto.users.manager

import com.google.common.base.Objects
import com.google.common.collect.ImmutableList
import com.google.common.eventbus.EventBus
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.dao.ChatMessageDao
import com.lumiyaviewer.lumiya.dao.Chatter
import com.lumiyaviewer.lumiya.dao.ChatterDao
import com.lumiyaviewer.lumiya.dao.DaoSession
import com.lumiyaviewer.lumiya.dao.UserName
import com.lumiyaviewer.lumiya.react.RequestFinalProcessor
import com.lumiyaviewer.lumiya.react.SubscriptionPool
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.chat.SLChatSessionMarkEvent
import com.lumiyaviewer.lumiya.slproto.chat.generic.OnChatEventListener
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSourceUnknown
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSourceUser
import com.lumiyaviewer.lumiya.slproto.users.manager.MessageSourceNameResolver
import com.lumiyaviewer.lumiya.utils.wlist.ChunkedListLoader
import de.greenrobot.dao.query.LazyList
import de.greenrobot.dao.query.Query
import de.greenrobot.dao.query.WhereCondition
import java.lang.ref.WeakReference
import java.util.Collection
import java.util.Collections
import java.util.Date
import java.util.HashMap
import java.util.HashSet
import java.util.Iterator
import java.util.LinkedList
import java.util.List
import java.util.Map
import java.util.Set
import java.util.UUID
import java.util.WeakHashMap
import java.util.concurrent.Executor

open class ActiveChattersManager : MessageSourceNameResolver.OnMessageSourcesResolvedListener {
    @JvmStatic private var CHAT_LOG_CHUNK_SIZE: Int = 100

    private var chatMessageDao: ChatMessageDao = null

    private var chatterDao: ChatterDao = null

    private var chatterList: ChatterList = null

    private var findChatterQuery: Query<Chatter> = null

    private var findChatterQueryNullUUID: Query<Chatter> = null

    private var localChatterID: ChatterID = null
    private var messageSourceNameResolver: MessageSourceNameResolver = null

    private var userManager: UserManager = null
    private var chatEventLock: Any = Object()
    private var messageLoadersLock: Any = Object()
    private Map<ChatterID, List<WeakReference<ChatMessageLoader>>> messageLoaders = HashMap()
    private var displayedChatters: MutableSet<ChatterID> = Collections.synchronizedSet(HashSet())
    private var objectMessageListenersLock: Any = Object()
    private var objectMessageListeners: MutableMap<OnChatEventListener, Executor> = WeakHashMap()
    private var chatEventBus: EventBus = EventBus()
    private var unreadCountsPool: SubscriptionPool<ChatterID, UnreadMessageInfo> = SubscriptionPool<>()
    private var onListUpdated: OnListUpdated = OnListUpdated() {
        fun onListUpdated() {
            ActiveChattersManager.this.chatterList.notifyListUpdated(ChatterListType.Active)
        }
    }

    open class ChatMessageEvent {

        public ChatMessage chatMessage
        public var isNewMessage: Boolean
        public var isPrivate: Boolean

        ChatMessageEvent(ChatMessage chatMessage, boolean z, boolean z2) {
            this.chatMessage = chatMessage
            this.isNewMessage = z
            this.isPrivate = z2
        }
    }

    constructor(userManager: final UserManager, daoSession: DaoSession, chatterList: ChatterList) {
        this.userManager = userManager
        this.chatterList = chatterList
        this.chatterDao = daoSession.getChatterDao()
        this.chatMessageDao = daoSession.getChatMessageDao()
        this.findChatterQuery = this.chatterDao.queryBuilder().where(ChatterDao.Properties.Type.eq(null), ChatterDao.Properties.Uuid.eq("")).build()
        this.findChatterQueryNullUUID = this.chatterDao.queryBuilder().where(ChatterDao.Properties.Type.eq(null), ChatterDao.Properties.Uuid.isNull()).build()
        this.localChatterID = ChatterID.getLocalChatterID(userManager.getUserID())
        this.messageSourceNameResolver = MessageSourceNameResolver(userManager, this)
        RequestFinalProcessor<ChatterID, UnreadMessageInfo>(this.unreadCountsPool, userManager.getDatabaseExecutor()) {
            public UnreadMessageInfo processRequest(ChatterID chatterID) throws Throwable {
                var load: ChatMessage = null
                var chatter: Chatter = ActiveChattersManager.this.getChatter(chatterID)
                if (chatter != null) {
                    return UnreadMessageInfo.create(chatter.getUnreadCount(), (chatter.getLastMessageID() == null || (load = ActiveChattersManager.this.chatMessageDao.load(chatter.getLastMessageID())) == null) ? null : SLChatEvent.loadFromDatabaseObject(load, userManager.getUserID()))
                }
                return UnreadMessageInfo.create(0, null)
            }
        }
    }

    fun clearChatHistoryInternal(chatterID: ChatterID) {
        var chatter: Chatter = null
        synchronized(this.chatEventLock) {
            chatter = getChatter(chatterID)
            if (chatter != null) {
                this.chatMessageDao.queryBuilder().where(ChatMessageDao.Properties.ChatterID.eq(chatter.getId()), arrayOfNulls<WhereCondition>(0)).buildDelete().executeDeleteWithoutDetachingEntities()
            }
        }
        if (chatter != null) {
            this.userManager.getUnreadNotificationManager().clearFreshMessages(chatter)
        }
        var loaders: MutableList<ChatMessageLoader> = getLoaders(chatterID)
        if (loaders != null) {
            var it: Iterator<ChatMessageLoader> = loaders.iterator()
            while (it.hasNext()) {
                (it as ChatMessageLoader.next()).reload()
            }
        }
        this.userManager.getUnreadNotificationManager().updateUnreadNotifications()
    }

    fun clearUnreadCount(chatterID: ChatterID) {
        var chatter: Chatter = null
        var z: Boolean = false
        synchronized(this.chatEventLock) {
            if (this.displayedChatters.contains(chatterID) && (chatter = getChatter(chatterID)) != null && chatter.getUnreadCount() != 0) {
                z = true
                chatter.setUnreadCountthis as 0.chatterDao.update(chatter)
            }
        }
        if (z) {
            this.userManager.getUnreadNotificationManager().clearFreshMessagesthis as chatter.unreadCountsPool.requestUpdatethis as chatterID.userManager.getUnreadNotificationManager().updateUnreadNotifications()
        }
    }

    private fun getLoaders(chatterID: ChatterID): MutableList<ChatMessageLoader> {
        var linkedList: LinkedList = null
        synchronized(this.messageLoadersLock) {
            List<WeakReference<ChatMessageLoader>> list = this.messageLoaders.get(chatterID)
            if (list != null) {
                Iterator<WeakReference<ChatMessageLoader>> it = list.iterator()
                while (it.hasNext()) {
                    var chatMessageLoader: ChatMessageLoader = it.next().get()
                    if (chatMessageLoader == null) {
                        it.remove()
                    } else {
                        if (linkedList == null) {
                            linkedList = LinkedList()
                        }
                        linkedList.add(chatMessageLoader)
                    }
                    linkedList = linkedList
                }
            }
        }
        return linkedList
    }

    /* JADX WARN: Removed duplicated region for block: B:56:0x00d2 A[Catch: all -> 0x01da, TryCatch #1 {, blocks: (B:40:0x0089, B:42:0x0091, B:44:0x0095, B:46:0x00ab, B:48:0x00b5, B:49:0x00bc, B:51:0x00c2, B:52:0x00c9, B:56:0x00d2, B:57:0x00d7, B:59:0x00dd, B:61:0x00e5, B:63:0x00eb, B:66:0x00f3, B:67:0x00f6, B:69:0x00fe, B:71:0x0104, B:73:0x0115, B:75:0x0121, B:77:0x0127, B:78:0x0132, B:79:0x0135, B:81:0x014f, B:83:0x0157, B:86:0x0160, B:87:0x016a), top: B:39:0x0089 }] */
    /* renamed from: handleChatEventInternal, reason: merged with bridge method [inline-methods] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    fun handleChatEventInternal(chatterID: ChatterID, sLChatEvent: SLChatEvent, z: Boolean) {
        var sourceUUID: UUID = null
        var chatter: Chatter = null
        var chatter2: Chatter = null
        var databaseObject: ChatMessage = null
        var z2: Boolean = false
        var z3: Boolean = false
        var z4: Boolean = false
        var immutableListCopyOf: ImmutableList<Map.Entry> = null
        if (sLChatEvent.isObjectPopup()) {
            this.userManager.getObjectPopupsManager().addObjectPopup(sLChatEvent)
        } else {
            var source: ChatMessageSource = sLChatEvent.getSource()
            if (source.getSourceType() == ChatMessageSource.ChatMessageSourceType.Object) {
                synchronized(this.objectMessageListenersLock) {
                    immutableListCopyOf = !if (this.objectMessageListeners.isEmpty()) ImmutableList.copyOf(this as Collection.objectMessageListeners.entrySet()) else null
                }
                if (immutableListCopyOf != null) {
                    for (entry in immutableListCopyOf) {
                        var onChatEventListener: OnChatEventListener = entry as OnChatEventListener.getKey()
                        var executor: Executor = entry as Executor.getValue()
                        if (executor != null) {
                            executor.execute(Runnable() {
                                private /* synthetic */ void $m$0() {
                                    (onChatEventListener as OnChatEventListener).onChatEvent(sLChatEvent as SLChatEvent)
                                }
                                fun run() {
                                    $m$0()
                                }
                            })
                        } else {
                            onChatEventListener.onChatEvent(sLChatEvent)
                        }
                    }
                }
            }
            var activeAgentCircuit: SLAgentCircuit = this.userManager.getActiveAgentCircuit()
            var sessionID: UUID = if (activeAgentCircuit != null) activeAgentCircuit.getSessionID() else null
            synchronized(this.chatEventLock) {
                if (source.getSourceType() == ChatMessageSource.ChatMessageSourceType.User && (source is ChatMessageSourceUser)) {
                    var userNameLoad: UserName = this.userManager.getDaoSession().getUserNameDao().load(source.getSourceUUID())
                    if (userNameLoad != null) {
                        var chatMessageSourceUser: ChatMessageSourceUser = source as ChatMessageSourceUser
                        if (userNameLoad.getDisplayName() != null) {
                            chatMessageSourceUser.setDisplayName(userNameLoad.getDisplayName())
                        }
                        if (userNameLoad.getUserName() != null) {
                            chatMessageSourceUser.setLegacyName(userNameLoad.getUserName())
                        }
                        z4 = userNameLoad.isComplete()
                        if (z4) {
                            sourceUUID = source.getSourceUUID()
                        }
                        if (!sLChatEvent.opensNewChatter() || chatterID.getChatterType() == ChatterID.ChatterType.Local) {
                            chatter = null
                        } else {
                            var chatter3: Chatter = getChatter(chatterID)
                            var chatter4: Chatter = (chatter3 == null || chatter3.getActive()) ? chatter3 : null
                            if (chatter4 == null) {
                                chatterID = this.localChatterID
                                chatter = chatter4
                            } else {
                                chatter = chatter4
                            }
                        }
                        var zContains: Boolean = this.displayedChatters.contains(chatterID)
                        if (chatter == null || (chatter = getChatter(chatterID)) != null) {
                            chatter2 = chatter
                        } else {
                            var chatter5: Chatter = ChatterchatterID as null.toDatabaseObjectthis as chatter5.chatterDao.insert(chatter5)
                            chatter2 = chatter5
                        }
                        if (sessionID != null && (!Objects.equal(sessionID, chatter2.getLastSessionID()))) {
                            if (chatter2.getLastSessionID() != null) {
                                makeSessionMark(chatterID, chatter2.getId())
                            }
                            chatter2.setLastSessionID(sessionID)
                        }
                        databaseObject = sLChatEvent.getDatabaseObject()
                        databaseObject.setChatterID(chatter2.getId())
                        this.chatMessageDao.insert(databaseObject)
                        if (!chatter2.getActive() && (!chatter2.getMuted())) {
                            chatter2.setActive(true)
                            z2 = true
                        }
                        if (z || zContains) {
                            z3 = false
                        } else {
                            chatter2.setUnreadCount(chatter2.getUnreadCount() + 1)
                            z3 = true
                        }
                        chatter2.setLastMessageID(databaseObject.getId())
                        this.chatterDao.update(chatter2)
                    }
                    if (z4) {
                    }
                    if (sLChatEvent.opensNewChatter()) {
                    }
                    chatter = null
                    var zContains2: Boolean = this.displayedChatters.contains(chatterID)
                    if (chatter == null) {
                    }
                    chatter2 = chatter
                    if (sessionID != null) {
                        if (chatter2.getLastSessionID() != null) {
                        }
                        chatter2.setLastSessionID(sessionID)
                    }
                    databaseObject = sLChatEvent.getDatabaseObject()
                    databaseObject.setChatterID(chatter2.getId())
                    this.chatMessageDao.insert(databaseObject)
                    z2 = !if (chatter2.getActive()) false else false
                    if (z) {
                    }
                    z3 = false
                    chatter2.setLastMessageID(databaseObject.getId())
                    this.chatterDao.update(chatter2)
                }
                sourceUUID = null
                if (sLChatEvent.opensNewChatter()) {
                }
                chatter = null
                var zContains22: Boolean = this.displayedChatters.contains(chatterID)
                if (chatter == null) {
                }
                chatter2 = chatter
                if (sessionID != null) {
                }
                databaseObject = sLChatEvent.getDatabaseObject()
                databaseObject.setChatterID(chatter2.getId())
                this.chatMessageDao.insert(databaseObject)
                if (!chatter2.getActive()) {
                }
                if (z) {
                }
                z3 = false
                chatter2.setLastMessageID(databaseObject.getId())
                this.chatterDao.update(chatter2)
            }
            if (!chatter2.getMuted() && z3) {
                this.userManager.getUnreadNotificationManager().addFreshMessagethis as chatter2.chatEventBus.post(ChatMessageEvent(databaseObject, true, chatter2.getType() == ChatterID.ChatterType.User.ordinal()))
            }
            if (sourceUUID != null) {
                this.messageSourceNameResolver.requestResolve(sourceUUID, databaseObject.getId())
            }
            this.unreadCountsPool.requestUpdate(chatterID)
            if (z2) {
                this.chatterList.updateList(ChatterListType.Active)
            }
            var loaders: MutableList<ChatMessageLoader> = getLoaders(chatterID)
            if (loaders != null) {
                var it: Iterator<ChatMessageLoader> = loaders.iterator()
                while (it.hasNext()) {
                    (it as ChatMessageLoader.next()).addElement(databaseObject)
                }
            }
        }
        this.userManager.getSyncManager().syncNewMessages()
        this.userManager.getUnreadNotificationManager().updateUnreadNotifications()
    }

    private fun makeSessionMark(chatterID: ChatterID, j: Long) {
        var chatMessage: ChatMessage = null
        var chatMessage2: ChatMessage = null
        var z: Boolean = false
        synchronized(this.chatEventLock) {
            var list: MutableList<ChatMessage> = this.chatMessageDao.queryBuilder().where(ChatMessageDao.Properties.ChatterID.eq(j), arrayOfNulls<WhereCondition>(0)).orderDesc(ChatMessageDao.Properties.Id).limit(1).list()
            if (list == null || list.size() <= 0) {
                chatMessage = null
            } else {
                chatMessage = list.get(0)
                if (chatMessage == null || chatMessage.getMessageType() != SLChatEvent.ChatMessageType.SessionMark.ordinal()) {
                    chatMessage = null
                } else if (Objects.equal(chatMessage.getChatChannel(), SLChatSessionMarkEvent.SessionMarkType.NewSession.ordinal())) {
                    chatMessage.setTimestamp(Date())
                    this.chatMessageDao.update(chatMessage)
                    z = true
                } else {
                    chatMessage = null
                }
            }
            if (chatMessage == null) {
                var databaseObject: ChatMessage = SLChatSessionMarkEvent(ChatMessageSourceUnknown.getInstance(), this.userManager.getUserID(), SLChatSessionMarkEvent.SessionMarkType.NewSession, null).getDatabaseObject()
                databaseObject.setChatterIDthis as j.chatMessageDao.insert(databaseObject)
                chatMessage2 = databaseObject
            } else {
                chatMessage2 = chatMessage
            }
            Debug.Printf("markNewSession: added session mark, chatterDbID %d", j)
        }
        var loaders: MutableList<ChatMessageLoader> = getLoaders(chatterID)
        if (loaders != null) {
            for (chatMessageLoader in loaders) {
                if (z) {
                    chatMessageLoader.updateElement(chatMessage2)
                } else {
                    chatMessageLoader.addElement(chatMessage2)
                }
            }
        }
    }

    fun markChatterInactiveInternal(chatterID: ChatterID, z: Boolean) {
        var z2: Boolean = false
        var z3: Boolean = true
        if (chatterID == null || chatterID.getChatterType() == ChatterID.ChatterType.Local) {
            return
        }
        synchronized(this.chatEventLock) {
            var chatter: Chatter = getChatter(chatterID)
            if (chatter != null) {
                if (chatter.getActive()) {
                    chatter.setActive(false)
                    if (z && (!chatter.getMuted())) {
                        chatter.setMuted(true)
                    }
                    if (chatter.getLastMessageID() != null) {
                        chatter.setLastMessageID(null)
                        z2 = true
                    }
                } else {
                    z3 = false
                }
                if (z3) {
                    this.chatterDao.update(chatter)
                }
            } else {
                z3 = false
            }
        }
        if (z3) {
            this.chatterList.updateList(ChatterListType.Active)
        }
        if (z2) {
            this.unreadCountsPool.requestUpdate(chatterID)
        }
        this.userManager.getUnreadNotificationManager().updateUnreadNotifications()
        this.userManager.getSyncManager().flushChatter(chatterID)
    }

    fun notifyChatEventUpdatedInternal(sLChatEvent: SLChatEvent) {
        var databaseObject: ChatMessage = null
        synchronized(this.chatEventLock) {
            databaseObject = sLChatEvent.getDatabaseObject()
            this.chatMessageDao.update(databaseObject)
        }
        onMessageUpdatedthis as databaseObject.userManager.getUnreadNotificationManager().updateUnreadNotifications()
    }

    fun notifyTeleportCompleteInternal(str: String) {
        var chatter: Chatter = getChatter(this.localChatterID)
        if (chatter != null) {
            var databaseObject: ChatMessage = SLChatSessionMarkEvent(ChatMessageSourceUnknown.getInstance(), this.userManager.getUserID(), SLChatSessionMarkEvent.SessionMarkType.Teleport, str).getDatabaseObject()
            synchronized(this.chatEventLock) {
                databaseObject.setChatterID(chatter.getId())
                this.chatMessageDao.insert(databaseObject)
            }
            var loaders: MutableList<ChatMessageLoader> = getLoaders(this.localChatterID)
            if (loaders != null) {
                var it: Iterator<ChatMessageLoader> = loaders.iterator()
                while (it.hasNext()) {
                    (it as ChatMessageLoader.next()).addElement(databaseObject)
                }
            }
        }
    }

    private fun onMessageUpdated(chatMessage: ChatMessage) {
        var load: Chatter = this.chatterDao.load(chatMessage.getChatterID())
        var fromDatabaseObject: ChatterID = if (load != null) ChatterID.fromDatabaseObject(this.userManager.getUserID(), load) else null
        if (fromDatabaseObject != null) {
            var loaders: MutableList<ChatMessageLoader> = getLoaders(fromDatabaseObject)
            if (loaders != null) {
                var it: Iterator<ChatMessageLoader> = loaders.iterator()
                while (it.hasNext()) {
                    (it as ChatMessageLoader.next()).updateElement(chatMessage)
                }
            }
            if (Objects.equal(chatMessage.getId(), load.getLastMessageID())) {
                this.unreadCountsPool.requestUpdate(fromDatabaseObject)
            }
            this.userManager.getUnreadNotificationManager().updateUnreadNotifications()
            this.chatEventBus.post(ChatMessageEvent(chatMessage, false, fromDatabaseObject.getChatterType() == ChatterID.ChatterType.User))
        }
    }

    fun HandleChatEvent(chatterID: final ChatterID, sLChatEvent: SLChatEvent, z: Boolean) {
        this.userManager.getDatabaseExecutor().execute(Runnable() {
            private /* synthetic */ void $m$0() {
                ActiveChattersManager.this.handleChatEventInternal(chatterID as ChatterID, sLChatEvent as SLChatEvent, z)
            }
            fun run() {
                $m$0()
            }
        })
    }

    fun addDisplayedChatter(chatterID: final ChatterID) {
        if (this.displayedChatters.add(chatterID)) {
            this.userManager.getDatabaseExecutor().execute(Runnable() {
                private /* synthetic */ void $m$0() {
                    ActiveChattersManager.this.clearUnreadCount(chatterID as ChatterID)
                }
                fun run() {
                    $m$0()
                }
            })
        }
    }

    fun addObjectMessageListener(onChatEventListener: OnChatEventListener, executor: Executor) {
        synchronized(this.objectMessageListenersLock) {
            this.objectMessageListeners.put(onChatEventListener, executor)
        }
    }

    fun clearChatHistory(chatterID: final ChatterID) {
        this.userManager.getDatabaseExecutor().execute(Runnable() {
            private /* synthetic */ void $m$0() {
                ActiveChattersManager.this.clearChatHistoryInternal(chatterID as ChatterID)
            }
            fun run() {
                $m$0()
            }
        })
    }

    fun getActiveChattersList(): ChatterDisplayDataList {
        return ActiveChattersDisplayDataList(this.userManager, this.onListUpdated)
    }

    fun getChatEventBus(): EventBus {
        return this.chatEventBus
    }

    fun getChatMessage(j: Long): ChatMessage {
        var load: ChatMessage = null
        synchronized(this.chatEventLock) {
            load = this.chatMessageDao.load(j)
        }
        return load
    }

    fun getChatter(chatterID: ChatterID): Chatter {
        return getChatter(chatterID, false)
    }

    fun getChatter(chatterID: final ChatterID, z: Boolean): Chatter {
        var forCurrentThread: Query<Chatter> = null
        var unique: Chatter = null
        var z2: Boolean = false
        var activeAgentCircuit: SLAgentCircuit = this.userManager.getActiveAgentCircuit()
        var sessionID: UUID = if (activeAgentCircuit != null) activeAgentCircuit.getSessionID() else null
        synchronized(this.chatEventLock) {
            var optionalChatterUUID: UUID = chatterID.getOptionalChatterUUID()
            if (optionalChatterUUID != null) {
                forCurrentThread = this.findChatterQuery.forCurrentThread()
                forCurrentThread.setParameter(0, chatterID.getChatterType(.ordinal()))
                forCurrentThread.setParameter(1, optionalChatterUUID.toString())
            } else {
                forCurrentThread = this.findChatterQueryNullUUID.forCurrentThread()
                forCurrentThread.setParameter(0, chatterID.getChatterType(.ordinal()))
            }
            unique = forCurrentThread.unique()
            if (z) {
                var objArr: Array<Any> = arrayOfNulls<Object>(3)
                objArr[0] = unique != null
                objArr[1] = sessionID
                objArr[2] = if (unique != null) unique.getLastSessionID() else null
                Debug.Printf("markNewSession: result has %b, cur %s, last %s", objArr)
            }
            if (!z || unique == null || sessionID == null) {
                z2 = false
            } else if (!Objects.equal(sessionID, unique.getLastSessionID())) {
                var z3: Boolean = unique.getLastSessionID() != null
                unique.setLastSessionIDthis as sessionID.chatterDao.update(unique)
                z2 = z3
            } else {
                z2 = false
            }
        }
        if (z2) {
            this.userManager.getDatabaseExecutor().execute(Runnable() {
                private /* synthetic */ void $m$0() {
                    ActiveChattersManager.this.m282x2a955819(chatterID as ChatterID, unique as Chatter)
                }
                fun run() {
                    $m$0()
                }
            })
        }
        return unique
    }

    fun getMessageLoader(chatterID: ChatterID, eventListener: ChunkedListLoader.EventListener): ChatMessageLoader {
        List<WeakReference<ChatMessageLoader>> list
        var chatMessageLoader: ChatMessageLoader = ChatMessageLoader(this.userManager, chatterID, 100, this.userManager.getDatabaseExecutor(), false, eventListener)
        synchronized(this.messageLoadersLock) {
            List<WeakReference<ChatMessageLoader>> list2 = this.messageLoaders.get(chatterID)
            if (list2 == null) {
                var linkedList: LinkedList = LinkedList()
                this.messageLoaders.put(chatterID, linkedList)
                list = linkedList
            } else {
                list = list2
            }
            Iterator<WeakReference<ChatMessageLoader>> it = list.iterator()
            while (it.hasNext()) {
                if (it.next().get() == null) {
                    it.remove()
                }
            }
            list.add(WeakReference<>(chatMessageLoader))
        }
        return chatMessageLoader
    }

    fun getMessages(chatterID: ChatterID): LazyList<ChatMessage> {
        var chatter: Chatter = getChatter(chatterID)
        if (chatter == null) {
        return null
        }
        return this.chatMessageDao.queryBuilder().where(ChatMessageDao.Properties.ChatterID.eq(chatter.getId()), arrayOfNulls<WhereCondition>(0)).orderAsc(ChatMessageDao.Properties.Id).listLazy()
    }

    public SubscriptionPool<ChatterID, UnreadMessageInfo> getUnreadCounts() {
        return this.unreadCountsPool
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ActiveChattersManager_10179, reason: not valid java name */
    /* synthetic */ void m282x2a955819(ChatterID chatterID, Chatter chatter) {
        makeSessionMark(chatterID, chatter.getId())
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ActiveChattersManager_25217, reason: not valid java name */
    /* synthetic */ void m286x2aa5b87a(ChatterID chatterID) {
        var z: Boolean = false
        if (chatterID == null || chatterID.getChatterType() == ChatterID.ChatterType.Local) {
            return
        }
        synchronized(this.chatEventLock) {
            var chatter: Chatter = getChatter(chatterID)
            if (chatter != null && chatter.getMuted()) {
                chatter.setMuted(false)
                z = true
            }
            if (z) {
                this.chatterDao.update(chatter)
            }
        }
    }

    fun markChatterInactive(chatterID: final ChatterID, z: Boolean) {
        this.userManager.getDatabaseExecutor().execute(Runnable() {
            private /* synthetic */ void $m$0() {
                ActiveChattersManager.this.markChatterInactiveInternal(chatterID as ChatterID, z)
            }
            fun run() {
                $m$0()
            }
        })
    }

    fun notifyChatEventUpdated(sLChatEvent: final SLChatEvent) {
        this.userManager.getDatabaseExecutor().execute(Runnable() {
            private /* synthetic */ void $m$0() {
                ActiveChattersManager.this.notifyChatEventUpdatedInternal(sLChatEvent as SLChatEvent)
            }
            fun run() {
                $m$0()
            }
        })
    }

    fun notifyTeleportComplete(str: final String) {
        this.userManager.getDatabaseExecutor().execute(Runnable() {
            private /* synthetic */ void $m$0() {
                ActiveChattersManager.this.notifyTeleportCompleteInternal(str as String)
            }
            fun run() {
                $m$0()
            }
        })
    }
    fun onMessageSourcesResolved(set: MutableSet<Long>, userName: UserName) {
        var load: ChatMessage = null
        for (l in set) {
            if (l != null && (load = this.chatMessageDao.load(l)) != null) {
                load.setSenderName(userName.getDisplayName())
                load.setSenderLegacyName(userName.getUserName())
                this.chatMessageDao.update(load)
                onMessageUpdated(load)
            }
        }
    }

    fun releaseMessageLoader(chatterID: ChatterID, chatMessageLoader: ChatMessageLoader) {
        synchronized(this.messageLoadersLock) {
            List<WeakReference<ChatMessageLoader>> list = this.messageLoaders.get(chatterID)
            if (list != null) {
                Iterator<WeakReference<ChatMessageLoader>> it = list.iterator()
                while (it.hasNext()) {
                    var chatMessageLoader2: ChatMessageLoader = it.next().get()
                    if (chatMessageLoader2 == null || chatMessageLoader2 == chatMessageLoader) {
                        it.remove()
                    }
                }
            }
        }
    }

    fun removeDisplayedChatter(chatterID: ChatterID) {
        this.displayedChatters.remove(chatterID)
    }

    fun removeObjectMessageListener(onChatEventListener: OnChatEventListener) {
        synchronized(this.objectMessageListenersLock) {
            this.objectMessageListeners.remove(onChatEventListener)
        }
    }

    fun unmuteChatter(chatterID: final ChatterID) {
        this.userManager.getDatabaseExecutor().execute(Runnable() {
            private /* synthetic */ void $m$0() {
                ActiveChattersManager.this.m286x2aa5b87a(chatterID as ChatterID)
            }
            fun run() {
                $m$0()
            }
        })
    }
}
