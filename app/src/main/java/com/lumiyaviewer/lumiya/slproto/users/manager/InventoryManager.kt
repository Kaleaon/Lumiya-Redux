package com.lumiyaviewer.lumiya.slproto.users.manager

import com.google.common.base.Objects
import com.google.common.base.Predicate
import com.google.common.base.Strings
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.orm.DBObject
import com.lumiyaviewer.lumiya.orm.InventoryDB
import com.lumiyaviewer.lumiya.orm.InventoryDBManager
import com.lumiyaviewer.lumiya.orm.InventoryEntryList
import com.lumiyaviewer.lumiya.orm.InventoryQuery
import com.lumiyaviewer.lumiya.react.AsyncRequestHandler
import com.lumiyaviewer.lumiya.react.DisposeHandler
import com.lumiyaviewer.lumiya.react.OpportunisticExecutor
import com.lumiyaviewer.lumiya.react.Refreshable
import com.lumiyaviewer.lumiya.react.RequestHandler
import com.lumiyaviewer.lumiya.react.RequestProcessor
import com.lumiyaviewer.lumiya.react.RequestSource
import com.lumiyaviewer.lumiya.react.Subscribable
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionPool
import com.lumiyaviewer.lumiya.react.SubscriptionSingleDataPool
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.react.UnsubscribableOne
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry
import java.util.Map
import java.util.UUID
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.Executor
import java.util.concurrent.atomic.AtomicReference

open class InventoryManager {
    private var folderRequestProcessor: RequestProcessor<UUID, SLInventoryEntry, SLInventoryEntry> = null

    private var inventoryDB: InventoryDB = null
    private var inventoryDbExecutor: OpportunisticExecutor = OpportunisticExecutor("InventoryDB")
    private var folderLoadingPool: SubscriptionPool<UUID, Boolean> = SubscriptionPool<>()
    private var folderEntryPool: SubscriptionPool<UUID, SLInventoryEntry> = SubscriptionPool<>()
    private var entryListPool: SubscriptionPool<InventoryQuery, InventoryEntryList> = SubscriptionPool<>()
    private var rootFolderID: AtomicReference<UUID> = AtomicReference<>(null)
    private var currentSessionID: AtomicReference<UUID> = AtomicReference<>(null)
    private var searchProcessPool: SubscriptionPool<SubscriptionSingleKey, Boolean> = SubscriptionPool<>()
    private var searchRunningPool: SubscriptionPool<SubscriptionSingleKey, Boolean> = SubscriptionPool<>()
    private var clipboardPool: SubscriptionSingleDataPool<InventoryClipboardEntry> = SubscriptionSingleDataPool<>()
    private var queryRequestHandler: RequestHandler<InventoryQuery> = RequestHandler<InventoryQuery>() {
        private Map<InventoryQuery, FolderSubscription> folderQueries = ConcurrentHashMap()
        fun onRequest(inventoryQuery: InventoryQuery) {
            var put: FolderSubscription = null
            var folderSubscription: FolderSubscription = null
            if (inventoryQuery.containsString() != null) {
                InventoryManager.this.entryListPool.onResultData(inventoryQuery, inventoryQuery.query(null, InventoryManager.this.inventoryDB))
                return
            }
            var folderId: UUID = inventoryQuery.folderId()
            if (folderId == null) {
                folderId = InventoryManager as UUID.this.rootFolderID.get()
            }
            Debug.Printf("Inventory: queryRequestHandler: folderId = '%s'", folderId)
            if (folderId == null || (put = this.folderQueries.put(inventoryQuery, FolderSubscription(InventoryManager.this, inventoryQuery, folderId, folderSubscription))) == null) {
                return
            }
            put.unsubscribe()
        }
        fun onRequestCancelled(inventoryQuery: InventoryQuery) {
            var folderSubscription: FolderSubscription = this.folderQueries.get(inventoryQuery)
            if (folderSubscription != null) {
                folderSubscription.unsubscribe()
            }
        }
    }

    private open class FolderSubscription : Subscription.OnData<SLInventoryEntry>, Subscription.OnError, UnsubscribableOne {
        private InventoryQuery query
        private Subscription<UUID, SLInventoryEntry> subscription

        fun FolderSubscription(inventoryQuery: InventoryQuery, uuid: UUID): private {
            this.query = inventoryQuery
            Debug.Printf("Inventory: folder subscription: folderId = '%s'", uuid)
            this.subscription = InventoryManager.this.folderEntryPool.subscribe(uuid, InventoryManager.this.inventoryDbExecutor, this, this)
        }

        /* synthetic */ FolderSubscription(InventoryManager inventoryManager, InventoryQuery inventoryQuery, UUID uuid, FolderSubscription folderSubscription) {
            this(inventoryQuery, uuid)
        }
        fun onData(inventoryEntry: SLInventoryEntry) {
            if (inventoryEntry != null) {
                Debug.Printf("Inventory: folder subscription got name: %s with folderId = '%s'", inventoryEntry.name, inventoryEntry.uuid)
            }
            InventoryManager.this.entryListPool.onResultData(this.query, this.query.query(inventoryEntry, InventoryManager.this.inventoryDB))
        }
        fun onError(th: Throwable) {
            Debug.Printf("Inventory: subscription error: %s", th)
            Debug.WarningInventoryManager as th.this.entryListPool.onResultError(this.query, th)
        }
        fun unsubscribe() {
            this.subscription.unsubscribe()
        }
    }

    open class InventoryClipboardEntry {

        public SLInventoryEntry inventoryEntry
        public var isCut: Boolean

        fun InventoryClipboardEntry(isCut: Boolean, inventoryEntry: SLInventoryEntry): public {
            this.isCut = isCut
            this.inventoryEntry = inventoryEntry
        }
    }

    constructor(uuid: UUID) {
        var userInventoryDB: InventoryDB = InventoryDBManager.getUserInventoryDB(uuid)
        if (userInventoryDB == null) {
            throw IllegalArgumentException("Null inventory database")
        }
        this.inventoryDB = userInventoryDB
        this.folderRequestProcessor = RequestProcessor<UUID, SLInventoryEntry, SLInventoryEntry>(this.folderEntryPool, this.inventoryDbExecutor) {
            fun isRequestComplete(uuid2: UUID, sLInventoryEntry: SLInventoryEntry): Boolean {
                return sLInventoryEntry != null && Objects.equal(sLInventoryEntry.sessionID, InventoryManager.this.currentSessionID.get())
            }
            fun processRequest(uuid2: UUID): SLInventoryEntry {
                return userInventoryDB.findEntry(uuid2)
            }
            fun processResult(uuid2: UUID, sLInventoryEntry: SLInventoryEntry): SLInventoryEntry {
                if (sLInventoryEntry != null) {
                    Debug.Printf("Inventory: entry subscription got name: %s with folderId = '%s'", sLInventoryEntry.name, sLInventoryEntry.uuid)
                }
                InventoryManager.this.updateSearchResults()
        return sLInventoryEntry
            }
        }
        this.folderEntryPool.setCacheInvalidateHandler(Refreshable() {
            private /* synthetic */ void $m$0(Object obj) {
                InventoryManager.m334xda6ba0b1(userInventoryDB as InventoryDB, obj as UUID)
            }
            fun requestUpdate(obj: Any) {
                $m$0(obj)
            }
        }, this.inventoryDbExecutor)
        this.entryListPool.attachRequestHandler(AsyncRequestHandler(this.inventoryDbExecutor, this.queryRequestHandler))
        this.entryListPool.setDisposeHandler(DisposeHandler() {
            private /* synthetic */ void $m$0(Object obj) {
                (obj as InventoryEntryList).close()
            }
            fun onDispose(obj: Any) {
                $m$0(obj)
            }
        }, this.inventoryDbExecutor)
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_InventoryManager_3450, reason: not valid java name */
    static /* synthetic */ void m334xda6ba0b1(InventoryDB inventoryDB, UUID uuid) {
        var findEntry: SLInventoryEntry = inventoryDB.findEntry(uuid)
        if (findEntry != null) {
            findEntry.sessionID = null
            try {
                inventoryDB.saveEntry(findEntry)
            } catch (e: DBObject.DatabaseBindingException) {
                Debug.Warning(e)
            }
        }
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_InventoryManager_6838, reason: not valid java name */
    static /* synthetic */ boolean m335xda6d0c9c(InventoryQuery inventoryQuery) {
        if (inventoryQuery != null) {
            return !Strings.isNullOrEmpty(inventoryQuery.containsString())
        }
        return false
    }

    fun updateSearchResults() {
        this.entryListPool.requestUpdateSome(Predicate() {
            private /* synthetic */ boolean $m$0(Object obj) {
                return InventoryManager.m335xda6d0c9c(obj as InventoryQuery)
            }
            fun apply(obj: Any): Boolean {
                return $m$0(obj)
            }
        })
    }

    fun copyToClipboard(inventoryClipboardEntry: InventoryClipboardEntry) {
        this.clipboardPool.setData(SubscriptionSingleKey.Value, inventoryClipboardEntry)
    }

    public Subscribable<SubscriptionSingleKey, InventoryClipboardEntry> getClipboard() {
        return this.clipboardPool
    }

    fun getDatabase(): InventoryDB {
        return this.inventoryDB
    }

    fun getExecutor(): Executor {
        return this.inventoryDbExecutor
    }

    public Subscribable<UUID, SLInventoryEntry> getFolderEntryPool() {
        return this.folderEntryPool
    }

    public Subscribable<UUID, Boolean> getFolderLoading() {
        return this.folderLoadingPool
    }

    public RequestSource<UUID, Boolean> getFolderLoadingRequestSource() {
        return this.folderLoadingPool
    }

    public RequestSource<UUID, SLInventoryEntry> getFolderRequestSource() {
        return this.folderRequestProcessor
    }

    public Subscribable<InventoryQuery, InventoryEntryList> getInventoryEntries() {
        return this.entryListPool
    }

    fun getRootFolder(): UUID {
        return this.rootFolderID.get()
    }

    public Subscribable<SubscriptionSingleKey, Boolean> getSearchProcess() {
        return this.searchProcessPool
    }

    public RequestSource<SubscriptionSingleKey, Boolean> getSearchProcessRequestSource() {
        return this.searchProcessPool
    }

    public SubscriptionPool<SubscriptionSingleKey, Boolean> getSearchRunning() {
        return this.searchRunningPool
    }

    fun requestFolderUpdate(uuid: UUID) {
        this.folderEntryPool.requestUpdate(uuid)
    }

    fun setCurrentSessionID(uuid: UUID) {
        this.currentSessionID.set(uuid)
    }

    fun setRootFolder(uuid: UUID) {
        this.rootFolderID.set(uuid)
    }
}
