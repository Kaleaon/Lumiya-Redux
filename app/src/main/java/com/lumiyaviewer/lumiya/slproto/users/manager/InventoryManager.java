package com.lumiyaviewer.lumiya.slproto.users.manager;

import com.google.common.base.Objects;
import com.google.common.base.Predicate;
import com.google.common.base.Strings;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.orm.DBObject;
import com.lumiyaviewer.lumiya.orm.InventoryDB;
import com.lumiyaviewer.lumiya.orm.InventoryDBManager;
import com.lumiyaviewer.lumiya.orm.InventoryEntryList;
import com.lumiyaviewer.lumiya.orm.InventoryQuery;
import com.lumiyaviewer.lumiya.react.AsyncRequestHandler;
import com.lumiyaviewer.lumiya.react.DisposeHandler;
import com.lumiyaviewer.lumiya.react.OpportunisticExecutor;
import com.lumiyaviewer.lumiya.react.Refreshable;
import com.lumiyaviewer.lumiya.react.RequestHandler;
import com.lumiyaviewer.lumiya.react.RequestProcessor;
import com.lumiyaviewer.lumiya.react.RequestSource;
import com.lumiyaviewer.lumiya.react.Subscribable;
import com.lumiyaviewer.lumiya.react.Subscription;
import com.lumiyaviewer.lumiya.react.SubscriptionPool;
import com.lumiyaviewer.lumiya.react.SubscriptionSingleDataPool;
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey;
import com.lumiyaviewer.lumiya.react.UnsubscribableOne;
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicReference;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public class InventoryManager {
    private final RequestProcessor<UUID, SLInventoryEntry, SLInventoryEntry> folderRequestProcessor;

    @Nonnull
    private final InventoryDB inventoryDB;
    private final OpportunisticExecutor inventoryDbExecutor = new OpportunisticExecutor("InventoryDB");
    private final SubscriptionPool<UUID, Boolean> folderLoadingPool = new SubscriptionPool<>();
    private final SubscriptionPool<UUID, SLInventoryEntry> folderEntryPool = new SubscriptionPool<>();
    private final SubscriptionPool<InventoryQuery, InventoryEntryList> entryListPool = new SubscriptionPool<>();
    private final AtomicReference<UUID> rootFolderID = new AtomicReference<>(null);
    private final AtomicReference<UUID> currentSessionID = new AtomicReference<>(null);
    private final SubscriptionPool<SubscriptionSingleKey, Boolean> searchProcessPool = new SubscriptionPool<>();
    private final SubscriptionPool<SubscriptionSingleKey, Boolean> searchRunningPool = new SubscriptionPool<>();
    private final SubscriptionSingleDataPool<InventoryClipboardEntry> clipboardPool = new SubscriptionSingleDataPool<>();
    private final RequestHandler<InventoryQuery> queryRequestHandler = new RequestHandler<InventoryQuery>() {
        private final Map<InventoryQuery, FolderSubscription> folderQueries = new ConcurrentHashMap();

        @Override
        public void onRequest(@Nonnull InventoryQuery inventoryQuery) {
            FolderSubscription put;
            FolderSubscription folderSubscription = null;
            if (inventoryQuery.containsString() != null) {
                InventoryManager.this.entryListPool.onResultData(inventoryQuery, inventoryQuery.query(null, InventoryManager.this.inventoryDB));
                return;
            }
            UUID folderId = inventoryQuery.folderId();
            if (folderId == null) {
                folderId = (UUID) InventoryManager.this.rootFolderID.get();
            }
            Debug.Printf("Inventory: queryRequestHandler: folderId = '%s'", folderId);
            if (folderId == null || (put = this.folderQueries.put(inventoryQuery, new FolderSubscription(InventoryManager.this, inventoryQuery, folderId, folderSubscription))) == null) {
                return;
            }
            put.unsubscribe();
        }

        @Override
        public void onRequestCancelled(@Nonnull InventoryQuery inventoryQuery) {
            FolderSubscription folderSubscription = this.folderQueries.get(inventoryQuery);
            if (folderSubscription != null) {
                folderSubscription.unsubscribe();
            }
        }
    };

    private class FolderSubscription implements Subscription.OnData<SLInventoryEntry>, Subscription.OnError, UnsubscribableOne {
        private final InventoryQuery query;
        private final Subscription<UUID, SLInventoryEntry> subscription;

        private FolderSubscription(InventoryQuery inventoryQuery, UUID uuid) {
            this.query = inventoryQuery;
            Debug.Printf("Inventory: folder subscription: folderId = '%s'", uuid);
            this.subscription = InventoryManager.this.folderEntryPool.subscribe(uuid, InventoryManager.this.inventoryDbExecutor, this, this);
        }

        /* synthetic */ FolderSubscription(InventoryManager inventoryManager, InventoryQuery inventoryQuery, UUID uuid, FolderSubscription folderSubscription) {
            this(inventoryQuery, uuid);
        }

        @Override
        public void onData(SLInventoryEntry sLInventoryEntry) {
            if (sLInventoryEntry != null) {
                Debug.Printf("Inventory: folder subscription got name: %s with folderId = '%s'", sLInventoryEntry.name, sLInventoryEntry.uuid);
            }
            InventoryManager.this.entryListPool.onResultData(this.query, this.query.query(sLInventoryEntry, InventoryManager.this.inventoryDB));
        }

        @Override
        public void onError(Throwable th) {
            Debug.Printf("Inventory: subscription error: %s", th);
            Debug.Warning(th);
            InventoryManager.this.entryListPool.onResultError(this.query, th);
        }

        @Override
        public void unsubscribe() {
            this.subscription.unsubscribe();
        }
    }

    public static class InventoryClipboardEntry {

        @Nonnull
        public final SLInventoryEntry inventoryEntry;
        public final boolean isCut;

        public InventoryClipboardEntry(boolean z, @Nonnull SLInventoryEntry sLInventoryEntry) {
            this.isCut = z;
            this.inventoryEntry = sLInventoryEntry;
        }
    }

    public InventoryManager(@Nonnull UUID uuid) {
        final InventoryDB userInventoryDB = InventoryDBManager.getUserInventoryDB(uuid);
        if (userInventoryDB == null) {
            throw new IllegalArgumentException("Null inventory database");
        }
        this.inventoryDB = userInventoryDB;
        this.folderRequestProcessor = new RequestProcessor<UUID, SLInventoryEntry, SLInventoryEntry>(this.folderEntryPool, this.inventoryDbExecutor) {
            @Override
            public boolean isRequestComplete(@Nonnull UUID uuid2, SLInventoryEntry sLInventoryEntry) {
                return sLInventoryEntry != null && Objects.equal(sLInventoryEntry.sessionID, InventoryManager.this.currentSessionID.get());
            }

            @Override
            @Nullable
            public SLInventoryEntry processRequest(@Nonnull UUID uuid2) {
                return userInventoryDB.findEntry(uuid2);
            }

            @Override
            public SLInventoryEntry processResult(@Nonnull UUID uuid2, SLInventoryEntry sLInventoryEntry) {
                if (sLInventoryEntry != null) {
                    Debug.Printf("Inventory: entry subscription got name: %s with folderId = '%s'", sLInventoryEntry.name, sLInventoryEntry.uuid);
                }
                InventoryManager.this.updateSearchResults();
                return sLInventoryEntry;
            }
        };
        this.folderEntryPool.setCacheInvalidateHandler(new Refreshable() {
            private final /* synthetic */ void $m$0(Object obj) {
                InventoryManager.m334xda6ba0b1((InventoryDB) userInventoryDB, (UUID) obj);
            }

            @Override
            public final void requestUpdate(Object obj) {
                $m$0(obj);
            }
        }, this.inventoryDbExecutor);
        this.entryListPool.attachRequestHandler(new AsyncRequestHandler(this.inventoryDbExecutor, this.queryRequestHandler));
        this.entryListPool.setDisposeHandler(new DisposeHandler() {
            private final /* synthetic */ void $m$0(Object obj) {
                ((InventoryEntryList) obj).close();
            }

            @Override
            public final void onDispose(Object obj) {
                $m$0(obj);
            }
        }, this.inventoryDbExecutor);
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_InventoryManager_3450, reason: not valid java name */
    static /* synthetic */ void m334xda6ba0b1(InventoryDB inventoryDB, UUID uuid) {
        SLInventoryEntry findEntry = inventoryDB.findEntry(uuid);
        if (findEntry != null) {
            findEntry.sessionID = null;
            try {
                inventoryDB.saveEntry(findEntry);
            } catch (DBObject.DatabaseBindingException e) {
                Debug.Warning(e);
            }
        }
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_InventoryManager_6838, reason: not valid java name */
    static /* synthetic */ boolean m335xda6d0c9c(InventoryQuery inventoryQuery) {
        if (inventoryQuery != null) {
            return !Strings.isNullOrEmpty(inventoryQuery.containsString());
        }
        return false;
    }

    public void updateSearchResults() {
        this.entryListPool.requestUpdateSome(new Predicate() {
            private final /* synthetic */ boolean $m$0(Object obj) {
                return InventoryManager.m335xda6d0c9c((InventoryQuery) obj);
            }

            @Override
            public final boolean apply(Object obj) {
                return $m$0(obj);
            }
        });
    }

    public void copyToClipboard(@Nullable InventoryClipboardEntry inventoryClipboardEntry) {
        this.clipboardPool.setData(SubscriptionSingleKey.Value, inventoryClipboardEntry);
    }

    public Subscribable<SubscriptionSingleKey, InventoryClipboardEntry> getClipboard() {
        return this.clipboardPool;
    }

    public InventoryDB getDatabase() {
        return this.inventoryDB;
    }

    public Executor getExecutor() {
        return this.inventoryDbExecutor;
    }

    public Subscribable<UUID, SLInventoryEntry> getFolderEntryPool() {
        return this.folderEntryPool;
    }

    public Subscribable<UUID, Boolean> getFolderLoading() {
        return this.folderLoadingPool;
    }

    public RequestSource<UUID, Boolean> getFolderLoadingRequestSource() {
        return this.folderLoadingPool;
    }

    public RequestSource<UUID, SLInventoryEntry> getFolderRequestSource() {
        return this.folderRequestProcessor;
    }

    public Subscribable<InventoryQuery, InventoryEntryList> getInventoryEntries() {
        return this.entryListPool;
    }

    @Nullable
    public UUID getRootFolder() {
        return this.rootFolderID.get();
    }

    public Subscribable<SubscriptionSingleKey, Boolean> getSearchProcess() {
        return this.searchProcessPool;
    }

    public RequestSource<SubscriptionSingleKey, Boolean> getSearchProcessRequestSource() {
        return this.searchProcessPool;
    }

    public SubscriptionPool<SubscriptionSingleKey, Boolean> getSearchRunning() {
        return this.searchRunningPool;
    }

    public void requestFolderUpdate(@Nonnull UUID uuid) {
        this.folderEntryPool.requestUpdate(uuid);
    }

    public void setCurrentSessionID(UUID uuid) {
        this.currentSessionID.set(uuid);
    }

    public void setRootFolder(UUID uuid) {
        this.rootFolderID.set(uuid);
    }
}
