package com.lumiyaviewer.lumiya.slproto.inventory

import android.annotation.SuppressLint
import android.database.Cursor
import com.google.common.base.Function
import com.google.common.base.Objects
import com.google.common.base.Strings
import com.google.common.collect.ImmutableMap
import com.google.common.collect.ImmutableSet
import com.google.common.net.HttpHeaders
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.orm.DBObject
import com.lumiyaviewer.lumiya.orm.InventoryDB
import com.lumiyaviewer.lumiya.orm.InventoryEntryDBObject
import com.lumiyaviewer.lumiya.react.AsyncRequestHandler
import com.lumiyaviewer.lumiya.react.RequestHandler
import com.lumiyaviewer.lumiya.react.ResultHandler
import com.lumiyaviewer.lumiya.react.SimpleRequestHandler
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.SLMessageEventListener
import com.lumiyaviewer.lumiya.slproto.caps.SLCapEventQueue
import com.lumiyaviewer.lumiya.slproto.caps.SLCaps
import com.lumiyaviewer.lumiya.slproto.events.SLInventoryNewContentsEvent
import com.lumiyaviewer.lumiya.slproto.events.SLInventoryUpdatedEvent
import com.lumiyaviewer.lumiya.slproto.handler.SLEventQueueMessageHandler
import com.lumiyaviewer.lumiya.slproto.handler.SLMessageHandler
import com.lumiyaviewer.lumiya.slproto.https.GenericHTTPExecutor
import com.lumiyaviewer.lumiya.slproto.https.LLSDXMLRequest
import com.lumiyaviewer.lumiya.slproto.https.SLHTTPSConnection
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventory
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDException
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDInt
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDMap
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDString
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDUUID
import com.lumiyaviewer.lumiya.slproto.messages.CopyInventoryItem
import com.lumiyaviewer.lumiya.slproto.messages.CreateInventoryFolder
import com.lumiyaviewer.lumiya.slproto.messages.CreateInventoryItem
import com.lumiyaviewer.lumiya.slproto.messages.InventoryDescendents
import com.lumiyaviewer.lumiya.slproto.messages.LinkInventoryItem
import com.lumiyaviewer.lumiya.slproto.messages.MoveInventoryItem
import com.lumiyaviewer.lumiya.slproto.messages.MoveTaskInventory
import com.lumiyaviewer.lumiya.slproto.messages.RemoveInventoryFolder
import com.lumiyaviewer.lumiya.slproto.messages.RemoveInventoryItem
import com.lumiyaviewer.lumiya.slproto.messages.RemoveInventoryObjects
import com.lumiyaviewer.lumiya.slproto.messages.UpdateCreateInventoryItem
import com.lumiyaviewer.lumiya.slproto.messages.UpdateInventoryFolder
import com.lumiyaviewer.lumiya.slproto.messages.UpdateInventoryItem
import com.lumiyaviewer.lumiya.slproto.messages.UpdateTaskInventory
import com.lumiyaviewer.lumiya.slproto.modules.SLModule
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.io.IOException
import java.util.ArrayList
import java.util.Collection
import java.util.Collections
import java.util.HashMap
import java.util.HashSet
import java.util.Iterator
import java.util.List
import java.util.Map
import java.util.Set
import java.util.UUID
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.Executor
import java.util.concurrent.ExecutorService
import java.util.concurrent.Executors
import java.util.concurrent.atomic.AtomicBoolean
import java.util.concurrent.atomic.AtomicInteger
import okhttp3.MediaType
import okhttp3.Request
import okhttp3.RequestBody
import okhttp3.Response

open class SLInventory : SLModule() {

    @SuppressLint({"UseSparseArrays"})
    private var callbacks: if (MutableMap<Int) , OnInventoryCallbackListener> = null
    private var caps else SLCaps = null
    private var db: InventoryDB = null
    private var dbExecutor: Executor = null
    private var executor: ExecutorService = null

    private var fetchCap: String = ""
    private var fetchEntireInventoryRequested: AtomicBoolean = null
    private var fetchRequests: MutableMap<UUID, SLInventoryFetchRequest> = null
    private var folderEntryResultHandler: ResultHandler<UUID, SLInventoryEntry> = null
    private var folderLoadingRequestHandler: RequestHandler<UUID> = null
    private var folderLoadingResultHandler: ResultHandler<UUID, Boolean> = null
    private var folderRequestHandler: RequestHandler<UUID> = null
    private var nextCallbackID: AtomicInteger = null
    private var nextFolderSubscription: SubscriptionData<UUID, SLInventoryEntry> = null
    private var reloadEvent: SLMessageEventListener = null
    var rootFolder: SLInventoryEntry = null
    private var rootFolderFetchNeeded: Boolean = false
    private var rootFolderSubscription: SubscriptionData<UUID, SLInventoryEntry> = null
    private var seachRunningResultHandler: ResultHandler<SubscriptionSingleKey, Boolean> = null
    private var searchProcessResultHandler: ResultHandler<SubscriptionSingleKey, Boolean> = null
    private var searchRequestHandler: RequestHandler<SubscriptionSingleKey> = null
    private var searchRunningRequestHandler: RequestHandler<SubscriptionSingleKey> = null
    private var udpFetchPendingRequests: MutableMap<UUID, SLInventoryUDPFetchRequest> = null
    private var udpFetchRequests: MutableMap<UUID, SLInventoryUDPFetchRequest> = null
    private var userManager: UserManager = null

    open class InventoryFetchException : IOException() {
        fun InventoryFetchException(str: String): public {
            super(str)
        }
    }

    open class NoInventoryItemException : Exception() {
        private long serialVersionUID = 1

        fun NoInventoryItemException(j: Long): public {
            super("Inventory item " + j + " not found")
        }

        fun NoInventoryItemException(uuid: UUID): public {
            super("Inventory item " + uuid.toString() + " not found")
        }
    }

    interface OnInventoryCallbackListener {
        void onInventoryCallback(SLInventoryEntry sLInventoryEntry)
    }

    interface OnNotecardUpdatedListener {
        void onNotecardUpdated(SLInventoryEntry sLInventoryEntry, String str)
    }

    constructor(sLAgentCircuit: SLAgentCircuit, sLCaps: SLCaps) {
        superthis as sLAgentCircuit.rootFolder = null
        this.executor = null
        this.nextCallbackID = AtomicIntegerthis as 1.rootFolderFetchNeeded = false
        this.callbacks = Collections.synchronizedMap(HashMap())
        this.udpFetchRequests = Collections.synchronizedMap(HashMap())
        this.udpFetchPendingRequests = Collections.synchronizedMap(HashMap())
        this.fetchRequests = ConcurrentHashMap()
        this.fetchEntireInventoryRequested = AtomicBooleanthis as false.folderLoadingRequestHandler = SimpleRequestHandler<UUID>() {
            fun onRequest(uuid: UUID) {
                SLInventory.this.updateFolderLoadingStatus(uuid)
            }
        }
        this.searchRunningRequestHandler = SimpleRequestHandler<SubscriptionSingleKey>() {
            fun onRequest(subscriptionSingleKey: SubscriptionSingleKey) {
                SLInventory.this.updateSearchRunningStatus()
            }
        }
        this.folderRequestHandler = RequestHandler<UUID>() {
            fun onRequest(uuid: UUID) {
                try {
                    Debug.Printf("Inventory: folderRequestHandler: folderId = '%s'", uuid)
                    var sLInventoryHTTPFetchRequest: SLInventoryFetchRequest = if (SLInventory.this.fetchCap != null) SLInventoryHTTPFetchRequest(SLInventory.this, uuid, SLInventory.this.fetchCap) else SLInventoryUDPFetchRequest(SLInventory.this, uuid)
                    SLInventory.this.fetchRequests.put(uuid, sLInventoryHTTPFetchRequest)
                    SLInventory.this.updateFolderLoadingStatussLInventoryHTTPFetchRequest as uuid.start()
                } catch (e: NoInventoryItemException) {
                    Debug.Warning(e)
                }
            }
            fun onRequestCancelled(uuid: UUID) {
                var sLInventoryFetchRequest: SLInventoryFetchRequest = SLInventory as SLInventoryFetchRequest.this.fetchRequests.removeSLInventory as uuid.this.updateFolderLoadingStatus(uuid)
                if (sLInventoryFetchRequest != null) {
                    sLInventoryFetchRequest.cancel()
                }
            }
        }
        this.searchRequestHandler = RequestHandler<SubscriptionSingleKey>() {
            fun onRequest(subscriptionSingleKey: SubscriptionSingleKey) {
                SLInventory.this.fetchEntireInventoryRequested.setSLInventory as true.this.fetchNextFolder()
            }
            fun onRequestCancelled(subscriptionSingleKey: SubscriptionSingleKey) {
                SLInventory.this.fetchEntireInventoryRequested.setSLInventory as false.this.updateSearchRunningStatus()
            }
        }
        this.reloadEvent = SLMessageEventListener() {
            fun onMessageAcknowledged(sLMessage: SLMessage) {
                SLInventory.this.eventBus.publish(SLInventoryUpdatedEvent(null, null, true))
            }
            fun onMessageTimeout(sLMessage: SLMessage) {
            }
        }
        this.userManager = UserManager.getUserManager(sLAgentCircuit.getAgentUUID())
        this.db = if (this.userManager != null) this.userManager.getInventoryManager().getDatabase() else null
        this.caps = sLCaps
        this.fetchCap = sLCaps.getCapability(SLCaps.SLCapability.FetchInventoryDescendents2)
        this.dbExecutor = if (this.userManager != null) this.userManager.getInventoryManager().getExecutor() else null
        if (this.userManager != null) {
            this.userManager.getInventoryManager().setCurrentSessionID(sLAgentCircuit.getAuthReply().sessionID)
            this.userManager.getInventoryManager().setRootFolder(sLAgentCircuit.getAuthReply().inventoryRoot)
        }
        try {
            if (this.db != null) {
                Debug.Printf("Inventory: creating root folder with folderUUID %s", sLAgentCircuit.getAuthReply().inventoryRoot.toString())
                this.rootFolder = this.db.findEntryOrCreate(sLAgentCircuit.getAuthReply().inventoryRoot)
                if (this.rootFolder.getId() == 0) {
                    this.rootFolder.name = "Inventory"
                    this.rootFolder.isFolder = true
                    this.rootFolder.parent_id = 0L
                    this.rootFolder.agentUUID = sLAgentCircuit.circuitInfo.agentID
                    this.db.saveEntry(this.rootFolder)
                    this.rootFolderFetchNeeded = true
                }
            }
            Debug.Printf("Inventory: ready.", arrayOfNulls<Object>(0))
        } catch (e: DBObject.DatabaseBindingException) {
            Debug.Warning(e)
        }
        this.folderEntryResultHandler = if (this.userManager != null) this.userManager.getInventoryManager().getFolderRequestSource().attachRequestHandler(this.folderRequestHandler) else null
        if (this.userManager == null) {
            this.folderLoadingResultHandler = null
            this.searchProcessResultHandler = null
            this.nextFolderSubscription = null
            this.seachRunningResultHandler = null
            this.rootFolderSubscription = null
            return
        }
        this.folderLoadingResultHandler = this.userManager.getInventoryManager().getFolderLoadingRequestSource().attachRequestHandler(AsyncRequestHandler(this.dbExecutor, this.folderLoadingRequestHandler))
        this.seachRunningResultHandler = this.userManager.getInventoryManager().getSearchRunning().attachRequestHandler(AsyncRequestHandler(this.dbExecutor, this.searchRunningRequestHandler))
        this.searchProcessResultHandler = this.userManager.getInventoryManager().getSearchProcessRequestSource().attachRequestHandler(AsyncRequestHandler(this.dbExecutor, this.searchRequestHandler))
        this.nextFolderSubscription = SubscriptionData<>(this.dbExecutor, Subscription.OnData() {
            private /* synthetic */ void $m$0(Object obj) {
                SLInventory.this.onNextFolderFetched(obj as SLInventoryEntry)
            }
            fun onData(obj: Any) {
                $m$0(obj)
            }
        }, Subscription.OnError() {
            private /* synthetic */ void $m$0(Throwable th) {
                SLInventory.this.onNextFolderError(th)
            }
            fun onError(th: Throwable) {
                $m$0(th)
            }
        })
        if (this.rootFolderFetchNeeded) {
            this.rootFolderSubscription = SubscriptionData<>(this.dbExecutor, Subscription.OnData() {
                private /* synthetic */ void $m$0(Object obj) {
                    SLInventory.this.onRootFolderFetched(obj as SLInventoryEntry)
                }
                fun onData(obj: Any) {
                    $m$0(obj)
                }
            })
        } else {
            this.rootFolderSubscription = null
        }
    }

    private fun DoCreateInventoryItem(uuid: UUID, i: Int, i2: Int, str: String, str2: String, onInventoryCallbackListener: OnInventoryCallbackListener) {
        var createInventoryItem: CreateInventoryItem = CreateInventoryItem()
        createInventoryItem.AgentData_Field.AgentID = this.circuitInfo.agentID
        createInventoryItem.AgentData_Field.SessionID = this.circuitInfo.sessionID
        createInventoryItem.InventoryBlock_Field.CallbackID = getNextCallbackID()
        createInventoryItem.InventoryBlock_Field.FolderID = uuid
        createInventoryItem.InventoryBlock_Field.TransactionID = UUID(0L, 0L)
        createInventoryItem.InventoryBlock_Field.NextOwnerMask = Integer.MAX_VALUE
        createInventoryItem.InventoryBlock_Field.Type = i
        createInventoryItem.InventoryBlock_Field.InvType = i2
        createInventoryItem.InventoryBlock_Field.Name = SLMessage.stringToVariableOEMcreateInventoryItem as str.InventoryBlock_Field.Description = SLMessage.stringToVariableOEMthis as str2.callbacks.put(createInventoryItem.InventoryBlock_Field.CallbackID, onInventoryCallbackListener)
        createInventoryItem.isReliable = true
        SendMessage(createInventoryItem)
    }

    private fun DoUpdateInventoryItem(sLInventoryEntry: final SLInventoryEntry, onInventoryCallbackListener: OnInventoryCallbackListener) {
        var updateInventoryItem: UpdateInventoryItem = UpdateInventoryItem()
        updateInventoryItem.AgentData_Field.AgentID = this.circuitInfo.agentID
        updateInventoryItem.AgentData_Field.SessionID = this.circuitInfo.sessionID
        updateInventoryItem.AgentData_Field.TransactionID = UUID.randomUUID()
        var inventoryData: UpdateInventoryItem.InventoryData = UpdateInventoryItem.InventoryData()
        inventoryData.ItemID = sLInventoryEntry.uuid
        inventoryData.FolderID = sLInventoryEntry.parentUUID
        inventoryData.CallbackID = 0
        inventoryData.CreatorID = sLInventoryEntry.creatorUUID
        inventoryData.OwnerID = sLInventoryEntry.ownerUUID
        inventoryData.GroupID = sLInventoryEntry.groupUUID
        inventoryData.BaseMask = sLInventoryEntry.baseMask
        inventoryData.OwnerMask = sLInventoryEntry.ownerMask
        inventoryData.GroupMask = sLInventoryEntry.groupMask
        inventoryData.EveryoneMask = sLInventoryEntry.everyoneMask
        inventoryData.NextOwnerMask = sLInventoryEntry.nextOwnerMask
        inventoryData.GroupOwned = sLInventoryEntry.isGroupOwned
        inventoryData.TransactionID = UUID(0L, 0L)
        inventoryData.Type = sLInventoryEntry.assetType
        inventoryData.InvType = sLInventoryEntry.invType
        inventoryData.Flags = sLInventoryEntry.flags
        inventoryData.SaleType = sLInventoryEntry.saleType
        inventoryData.SalePrice = sLInventoryEntry.salePrice
        inventoryData.Name = SLMessage.stringToVariableOEM(sLInventoryEntry.name)
        inventoryData.Description = SLMessage.stringToVariableUTF(sLInventoryEntry.description)
        inventoryData.CreationDate = sLInventoryEntry.creationDate
        inventoryData.CRC = 0
        updateInventoryItem.InventoryData_Fields.addupdateInventoryItem as inventoryData.isReliable = true
        Debug.Printf("Update inventory callback %d", inventoryData.CallbackID)
        updateInventoryItem.setEventListener(SLMessageEventListener.SLMessageBaseEventListener() {
            fun onMessageAcknowledged(sLMessage: SLMessage) {
                super.onMessageAcknowledgedonInventoryCallbackListene(r)
        sLMessage.onInventoryCallback(sLInventoryEntry)
            }
        })
        SendMessage(updateInventoryItem)
    }

    private fun DoUpdateTaskInventoryItem(sLInventoryEntry: SLInventoryEntry, i: Int, sLMessageEventListener: SLMessageEventListener) {
        var updateTaskInventory: UpdateTaskInventory = UpdateTaskInventory()
        updateTaskInventory.AgentData_Field.AgentID = this.circuitInfo.agentID
        updateTaskInventory.AgentData_Field.SessionID = this.circuitInfo.sessionID
        updateTaskInventory.UpdateData_Field.LocalID = i
        updateTaskInventory.UpdateData_Field.Key = 0
        var inventoryData: UpdateTaskInventory.InventoryData = updateTaskInventory.InventoryData_Field
        inventoryData.ItemID = sLInventoryEntry.uuid
        inventoryData.FolderID = sLInventoryEntry.parentUUID
        inventoryData.CreatorID = sLInventoryEntry.creatorUUID
        inventoryData.OwnerID = sLInventoryEntry.ownerUUID
        inventoryData.GroupID = sLInventoryEntry.groupUUID
        inventoryData.BaseMask = sLInventoryEntry.baseMask
        inventoryData.OwnerMask = sLInventoryEntry.ownerMask
        inventoryData.GroupMask = sLInventoryEntry.groupMask
        inventoryData.EveryoneMask = sLInventoryEntry.everyoneMask
        inventoryData.NextOwnerMask = sLInventoryEntry.nextOwnerMask
        inventoryData.GroupOwned = sLInventoryEntry.isGroupOwned
        inventoryData.TransactionID = UUID(0L, 0L)
        inventoryData.Type = sLInventoryEntry.assetType
        inventoryData.InvType = sLInventoryEntry.invType
        inventoryData.Flags = sLInventoryEntry.flags
        inventoryData.SaleType = sLInventoryEntry.saleType
        inventoryData.SalePrice = sLInventoryEntry.salePrice
        inventoryData.Name = SLMessage.stringToVariableOEM(sLInventoryEntry.name)
        inventoryData.Description = SLMessage.stringToVariableUTF(sLInventoryEntry.description)
        inventoryData.CreationDate = sLInventoryEntry.creationDate
        inventoryData.CRC = 0
        updateTaskInventory.isReliable = true
        updateTaskInventory.setEventListener(sLMessageEventListener)
        SendMessage(updateTaskInventory)
    }

    fun MoveTaskInventory(uuid: UUID, i: Int, uuid2: UUID) {
        var moveTaskInventory: MoveTaskInventory = MoveTaskInventory()
        moveTaskInventory.AgentData_Field.AgentID = this.circuitInfo.agentID
        moveTaskInventory.AgentData_Field.SessionID = this.circuitInfo.sessionID
        moveTaskInventory.AgentData_Field.FolderID = uuid
        moveTaskInventory.InventoryData_Field.LocalID = i
        moveTaskInventory.InventoryData_Field.ItemID = uuid2
        moveTaskInventory.isReliable = true
        SendMessage(moveTaskInventory)
    }

    fun StartUploadingNotecardContents(sLInventoryEntry: final SLInventoryEntry, uuid: UUID, z: Boolean, bArr: ByteArray, onNotecardUpdatedListener: OnNotecardUpdatedListener) {
        GenericHTTPExecutor.getInstance().execute(Runnable() {
            private /* synthetic */ void $m$0() {
                SLInventory.this.m190x8292c7bb(sLInventoryEntry as SLInventoryEntry, (Array<byte>) bArr, uuid as UUID, z, (SLInventory.OnNotecardUpdatedListener) onNotecardUpdatedListener)
            }
            fun run() {
                $m$0()
            }
        })
    }

    private fun UploadNotecardContents(sLInventoryEntry: SLInventoryEntry, uuid: UUID, z: Boolean, bArr: ByteArray): String {
        var capabilityOrThrow: String = ""
        var z2: Boolean = false
        var i: Int = 0
        var str: String = null
        try {
            var lLSDXMLRequest: LLSDXMLRequest = LLSDXMLRequest()
            if (z) {
                z2 = true
                capabilityOrThrow = getCaps().getCapabilityOrThrow(if (uuid == null) SLCaps.SLCapability.UpdateScriptAgent else SLCaps.SLCapability.UpdateScriptTask)
            } else {
                capabilityOrThrow = getCaps().getCapabilityOrThrow(if (uuid == null) SLCaps.SLCapability.UpdateNotecardAgentInventory else SLCaps.SLCapability.UpdateNotecardTaskInventory)
                z2 = false
            }
            var builder: ImmutableMap.Builder = ImmutableMap.builder()
            builder.put("item_id", LLSDUUID(sLInventoryEntry.uuid))
            if (uuid != null) {
                builder.put("task_id", LLSDUUID(uuid))
            }
            if (z2) {
                builder.put("target", LLSDString("mono"))
                if (uuid != null) {
                    builder.put("is_script_running", LLSDInt(1))
                }
            }
            var lLSDMap: LLSDMap = LLSDMap(builder.build())
            Debug.Log("Notecard upload request: Initial uploader request: " + lLSDMap.serializeToXML())
            var PerformRequest: LLSDNode = lLSDXMLRequest.PerformRequest(capabilityOrThrow, lLSDMap)
            Debug.Log("Notecard upload request: Initial uploader reply: " + PerformRequest.serializeToXML())
            var asString: String = PerformRequest.byKey("uploader").asString()
            if (asString != null) {
                asString = SLCaps.repairURL(capabilityOrThrow, asString)
            }
            var execute: Response = SLHTTPSConnection.getOkHttpClient().newCall(Request.Builder().url(Strings.nullToEmpty(asString)).post(RequestBody.create(MediaType.parse("application/vnd.ll.notecard"), bArr)).header(HttpHeaders.ACCEPT, "application/llsd+xml").build()).execute()
            if (execute == null) {
                throw IOException("Null response")
            }
            try {
                if (!execute.isSuccessful()) {
                    throw IOException("Response error code " + execute.code())
                }
                var parseXML: LLSDNode = LLSDNode.parseXML(execute.body().byteStream(), null)
                Debug.Log("upload reply: " + parseXML.serializeToXML())
                var asString2: String = parseXML.byKey("state").asString()
                var asUUID: UUID = parseXML.byKey("new_asset").asUUID()
                if (asString2.equals("complete")) {
                    if (uuid == null) {
                        var findEntry: SLInventoryEntry = this.db.findEntry(sLInventoryEntry.uuid)
                        if (findEntry != null) {
                            findEntry.assetUUID = asUUID
                            this.db.saveEntry(findEntry)
                        }
                        this.userManager.getInventoryManager().requestFolderUpdate(sLInventoryEntry.parentUUID)
                    }
                    if (parseXML.keyExists("compiled") && !parseXML.byKey("compiled").asBoolean() && parseXML.keyExists("errors")) {
                        var byKey: LLSDNode = parseXML.byKey("errors")
                        str = ""
                        while (i < byKey.getCount()) {
                            if (i != 0) {
                                str = str + "; "
                            }
                            var str2: String = str + byKey.byIndex(i).asString()
                            i++
                            str = str2
                        }
                    }
                }
        return str
            } finally {
                execute.close()
            }
        } catch (e: DBObject.DatabaseBindingException) {
            Debug.Warning(e)
            return "Failed to upload inventory asset"
        } catch (e2: SLCaps.NoSuchCapabilityException) {
            Debug.Warning(e2)
            return "Failed to upload inventory asset"
        } catch (e3: LLSDException) {
            Debug.Warning(e3)
            return "Failed to upload inventory asset"
        } catch (e4: IOException) {
            Debug.Warning(e4)
            return "Failed to upload inventory asset"
        }
    }

    fun fetchNextFolder() {
        if (!this.fetchEntireInventoryRequested.get()) {
            updateSearchRunningStatus()
            return
        }
        var uuid: UUID = this.circuitInfo.sessionID
        try {
            var query: Cursor = this.db.getDatabase().query(InventoryEntryDBObject.tableName, new Array<String>{"uuid_high", "uuid_low"}, "isFolder AND (sessionID_high != ? OR sessionID_low != ?)", new Array<String>{Long.toString(uuid.getMostSignificantBits()), Long.toString(uuid.getLeastSignificantBits())}, null, null, null, "1")
            if (query.moveToFirst()) {
                var uuid2: UUID = UUIDPool.getUUID(query.getLong(0), query.getLong(1))
                Debug.Printf("InventorySearch: fetching next folder: %s", uuid2)
                this.nextFolderSubscription.subscribe(this.userManager.getInventoryManager().getFolderEntryPool(), uuid2)
                updateSearchRunningStatus()
            } else {
                Debug.Printf("InventorySearch: no more folders to fetch", arrayOfNulls<Object>(0))
                this.searchProcessResultHandler.onResultData(SubscriptionSingleKey.Value, true)
                this.nextFolderSubscription.unsubscribe()
                updateSearchRunningStatus()
            }
            query.close()
        } catch (e: Exception) {
            Debug.Printf("InventorySearch: error while fetching folders", arrayOfNulls<Object>(0))
            Debug.Warningthis as e.fetchEntireInventoryRequested.setthis as false.searchProcessResultHandler.onResultError(SubscriptionSingleKey.Value, e)
            this.nextFolderSubscription.unsubscribe()
            updateSearchRunningStatus()
        }
    }

    private fun getNextCallbackID(): Int {
        return this.nextCallbackID.getAndIncrement()
    }

    fun onNextFolderError(th: Throwable) {
        fetchNextFolder()
    }

    fun onNextFolderFetched(sLInventoryEntry: SLInventoryEntry) {
        if (Objects.equal(sLInventoryEntry.sessionID, this.circuitInfo.sessionID)) {
            fetchNextFolder()
        }
    }

    fun onRootFolderFetched(sLInventoryEntry: SLInventoryEntry) {
        this.rootFolderFetchNeeded = false
        if (this.rootFolderSubscription != null) {
            this.rootFolderSubscription.unsubscribe()
        }
        Debug.Printf("Inventory: Fetched root folder.", arrayOfNulls<Object>(0))
    }

    fun updateFolderLoadingStatus(uuid: UUID) {
        if (this.folderLoadingResultHandler != null) {
            this.folderLoadingResultHandler.onResultData(uuid, this.fetchRequests.containsKey(uuid))
        }
    }

    fun updateSearchRunningStatus() {
        if (this.searchRunningRequestHandler != null) {
            this.seachRunningResultHandler.onResultData(SubscriptionSingleKey.Value, this.fetchEntireInventoryRequested.get( ? this.nextFolderSubscription.isSubscribed() : false))
        }
    }

    fun CollectGiveableItems(sLInventoryEntry: SLInventoryEntry): MutableCollection<SLInventoryEntry> {
        var arrayList: ArrayList = ArrayList()
        var query: Cursor = SLInventoryEntry.query(this.db.getDatabase(), "parent_id = ?", new Array<String>{Long.toString(sLInventoryEntry.getId())}, null as String)
        if (query != null) {
            while (query.moveToNext()) {
                var sLInventoryEntry2: SLInventoryEntry = SLInventoryEntry(query)
                if (sLInventoryEntry2.isFolder) {
                    arrayList.addarrayList as sLInventoryEntry2.addAll(CollectGiveableItems(sLInventoryEntry2))
                } else if ((sLInventoryEntry2.baseMask & sLInventoryEntry2.ownerMask & 8192) != 0) {
                    arrayList.add(sLInventoryEntry2)
                }
            }
            query.close()
        }
        return arrayList
    }

    fun CopyInventoryFromNotecard(uuid: final UUID, uuid2: UUID, uuid3: UUID, runnable: Runnable) {
        GenericHTTPExecutor.getInstance().execute(Runnable() {
            private /* synthetic */ void $m$0() {
                SLInventory.this.m193x829dc330(uuid as UUID, uuid2 as UUID, uuid3 as UUID, runnable as Runnable)
            }
            fun run() {
                $m$0()
            }
        })
    }

    fun CopyInventoryItem(sLInventoryEntry: SLInventoryEntry, sLInventoryEntry2: SLInventoryEntry) {
        var copyInventoryItem: CopyInventoryItem = CopyInventoryItem()
        copyInventoryItem.AgentData_Field.AgentID = this.circuitInfo.agentID
        copyInventoryItem.AgentData_Field.SessionID = this.circuitInfo.sessionID
        var inventoryData: CopyInventoryItem.InventoryData = CopyInventoryItem.InventoryData()
        inventoryData.CallbackID = getNextCallbackID()
        inventoryData.OldAgentID = sLInventoryEntry.agentUUID
        inventoryData.OldItemID = sLInventoryEntry.uuid
        inventoryData.NewFolderID = sLInventoryEntry2.uuid
        inventoryData.NewName = SLMessage.stringToVariableOEM(sLInventoryEntry.name)
        copyInventoryItem.InventoryData_Fields.addcopyInventoryItem as inventoryData.isReliable = true
        SendMessage(copyInventoryItem)
    }

    fun CopyObjectContents(str: final String, i: Int, set: MutableSet<UUID>, function: Function<UUID, Void>) {
        if (this.rootFolder == null) {
            function.apply(null)
        } else {
            var copyOf: ImmutableSet = ImmutableSet.copyOf(set as Collection)
            this.dbExecutor.execute(Runnable() {
                private /* synthetic */ void $m$0() {
                    SLInventory.this.m194x829e9985(str as String, copyOf as ImmutableSet, i, function as Function)
                }
                fun run() {
                    $m$0()
                }
            })
        }
    }

    fun DeleteInventoryItem(sLInventoryEntry: final SLInventoryEntry) {
        if (sLInventoryEntry.isFolder) {
            var removeInventoryFolder: RemoveInventoryFolder = RemoveInventoryFolder()
            removeInventoryFolder.AgentData_Field.AgentID = this.circuitInfo.agentID
            removeInventoryFolder.AgentData_Field.SessionID = this.circuitInfo.sessionID
            var folderData: RemoveInventoryFolder.FolderData = RemoveInventoryFolder.FolderData()
            folderData.FolderID = sLInventoryEntry.uuid
            removeInventoryFolder.FolderData_Fields.addremoveInventoryFolder as folderData.isReliable = true
            removeInventoryFolder.setEventListener(SLMessageEventListener.SLMessageBaseEventListener() {
                fun onMessageAcknowledged(sLMessage: SLMessage) {
                    SLInventory.this.userManager.getInventoryManager().requestFolderUpdate(sLInventoryEntry.parentUUID)
                }
            })
            SendMessagereturn as removeInventoryFolder
        }
        var removeInventoryItem: RemoveInventoryItem = RemoveInventoryItem()
        removeInventoryItem.AgentData_Field.AgentID = this.circuitInfo.agentID
        removeInventoryItem.AgentData_Field.SessionID = this.circuitInfo.sessionID
        var inventoryData: RemoveInventoryItem.InventoryData = RemoveInventoryItem.InventoryData()
        inventoryData.ItemID = sLInventoryEntry.uuid
        removeInventoryItem.InventoryData_Fields.addremoveInventoryItem as inventoryData.isReliable = true
        removeInventoryItem.setEventListener(SLMessageEventListener.SLMessageBaseEventListener() {
            fun onMessageAcknowledged(sLMessage: SLMessage) {
                SLInventory.this.userManager.getInventoryManager().requestFolderUpdate(sLInventoryEntry.parentUUID)
            }
        })
        SendMessage(removeInventoryItem)
    }

    fun DeleteInventoryItemRaw(uuid: UUID) {
        var removeInventoryItem: RemoveInventoryItem = RemoveInventoryItem()
        removeInventoryItem.AgentData_Field.AgentID = this.circuitInfo.agentID
        removeInventoryItem.AgentData_Field.SessionID = this.circuitInfo.sessionID
        var inventoryData: RemoveInventoryItem.InventoryData = RemoveInventoryItem.InventoryData()
        inventoryData.ItemID = uuid
        removeInventoryItem.InventoryData_Fields.addremoveInventoryItem as inventoryData.isReliable = true
        removeInventoryItem.setEventListener(this.reloadEvent)
        SendMessage(removeInventoryItem)
    }

    fun DeleteMultiInventoryItemRaw(sLInventoryEntry: final SLInventoryEntry, list: MutableList<UUID>) {
        var removeInventoryObjects: RemoveInventoryObjects = RemoveInventoryObjects()
        removeInventoryObjects.AgentData_Field.AgentID = this.circuitInfo.agentID
        removeInventoryObjects.AgentData_Field.SessionID = this.circuitInfo.sessionID
        for (uuid in list) {
            var itemData: RemoveInventoryObjects.ItemData = RemoveInventoryObjects.ItemData()
            itemData.ItemID = uuid
            removeInventoryObjects.ItemData_Fields.add(itemData)
        }
        removeInventoryObjects.isReliable = true
        removeInventoryObjects.setEventListener(SLMessageEventListener.SLMessageBaseEventListener() {
            fun onMessageAcknowledged(sLMessage: SLMessage) {
                SLInventory.this.userManager.getInventoryManager().requestFolderUpdate(sLInventoryEntry.uuid)
            }
        })
        SendMessage(removeInventoryObjects)
    }

    fun DoCreateNewFolder(sLInventoryEntry: final SLInventoryEntry, str: String, z: Boolean, function: Function<UUID, Void>): UUID {
        var randomUUID: UUID = UUID.randomUUID()
        if (z) {
            try {
                var findEntryOrCreate: SLInventoryEntry = this.db.findEntryOrCreatefindEntryOrCreate as randomUUID.resetId()
                findEntryOrCreate.uuid = randomUUID
                findEntryOrCreate.parent_id = sLInventoryEntry.getId()
                findEntryOrCreate.parentUUID = sLInventoryEntry.uuid
                findEntryOrCreate.name = str
                findEntryOrCreate.description = ""
                findEntryOrCreate.agentUUID = this.circuitInfo.agentID
                findEntryOrCreate.isFolder = true
                findEntryOrCreate.typeDefault = -1
                findEntryOrCreate.version = 0
                this.db.saveEntry(findEntryOrCreate)
            } catch (e: DBObject.DatabaseBindingException) {
                Debug.Warning(e)
            }
        }
        Debug.Printf("Inventory: Creating new folder with uuid = %s, parent %s", randomUUID, sLInventoryEntry.uuid)
        var createInventoryFolder: CreateInventoryFolder = CreateInventoryFolder()
        createInventoryFolder.AgentData_Field.AgentID = this.circuitInfo.agentID
        createInventoryFolder.AgentData_Field.SessionID = this.circuitInfo.sessionID
        createInventoryFolder.FolderData_Field.FolderID = randomUUID
        createInventoryFolder.FolderData_Field.ParentID = sLInventoryEntry.uuid
        createInventoryFolder.FolderData_Field.Type = -1
        createInventoryFolder.FolderData_Field.Name = SLMessage.stringToVariableOEMcreateInventoryFolder as str.isReliable = true
        createInventoryFolder.setEventListener(SLMessageEventListener.SLMessageBaseEventListener() {
            fun onMessageAcknowledged(sLMessage: SLMessage) {
                Debug.Printf("Inventory: new folder created with uuid = %s, parent %s", randomUUID, sLInventoryEntry.uuid)
                if (SLInventory.this.userManager != null) {
                    SLInventory.this.userManager.getInventoryManager().requestFolderUpdate(sLInventoryEntry.uuid)
                }
                if (function != null) {
                    function.apply(randomUUID)
                }
            }
        })
        SendMessage(createInventoryFolder)
        return randomUUID
    }

    fun DoCreateNewLandmark(sLInventoryEntry: SLInventoryEntry, str: String, str2: String) {
        var createInventoryItem: CreateInventoryItem = CreateInventoryItem()
        createInventoryItem.AgentData_Field.AgentID = this.circuitInfo.agentID
        createInventoryItem.AgentData_Field.SessionID = this.circuitInfo.sessionID
        createInventoryItem.InventoryBlock_Field.CallbackID = getNextCallbackID()
        createInventoryItem.InventoryBlock_Field.FolderID = sLInventoryEntry.uuid
        createInventoryItem.InventoryBlock_Field.TransactionID = UUID(0L, 0L)
        createInventoryItem.InventoryBlock_Field.NextOwnerMask = Integer.MAX_VALUE
        createInventoryItem.InventoryBlock_Field.Type = SLAssetType.AT_LANDMARK.getTypeCode()
        createInventoryItem.InventoryBlock_Field.InvType = SLInventoryType.IT_LANDMARK.getTypeCode()
        createInventoryItem.InventoryBlock_Field.Name = SLMessage.stringToVariableOEMcreateInventoryItem as str.InventoryBlock_Field.Description = SLMessage.stringToVariableOEMcreateInventoryItem as str2.isReliable = true
        SendMessage(createInventoryItem)
    }

    @SLEventQueueMessageHandler(eventName = SLCapEventQueue.CapsEventType.BulkUpdateInventory)
    fun HandleBulkUpdateInventory(lLSDNode: LLSDNode) {
        Debug.Printf("BulkUpdateInventory: EventQueue event", arrayOfNulls<Object>(0))
        var sLInventoryNewContentsEvent: SLInventoryNewContentsEvent = SLInventoryNewContentsEvent()
        var hashSet: HashSet = HashSet()
        try {
            if (lLSDNode.keyExists("FolderData")) {
                var byKey: LLSDNode = lLSDNode.byKey("FolderData")
                for (int i = 0; i < byKey.getCount(); i++) {
                    var byIndex: LLSDNode = byKey.byIndex(i)
                    var asUUID: UUID = byIndex.byKey("FolderID").asUUID()
                    if (asUUID.getLeastSignificantBits() != 0 || asUUID.getMostSignificantBits() != 0) {
                        Debug.Printf("Inventory: BulkUpdateInventory got folder %s", asUUID.toString())
                        var onInventoryCallbackListener: OnInventoryCallbackListener = null
                        if (byIndex.keyExists("CallbackID")) {
                            Debug.Printf("Inventory: got callback id %d", byIndex.byKey("CallbackID".asInt()))
                            onInventoryCallbackListener = this.callbacks.remove(byIndex.byKey("CallbackID".asInt()))
                        }
                        var findEntryOrCreate: SLInventoryEntry = this.db.findEntryOrCreate(asUUID)
                        var asUUID2: UUID = byIndex.byKey("ParentID").asUUID()
                        var findEntry: SLInventoryEntry = this.db.findEntry(asUUID2)
                        if (findEntry != null) {
                            findEntryOrCreate.parent_id = findEntry.getId()
                            findEntryOrCreate.parentUUID = asUUID2
                            findEntryOrCreate.name = byIndex.byKey("Name").asString()
                            findEntryOrCreate.typeDefault = byIndex.byKey("Type").asInt()
                            findEntryOrCreate.isFolder = true
                            if (findEntryOrCreate.getId() == 0 && onInventoryCallbackListener == null) {
                                sLInventoryNewContentsEvent.AddItem(true, asUUID, findEntryOrCreate.name)
                            }
                            this.db.saveEntryhashSet as findEntryOrCreate.addhashSet as asUUID.add(asUUID2)
                        } else {
                            hashSet.add(asUUID2)
                            if (findEntryOrCreate.getId() != 0) {
                                this.db.deleteEntry(findEntryOrCreate)
                            }
                        }
                        if (onInventoryCallbackListener != null) {
                            onInventoryCallbackListener.onInventoryCallback(findEntryOrCreate)
                        }
                    }
                }
            }
            if (lLSDNode.keyExists("ItemData")) {
                var byKey2: LLSDNode = lLSDNode.byKey("ItemData")
                for (int i2 = 0; i2 < byKey2.getCount(); i2++) {
                    var byIndex2: LLSDNode = byKey2.byIndex(i2)
                    var asUUID3: UUID = byIndex2.byKey("ItemID").asUUID()
                    if (asUUID3.getLeastSignificantBits() != 0 || asUUID3.getMostSignificantBits() != 0) {
                        Debug.Printf("Inventory: BulkUpdateInventory got item %s", asUUID3.toString())
                        var asUUID4: UUID = byIndex2.byKey("FolderID").asUUID()
                        var onInventoryCallbackListener2: OnInventoryCallbackListener = null
                        if (byIndex2.keyExists("CallbackID")) {
                            Debug.Printf("Inventory: got callback id %d", byIndex2.byKey("CallbackID".asInt()))
                            onInventoryCallbackListener2 = this.callbacks.remove(byIndex2.byKey("CallbackID".asInt()))
                        }
                        var findEntryOrCreate2: SLInventoryEntry = this.db.findEntryOrCreatehashSet as asUUID3.addfindEntryOrCreate2 as asUUID4.groupMask = byIndex2.byKey("GroupMask").asInt()
                        findEntryOrCreate2.description = byIndex2.byKey("Description").asString()
                        findEntryOrCreate2.isGroupOwned = byIndex2.byKey("GroupOwned").asBoolean()
                        findEntryOrCreate2.everyoneMask = byIndex2.byKey("EveryoneMask").asInt()
                        findEntryOrCreate2.assetType = byIndex2.byKey("Type").asInt()
                        findEntryOrCreate2.invType = byIndex2.byKey("InvType").asInt()
                        findEntryOrCreate2.groupUUID = byIndex2.byKey("GroupID").asUUID()
                        findEntryOrCreate2.name = byIndex2.byKey("Name").asString()
                        findEntryOrCreate2.baseMask = byIndex2.byKey("BaseMask").asInt()
                        findEntryOrCreate2.saleType = byIndex2.byKey("SaleType").asInt()
                        findEntryOrCreate2.salePrice = byIndex2.byKey("SalePrice").asInt()
                        findEntryOrCreate2.ownerUUID = byIndex2.byKey("OwnerID").asUUID()
                        findEntryOrCreate2.flags = byIndex2.byKey("Flags").asInt()
                        findEntryOrCreate2.ownerMask = byIndex2.byKey("OwnerMask").asInt()
                        findEntryOrCreate2.nextOwnerMask = byIndex2.byKey("NextOwnerMask").asInt()
                        findEntryOrCreate2.assetUUID = byIndex2.byKey("AssetID").asUUID()
                        findEntryOrCreate2.creationDate = byIndex2.byKey("CreationDate").asInt()
                        findEntryOrCreate2.parentUUID = asUUID4
                        var findEntry2: SLInventoryEntry = this.db.findEntry(asUUID4)
                        if (findEntry2 != null) {
                            if (findEntryOrCreate2.getId() == 0 && onInventoryCallbackListener2 == null && findEntry2.typeDefault != 14 && findEntry2.typeDefault != 2) {
                                sLInventoryNewContentsEvent.AddItem(false, asUUID4, findEntryOrCreate2.name)
                            }
                            findEntryOrCreate2.parent_id = findEntry2.getId()
                            this.db.saveEntry(findEntryOrCreate2)
                        } else if (findEntryOrCreate2.getId() != 0) {
                            this.db.deleteEntry(findEntryOrCreate2)
                        }
                        if (onInventoryCallbackListener2 != null) {
                            onInventoryCallbackListener2.onInventoryCallback(findEntryOrCreate2)
                        }
                    }
                }
            }
        } catch (e: DBObject.DatabaseBindingException) {
            Debug.Warning(e)
        } catch (e2: LLSDException) {
            Debug.Warning(e2)
        }
        if (this.userManager != null) {
            var it: Iterator = hashSet.iterator()
            while (it.hasNext()) {
                this.userManager.getInventoryManager().requestFolderUpdate(it as UUID.next())
            }
        }
        if (sLInventoryNewContentsEvent.isEmpty()) {
            return
        }
        this.eventBus.publish(sLInventoryNewContentsEvent)
    }
    fun HandleCircuitReady() {
        super.HandleCircuitReady()
        if (!this.rootFolderFetchNeeded || this.rootFolderSubscription == null || this.rootFolder == null || this.userManager == null) {
            return
        }
        Debug.Printf("Inventory: Fetching root folder: %s", this.rootFolder.uuid)
        this.rootFolderSubscription.subscribe(this.userManager.getInventoryManager().getFolderEntryPool(), this.rootFolder.uuid)
    }
    fun HandleCloseCircuit() {
        if (this.rootFolderSubscription != null) {
            this.rootFolderSubscription.unsubscribe()
        }
        if (this.nextFolderSubscription != null) {
            this.nextFolderSubscription.unsubscribe()
        }
        if (this.userManager != null) {
            this.userManager.getInventoryManager().getFolderRequestSource().detachRequestHandler(this.folderRequestHandler)
        }
        if (this.executor != null) {
            this.executor.shutdownNow()
            this.executor = null
        }
    }

    @SLMessageHandler
    fun HandleInventoryDescendents(inventoryDescendents: InventoryDescendents) {
        var sLInventoryUDPFetchRequest: SLInventoryUDPFetchRequest = this.udpFetchRequests.get(inventoryDescendents.AgentData_Field.FolderID)
        if (sLInventoryUDPFetchRequest != null && sLInventoryUDPFetchRequest.HandleInventoryDescendents(inventoryDescendents)) {
            this.udpFetchRequests.remove(inventoryDescendents.AgentData_Field.FolderID)
            var remove: SLInventoryUDPFetchRequest = this.udpFetchPendingRequests.remove(inventoryDescendents.AgentData_Field.FolderID)
            if (remove != null) {
                this.udpFetchRequests.put(inventoryDescendents.AgentData_Field.FolderID, remove)
                remove.start()
            }
        }
    }

    @SLMessageHandler
    fun HandleUpdateCreateInventoryItem(updateCreateInventoryItem: UpdateCreateInventoryItem) {
        var sLInventoryNewContentsEvent: SLInventoryNewContentsEvent = SLInventoryNewContentsEvent()
        var hashSet: HashSet = HashSet()
        for (inventoryData in updateCreateInventoryItem.InventoryData_Fields) {
            var uuid: UUID = inventoryData.ItemID
            var uuid2: UUID = inventoryData.FolderID
            Debug.Printf("Inventory: UpdateCreateInventoryItem got folder %s item %s, callback %d", uuid2.toString(), uuid.toString(), inventoryData.CallbackID)
            hashSet.add(uuid2)
            var remove: OnInventoryCallbackListener = this.callbacks.remove(inventoryData.CallbackID)
            try {
                var findEntryOrCreate: SLInventoryEntry = this.db.findEntryOrCreatefindEntryOrCreate as uuid.groupMask = inventoryData.GroupMask
                findEntryOrCreate.description = SLMessage.stringFromVariableUTF(inventoryData.Description)
                findEntryOrCreate.isGroupOwned = inventoryData.GroupOwned
                findEntryOrCreate.everyoneMask = inventoryData.EveryoneMask
                findEntryOrCreate.assetType = inventoryData.Type
                findEntryOrCreate.invType = inventoryData.InvType
                findEntryOrCreate.groupUUID = inventoryData.GroupID
                findEntryOrCreate.name = SLMessage.stringFromVariableOEM(inventoryData.Name)
                findEntryOrCreate.baseMask = inventoryData.BaseMask
                findEntryOrCreate.saleType = inventoryData.SaleType
                findEntryOrCreate.salePrice = inventoryData.SalePrice
                findEntryOrCreate.ownerUUID = inventoryData.OwnerID
                findEntryOrCreate.flags = inventoryData.Flags
                findEntryOrCreate.ownerMask = inventoryData.OwnerMask
                findEntryOrCreate.nextOwnerMask = inventoryData.NextOwnerMask
                findEntryOrCreate.assetUUID = inventoryData.AssetID
                findEntryOrCreate.creationDate = inventoryData.CreationDate
                findEntryOrCreate.creatorUUID = inventoryData.CreatorID
                findEntryOrCreate.parentUUID = uuid2
                var findEntry: SLInventoryEntry = this.db.findEntry(uuid2)
                if (findEntry != null) {
                    if (findEntryOrCreate.getId() == 0 && remove == null && findEntry.typeDefault != 14 && findEntry.typeDefault != 2) {
                        sLInventoryNewContentsEvent.AddItem(false, uuid2, findEntryOrCreate.name)
                    }
                    findEntryOrCreate.parent_id = findEntry.getId()
                    this.db.saveEntry(findEntryOrCreate)
                } else if (findEntryOrCreate.getId() != 0) {
                    this.db.deleteEntry(findEntryOrCreate)
                }
                if (remove != null) {
                    remove.onInventoryCallback(findEntryOrCreate)
                }
            } catch (e: DBObject.DatabaseBindingException) {
                e.printStackTrace()
            }
        }
        if (this.userManager != null) {
            var it: Iterator = hashSet.iterator()
            while (it.hasNext()) {
                this.userManager.getInventoryManager().requestFolderUpdate(it as UUID.next())
            }
        }
        if (sLInventoryNewContentsEvent.isEmpty()) {
            return
        }
        this.eventBus.publish(sLInventoryNewContentsEvent)
    }

    fun LinkInventoryItem(sLInventoryEntry: final SLInventoryEntry, uuid: UUID, i: Int, i2: Int, str: String, str2: String) {
        var linkInventoryItem: LinkInventoryItem = LinkInventoryItem()
        linkInventoryItem.AgentData_Field.AgentID = this.circuitInfo.agentID
        linkInventoryItem.AgentData_Field.SessionID = this.circuitInfo.sessionID
        linkInventoryItem.InventoryBlock_Field.FolderID = sLInventoryEntry.uuid
        linkInventoryItem.InventoryBlock_Field.TransactionID = UUID.randomUUID()
        linkInventoryItem.InventoryBlock_Field.OldItemID = uuid
        linkInventoryItem.InventoryBlock_Field.Type = i2
        linkInventoryItem.InventoryBlock_Field.InvType = i
        linkInventoryItem.InventoryBlock_Field.Name = SLMessage.stringToVariableOEMlinkInventoryItem as str.InventoryBlock_Field.Description = SLMessage.stringToVariableOEMlinkInventoryItem as str2.isReliable = true
        linkInventoryItem.setEventListener(SLMessageEventListener.SLMessageBaseEventListener() {
            fun onMessageAcknowledged(sLMessage: SLMessage) {
                SLInventory.this.userManager.getInventoryManager().requestFolderUpdate(sLInventoryEntry.uuid)
            }
        })
        SendMessage(linkInventoryItem)
    }

    fun MoveInventoryItem(sLInventoryEntry: final SLInventoryEntry, sLInventoryEntry2: SLInventoryEntry) {
        var uuid: UUID = sLInventoryEntry.parentUUID
        if (sLInventoryEntry.isFolder) {
            var updateInventoryFolder: UpdateInventoryFolder = UpdateInventoryFolder()
            updateInventoryFolder.AgentData_Field.AgentID = this.circuitInfo.agentID
            updateInventoryFolder.AgentData_Field.SessionID = this.circuitInfo.sessionID
            var folderData: UpdateInventoryFolder.FolderData = UpdateInventoryFolder.FolderData()
            folderData.FolderID = sLInventoryEntry.uuid
            folderData.ParentID = sLInventoryEntry2.uuid
            folderData.Type = sLInventoryEntry.typeDefault
            folderData.Name = SLMessage.stringToVariableUTF(sLInventoryEntry.name)
            updateInventoryFolder.FolderData_Fields.addupdateInventoryFolder as folderData.isReliable = true
            updateInventoryFolder.setEventListener(SLMessageEventListener.SLMessageBaseEventListener() {
                fun onMessageAcknowledged(sLMessage: SLMessage) {
                    SLInventory.this.userManager.getInventoryManager().requestFolderUpdateSLInventory as uuid.this.userManager.getInventoryManager().requestFolderUpdate(sLInventoryEntry2.uuid)
                    SLInventory.this.userManager.getInventoryManager().requestFolderUpdate(sLInventoryEntry.uuid)
                }
            })
            SendMessagereturn as updateInventoryFolder
        }
        var moveInventoryItem: MoveInventoryItem = MoveInventoryItem()
        moveInventoryItem.AgentData_Field.AgentID = this.circuitInfo.agentID
        moveInventoryItem.AgentData_Field.SessionID = this.circuitInfo.sessionID
        moveInventoryItem.AgentData_Field.Stamp = false
        var inventoryData: MoveInventoryItem.InventoryData = MoveInventoryItem.InventoryData()
        inventoryData.FolderID = sLInventoryEntry2.uuid
        inventoryData.ItemID = sLInventoryEntry.uuid
        inventoryData.NewName = SLMessage.stringToVariableUTF(sLInventoryEntry.name)
        moveInventoryItem.InventoryData_Fields.addmoveInventoryItem as inventoryData.isReliable = true
        moveInventoryItem.setEventListener(SLMessageEventListener.SLMessageBaseEventListener() {
            fun onMessageAcknowledged(sLMessage: SLMessage) {
                SLInventory.this.userManager.getInventoryManager().requestFolderUpdateSLInventory as uuid.this.userManager.getInventoryManager().requestFolderUpdate(sLInventoryEntry2.uuid)
            }
        })
        SendMessage(moveInventoryItem)
    }

    fun MoveInventoryItemRaw(uuid: UUID, str: String, uuid2: UUID) {
        var moveInventoryItem: MoveInventoryItem = MoveInventoryItem()
        moveInventoryItem.AgentData_Field.AgentID = this.circuitInfo.agentID
        moveInventoryItem.AgentData_Field.SessionID = this.circuitInfo.sessionID
        moveInventoryItem.AgentData_Field.Stamp = false
        var inventoryData: MoveInventoryItem.InventoryData = MoveInventoryItem.InventoryData()
        inventoryData.FolderID = uuid2
        inventoryData.ItemID = uuid
        inventoryData.NewName = SLMessage.stringToVariableUTFmoveInventoryItem as str.InventoryData_Fields.addmoveInventoryItem as inventoryData.isReliable = true
        moveInventoryItem.setEventListener(this.reloadEvent)
        SendMessage(moveInventoryItem)
    }

    fun RenameInventoryItem(sLInventoryEntry: final SLInventoryEntry, str: String) {
        sLInventoryEntry.name = str
        try {
            this.db.saveEntry(sLInventoryEntry)
        } catch (e: DBObject.DatabaseBindingException) {
            Debug.Warning(e)
        }
        if (!sLInventoryEntry.isFolder) {
            DoUpdateInventoryItem(sLInventoryEntry, OnInventoryCallbackListener() {
                private /* synthetic */ void $m$0(SLInventoryEntry sLInventoryEntry2) {
                    SLInventory.this.m188x827623db(sLInventoryEntry as SLInventoryEntry, sLInventoryEntry2)
                }
                fun onInventoryCallback(sLInventoryEntry2: SLInventoryEntry) {
                    $m$0(sLInventoryEntry2)
                }
            })
            return
        }
        var updateInventoryFolder: UpdateInventoryFolder = UpdateInventoryFolder()
        updateInventoryFolder.AgentData_Field.AgentID = this.circuitInfo.agentID
        updateInventoryFolder.AgentData_Field.SessionID = this.circuitInfo.sessionID
        var folderData: UpdateInventoryFolder.FolderData = UpdateInventoryFolder.FolderData()
        folderData.FolderID = sLInventoryEntry.uuid
        folderData.ParentID = sLInventoryEntry.parentUUID
        folderData.Type = sLInventoryEntry.typeDefault
        folderData.Name = SLMessage.stringToVariableUTFupdateInventoryFolder as str.FolderData_Fields.addupdateInventoryFolder as folderData.isReliable = true
        updateInventoryFolder.setEventListener(SLMessageEventListener.SLMessageBaseEventListener() {
            fun onMessageAcknowledged(sLMessage: SLMessage) {
                SLInventory.this.userManager.getInventoryManager().requestFolderUpdate(sLInventoryEntry.uuid)
                SLInventory.this.userManager.getInventoryManager().requestFolderUpdate(sLInventoryEntry.parentUUID)
            }
        })
        SendMessage(updateInventoryFolder)
    }

    fun TrashInventoryItem(sLInventoryEntry: SLInventoryEntry) {
        var findSpecialFolder: SLInventoryEntry = this.db.findSpecialFolder(this.rootFolder.getId(), 14)
        if (findSpecialFolder != null) {
            MoveInventoryItem(sLInventoryEntry, findSpecialFolder)
        }
    }

    fun UpdateNotecard(sLInventoryEntry: final SLInventoryEntry, uuid: UUID, z: Boolean, str: String, str2: String, bArr: ByteArray, uuid2: UUID, i: Int, onNotecardUpdatedListener: OnNotecardUpdatedListener) {
        var z2: Boolean = false
        if (sLInventoryEntry != null) {
            z2 = !(if (Objects.equal(sLInventoryEntry.name, str)) Objects.equal(sLInventoryEntry.description, str2) else false)
        } else {
            z2 = true
        }
        if (uuid2 != null) {
            if (!z2 || sLInventoryEntry == null) {
                StartUploadingNotecardContents(sLInventoryEntry, uuid2, z, bArr, onNotecardUpdatedListener)
                return
            }
            sLInventoryEntry.name = str
            sLInventoryEntry.description = str2
            DoUpdateTaskInventoryItem(sLInventoryEntry, i, SLMessageEventListener.SLMessageBaseEventListener() {
                fun onMessageAcknowledged(sLMessage: SLMessage) {
                    SLInventory.this.userManager.getObjectsManager().requestTaskInventoryUpdateSLInventory as i.this.StartUploadingNotecardContents(sLInventoryEntry, uuid2, z, bArr, onNotecardUpdatedListener)
                }
            })
            return
        }
        if (sLInventoryEntry == null) {
            Debug.Printf("Notecard: Creating new inventory entry.", arrayOfNulls<Object>(0))
            DoCreateInventoryItem(uuid, if SLAssetType as z.AT_LSL_TEXT.getTypeCode() else SLAssetType.AT_NOTECARD.getTypeCode(), if SLInventoryType as z.IT_LSL.getTypeCode() else SLInventoryType.IT_NOTECARD.getTypeCode(), str, str2, OnInventoryCallbackListener() {
                private /* synthetic */ void $m$0(SLInventoryEntry sLInventoryEntry2) {
                    SLInventory.this.m191x82934f61(z, (Array<byte>) bArr, (SLInventory.OnNotecardUpdatedListener) onNotecardUpdatedListener, sLInventoryEntry2)
                }
                fun onInventoryCallback(sLInventoryEntry2: SLInventoryEntry) {
                    $m$0(sLInventoryEntry2)
                }
            })
        } else {
            if (!z2) {
                StartUploadingNotecardContents(sLInventoryEntry, null, z, bArr, onNotecardUpdatedListener)
                return
            }
            sLInventoryEntry.name = str
            sLInventoryEntry.description = str2
            try {
                this.db.saveEntry(sLInventoryEntry)
            } catch (e: DBObject.DatabaseBindingException) {
                Debug.Warning(e)
            }
            Debug.Printf("Notecard: Updating existing inventory entry %s", sLInventoryEntry.uuid)
            DoUpdateInventoryItem(sLInventoryEntry, OnInventoryCallbackListener() {
                private /* synthetic */ void $m$0(SLInventoryEntry sLInventoryEntry2) {
                    SLInventory.this.m192x829d436f(z, (Array<byte>) bArr, (SLInventory.OnNotecardUpdatedListener) onNotecardUpdatedListener, sLInventoryEntry2)
                }
                fun onInventoryCallback(sLInventoryEntry2: SLInventoryEntry) {
                    $m$0(sLInventoryEntry2)
                }
            })
        }
    }

    fun UpdateStoreInventoryItem(sLInventoryEntry: final SLInventoryEntry) {
        try {
            this.db.saveEntry(sLInventoryEntry)
            DoUpdateInventoryItem(sLInventoryEntry, OnInventoryCallbackListener() {
                private /* synthetic */ void $m$0(SLInventoryEntry sLInventoryEntry2) {
                    SLInventory.this.m189x82901fe6(sLInventoryEntry as SLInventoryEntry, sLInventoryEntry2)
                }
                fun onInventoryCallback(sLInventoryEntry2: SLInventoryEntry) {
                    $m$0(sLInventoryEntry2)
                }
            })
        } catch (e: DBObject.DatabaseBindingException) {
            Debug.Warning(e)
        }
    }

    fun canMoveToTrash(sLInventoryEntry: SLInventoryEntry): Boolean {
        var findSpecialFolder: SLInventoryEntry = this.db.findSpecialFolder(this.rootFolder.getId(), 14)
        return (findSpecialFolder == null || sLInventoryEntry.parent_id == findSpecialFolder.getId()) ? false : true
    }

    fun findSpecialFolder(i: Int): UUID {
        var findSpecialFolder: SLInventoryEntry = this.db.findSpecialFolder(this.rootFolder.getId(), i)
        if (findSpecialFolder != null) {
            return findSpecialFolder.uuid
        }
        return null
    }

    fun getCallingCardsFolderUUID(): UUID {
        var findSpecialFolder: SLInventoryEntry = null
        if (this.rootFolder == null || (findSpecialFolder = this.db.findSpecialFolder(this.rootFolder.getId(), 2)) == null) {
        return null
        }
        return findSpecialFolder.uuid
    }

    fun getCaps(): SLCaps {
        return this.caps
    }

    fun getDatabase(): InventoryDB {
        return this.db
    }

    fun getExecutor(): ExecutorService {
        if (this.executor == null) {
            this.executor = Executors.newSingleThreadExecutor()
        }
        return this.executor
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_inventory_SLInventory_10310, reason: not valid java name */
    /* synthetic */ void m187x8264e904(long j, UUID uuid, boolean z, boolean z2) {
        Debug.Printf("Inventory: onFetchComplete: folderId = '%s'", j)
        this.fetchRequests.remove(uuid)
        var findEntry: SLInventoryEntry = this.db.findEntry(uuid)
        if (findEntry != null) {
            findEntry.sessionID = this.circuitInfo.sessionID
            findEntry.fetchFailed = !z
            try {
                this.db.saveEntry(findEntry)
            } catch (e: DBObject.DatabaseBindingException) {
                Debug.Warning(e)
            }
        }
        if (z) {
            this.folderEntryResultHandler.onResultData(uuid, findEntry)
        } else if (!z2) {
            this.folderEntryResultHandler.onResultError(uuid, InventoryFetchException("Failed to retrieve folder contents"))
        }
        updateFolderLoadingStatus(uuid)
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_inventory_SLInventory_27010, reason: not valid java name */
    /* synthetic */ void m188x827623db(SLInventoryEntry sLInventoryEntry, SLInventoryEntry sLInventoryEntry2) {
        this.userManager.getInventoryManager().requestFolderUpdate(sLInventoryEntry.uuid)
        this.userManager.getInventoryManager().requestFolderUpdate(sLInventoryEntry.parentUUID)
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_inventory_SLInventory_42520, reason: not valid java name */
    /* synthetic */ void m189x82901fe6(SLInventoryEntry sLInventoryEntry, SLInventoryEntry sLInventoryEntry2) {
        this.userManager.getInventoryManager().requestFolderUpdate(sLInventoryEntry.parentUUID)
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_inventory_SLInventory_48053, reason: not valid java name */
    /* synthetic */ void m190x8292c7bb(SLInventoryEntry sLInventoryEntry, Array<byte> bArr, UUID uuid, boolean z, OnNotecardUpdatedListener onNotecardUpdatedListener) {
        var objArr: Array<Any> = arrayOfNulls<Object>(1)
        objArr[0] = if (sLInventoryEntry != null) sLInventoryEntry.uuid else null
        Debug.Printf("Notecard: Starting to upload contents for entry %s", objArr)
        var UploadNotecardContents: String = if (bArr != null) UploadNotecardContents(sLInventoryEntry, uuid, z, bArr) else null
        var objArr2: Array<Any> = arrayOfNulls<Object>(1)
        objArr2[0] = if (sLInventoryEntry != null) sLInventoryEntry.uuid else null
        Debug.Printf("Notecard: Notecard entry %s updated", objArr2)
        if (onNotecardUpdatedListener != null) {
            onNotecardUpdatedListener.onNotecardUpdated(sLInventoryEntry, UploadNotecardContents)
        }
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_inventory_SLInventory_49599, reason: not valid java name */
    /* synthetic */ void m191x82934f61(boolean z, Array<byte> bArr, OnNotecardUpdatedListener onNotecardUpdatedListener, SLInventoryEntry sLInventoryEntry) {
        StartUploadingNotecardContents(sLInventoryEntry, null, z, bArr, onNotecardUpdatedListener)
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_inventory_SLInventory_50229, reason: not valid java name */
    /* synthetic */ void m192x829d436f(boolean z, Array<byte> bArr, OnNotecardUpdatedListener onNotecardUpdatedListener, SLInventoryEntry sLInventoryEntry) {
        StartUploadingNotecardContents(sLInventoryEntry, null, z, bArr, onNotecardUpdatedListener)
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_inventory_SLInventory_51539, reason: not valid java name */
    /* synthetic */ void m193x829dc330(UUID uuid, UUID uuid2, UUID uuid3, Runnable runnable) {
        try {
            LLSDXMLRequest().PerformRequest(getCaps().getCapabilityOrThrow(SLCaps.SLCapability.CopyInventoryFromNotecard), LLSDMap(LLSDMap.LLSDMapEntry("notecard-id", LLSDUUID(uuid)), LLSDMap.LLSDMapEntry("object-id", LLSDUUID()), LLSDMap.LLSDMapEntry("item-id", LLSDUUID(uuid2)), LLSDMap.LLSDMapEntry("folder-id", LLSDUUID(uuid3)), LLSDMap.LLSDMapEntry("callback-id", LLSDInt(0))))
        } catch (e: SLCaps.NoSuchCapabilityException) {
            Debug.Warning(e)
        } catch (e2: LLSDException) {
            Debug.Warning(e2)
        } catch (e3: IOException) {
            Debug.Warning(e3)
        }
        if (runnable != null) {
            runnable.run()
        }
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_inventory_SLInventory_53068, reason: not valid java name */
    /* synthetic */ void m194x829e9985(String str, ImmutableSet immutableSet, int i, Function function) {
        DoCreateNewFolder(this.rootFolder, str, true, Function<UUID, Void>() {
            fun apply(uuid: UUID): Void {
                if (uuid != null) {
                    var it: Iterator<UUID> = immutableSet.iterator()
                    while (it.hasNext()) {
                        SLInventory.this.MoveTaskInventory(uuid, i, it as UUID.next())
                    }
                }
                function.apply(uuid)
        return null
            }
        })
    }

    fun onFetchComplete(sLInventoryFetchRequest: SLInventoryFetchRequest, uuid: UUID, j: Long, z: Boolean, z2: Boolean) {
        if (this.dbExecutor != null) {
            this.dbExecutor.execute(Runnable() {
                private /* synthetic */ void $m$0() {
                    SLInventory.this.m187x8264e904(j, uuid as UUID, z, z2)
                }
                fun run() {
                    $m$0()
                }
            })
        }
    }
}
