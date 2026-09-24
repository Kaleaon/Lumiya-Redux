package com.lumiyaviewer.lumiya.slproto.users.manager;

import android.annotation.SuppressLint;
import android.content.Context;
import com.google.common.base.Strings;
import com.google.common.collect.ImmutableList;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.LumiyaApp;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.cloud.common.LogChatMessage;
import com.lumiyaviewer.lumiya.cloud.common.LogFlushMessages;
import com.lumiyaviewer.lumiya.cloud.common.LogMessageBatch;
import com.lumiyaviewer.lumiya.cloud.common.MessageType;
import com.lumiyaviewer.lumiya.dao.ChatMessage;
import com.lumiyaviewer.lumiya.dao.ChatMessageDao;
import com.lumiyaviewer.lumiya.dao.Chatter;
import com.lumiyaviewer.lumiya.dao.ChatterDao;
import com.lumiyaviewer.lumiya.dao.DaoSession;
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever;
import com.lumiyaviewer.lumiya.sync.CloudSyncServiceConnection;
import de.greenrobot.dao.query.LazyList;
import de.greenrobot.dao.query.Query;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public class SyncManager {

    private static final int MAX_MESSAGES_PER_BATCH = 100;

    @Nonnull
    private final ChatMessageDao chatMessageDao;

    @Nonnull
    private final ChatterDao chatterDao;

    @Nonnull
    private final Context context;
    private final DateFormat dateFormat;

    @Nonnull
    private final Executor dbExecutor;

    @Nonnull
    private final String localChatName;
    private final Query<ChatMessage> messagesQuery;

    @Nonnull
    private final UserManager userManager;
    private final AtomicBoolean syncingEnabled = new AtomicBoolean(false);
    private final AtomicReference<CloudSyncServiceConnection> syncServiceConnection = new AtomicReference<>();
    private final AtomicBoolean syncMessageSent = new AtomicBoolean(false);
    private final AtomicBoolean needsStopSyncing = new AtomicBoolean(false);
    private final Map<ChatterID, ChatterNameRetriever> flushChatters = new ConcurrentHashMap();
    private final Set<String> flushChatterNames = Collections.newSetFromMap(new ConcurrentHashMap());
    private long lastConfirmedMessageID = 0;
    private ChatterNameRetriever myNameRetriever = null;
    private ChatterNameRetriever chatterNameRetriever = null;

    @SuppressLint({"SimpleDateFormat"})
    SyncManager(@Nonnull UserManager userManager) {
        this.userManager = userManager;
        this.dbExecutor = userManager.getDatabaseExecutor();
        DaoSession daoSession = userManager.getDaoSession();
        this.chatMessageDao = daoSession.getChatMessageDao();
        this.chatterDao = daoSession.getChatterDao();
        this.context = LumiyaApp.getContext();
        this.localChatName = this.context.getString(R.string.local_chat_title);
        this.dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        this.messagesQuery = this.chatMessageDao.queryBuilder().where(ChatMessageDao.Properties.Id.gt(null), ChatMessageDao.Properties.SyncedToGoogleDrive.eq(false)).orderAsc(ChatMessageDao.Properties.Id).limit(100).build();
    }

    public void onChatterNameRetrieved(ChatterNameRetriever chatterNameRetriever) {
        this.dbExecutor.execute(new Runnable() {
            private final /* synthetic */ void $m$0() {
                SyncManager.this.syncMoreMessages();
            }

            @Override
            public final void run() {
                $m$0();
            }
        });
    }

    public void onFlushChatterNameRetrieved(ChatterNameRetriever chatterNameRetriever) {
        String resolvedName = chatterNameRetriever.getResolvedName();
        this.flushChatters.remove(chatterNameRetriever.chatterID);
        chatterNameRetriever.dispose();
        if (Strings.isNullOrEmpty(resolvedName) || !this.flushChatterNames.add(resolvedName)) {
            return;
        }
        syncMoreMessages();
    }

    public void onMyNameRetrieved(ChatterNameRetriever chatterNameRetriever) {
        this.dbExecutor.execute(new Runnable() {
            private final /* synthetic */ void $m$0() {
                SyncManager.this.syncMoreMessages();
            }

            @Override
            public final void run() {
                $m$0();
            }
        });
    }

    public void processMessagesFlushed(ImmutableList<Long> immutableList) {
        Iterator<Long> it = immutableList.iterator();
        while (it.hasNext()) {
            ChatMessage load = this.chatMessageDao.load(it.next());
            if (load != null && !load.getSyncedToGoogleDrive()) {
                load.setSyncedToGoogleDrive(true);
                this.chatMessageDao.update(load);
            }
        }
    }

    @Nullable
    private String resolveChatterName(@Nonnull Chatter chatter) {
        if (chatter.getType() != ChatterID.ChatterType.User.ordinal() && chatter.getType() != ChatterID.ChatterType.Group.ordinal()) {
            return this.localChatName;
        }
        ChatterID fromDatabaseObject = ChatterID.fromDatabaseObject(this.userManager.getUserID(), chatter);
        if (this.chatterNameRetriever == null || (!this.chatterNameRetriever.chatterID.equals(fromDatabaseObject))) {
            if (this.chatterNameRetriever != null) {
                this.chatterNameRetriever.dispose();
            }
            this.chatterNameRetriever = new ChatterNameRetriever(fromDatabaseObject, new ChatterNameRetriever.OnChatterNameUpdated() {
                private final /* synthetic */ void $m$0(ChatterNameRetriever chatterNameRetriever) {
                    SyncManager.this.onChatterNameRetrieved(chatterNameRetriever);
                }

                @Override
                public final void onChatterNameUpdated(ChatterNameRetriever chatterNameRetriever) {
                    $m$0(chatterNameRetriever);
                }
            }, this.dbExecutor, true);
        }
        return this.chatterNameRetriever.getResolvedName();
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x014f  */
    /* renamed from: syncMoreMessages, reason: merged with bridge method [inline-methods] and merged with bridge method [inline-methods] and merged with bridge method [inline-methods] and merged with bridge method [inline-methods] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void syncMoreMessages() {
        boolean zSendMessage = false;
        long j;
        int i;
        CloudSyncServiceConnection cloudSyncServiceConnection;
        Chatter chatter;
        if (!this.syncMessageSent.getAndSet(true)) {
            if (this.myNameRetriever == null) {
                this.myNameRetriever = new ChatterNameRetriever(ChatterID.getUserChatterID(this.userManager.getUserID(), this.userManager.getUserID()), new ChatterNameRetriever.OnChatterNameUpdated() {
                    private final /* synthetic */ void $m$0(ChatterNameRetriever chatterNameRetriever) {
                        SyncManager.this.onMyNameRetrieved(chatterNameRetriever);
                    }

                    @Override
                    public final void onChatterNameUpdated(ChatterNameRetriever chatterNameRetriever) {
                        $m$0(chatterNameRetriever);
                    }
                }, this.dbExecutor, true);
            }
            String resolvedName = this.myNameRetriever.getResolvedName();
            if (resolvedName != null) {
                Query<ChatMessage> forCurrentThread = this.messagesQuery.forCurrentThread();
                forCurrentThread.setParameter(0, Long.valueOf(this.lastConfirmedMessageID));
                LazyList<ChatMessage> listLazy = forCurrentThread.listLazy();
                ImmutableList.Builder builder = ImmutableList.builder();
                int i2 = 0;
                long j2 = 0;
                Iterator<ChatMessage> it = listLazy.iterator();
                while (true) {
                    j = j2;
                    i = i2;
                    if (!it.hasNext()) {
                        break;
                    }
                    ChatMessage next = it.next();
                    SLChatEvent fromDatabaseObject = SLChatEvent.loadFromDatabaseObject(next, this.userManager.getUserID());
                    if (fromDatabaseObject != null && (chatter = this.chatterDao.load(Long.valueOf(next.getChatterID()))) != null) {
                        String chatterName = resolveChatterName(chatter);
                        if (chatterName == null) {
                            break;
                        }
                        LogChatMessage logChatMessage = new LogChatMessage(chatter.getType(), chatter.getUuid(), next.getId().longValue(), chatterName, new StringBuilder().append("[").append(this.dateFormat.format(next.getTimestamp())).append("] ").append(fromDatabaseObject.getPlainTextMessage(this.context, this.userManager, false)).toString());
                        builder.add(logChatMessage);
                        j = logChatMessage.messageID;
                        i++;
                        if (i >= 100) {
                            break;
                        }
                    }
                    j2 = j;
                    i2 = i;
                }
                listLazy.close();
                if (i != 0) {
                    LogMessageBatch logMessageBatch = new LogMessageBatch(this.userManager.getUserID(), resolvedName, builder.build(), j);
                    CloudSyncServiceConnection cloudSyncServiceConnection2 = this.syncServiceConnection.get();
                    zSendMessage = cloudSyncServiceConnection2 != null ? cloudSyncServiceConnection2.sendMessage(MessageType.LogMessageBatch, logMessageBatch) : false;
                    if (!this.flushChatterNames.isEmpty() && (cloudSyncServiceConnection = this.syncServiceConnection.get()) != null) {
                        Iterator<String> iterator = this.flushChatterNames.iterator();
                        if (iterator.hasNext()) {
                            String next2 = iterator.next();
                            iterator.remove();
                            cloudSyncServiceConnection.sendMessage(MessageType.LogFlushMessages, new LogFlushMessages(this.userManager.getUserID(), resolvedName, next2));
                        }
                    }
                }
            } else {
                zSendMessage = false;
            }
            this.syncMessageSent.set(zSendMessage);
        }
        if (this.needsStopSyncing.getAndSet(false)) {
            this.syncingEnabled.set(false);
            CloudSyncServiceConnection andSet = this.syncServiceConnection.getAndSet(null);
            this.syncMessageSent.set(false);
            if (andSet != null) {
                andSet.sendMessage(MessageType.LogFlushMessages, new LogFlushMessages(this.userManager.getUserID(), null, null));
                andSet.disconnect();
            }
        }
    }

    void flushChatter(final ChatterID chatterID) {
        if (this.syncingEnabled.get()) {
            this.dbExecutor.execute(new Runnable() {
                private final /* synthetic */ void $m$0() {
                    SyncManager.this.m374x1b9f5c8c((ChatterID) chatterID);
                }

                @Override
                public final void run() {
                    $m$0();
                }
            });
        }
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_SyncManager_10038, reason: not valid java name */
    /* synthetic */ void m373x1b9f54d0() {
        this.needsStopSyncing.set(true);
        syncMoreMessages();
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_SyncManager_10254, reason: not valid java name */
    /* synthetic */ void m374x1b9f5c8c(ChatterID chatterID) {
        switch (chatterID.getChatterType()) {
            case Group:
            case User:
                if (!this.flushChatters.containsKey(chatterID)) {
                    new ChatterNameRetriever(chatterID, new ChatterNameRetriever.OnChatterNameUpdated() {
                        private final /* synthetic */ void $m$0(ChatterNameRetriever chatterNameRetriever) {
                            SyncManager.this.onFlushChatterNameRetrieved(chatterNameRetriever);
                        }

                        @Override
                        public final void onChatterNameUpdated(ChatterNameRetriever chatterNameRetriever) {
                            $m$0(chatterNameRetriever);
                        }
                    }, this.dbExecutor, false).subscribe();
                    break;
                }
                break;
            case Local:
                if (this.flushChatterNames.add(this.localChatName)) {
                    syncMoreMessages();
                    break;
                }
                break;
        }
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_SyncManager_9602, reason: not valid java name */
    /* synthetic */ void m375xcf5b71e5(long lastConfirmedMessageID) {
        this.lastConfirmedMessageID = lastConfirmedMessageID;
        this.syncMessageSent.set(false);
        syncMoreMessages();
    }

    public void onMessagesFlushed(final ImmutableList<Long> immutableList) {
        this.dbExecutor.execute(new Runnable() {
            private final /* synthetic */ void $m$0() {
                SyncManager.this.processMessagesFlushed((ImmutableList) immutableList);
            }

            @Override
            public final void run() {
                $m$0();
            }
        });
    }

    public void onMessagesWritten(final long j) {
        this.dbExecutor.execute(new Runnable() {
            private final /* synthetic */ void $m$0() {
                SyncManager.this.m375xcf5b71e5(j);
            }

            @Override
            public final void run() {
                $m$0();
            }
        });
    }

    public void startSyncing(CloudSyncServiceConnection cloudSyncServiceConnection) {
        this.syncServiceConnection.set(cloudSyncServiceConnection);
        this.syncingEnabled.set(true);
        this.needsStopSyncing.set(false);
        this.dbExecutor.execute(new Runnable() {
            private final /* synthetic */ void $m$0() {
                SyncManager.this.syncMoreMessages();
            }

            @Override
            public final void run() {
                $m$0();
            }
        });
    }

    public void stopSyncing() {
        Debug.Printf("SyncManager: requested to stop syncing", new Object[0]);
        this.dbExecutor.execute(new Runnable() {
            private final /* synthetic */ void $m$0() {
                SyncManager.this.m373x1b9f54d0();
            }

            @Override
            public final void run() {
                $m$0();
            }
        });
    }

    void syncNewMessages() {
        if (this.syncingEnabled.get()) {
            this.dbExecutor.execute(new Runnable() {
                private final /* synthetic */ void $m$0() {
                    SyncManager.this.syncMoreMessages();
                }

                @Override
                public final void run() {
                    $m$0();
                }
            });
        }
    }
}
