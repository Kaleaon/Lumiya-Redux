package com.lumiyaviewer.lumiya.slproto.users.manager;

import com.google.common.collect.ImmutableList;
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource;
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSourceUser;
import java.util.Collection;

import com.google.common.base.Objects;
import com.google.common.eventbus.EventBus;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.dao.ChatMessage;
import com.lumiyaviewer.lumiya.dao.ChatMessageDao;
import com.lumiyaviewer.lumiya.dao.Chatter;
import com.lumiyaviewer.lumiya.dao.ChatterDao;
import com.lumiyaviewer.lumiya.dao.DaoSession;
import com.lumiyaviewer.lumiya.dao.UserName;
import com.lumiyaviewer.lumiya.react.RequestFinalProcessor;
import com.lumiyaviewer.lumiya.react.SubscriptionPool;
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit;
import com.lumiyaviewer.lumiya.slproto.chat.SLChatSessionMarkEvent;
import com.lumiyaviewer.lumiya.slproto.chat.generic.OnChatEventListener;
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSourceUnknown;
import com.lumiyaviewer.lumiya.slproto.users.manager.MessageSourceNameResolver;
import com.lumiyaviewer.lumiya.utils.wlist.ChunkedListLoader;
import de.greenrobot.dao.query.LazyList;
import de.greenrobot.dao.query.Query;
import de.greenrobot.dao.query.WhereCondition;
import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.WeakHashMap;
import java.util.concurrent.Executor;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

/* loaded from: classes.dex */
public class ActiveChattersManager implements MessageSourceNameResolver.OnMessageSourcesResolvedListener {
    private static final int CHAT_LOG_CHUNK_SIZE = 100;

    @Nonnull
    private final ChatMessageDao chatMessageDao;

    @Nonnull
    private final ChatterDao chatterDao;

    @Nonnull
    private final ChatterList chatterList;

    @Nonnull
    private final Query<Chatter> findChatterQuery;

    @Nonnull
    private final Query<Chatter> findChatterQueryNullUUID;

    @Nonnull
    private final ChatterID localChatterID;
    private final MessageSourceNameResolver messageSourceNameResolver;

    @Nonnull
    private final UserManager userManager;
    private final Object chatEventLock = new Object();
    private final Object messageLoadersLock = new Object();
    private final Map<ChatterID, List<WeakReference<ChatMessageLoader>>> messageLoaders = new HashMap();
    private final Set<ChatterID> displayedChatters = Collections.synchronizedSet(new HashSet());
    private final Object objectMessageListenersLock = new Object();
    private final Map<OnChatEventListener, Executor> objectMessageListeners = new WeakHashMap();
    private final EventBus chatEventBus = new EventBus();
    private final SubscriptionPool<ChatterID, UnreadMessageInfo> unreadCountsPool = new SubscriptionPool<>();
    private final OnListUpdated onListUpdated = new OnListUpdated() { // from class: com.lumiyaviewer.lumiya.slproto.users.manager.ActiveChattersManager.1
        @Override // com.lumiyaviewer.lumiya.slproto.users.manager.OnListUpdated
        public void onListUpdated() {
            ActiveChattersManager.this.chatterList.notifyListUpdated(ChatterListType.Active);
        }
    };

    public static class ChatMessageEvent {

        @Nonnull
        public final ChatMessage chatMessage;
        public final boolean isNewMessage;
        public final boolean isPrivate;

        ChatMessageEvent(@Nonnull ChatMessage chatMessage, boolean z, boolean z2) {
            this.chatMessage = chatMessage;
            this.isNewMessage = z;
            this.isPrivate = z2;
        }
    }

    ActiveChattersManager(@Nonnull final UserManager userManager, @Nonnull DaoSession daoSession, @Nonnull ChatterList chatterList) {
        this.userManager = userManager;
        this.chatterList = chatterList;
        this.chatterDao = daoSession.getChatterDao();
        this.chatMessageDao = daoSession.getChatMessageDao();
        this.findChatterQuery = this.chatterDao.queryBuilder().where(ChatterDao.Properties.Type.eq(null), ChatterDao.Properties.Uuid.eq("")).build();
        this.findChatterQueryNullUUID = this.chatterDao.queryBuilder().where(ChatterDao.Properties.Type.eq(null), ChatterDao.Properties.Uuid.isNull()).build();
        this.localChatterID = ChatterID.getLocalChatterID(userManager.getUserID());
        this.messageSourceNameResolver = new MessageSourceNameResolver(userManager, this);
        new RequestFinalProcessor<ChatterID, UnreadMessageInfo>(this.unreadCountsPool, userManager.getDatabaseExecutor()) { // from class: com.lumiyaviewer.lumiya.slproto.users.manager.ActiveChattersManager.2
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.lumiyaviewer.lumiya.react.RequestFinalProcessor
            public UnreadMessageInfo processRequest(@Nonnull ChatterID chatterID) throws Throwable {
                ChatMessage load;
                Chatter chatter = ActiveChattersManager.this.getChatter(chatterID);
                if (chatter != null) {
                    return UnreadMessageInfo.create(chatter.getUnreadCount(), (chatter.getLastMessageID() == null || (load = ActiveChattersManager.this.chatMessageDao.load(chatter.getLastMessageID())) == null) ? null : SLChatEvent.loadFromDatabaseObject(load, userManager.getUserID()));
                }
                return UnreadMessageInfo.create(0, null);
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: clearChatHistoryInternal, reason: merged with bridge method [inline-methods] */
    public void m284x2aa4c8d2(@Nonnull ChatterID chatterID) {
        Chatter chatter;
        synchronized (this.chatEventLock) {
            chatter = getChatter(chatterID);
            if (chatter != null) {
                this.chatMessageDao.queryBuilder().where(ChatMessageDao.Properties.ChatterID.eq(chatter.getId()), new WhereCondition[0]).buildDelete().executeDeleteWithoutDetachingEntities();
            }
        }
        if (chatter != null) {
            this.userManager.getUnreadNotificationManager().clearFreshMessages(chatter);
        }
        List<ChatMessageLoader> loaders = getLoaders(chatterID);
        if (loaders != null) {
            Iterator<ChatMessageLoader> it = loaders.iterator();
            while (it.hasNext()) {
                ((ChatMessageLoader) it.next()).reload();
            }
        }
        this.userManager.getUnreadNotificationManager().updateUnreadNotifications();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: clearUnreadCount, reason: merged with bridge method [inline-methods] */
    public void m289x43721060(@Nonnull ChatterID chatterID) {
        Chatter chatter = null;
        boolean z = false;
        synchronized (this.chatEventLock) {
            if (this.displayedChatters.contains(chatterID) && (chatter = getChatter(chatterID)) != null && chatter.getUnreadCount() != 0) {
                z = true;
                chatter.setUnreadCount(0);
                this.chatterDao.update(chatter);
            }
        }
        if (z) {
            this.userManager.getUnreadNotificationManager().clearFreshMessages(chatter);
            this.unreadCountsPool.requestUpdate(chatterID);
            this.userManager.getUnreadNotificationManager().updateUnreadNotifications();
        }
    }

    @Nullable
    private List<ChatMessageLoader> getLoaders(@Nonnull ChatterID chatterID) {
        LinkedList linkedList = null;
        synchronized (this.messageLoadersLock) {
            List<WeakReference<ChatMessageLoader>> list = this.messageLoaders.get(chatterID);
            if (list != null) {
                Iterator<WeakReference<ChatMessageLoader>> it = list.iterator();
                while (it.hasNext()) {
                    ChatMessageLoader chatMessageLoader = it.next().get();
                    if (chatMessageLoader == null) {
                        it.remove();
                    } else {
                        if (linkedList == null) {
                            linkedList = new LinkedList();
                        }
                        linkedList.add(chatMessageLoader);
                    }
                    linkedList = linkedList;
                }
            }
        }
        return linkedList;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00d2 A[Catch: all -> 0x01da, TryCatch #1 {, blocks: (B:40:0x0089, B:42:0x0091, B:44:0x0095, B:46:0x00ab, B:48:0x00b5, B:49:0x00bc, B:51:0x00c2, B:52:0x00c9, B:56:0x00d2, B:57:0x00d7, B:59:0x00dd, B:61:0x00e5, B:63:0x00eb, B:66:0x00f3, B:67:0x00f6, B:69:0x00fe, B:71:0x0104, B:73:0x0115, B:75:0x0121, B:77:0x0127, B:78:0x0132, B:79:0x0135, B:81:0x014f, B:83:0x0157, B:86:0x0160, B:87:0x016a), top: B:39:0x0089 }] */
    /* renamed from: handleChatEventInternal, reason: merged with bridge method [inline-methods] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void m283x2a96bcb8(ChatterID chatterID, final SLChatEvent sLChatEvent, boolean z) {
        UUID sourceUUID;
        Chatter chatter;
        Chatter chatter2;
        ChatMessage databaseObject;
        boolean z2 = false;
        boolean z3 = false;
        boolean z4 = false;
        ImmutableList<Map.Entry> immutableListCopyOf;
        if (sLChatEvent.isObjectPopup()) {
            this.userManager.getObjectPopupsManager().addObjectPopup(sLChatEvent);
        } else {
            ChatMessageSource source = sLChatEvent.getSource();
            if (source.getSourceType() == ChatMessageSource.ChatMessageSourceType.Object) {
                synchronized (this.objectMessageListenersLock) {
                    immutableListCopyOf = !this.objectMessageListeners.isEmpty() ? ImmutableList.copyOf((Collection) this.objectMessageListeners.entrySet()) : null;
                }
                if (immutableListCopyOf != null) {
                    for (Map.Entry entry : immutableListCopyOf) {
                        final OnChatEventListener onChatEventListener = (OnChatEventListener) entry.getKey();
                        Executor executor = (Executor) entry.getValue();
                        if (executor != null) {
                            executor.execute(new Runnable() { // from class: com.lumiyaviewer.lumiya.slproto.users.manager.-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI.2
                                private final /* synthetic */ void $m$0() {
                                    ((OnChatEventListener) onChatEventListener).onChatEvent((SLChatEvent) sLChatEvent);
                                }

                                @Override // java.lang.Runnable
                                public final void run() {
                                    $m$0();
                                }
                            });
                        } else {
                            onChatEventListener.onChatEvent(sLChatEvent);
                        }
                    }
                }
            }
            SLAgentCircuit activeAgentCircuit = this.userManager.getActiveAgentCircuit();
            UUID sessionID = activeAgentCircuit != null ? activeAgentCircuit.getSessionID() : null;
            synchronized (this.chatEventLock) {
                if (source.getSourceType() == ChatMessageSource.ChatMessageSourceType.User && (source instanceof ChatMessageSourceUser)) {
                    UserName userNameLoad = this.userManager.getDaoSession().getUserNameDao().load(source.getSourceUUID());
                    if (userNameLoad != null) {
                        ChatMessageSourceUser chatMessageSourceUser = (ChatMessageSourceUser) source;
                        if (userNameLoad.getDisplayName() != null) {
                            chatMessageSourceUser.setDisplayName(userNameLoad.getDisplayName());
                        }
                        if (userNameLoad.getUserName() != null) {
                            chatMessageSourceUser.setLegacyName(userNameLoad.getUserName());
                        }
                        z4 = userNameLoad.isComplete();
                        if (z4) {
                            sourceUUID = source.getSourceUUID();
                        }
                        if (!sLChatEvent.opensNewChatter() || chatterID.getChatterType() == ChatterID.ChatterType.Local) {
                            chatter = null;
                        } else {
                            Chatter chatter3 = getChatter(chatterID);
                            Chatter chatter4 = (chatter3 == null || chatter3.getActive()) ? chatter3 : null;
                            if (chatter4 == null) {
                                chatterID = this.localChatterID;
                                chatter = chatter4;
                            } else {
                                chatter = chatter4;
                            }
                        }
                        boolean zContains = this.displayedChatters.contains(chatterID);
                        if (chatter == null || (chatter = getChatter(chatterID)) != null) {
                            chatter2 = chatter;
                        } else {
                            Chatter chatter5 = new Chatter(null);
                            chatterID.toDatabaseObject(chatter5);
                            this.chatterDao.insert(chatter5);
                            chatter2 = chatter5;
                        }
                        if (sessionID != null && (!Objects.equal(sessionID, chatter2.getLastSessionID()))) {
                            if (chatter2.getLastSessionID() != null) {
                                makeSessionMark(chatterID, chatter2.getId().longValue());
                            }
                            chatter2.setLastSessionID(sessionID);
                        }
                        databaseObject = sLChatEvent.getDatabaseObject();
                        databaseObject.setChatterID(chatter2.getId().longValue());
                        this.chatMessageDao.insert(databaseObject);
                        if (!chatter2.getActive() && (!chatter2.getMuted())) {
                            chatter2.setActive(true);
                            z2 = true;
                        }
                        if (z || zContains) {
                            z3 = false;
                        } else {
                            chatter2.setUnreadCount(chatter2.getUnreadCount() + 1);
                            z3 = true;
                        }
                        chatter2.setLastMessageID(databaseObject.getId());
                        this.chatterDao.update(chatter2);
                    }
                    if (z4) {
                    }
                    if (sLChatEvent.opensNewChatter()) {
                    }
                    chatter = null;
                    boolean zContains2 = this.displayedChatters.contains(chatterID);
                    if (chatter == null) {
                    }
                    chatter2 = chatter;
                    if (sessionID != null) {
                        if (chatter2.getLastSessionID() != null) {
                        }
                        chatter2.setLastSessionID(sessionID);
                    }
                    databaseObject = sLChatEvent.getDatabaseObject();
                    databaseObject.setChatterID(chatter2.getId().longValue());
                    this.chatMessageDao.insert(databaseObject);
                    z2 = !chatter2.getActive() ? false : false;
                    if (z) {
                    }
                    z3 = false;
                    chatter2.setLastMessageID(databaseObject.getId());
                    this.chatterDao.update(chatter2);
                }
                sourceUUID = null;
                if (sLChatEvent.opensNewChatter()) {
                }
                chatter = null;
                boolean zContains22 = this.displayedChatters.contains(chatterID);
                if (chatter == null) {
                }
                chatter2 = chatter;
                if (sessionID != null) {
                }
                databaseObject = sLChatEvent.getDatabaseObject();
                databaseObject.setChatterID(chatter2.getId().longValue());
                this.chatMessageDao.insert(databaseObject);
                if (!chatter2.getActive()) {
                }
                if (z) {
                }
                z3 = false;
                chatter2.setLastMessageID(databaseObject.getId());
                this.chatterDao.update(chatter2);
            }
            if (!chatter2.getMuted() && z3) {
                this.userManager.getUnreadNotificationManager().addFreshMessage(chatter2);
                this.chatEventBus.post(new ChatMessageEvent(databaseObject, true, chatter2.getType() == ChatterID.ChatterType.User.ordinal()));
            }
            if (sourceUUID != null) {
                this.messageSourceNameResolver.requestResolve(sourceUUID, databaseObject.getId());
            }
            this.unreadCountsPool.requestUpdate(chatterID);
            if (z2) {
                this.chatterList.updateList(ChatterListType.Active);
            }
            List<ChatMessageLoader> loaders = getLoaders(chatterID);
            if (loaders != null) {
                Iterator<ChatMessageLoader> it = loaders.iterator();
                while (it.hasNext()) {
                    ((ChatMessageLoader) it.next()).addElement(databaseObject);
                }
            }
        }
        this.userManager.getSyncManager().syncNewMessages();
        this.userManager.getUnreadNotificationManager().updateUnreadNotifications();
    }

    private void makeSessionMark(@Nonnull ChatterID chatterID, long j) {
        ChatMessage chatMessage;
        ChatMessage chatMessage2;
        boolean z = false;
        synchronized (this.chatEventLock) {
            List<ChatMessage> list = this.chatMessageDao.queryBuilder().where(ChatMessageDao.Properties.ChatterID.eq(Long.valueOf(j)), new WhereCondition[0]).orderDesc(ChatMessageDao.Properties.Id).limit(1).list();
            if (list == null || list.size() <= 0) {
                chatMessage = null;
            } else {
                chatMessage = list.get(0);
                if (chatMessage == null || chatMessage.getMessageType() != SLChatEvent.ChatMessageType.SessionMark.ordinal()) {
                    chatMessage = null;
                } else if (Objects.equal(chatMessage.getChatChannel(), Integer.valueOf(SLChatSessionMarkEvent.SessionMarkType.NewSession.ordinal()))) {
                    chatMessage.setTimestamp(new Date());
                    this.chatMessageDao.update(chatMessage);
                    z = true;
                } else {
                    chatMessage = null;
                }
            }
            if (chatMessage == null) {
                ChatMessage databaseObject = new SLChatSessionMarkEvent(ChatMessageSourceUnknown.getInstance(), this.userManager.getUserID(), SLChatSessionMarkEvent.SessionMarkType.NewSession, null).getDatabaseObject();
                databaseObject.setChatterID(j);
                this.chatMessageDao.insert(databaseObject);
                chatMessage2 = databaseObject;
            } else {
                chatMessage2 = chatMessage;
            }
            Debug.Printf("markNewSession: added session mark, chatterDbID %d", Long.valueOf(j));
        }
        List<ChatMessageLoader> loaders = getLoaders(chatterID);
        if (loaders != null) {
            for (ChatMessageLoader chatMessageLoader : loaders) {
                if (z) {
                    chatMessageLoader.updateElement(chatMessage2);
                } else {
                    chatMessageLoader.addElement(chatMessage2);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: markChatterInactiveInternal, reason: merged with bridge method [inline-methods] */
    public void m285x2aa5b155(ChatterID chatterID, boolean z) {
        boolean z2 = false;
        boolean z3 = true;
        if (chatterID == null || chatterID.getChatterType() == ChatterID.ChatterType.Local) {
            return;
        }
        synchronized (this.chatEventLock) {
            Chatter chatter = getChatter(chatterID);
            if (chatter != null) {
                if (chatter.getActive()) {
                    chatter.setActive(false);
                    if (z && (!chatter.getMuted())) {
                        chatter.setMuted(true);
                    }
                    if (chatter.getLastMessageID() != null) {
                        chatter.setLastMessageID(null);
                        z2 = true;
                    }
                } else {
                    z3 = false;
                }
                if (z3) {
                    this.chatterDao.update(chatter);
                }
            } else {
                z3 = false;
            }
        }
        if (z3) {
            this.chatterList.updateList(ChatterListType.Active);
        }
        if (z2) {
            this.unreadCountsPool.requestUpdate(chatterID);
        }
        this.userManager.getUnreadNotificationManager().updateUnreadNotifications();
        this.userManager.getSyncManager().flushChatter(chatterID);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: notifyChatEventUpdatedInternal, reason: merged with bridge method [inline-methods] */
    public void m287x2aa63116(SLChatEvent sLChatEvent) {
        ChatMessage databaseObject;
        synchronized (this.chatEventLock) {
            databaseObject = sLChatEvent.getDatabaseObject();
            this.chatMessageDao.update(databaseObject);
        }
        onMessageUpdated(databaseObject);
        this.userManager.getUnreadNotificationManager().updateUnreadNotifications();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: notifyTeleportCompleteInternal, reason: merged with bridge method [inline-methods] */
    public void m288x2aa63855(String str) {
        Chatter chatter = getChatter(this.localChatterID);
        if (chatter != null) {
            ChatMessage databaseObject = new SLChatSessionMarkEvent(ChatMessageSourceUnknown.getInstance(), this.userManager.getUserID(), SLChatSessionMarkEvent.SessionMarkType.Teleport, str).getDatabaseObject();
            synchronized (this.chatEventLock) {
                databaseObject.setChatterID(chatter.getId().longValue());
                this.chatMessageDao.insert(databaseObject);
            }
            List<ChatMessageLoader> loaders = getLoaders(this.localChatterID);
            if (loaders != null) {
                Iterator<ChatMessageLoader> it = loaders.iterator();
                while (it.hasNext()) {
                    ((ChatMessageLoader) it.next()).addElement(databaseObject);
                }
            }
        }
    }

    private void onMessageUpdated(ChatMessage chatMessage) {
        Chatter load = this.chatterDao.load(Long.valueOf(chatMessage.getChatterID()));
        ChatterID fromDatabaseObject = load != null ? ChatterID.fromDatabaseObject(this.userManager.getUserID(), load) : null;
        if (fromDatabaseObject != null) {
            List<ChatMessageLoader> loaders = getLoaders(fromDatabaseObject);
            if (loaders != null) {
                Iterator<ChatMessageLoader> it = loaders.iterator();
                while (it.hasNext()) {
                    ((ChatMessageLoader) it.next()).updateElement(chatMessage);
                }
            }
            if (Objects.equal(chatMessage.getId(), load.getLastMessageID())) {
                this.unreadCountsPool.requestUpdate(fromDatabaseObject);
            }
            this.userManager.getUnreadNotificationManager().updateUnreadNotifications();
            this.chatEventBus.post(new ChatMessageEvent(chatMessage, false, fromDatabaseObject.getChatterType() == ChatterID.ChatterType.User));
        }
    }

    public void HandleChatEvent(final ChatterID chatterID, final SLChatEvent sLChatEvent, final boolean z) {
        this.userManager.getDatabaseExecutor().execute(new Runnable() { // from class: com.lumiyaviewer.lumiya.slproto.users.manager.-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI.8
            private final /* synthetic */ void $m$0() {
                ActiveChattersManager.this.m283x2a96bcb8((ChatterID) chatterID, (SLChatEvent) sLChatEvent, z);
            }

            @Override // java.lang.Runnable
            public final void run() {
                $m$0();
            }
        });
    }

    public void addDisplayedChatter(@Nonnull final ChatterID chatterID) {
        if (this.displayedChatters.add(chatterID)) {
            this.userManager.getDatabaseExecutor().execute(new Runnable() { // from class: com.lumiyaviewer.lumiya.slproto.users.manager.-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI
                private final /* synthetic */ void $m$0() {
                    ActiveChattersManager.this.m289x43721060((ChatterID) chatterID);
                }

                @Override // java.lang.Runnable
                public final void run() {
                    $m$0();
                }
            });
        }
    }

    public void addObjectMessageListener(OnChatEventListener onChatEventListener, @Nullable Executor executor) {
        synchronized (this.objectMessageListenersLock) {
            this.objectMessageListeners.put(onChatEventListener, executor);
        }
    }

    public void clearChatHistory(@Nonnull final ChatterID chatterID) {
        this.userManager.getDatabaseExecutor().execute(new Runnable() { // from class: com.lumiyaviewer.lumiya.slproto.users.manager.-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI.1
            private final /* synthetic */ void $m$0() {
                ActiveChattersManager.this.m284x2aa4c8d2((ChatterID) chatterID);
            }

            @Override // java.lang.Runnable
            public final void run() {
                $m$0();
            }
        });
    }

    ChatterDisplayDataList getActiveChattersList() {
        return new ActiveChattersDisplayDataList(this.userManager, this.onListUpdated);
    }

    public EventBus getChatEventBus() {
        return this.chatEventBus;
    }

    public ChatMessage getChatMessage(long j) {
        ChatMessage load;
        synchronized (this.chatEventLock) {
            load = this.chatMessageDao.load(Long.valueOf(j));
        }
        return load;
    }

    public Chatter getChatter(@Nonnull ChatterID chatterID) {
        return getChatter(chatterID, false);
    }

    Chatter getChatter(@Nonnull final ChatterID chatterID, boolean z) {
        Query<Chatter> forCurrentThread;
        final Chatter unique;
        boolean z2;
        SLAgentCircuit activeAgentCircuit = this.userManager.getActiveAgentCircuit();
        UUID sessionID = activeAgentCircuit != null ? activeAgentCircuit.getSessionID() : null;
        synchronized (this.chatEventLock) {
            UUID optionalChatterUUID = chatterID.getOptionalChatterUUID();
            if (optionalChatterUUID != null) {
                forCurrentThread = this.findChatterQuery.forCurrentThread();
                forCurrentThread.setParameter(0, Integer.valueOf(chatterID.getChatterType().ordinal()));
                forCurrentThread.setParameter(1, optionalChatterUUID.toString());
            } else {
                forCurrentThread = this.findChatterQueryNullUUID.forCurrentThread();
                forCurrentThread.setParameter(0, Integer.valueOf(chatterID.getChatterType().ordinal()));
            }
            unique = forCurrentThread.unique();
            if (z) {
                Object[] objArr = new Object[3];
                objArr[0] = Boolean.valueOf(unique != null);
                objArr[1] = sessionID;
                objArr[2] = unique != null ? unique.getLastSessionID() : null;
                Debug.Printf("markNewSession: result has %b, cur %s, last %s", objArr);
            }
            if (!z || unique == null || sessionID == null) {
                z2 = false;
            } else if (!Objects.equal(sessionID, unique.getLastSessionID())) {
                boolean z3 = unique.getLastSessionID() != null;
                unique.setLastSessionID(sessionID);
                this.chatterDao.update(unique);
                z2 = z3;
            } else {
                z2 = false;
            }
        }
        if (z2) {
            this.userManager.getDatabaseExecutor().execute(new Runnable() { // from class: com.lumiyaviewer.lumiya.slproto.users.manager.-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI.6
                private final /* synthetic */ void $m$0() {
                    ActiveChattersManager.this.m282x2a955819((ChatterID) chatterID, (Chatter) unique);
                }

                @Override // java.lang.Runnable
                public final void run() {
                    $m$0();
                }
            });
        }
        return unique;
    }

    public ChatMessageLoader getMessageLoader(@Nonnull ChatterID chatterID, ChunkedListLoader.EventListener eventListener) {
        List<WeakReference<ChatMessageLoader>> list;
        ChatMessageLoader chatMessageLoader = new ChatMessageLoader(this.userManager, chatterID, 100, this.userManager.getDatabaseExecutor(), false, eventListener);
        synchronized (this.messageLoadersLock) {
            List<WeakReference<ChatMessageLoader>> list2 = this.messageLoaders.get(chatterID);
            if (list2 == null) {
                LinkedList linkedList = new LinkedList();
                this.messageLoaders.put(chatterID, linkedList);
                list = linkedList;
            } else {
                list = list2;
            }
            Iterator<WeakReference<ChatMessageLoader>> it = list.iterator();
            while (it.hasNext()) {
                if (it.next().get() == null) {
                    it.remove();
                }
            }
            list.add(new WeakReference<>(chatMessageLoader));
        }
        return chatMessageLoader;
    }

    @Nullable
    public LazyList<ChatMessage> getMessages(ChatterID chatterID) {
        Chatter chatter = getChatter(chatterID);
        if (chatter == null) {
            return null;
        }
        return this.chatMessageDao.queryBuilder().where(ChatMessageDao.Properties.ChatterID.eq(chatter.getId()), new WhereCondition[0]).orderAsc(ChatMessageDao.Properties.Id).listLazy();
    }

    public SubscriptionPool<ChatterID, UnreadMessageInfo> getUnreadCounts() {
        return this.unreadCountsPool;
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ActiveChattersManager_10179, reason: not valid java name */
    /* synthetic */ void m282x2a955819(ChatterID chatterID, Chatter chatter) {
        makeSessionMark(chatterID, chatter.getId().longValue());
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ActiveChattersManager_25217, reason: not valid java name */
    /* synthetic */ void m286x2aa5b87a(ChatterID chatterID) {
        boolean z = false;
        if (chatterID == null || chatterID.getChatterType() == ChatterID.ChatterType.Local) {
            return;
        }
        synchronized (this.chatEventLock) {
            Chatter chatter = getChatter(chatterID);
            if (chatter != null && chatter.getMuted()) {
                chatter.setMuted(false);
                z = true;
            }
            if (z) {
                this.chatterDao.update(chatter);
            }
        }
    }

    public void markChatterInactive(final ChatterID chatterID, final boolean z) {
        this.userManager.getDatabaseExecutor().execute(new Runnable() { // from class: com.lumiyaviewer.lumiya.slproto.users.manager.-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI.7
            private final /* synthetic */ void $m$0() {
                ActiveChattersManager.this.m285x2aa5b155((ChatterID) chatterID, z);
            }

            @Override // java.lang.Runnable
            public final void run() {
                $m$0();
            }
        });
    }

    public void notifyChatEventUpdated(final SLChatEvent sLChatEvent) {
        this.userManager.getDatabaseExecutor().execute(new Runnable() { // from class: com.lumiyaviewer.lumiya.slproto.users.manager.-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI.3
            private final /* synthetic */ void $m$0() {
                ActiveChattersManager.this.m287x2aa63116((SLChatEvent) sLChatEvent);
            }

            @Override // java.lang.Runnable
            public final void run() {
                $m$0();
            }
        });
    }

    public void notifyTeleportComplete(final String str) {
        this.userManager.getDatabaseExecutor().execute(new Runnable() { // from class: com.lumiyaviewer.lumiya.slproto.users.manager.-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI.4
            private final /* synthetic */ void $m$0() {
                ActiveChattersManager.this.m288x2aa63855((String) str);
            }

            @Override // java.lang.Runnable
            public final void run() {
                $m$0();
            }
        });
    }

    @Override // com.lumiyaviewer.lumiya.slproto.users.manager.MessageSourceNameResolver.OnMessageSourcesResolvedListener
    public void onMessageSourcesResolved(Set<Long> set, UserName userName) {
        ChatMessage load;
        for (Long l : set) {
            if (l != null && (load = this.chatMessageDao.load(l)) != null) {
                load.setSenderName(userName.getDisplayName());
                load.setSenderLegacyName(userName.getUserName());
                this.chatMessageDao.update(load);
                onMessageUpdated(load);
            }
        }
    }

    public void releaseMessageLoader(ChatterID chatterID, ChatMessageLoader chatMessageLoader) {
        synchronized (this.messageLoadersLock) {
            List<WeakReference<ChatMessageLoader>> list = this.messageLoaders.get(chatterID);
            if (list != null) {
                Iterator<WeakReference<ChatMessageLoader>> it = list.iterator();
                while (it.hasNext()) {
                    ChatMessageLoader chatMessageLoader2 = it.next().get();
                    if (chatMessageLoader2 == null || chatMessageLoader2 == chatMessageLoader) {
                        it.remove();
                    }
                }
            }
        }
    }

    public void removeDisplayedChatter(@Nonnull ChatterID chatterID) {
        this.displayedChatters.remove(chatterID);
    }

    public void removeObjectMessageListener(OnChatEventListener onChatEventListener) {
        synchronized (this.objectMessageListenersLock) {
            this.objectMessageListeners.remove(onChatEventListener);
        }
    }

    public void unmuteChatter(final ChatterID chatterID) {
        this.userManager.getDatabaseExecutor().execute(new Runnable() { // from class: com.lumiyaviewer.lumiya.slproto.users.manager.-$Lambda$bC26PUjVA14BMgZPIZxiNFWFltI.5
            private final /* synthetic */ void $m$0() {
                ActiveChattersManager.this.m286x2aa5b87a((ChatterID) chatterID);
            }

            @Override // java.lang.Runnable
            public final void run() {
                $m$0();
            }
        });
    }
}
