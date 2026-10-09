package com.lumiyaviewer.lumiya.slproto.inventory

import android.database.sqlite.SQLiteStatement
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.orm.DBObject
import com.lumiyaviewer.lumiya.slproto.https.GenericHTTPExecutor
import com.lumiyaviewer.lumiya.slproto.https.LLSDStreamingXMLRequest
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDStreamingParser
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDXMLException
import java.io.IOException
import java.util.HashSet
import java.util.UUID
import java.util.concurrent.BlockingQueue
import java.util.concurrent.Future
import java.util.concurrent.LinkedBlockingQueue
import java.util.concurrent.atomic.AtomicBoolean
import java.util.concurrent.atomic.AtomicReference

open class SLAIS3FetchRequest(
    inventory: SLInventory,
    uuid: UUID,
    private val capURL: String
) : SLInventoryFetchRequest(inventory, uuid) {

    private val futureRef = AtomicReference<Future<*>?>(null)
    private val streamingXmlReqRef = AtomicReference<LLSDStreamingXMLRequest?>(null)
    private val isCancelled = AtomicBoolean(false)

    private inner class DatabaseCommitThread : Thread() {
        private val commitEntryQueue: BlockingQueue<SLInventoryEntry> = LinkedBlockingQueue()
        private val stopEntry: SLInventoryEntry = SLInventoryEntry()
        @Volatile private var aborted = false

        fun addEntry(inventoryEntry: SLInventoryEntry) {
            commitEntryQueue.put(inventoryEntry)
        }

        override fun run() {
            val retainedChildren: MutableSet<UUID> = HashSet()
            var insertStatement: SQLiteStatement? = null
            var updateStatement: SQLiteStatement? = null
            var inTransaction = false
            var uncommittedCount = 0
            var success = false
            try {
                while (!Thread.interrupted()) {
                    var entry: SLInventoryEntry? = commitEntryQueue.poll()
                    if (entry == null) {
                        if (inTransaction) {
                            db.setTransactionSuccessful()
                            db.endTransaction()
                            inTransaction = false
                            uncommittedCount = 0
                        }
                        entry = commitEntryQueue.take()
                    }
                    if (entry == stopEntry) {
                        break
                    }
                    if (!inTransaction) {
                        db.beginTransaction()
                        inTransaction = true
                    }
                    uncommittedCount++
                    if (uncommittedCount >= 16) {
                        db.yieldIfContendedSafely()
                        uncommittedCount = 0
                    }
                    retainedChildren.add(entry.uuid)
                    if (insertStatement == null) {
                        insertStatement = SLInventoryEntry.getInsertStatement(db.database)
                    }
                    if (updateStatement == null) {
                        updateStatement = SLInventoryEntry.getUpdateStatement(db.database)
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
                Debug.Printf(
                    "AIS3Fetch: commit thread ending transaction (success: %s, count %d).",
                    if (success) "true" else "false", retainedChildren.size
                )
                db.setTransactionSuccessful()
                db.endTransaction()
            }
            insertStatement?.close()
            updateStatement?.close()
            if (success && !aborted) {
                Debug.Printf("AIS3Fetch: commit thread successful, calling retainChildren.")
                db.retainChildren(folderId, retainedChildren)
            }
        }

        fun stopAndWait(success: Boolean) {
            if (!success) {
                aborted = true
            }
            commitEntryQueue.put(stopEntry)
            join()
        }
    }

    private inner class FolderDataContentHandler(
        private val commitThread: DatabaseCommitThread
    ) : LLSDStreamingParser.LLSDDefaultContentHandler() {
        private var gotUUID: UUID? = null
        private var gotVersion: Int = -1

        override fun onArrayBegin(str: String): LLSDStreamingParser.LLSDContentHandler {
            if (str == "categories") {
                return object : LLSDStreamingParser.LLSDDefaultContentHandler() {
                    override fun onMapBegin(str2: String): LLSDStreamingParser.LLSDContentHandler {
                        return FolderEntryContentHandler(commitThread)
                    }
                }
            } else if (str == "items") {
                return object : LLSDStreamingParser.LLSDDefaultContentHandler() {
                    override fun onMapBegin(str2: String): LLSDStreamingParser.LLSDContentHandler {
                        return ItemEntryContentHandler(commitThread)
                    }
                }
            }
            return super.onArrayBegin(str)
        }

        override fun onMapEnd(str: String) {
            if (gotUUID != null && gotUUID == folderUUID && gotVersion != folderEntry.version) {
                folderEntry.version = gotVersion
                commitThread.addEntry(folderEntry)
            }
        }

        override fun onPrimitiveValue(str: String, lsdNode: LLSDNode) {
            Debug.Printf("AIS3Fetch: FolderDataContentHandler: key '%s' value '%s'", str, lsdNode)
            if (str == "version") {
                gotVersion = lsdNode.asInt()
            } else if (str == "folder_id" || str == "category_id") {
                gotUUID = lsdNode.asUUID()
            }
        }
    }

    private inner class FolderEntryContentHandler(
        private val commitThread: DatabaseCommitThread
    ) : LLSDStreamingParser.LLSDDefaultContentHandler() {
        private val entry = SLInventoryEntry()

        init {
            entry.isFolder = true
        }

        override fun onMapEnd(str: String) {
            if (entry.parentUUID == null) {
                entry.parentUUID = folderEntry.parentUUID
                entry.parent_id = folderEntry.getId()
            }
            if (entry.agentUUID == null) {
                entry.agentUUID = folderEntry.agentUUID
            }
            commitThread.addEntry(entry)
        }

        override fun onPrimitiveValue(str: String, lsdNode: LLSDNode) {
            val key = FolderValueKey.byTag(str) ?: run {
                Debug.Printf("AIS3Fetch: Folder unknown key '%s'", str)
                return
            }
            when (key) {
                FolderValueKey.agent_id -> entry.agentUUID = lsdNode.asUUID()
                FolderValueKey.category_id, FolderValueKey.folder_id -> entry.uuid = lsdNode.asUUID()
                FolderValueKey.name -> entry.name = lsdNode.asString()
                FolderValueKey.parent_id -> {
                    entry.parentUUID = lsdNode.asUUID()
                    if (entry.parentUUID != folderUUID) {
                        val parentEntry = db.findEntry(entry.parentUUID)
                        entry.parent_id = parentEntry?.getId() ?: 0L
                    } else {
                        entry.parent_id = folderEntry.getId()
                    }
                }
                FolderValueKey.type, FolderValueKey.type_default, FolderValueKey.preferred_type -> {
                    if (!lsdNode.isInt) {
                        val assetType = SLAssetType.getByString(lsdNode.asString())
                        if (assetType == SLAssetType.AT_UNKNOWN) {
                            entry.typeDefault = SLInventoryType.getByString(lsdNode.asString()).typeCode
                        } else {
                            entry.typeDefault = assetType.inventoryType.typeCode
                        }
                    } else {
                        entry.typeDefault = lsdNode.asInt()
                    }
                }
                FolderValueKey.version -> entry.version = lsdNode.asInt()
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
        preferred_type;

        companion object {
            private val tagMap: Map<String, FolderValueKey> = values().associateBy { it.name }
            fun byTag(tag: String): FolderValueKey? = tagMap[tag]
        }
    }

    private inner class ItemEntryContentHandler(
        private val commitThread: DatabaseCommitThread
    ) : LLSDStreamingParser.LLSDDefaultContentHandler() {
        private val entry = SLInventoryEntry()

        private val permissionsHandler = object : LLSDStreamingParser.LLSDDefaultContentHandler() {
            override fun onPrimitiveValue(str: String, lsdNode: LLSDNode) {
                val key = PermissionsValueKey.byTag(str) ?: run {
                    Debug.Printf("AIS3Fetch: Permissions unknown key '%s'", str)
                    return
                }
                when (key) {
                    PermissionsValueKey.base_mask -> entry.baseMask = lsdNode.asInt()
                    PermissionsValueKey.creator_id -> entry.creatorUUID = lsdNode.asUUID()
                    PermissionsValueKey.everyone_mask -> entry.everyoneMask = lsdNode.asInt()
                    PermissionsValueKey.group_id -> entry.groupUUID = lsdNode.asUUID()
                    PermissionsValueKey.group_mask -> entry.groupMask = lsdNode.asInt()
                    PermissionsValueKey.is_owner_group -> entry.isGroupOwned = lsdNode.asBoolean()
                    PermissionsValueKey.last_owner_id -> entry.lastOwnerUUID = lsdNode.asUUID()
                    PermissionsValueKey.next_owner_mask -> entry.nextOwnerMask = lsdNode.asInt()
                    PermissionsValueKey.owner_id -> entry.ownerUUID = lsdNode.asUUID()
                    PermissionsValueKey.owner_mask -> entry.ownerMask = lsdNode.asInt()
                }
            }
        }

        private val saleInfoHandler = object : LLSDStreamingParser.LLSDDefaultContentHandler() {
            override fun onPrimitiveValue(str: String, lsdNode: LLSDNode) {
                if (str == "sale_type") {
                    if (lsdNode.isString) {
                        entry.saleType = SLSaleType.getByString(lsdNode.asString()).typeCode
                    } else {
                        entry.saleType = lsdNode.asInt()
                    }
                } else if (str == "sale_price") {
                    entry.salePrice = lsdNode.asInt()
                } else {
                    Debug.Printf("AIS3Fetch: Sale info unknown key '%s'", str)
                }
            }
        }

        init {
            entry.isFolder = false
        }

        override fun onMapBegin(str: String): LLSDStreamingParser.LLSDContentHandler {
            if (str == "permissions") return permissionsHandler
            if (str == "sale_info") return saleInfoHandler
            return super.onMapBegin(str)
        }

        override fun onMapEnd(str: String) {
            if (entry.parentUUID == null) {
                entry.parentUUID = folderEntry.parentUUID
                entry.parent_id = folderEntry.getId()
            }
            if (entry.agentUUID == null) {
                entry.agentUUID = folderEntry.agentUUID
            }
            commitThread.addEntry(entry)
        }

        override fun onPrimitiveValue(str: String, lsdNode: LLSDNode) {
            val key = ItemValueKey.byTag(str) ?: run {
                Debug.Printf("AIS3Fetch: Item unknown key '%s'", str)
                return
            }
            when (key) {
                ItemValueKey.agent_id -> entry.agentUUID = lsdNode.asUUID()
                ItemValueKey.asset_id -> entry.assetUUID = lsdNode.asUUID()
                ItemValueKey.created_at -> entry.creationDate = lsdNode.asInt()
                ItemValueKey.desc -> entry.description = lsdNode.asString()
                ItemValueKey.flags -> entry.flags = lsdNode.asInt()
                ItemValueKey.inv_type -> {
                    if (!lsdNode.isInt) {
                        entry.invType = SLInventoryType.getByString(lsdNode.asString()).typeCode
                    } else {
                        entry.invType = lsdNode.asInt()
                    }
                }
                ItemValueKey.item_id -> entry.uuid = lsdNode.asUUID()
                ItemValueKey.name -> entry.name = lsdNode.asString()
                ItemValueKey.parent_id -> {
                    entry.parentUUID = lsdNode.asUUID()
                    if (entry.parentUUID != folderUUID) {
                        val parentEntry = db.findEntry(entry.parentUUID)
                        entry.parent_id = parentEntry?.getId() ?: 0L
                    } else {
                        entry.parent_id = folderEntry.getId()
                    }
                }
                ItemValueKey.type -> {
                    if (!lsdNode.isInt) {
                        entry.assetType = SLAssetType.getByString(lsdNode.asString()).typeCode
                    } else {
                        entry.assetType = lsdNode.asInt()
                    }
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
        asset_id;

        companion object {
            private val tagMap: Map<String, ItemValueKey> = values().associateBy { it.name }
            fun byTag(tag: String): ItemValueKey? = tagMap[tag]
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
        everyone_mask;

        companion object {
            private val tagMap: Map<String, PermissionsValueKey> = values().associateBy { it.name }
            fun byTag(tag: String): PermissionsValueKey? = tagMap[tag]
        }
    }

    private inner class RootContentHandler(
        private val commitThread: DatabaseCommitThread
    ) : LLSDStreamingParser.LLSDDefaultContentHandler() {
        private val folderDataContentHandler = FolderDataContentHandler(commitThread)

        override fun onMapBegin(str: String): LLSDStreamingParser.LLSDContentHandler {
            return object : LLSDStreamingParser.LLSDDefaultContentHandler() {
                override fun onArrayBegin(str2: String): LLSDStreamingParser.LLSDContentHandler {
                    if (str2 == "folders") {
                        return object : LLSDStreamingParser.LLSDDefaultContentHandler() {
                            override fun onMapBegin(str3: String): LLSDStreamingParser.LLSDContentHandler {
                                return FolderDataContentHandler(commitThread)
                            }
                        }
                    }
                    if (str2 == "categories" || str2 == "items") {
                        return folderDataContentHandler.onArrayBegin(str2)
                    }
                    return super.onArrayBegin(str2)
                }

                override fun onPrimitiveValue(str2: String, lsdNode: LLSDNode) {
                    folderDataContentHandler.onPrimitiveValue(str2, lsdNode)
                }

                override fun onMapEnd(str2: String) {
                    folderDataContentHandler.onMapEnd(str2)
                }
            }
        }
    }

    private val httpRequest = Runnable {
        var success = false
        try {
            val startTime = System.currentTimeMillis()
            val requestUrl = if (capURL.endsWith("/")) "${capURL}category/$folderUUID" else "$capURL/category/$folderUUID"
            Debug.Printf("AIS3Fetch: Going to fetch folder %s from %s", folderUUID, requestUrl)
            val request = LLSDStreamingXMLRequest()
            streamingXmlReqRef.set(request)
            for (attempt in 0 until 3) {
                val commitThread = DatabaseCommitThread()
                try {
                    commitThread.start()
                    Debug.Printf("AIS3Fetch: Starting HTTP GET request for folder %s (attempt %d)", folderUUID, attempt)
                    request.PerformRequest(requestUrl, null, RootContentHandler(commitThread))
                    Debug.Printf("AIS3Fetch: done parsing, waiting for commit thread")
                    commitThread.stopAndWait(true)
                    Debug.Printf("AIS3Fetch: commit thread finished")
                    success = true
                } catch (e: LLSDXMLException) {
                    Debug.Warning(e)
                    commitThread.stopAndWait(false)
                } catch (e: IOException) {
                    Debug.Warning(e)
                    commitThread.stopAndWait(false)
                } catch (e: Exception) {
                    Debug.Warning(e)
                    commitThread.stopAndWait(false)
                }
                if (success) {
                    break
                }
                if (Thread.interrupted() || isCancelled.get()) {
                    break
                }
            }
            Debug.Printf("AIS3Fetch: Fetched folder %s (fetch time = %d)", folderUUID, System.currentTimeMillis() - startTime)
            streamingXmlReqRef.set(null)
        } catch (e: Exception) {
            Debug.Warning(e)
        }
        val cancelled = Thread.interrupted() || isCancelled.get()
        Debug.Printf("AIS3Fetch: done processing folder %s: success %b cancelled %b", folderUUID, success, cancelled)
        completeFetch(success, cancelled)
    }

    override fun cancel() {
        isCancelled.set(true)
        val req = streamingXmlReqRef.get()
        req?.InterruptRequest()
        val future = futureRef.getAndSet(null)
        future?.cancel(true)
    }

    override fun start() {
        if (isCancelled.get() || futureRef.get() != null) {
            return
        }
        futureRef.set(GenericHTTPExecutor.getInstance().submit(httpRequest))
    }
}
