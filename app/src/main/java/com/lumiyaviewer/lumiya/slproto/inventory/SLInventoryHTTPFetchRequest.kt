package com.lumiyaviewer.lumiya.slproto.inventory

import android.database.sqlite.SQLiteStatement
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.orm.DBObject
import com.lumiyaviewer.lumiya.slproto.https.GenericHTTPExecutor
import com.lumiyaviewer.lumiya.slproto.https.LLSDStreamingXMLRequest
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventory
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDStreamingParser
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDValueTypeException
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDXMLException
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDArray
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDBoolean
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDMap
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDUUID
import java.io.IOException
import java.util.HashMap
import java.util.HashSet
import java.util.Map
import java.util.Set
import java.util.UUID
import java.util.concurrent.BlockingQueue
import java.util.concurrent.Future
import java.util.concurrent.LinkedBlockingQueue
import java.util.concurrent.atomic.AtomicBoolean
import java.util.concurrent.atomic.AtomicReference

open class SLInventoryHTTPFetchRequest : SLInventoryFetchRequest() {
    private var capURL: String = ""
    private AtomicReference<Future<?>> futureRef
    private var httpRequest: Runnable = null
    private var isCancelled: AtomicBoolean = null
    private var streamingXmlReqRef: AtomicReference<LLSDStreamingXMLRequest> = null

    private class DatabaseCommitThread : Thread() {
        private volatile boolean aborted
        private BlockingQueue<SLInventoryEntry> commitEntryQueue
        private SLInventoryEntry stopEntry

        fun DatabaseCommitThread(): private {
            this.commitEntryQueue = LinkedBlockingQueuethis as 100.stopEntry = SLInventoryEntry()
            this.aborted = false
        }

            void addEntry(SLInventoryEntry inventoryEntry) throws InterruptedException {
            this.commitEntryQueue.put(inventoryEntry)
        }

        /**
         * Write parsed entries to the inventory database as they arrive.
         *
         * <p>Entries are written in a transaction that is committed whenever
         * the queue runs dry, so a large folder becomes visible in batches
         * every 16 entries the transaction yields to other database users.
         * The loop ends at {@link #stopEntry}. Whatever was written is
         * committed even if the fetch failed; only a successful, non-aborted
         * fetch then prunes children that were not in the reply
         * (retainChildren).</p>
         */
        fun run() {
            var retainedChildren: MutableSet<UUID> = HashSet<>()
            var insertStatement: SQLiteStatement = null
            var updateStatement: SQLiteStatement = null
            var inTransaction: Boolean = false
            var uncommittedCount: Int = 0
            var success: Boolean = false
            try {
                while (!Thread.interrupted()) {
                    var entry: SLInventoryEntry = this.commitEntryQueue.poll()
                    if (entry == null) {
                        if (inTransaction) {
                            SLInventoryHTTPFetchRequest.this.db.setTransactionSuccessful()
                            SLInventoryHTTPFetchRequest.this.db.endTransaction()
                            inTransaction = false
                            uncommittedCount = 0
                        }
                        entry = this.commitEntryQueue.take()
                    }
                    if (entry == this.stopEntry) {

                    }
                    if (!inTransaction) {
                        SLInventoryHTTPFetchRequest.this.db.beginTransaction()
                        inTransaction = true
                    }
                    uncommittedCount++
                    if (uncommittedCount >= 16) {
                        SLInventoryHTTPFetchRequest.this.db.yieldIfContendedSafely()
                        uncommittedCount = 0
                    }
                    retainedChildren.add(entry.uuid)
                    if (insertStatement == null) {
                        insertStatement = SLInventoryEntry.getInsertStatement(SLInventoryHTTPFetchRequest.this.db.getDatabase())
                    }
                    if (updateStatement == null) {
                        updateStatement = SLInventoryEntry.getUpdateStatement(SLInventoryHTTPFetchRequest.this.db.getDatabase())
                    }
                    entry.updateOrInsert(updateStatement, insertStatement)
                }
                success = !Thread.interrupted()
            } catch (e: InterruptedException) {
                Debug.Warning(e)
                success = false
            } catch (e: DBObject.DatabaseBindingException) {
                Debug.Warning(e)
                success = false
            }
            if (inTransaction) {
                Debug.Printf("InvFetch: commit thread ending transaction (success: %s, count %d).",
                        if (success) "true" else "false", retainedChildren.size())
                SLInventoryHTTPFetchRequest.this.db.setTransactionSuccessful()
                SLInventoryHTTPFetchRequest.this.db.endTransaction()
            }
            if (insertStatement != null) {
                insertStatement.close()
            }
            if (updateStatement != null) {
                updateStatement.close()
            }
            if (success && !this.aborted) {
                Debug.Printf("InvFetch: commit thread successful, calling retainChildren.", arrayOfNulls<Object>(0))
                SLInventoryHTTPFetchRequest.this.db.retainChildren(SLInventoryHTTPFetchRequest.this.folderId, retainedChildren)
            }
        }

        void stopAndWait(boolean z) throws InterruptedException {
            if (!z) {
                this.aborted = true
            }
            this.commitEntryQueue.put(this.stopEntry)
            join()
        }
    }

    private open class FolderDataContentHandler : LLSDStreamingParser.LLSDDefaultContentHandler() {
        private DatabaseCommitThread commitThread
        private UUID gotUUID
        private int gotVersion

        fun FolderDataContentHandler(databaseCommitThread: DatabaseCommitThread): private {
            this.commitThread = databaseCommitThread
        }
        public LLSDStreamingParser.LLSDContentHandler onArrayBegin(String str) throws LLSDXMLException {
            return if (str.equals("categories")) LLSDStreamingParser.LLSDDefaultContentHandler() {
                public LLSDStreamingParser.LLSDContentHandler onMapBegin(String str2) throws LLSDXMLException {
                    return SLInventoryHTTPFetchRequest.this.FolderEntryContentHandler(FolderDataContentHandler.this.commitThread)
                }
            } else if (str.equals("items")) LLSDStreamingParser.LLSDDefaultContentHandler() {
                public LLSDStreamingParser.LLSDContentHandler onMapBegin(String str2) throws LLSDXMLException {
                    return SLInventoryHTTPFetchRequest.this.ItemEntryContentHandler(FolderDataContentHandler.this.commitThread)
                }
            } else super.onArrayBegin(str)
        }
        public void onMapEnd(String str) throws LLSDXMLException, InterruptedException {
            if (this.gotUUID == null || !this.gotUUID.equals(SLInventoryHTTPFetchRequest.this.folderUUID) || this.gotVersion == SLInventoryHTTPFetchRequest.this.folderEntry.version) {
                return
            }
            SLInventoryHTTPFetchRequest.this.folderEntry.version = this.gotVersion
            this.commitThread.addEntry(SLInventoryHTTPFetchRequest.this.folderEntry)
        }
        public void onPrimitiveValue(String str, LLSDNode lsdNode) throws LLSDXMLException, LLSDValueTypeException {
            Debug.Printf("InvFetch: FolderDataContentHandler: key '%s' value '%s'", str, lsdNode)
            if (str.equals("version")) {
                this.gotVersion = lsdNode.asInt()
            } else if (str.equals("folder_id")) {
                this.gotUUID = lsdNode.asUUID()
            }
        }
    }

    private open class FolderEntryContentHandler : LLSDStreamingParser.LLSDDefaultContentHandler() {

        private DatabaseCommitThread commitThread
        private SLInventoryEntry entry = SLInventoryEntry()

        FolderEntryContentHandler(DatabaseCommitThread databaseCommitThread) {
            this.commitThread = databaseCommitThread
            this.entry.isFolder = true
        }
        public void onMapEnd(String str) throws LLSDXMLException, InterruptedException {
            if (this.entry.parentUUID == null) {
                this.entry.parentUUID = SLInventoryHTTPFetchRequest.this.folderEntry.parentUUID
                this.entry.parent_id = SLInventoryHTTPFetchRequest.this.folderEntry.getId()
            }
            if (this.entry.agentUUID == null) {
                this.entry.agentUUID = SLInventoryHTTPFetchRequest.this.folderEntry.agentUUID
            }
            this.commitThread.addEntry(this.entry)
        }
        public void onPrimitiveValue(String str, LLSDNode lsdNode) throws LLSDXMLException, LLSDValueTypeException {
            var byTag: FolderValueKey = FolderValueKey.byTag(str)
            if (byTag == null) {
                Debug.Printf("InvFetch: Folder unknown key '%s'", str)
                return
            }
            when (byTag) {
                agent_id ->
                    this.entry.agentUUID = lsdNode.asUUID()

                category_id ->
                    this.entry.uuid = lsdNode.asUUID()

                folder_id ->
                    this.entry.uuid = lsdNode.asUUID()

                name ->
                    this.entry.name = lsdNode.asString()

                parent_id ->
                    this.entry.parentUUID = lsdNode.asUUID()
                    if (!this.entry.parentUUID.equals(SLInventoryHTTPFetchRequest.this.folderUUID)) {
                        var findEntry: SLInventoryEntry = SLInventoryHTTPFetchRequest.this.db.findEntry(this.entry.parentUUID)
                        if (findEntry == null) {
                            this.entry.parent_id = 0L

                        } else {
                            this.entry.parent_id = findEntry.getId()

                        }
                    } else {
                        this.entry.parent_id = SLInventoryHTTPFetchRequest.this.folderEntry.getId()

                    }
                type ->
                    if (!lsdNode.isInt()) {
                        var byString: SLAssetType = SLAssetType.getByString(lsdNode.asString())
                        if (byString == SLAssetType.AT_UNKNOWN) {
                            this.entry.typeDefault = SLInventoryType.getByString(lsdNode.asString()).getTypeCode()

                        } else {
                            this.entry.typeDefault = byString.getInventoryType().getTypeCode()

                        }
                    } else {
                        this.entry.typeDefault = lsdNode.asInt()

                    }
                type_default ->
                    this.entry.typeDefault = lsdNode.asInt()

                version ->
                    this.entry.version = lsdNode.asInt()

            }
        }
    }

    enum class FolderValueKey {
        category_id,
        folder_id,
        agent_id,
        name,
        type_default,
        type,
        version,
        parent_id,
        preferred_type

        private static Map<String, FolderValueKey> tagMap = HashMap(valuesCustom().length * 2)
    init {
            for (folderValueKey in valuesCustom()) {
                tagMap.put(folderValueKey.toString(), folderValueKey)
            }
        }

        fun byTag(str: String): FolderValueKey {
            return tagMap.get(str)
        }

        /* renamed from: values, reason: to resolve conflict with enum method */
        fun valuesCustom(): Array<FolderValueKey> {
            return values()
        }
    }

    private open class ItemEntryContentHandler : LLSDStreamingParser.LLSDDefaultContentHandler() {

        private DatabaseCommitThread commitThread
        private LLSDStreamingParser.LLSDContentHandler permissionsHandler = LLSDStreamingParser.LLSDDefaultContentHandler() {
            public void onPrimitiveValue(String str, LLSDNode lsdNode) throws LLSDXMLException, LLSDValueTypeException {
                var byTag: PermissionsValueKey = PermissionsValueKey.byTag(str)
                if (byTag == null) {
                    Debug.Printf("InvFetch: Permissions unknown key '%s'", str)
                    return
                }
                when (byTag) {
                    base_mask ->
                        ItemEntryContentHandler.this.entry.baseMask = lsdNode.asInt()

                    creator_id ->
                        ItemEntryContentHandler.this.entry.creatorUUID = lsdNode.asUUID()

                    everyone_mask ->
                        ItemEntryContentHandler.this.entry.everyoneMask = lsdNode.asInt()

                    group_id ->
                        ItemEntryContentHandler.this.entry.groupUUID = lsdNode.asUUID()

                    group_mask ->
                        ItemEntryContentHandler.this.entry.groupMask = lsdNode.asInt()

                    is_owner_group ->
                        ItemEntryContentHandler.this.entry.isGroupOwned = lsdNode.asBoolean()

                    last_owner_id ->
                        ItemEntryContentHandler.this.entry.lastOwnerUUID = lsdNode.asUUID()

                    next_owner_mask ->
                        ItemEntryContentHandler.this.entry.nextOwnerMask = lsdNode.asInt()

                    owner_id ->
                        ItemEntryContentHandler.this.entry.ownerUUID = lsdNode.asUUID()

                    owner_mask ->
                        ItemEntryContentHandler.this.entry.ownerMask = lsdNode.asInt()

                }
            }
        }
        private LLSDStreamingParser.LLSDContentHandler saleInfoHandler = LLSDStreamingParser.LLSDDefaultContentHandler() {
            public void onPrimitiveValue(String str, LLSDNode lsdNode) throws LLSDXMLException, LLSDValueTypeException {
                if (str.equals("sale_type")) {
                    if (lsdNode.isString()) {
                        ItemEntryContentHandler.this.entry.saleType = SLSaleType.getByString(lsdNode.asString()).getTypeCode()
                        return
                    } else {
                        ItemEntryContentHandler.this.entry.saleType = lsdNode.asInt()
                        return
                    }
                }
                if (str.equals("sale_price")) {
                    ItemEntryContentHandler.this.entry.salePrice = lsdNode.asInt()
                } else {
                    Debug.Printf("InvFetch: Sale info unknown key '%s'", str)
                }
            }
        }
        private SLInventoryEntry entry = SLInventoryEntry()

        ItemEntryContentHandler(DatabaseCommitThread databaseCommitThread) {
            this.commitThread = databaseCommitThread
            this.entry.isFolder = false
        }
        public LLSDStreamingParser.LLSDContentHandler onMapBegin(String str) throws LLSDXMLException {
            return if (str.equals("permissions")) this.permissionsHandler else if (str.equals("sale_info")) this.saleInfoHandler else super.onMapBegin(str)
        }
        public void onMapEnd(String str) throws LLSDXMLException, InterruptedException {
            if (this.entry.parentUUID == null) {
                this.entry.parentUUID = SLInventoryHTTPFetchRequest.this.folderEntry.parentUUID
                this.entry.parent_id = SLInventoryHTTPFetchRequest.this.folderEntry.getId()
            }
            if (this.entry.agentUUID == null) {
                this.entry.agentUUID = SLInventoryHTTPFetchRequest.this.folderEntry.agentUUID
            }
            this.commitThread.addEntry(this.entry)
        }
        public void onPrimitiveValue(String str, LLSDNode lsdNode) throws LLSDXMLException, LLSDValueTypeException {
            var byTag: ItemValueKey = ItemValueKey.byTag(str)
            if (byTag == null) {
                Debug.Printf("InvFetch: Item unknown key '%s'", str)
                return
            }
            when (byTag) {
                agent_id ->
                    this.entry.agentUUID = lsdNode.asUUID()

                asset_id ->
                    this.entry.assetUUID = lsdNode.asUUID()

                created_at ->
                    this.entry.creationDate = lsdNode.asInt()

                desc ->
                    this.entry.description = lsdNode.asString()

                flags ->
                    this.entry.flags = lsdNode.asInt()

                inv_type ->
                    if (!lsdNode.isInt()) {
                        this.entry.invType = SLInventoryType.getByString(lsdNode.asString()).getTypeCode()

                    } else {
                        this.entry.invType = lsdNode.asInt()

                    }
                item_id ->
                    this.entry.uuid = lsdNode.asUUID()

                name ->
                    this.entry.name = lsdNode.asString()

                parent_id ->
                    this.entry.parentUUID = lsdNode.asUUID()
                    if (!this.entry.parentUUID.equals(SLInventoryHTTPFetchRequest.this.folderUUID)) {
                        var findEntry: SLInventoryEntry = SLInventoryHTTPFetchRequest.this.db.findEntry(this.entry.parentUUID)
                        if (findEntry == null) {
                            this.entry.parent_id = 0L

                        } else {
                            this.entry.parent_id = findEntry.getId()

                        }
                    } else {
                        this.entry.parent_id = SLInventoryHTTPFetchRequest.this.folderEntry.getId()

                    }
                type ->
                    if (!lsdNode.isInt()) {
                        this.entry.assetType = SLAssetType.getByString(lsdNode.asString()).getTypeCode()

                    } else {
                        this.entry.assetType = lsdNode.asInt()

                    }
            }
        }
    }

    enum class ItemValueKey {
        item_id,
        name,
        parent_id,
        agent_id,
        type,
        inv_type,
        desc,
        flags,
        created_at,
        asset_id

        private static Map<String, ItemValueKey> tagMap = HashMap(valuesCustom().length * 2)
    init {
            for (itemValueKey in valuesCustom()) {
                tagMap.put(itemValueKey.toString(), itemValueKey)
            }
        }

        fun byTag(str: String): ItemValueKey {
            return tagMap.get(str)
        }

        /* renamed from: values, reason: to resolve conflict with enum method */
        fun valuesCustom(): Array<ItemValueKey> {
            return values()
        }
    }

    enum class PermissionsValueKey {
        creator_id,
        group_id,
        owner_id,
        last_owner_id,
        is_owner_group,
        base_mask,
        owner_mask,
        next_owner_mask,
        group_mask,
        everyone_mask

        private static Map<String, PermissionsValueKey> tagMap = HashMap(valuesCustom().length * 2)
    init {
            for (permissionsValueKey in valuesCustom()) {
                tagMap.put(permissionsValueKey.toString(), permissionsValueKey)
            }
        }

        fun byTag(str: String): PermissionsValueKey {
            return tagMap.get(str)
        }

        /* renamed from: values, reason: to resolve conflict with enum method */
        fun valuesCustom(): Array<PermissionsValueKey> {
            return values()
        }
    }

    private open class RootContentHandler : LLSDStreamingParser.LLSDDefaultContentHandler() {
        private DatabaseCommitThread commitThread

        fun RootContentHandler(databaseCommitThread: DatabaseCommitThread): private {
            this.commitThread = databaseCommitThread
        }
        public LLSDStreamingParser.LLSDContentHandler onMapBegin(String str) throws LLSDXMLException {
            return LLSDStreamingParser.LLSDDefaultContentHandler() {
                public LLSDStreamingParser.LLSDContentHandler onArrayBegin(String str2) throws LLSDXMLException {
                    return if (str2.equals("folders")) LLSDStreamingParser.LLSDDefaultContentHandler() {
                        public LLSDStreamingParser.LLSDContentHandler onMapBegin(String str3) throws LLSDXMLException {
                            return FolderDataContentHandler(RootContentHandler.this.commitThread)
                        }
                    } else super.onArrayBegin(str2)
                }
            }
        }
    }

    SLInventoryHTTPFetchRequest(SLInventory inventory, UUID uuid, String capURL) throws SLInventory.NoInventoryItemException {
        super(inventory, uuid)
        this.futureRef = AtomicReference<>this as null.streamingXmlReqRef = AtomicReference<>this as null.isCancelled = AtomicBooleanthis as false.httpRequest = Runnable() {
            /**
             * Fetch one folder through the FetchInventoryDescendents2 capability
             * (LLSD request <code>{folders: [{folder_id, fetch_folders, fetch_items}]}</code>).
             * The streamed reply is parsed on this thread and committed to the
             * database by a {@link DatabaseCommitThread}. Up to three attempts
             * are made; an attempt that fails interrupts its commit thread.
             */
            fun run() {
                var success: Boolean = false
                try {
                    var startTime: Long = System.currentTimeMillis()
                    Debug.Printf("InventoryFetcher: Going to fetch folder: %s", SLInventoryHTTPFetchRequest.this.folderUUID)
                    var request: LLSDStreamingXMLRequest = LLSDStreamingXMLRequest()
                    var folders: LLSDArray = LLSDArray()
                    folders.add(LLSDMap(
                            LLSDMap.LLSDMapEntry("folder_id", LLSDUUID(SLInventoryHTTPFetchRequest.this.folderUUID)),
                            LLSDMap.LLSDMapEntry("fetch_folders", LLSDBoolean(true)),
                            LLSDMap.LLSDMapEntry("fetch_items", LLSDBoolean(true))))
                    var body: LLSDMap = LLSDMap(LLSDMap.LLSDMapEntry("folders", folders))
                    SLInventoryHTTPFetchRequest.this.streamingXmlReqRef.set(request)
                    for (int attempt = 0; attempt < 3; attempt++) {
                        var commitThread: DatabaseCommitThread = DatabaseCommitThread()
                        try {
                            commitThread.start()
                            Debug.Printf("InventoryFetcher: Starting HTTP request for folder: %s", SLInventoryHTTPFetchRequest.this.folderUUID)
                            request.PerformRequest(SLInventoryHTTPFetchRequest.this.capURL, body, RootContentHandler(commitThread))
                            Debug.Printf("InvFetch: done parsing,  waiting for commit thread", arrayOfNulls<Object>(0))
                            commitThread.stopAndWaitDebug as true.Printf("InvFetch: commit thread finished", arrayOfNulls<Object>(0))
                            success = true
                        } catch (e: LLSDXMLException) {
                            e.printStackTrace()
                            try {
                                Debug.Log("InventoryFetcher: malformed xml after req = " + body.serializeToXML())
                            } catch (ignored: Exception) {
                                // logging only
                            }
                        } catch (e: IOException) {
                            e.printStackTrace()
                        }
                        if (success) {

                        }
                        commitThread.interrupt()
                        if (Thread.interrupted() || SLInventoryHTTPFetchRequest.this.isCancelled.get()) {

                        }
                    }
                    Debug.Printf("InventoryFetcher: Fetched folder: %s (fetch time = %d)",
                            SLInventoryHTTPFetchRequest.this.folderUUID.toString(), System.currentTimeMillis( - startTime))
                    SLInventoryHTTPFetchRequest.this.streamingXmlReqRef.set(null)
                } catch (e: Exception) {
                    Debug.Warning(e)
                }
                var cancelled: Boolean = Thread.interrupted() || SLInventoryHTTPFetchRequest.this.isCancelled.get()
                Debug.Printf("InventoryFetcher: done processing folder %s: success %s cancelled %b",
                        SLInventoryHTTPFetchRequest.this.folderUUID.toString(), if (success) "true" else "false", cancelled)
                SLInventoryHTTPFetchRequest.this.completeFetch(success, cancelled)
            }
        }
        this.capURL = capURL
    }
    fun cancel() {
        this.isCancelled.set(true)
        var lsdStreamingXMLRequest: LLSDStreamingXMLRequest = this.streamingXmlReqRef.get()
        if (lsdStreamingXMLRequest != null) {
            lsdStreamingXMLRequest.InterruptRequest()
        }
        var andSet: Future<?> = this.futureRef.getAndSet(null)
        if (andSet != null) {
            andSet.cancel(true)
        }
    }
    fun start() {
        if (this.isCancelled.get() || this.futureRef.get() != null) {
            return
        }
        this.futureRef.set(GenericHTTPExecutor.getInstance().submit(this.httpRequest))
    }
}
