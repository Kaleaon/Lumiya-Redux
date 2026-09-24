package com.lumiyaviewer.lumiya.slproto.inventory;

import android.database.sqlite.SQLiteStatement;
import com.lumiyaviewer.lumiya.orm.DBObject;
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDArray;
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDBoolean;
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDMap;
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDUUID;
import java.io.IOException;
import java.util.HashSet;

import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.slproto.https.GenericHTTPExecutor;
import com.lumiyaviewer.lumiya.slproto.https.LLSDStreamingXMLRequest;
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventory;
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode;
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDStreamingParser;
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDValueTypeException;
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDXMLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.Future;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

class SLInventoryHTTPFetchRequest extends SLInventoryFetchRequest {
    private final String capURL;
    private final AtomicReference<Future<?>> futureRef;
    private final Runnable httpRequest;
    private final AtomicBoolean isCancelled;
    private final AtomicReference<LLSDStreamingXMLRequest> streamingXmlReqRef;

    private final class DatabaseCommitThread extends Thread {
        private volatile boolean aborted;
        private final BlockingQueue<SLInventoryEntry> commitEntryQueue;
        private final SLInventoryEntry stopEntry;

        private DatabaseCommitThread() {
            this.commitEntryQueue = new LinkedBlockingQueue(100);
            this.stopEntry = new SLInventoryEntry();
            this.aborted = false;
        }

            void addEntry(SLInventoryEntry sLInventoryEntry) throws InterruptedException {
            this.commitEntryQueue.put(sLInventoryEntry);
        }

        /**
         * Write parsed entries to the inventory database as they arrive.
         *
         * <p>Entries are written in a transaction that is committed whenever
         * the queue runs dry, so a large folder becomes visible in batches;
         * every 16 entries the transaction yields to other database users.
         * The loop ends at {@link #stopEntry}. Whatever was written is
         * committed even if the fetch failed; only a successful, non-aborted
         * fetch then prunes children that were not in the reply
         * (retainChildren).</p>
         */
        @Override
        public void run() {
            Set<UUID> retainedChildren = new HashSet<>();
            SQLiteStatement insertStatement = null;
            SQLiteStatement updateStatement = null;
            boolean inTransaction = false;
            int uncommittedCount = 0;
            boolean success;
            try {
                while (!Thread.interrupted()) {
                    SLInventoryEntry entry = this.commitEntryQueue.poll();
                    if (entry == null) {
                        if (inTransaction) {
                            SLInventoryHTTPFetchRequest.this.db.setTransactionSuccessful();
                            SLInventoryHTTPFetchRequest.this.db.endTransaction();
                            inTransaction = false;
                            uncommittedCount = 0;
                        }
                        entry = this.commitEntryQueue.take();
                    }
                    if (entry == this.stopEntry) {
                        break;
                    }
                    if (!inTransaction) {
                        SLInventoryHTTPFetchRequest.this.db.beginTransaction();
                        inTransaction = true;
                    }
                    uncommittedCount++;
                    if (uncommittedCount >= 16) {
                        SLInventoryHTTPFetchRequest.this.db.yieldIfContendedSafely();
                        uncommittedCount = 0;
                    }
                    retainedChildren.add(entry.uuid);
                    if (insertStatement == null) {
                        insertStatement = SLInventoryEntry.getInsertStatement(SLInventoryHTTPFetchRequest.this.db.getDatabase());
                    }
                    if (updateStatement == null) {
                        updateStatement = SLInventoryEntry.getUpdateStatement(SLInventoryHTTPFetchRequest.this.db.getDatabase());
                    }
                    entry.updateOrInsert(updateStatement, insertStatement);
                }
                success = !Thread.interrupted();
            } catch (InterruptedException e) {
                Debug.Warning(e);
                success = false;
            } catch (DBObject.DatabaseBindingException e) {
                Debug.Warning(e);
                success = false;
            }
            if (inTransaction) {
                Debug.Printf("InvFetch: commit thread ending transaction (success: %s, count %d).",
                        success ? "true" : "false", Integer.valueOf(retainedChildren.size()));
                SLInventoryHTTPFetchRequest.this.db.setTransactionSuccessful();
                SLInventoryHTTPFetchRequest.this.db.endTransaction();
            }
            if (insertStatement != null) {
                insertStatement.close();
            }
            if (updateStatement != null) {
                updateStatement.close();
            }
            if (success && !this.aborted) {
                Debug.Printf("InvFetch: commit thread successful, calling retainChildren.", new Object[0]);
                SLInventoryHTTPFetchRequest.this.db.retainChildren(SLInventoryHTTPFetchRequest.this.folderId, retainedChildren);
            }
        }

        void stopAndWait(boolean z) throws InterruptedException {
            if (!z) {
                this.aborted = true;
            }
            this.commitEntryQueue.put(this.stopEntry);
            join();
        }
    }

    private class FolderDataContentHandler extends LLSDStreamingParser.LLSDDefaultContentHandler {
        private final DatabaseCommitThread commitThread;
        private UUID gotUUID;
        private int gotVersion;

        private FolderDataContentHandler(DatabaseCommitThread databaseCommitThread) {
            this.commitThread = databaseCommitThread;
        }

        @Override
        public LLSDStreamingParser.LLSDContentHandler onArrayBegin(String str) throws LLSDXMLException {
            return str.equals("categories") ? new LLSDStreamingParser.LLSDDefaultContentHandler() {
                @Override
                public LLSDStreamingParser.LLSDContentHandler onMapBegin(String str2) throws LLSDXMLException {
                    return SLInventoryHTTPFetchRequest.this.new FolderEntryContentHandler(FolderDataContentHandler.this.commitThread);
                }
            } : str.equals("items") ? new LLSDStreamingParser.LLSDDefaultContentHandler() {
                @Override
                public LLSDStreamingParser.LLSDContentHandler onMapBegin(String str2) throws LLSDXMLException {
                    return SLInventoryHTTPFetchRequest.this.new ItemEntryContentHandler(FolderDataContentHandler.this.commitThread);
                }
            } : super.onArrayBegin(str);
        }

        @Override
        public void onMapEnd(String str) throws LLSDXMLException, InterruptedException {
            if (this.gotUUID == null || !this.gotUUID.equals(SLInventoryHTTPFetchRequest.this.folderUUID) || this.gotVersion == SLInventoryHTTPFetchRequest.this.folderEntry.version) {
                return;
            }
            SLInventoryHTTPFetchRequest.this.folderEntry.version = this.gotVersion;
            this.commitThread.addEntry(SLInventoryHTTPFetchRequest.this.folderEntry);
        }

        @Override
        public void onPrimitiveValue(String str, LLSDNode lLSDNode) throws LLSDXMLException, LLSDValueTypeException {
            Debug.Printf("InvFetch: FolderDataContentHandler: key '%s' value '%s'", str, lLSDNode);
            if (str.equals("version")) {
                this.gotVersion = lLSDNode.asInt();
            } else if (str.equals("folder_id")) {
                this.gotUUID = lLSDNode.asUUID();
            }
        }
    }

    private class FolderEntryContentHandler extends LLSDStreamingParser.LLSDDefaultContentHandler {

        private final DatabaseCommitThread commitThread;
        private final SLInventoryEntry entry = new SLInventoryEntry();

        FolderEntryContentHandler(DatabaseCommitThread databaseCommitThread) {
            this.commitThread = databaseCommitThread;
            this.entry.isFolder = true;
        }

        @Override
        public void onMapEnd(String str) throws LLSDXMLException, InterruptedException {
            if (this.entry.parentUUID == null) {
                this.entry.parentUUID = SLInventoryHTTPFetchRequest.this.folderEntry.parentUUID;
                this.entry.parent_id = SLInventoryHTTPFetchRequest.this.folderEntry.getId();
            }
            if (this.entry.agentUUID == null) {
                this.entry.agentUUID = SLInventoryHTTPFetchRequest.this.folderEntry.agentUUID;
            }
            this.commitThread.addEntry(this.entry);
        }

        @Override
        public void onPrimitiveValue(String str, LLSDNode lLSDNode) throws LLSDXMLException, LLSDValueTypeException {
            FolderValueKey byTag = FolderValueKey.byTag(str);
            if (byTag == null) {
                Debug.Printf("InvFetch: Folder unknown key '%s'", str);
                return;
            }
            switch (byTag) {
                case agent_id:
                    this.entry.agentUUID = lLSDNode.asUUID();
                    break;
                case category_id:
                    this.entry.uuid = lLSDNode.asUUID();
                    break;
                case folder_id:
                    this.entry.uuid = lLSDNode.asUUID();
                    break;
                case name:
                    this.entry.name = lLSDNode.asString();
                    break;
                case parent_id:
                    this.entry.parentUUID = lLSDNode.asUUID();
                    if (!this.entry.parentUUID.equals(SLInventoryHTTPFetchRequest.this.folderUUID)) {
                        SLInventoryEntry findEntry = SLInventoryHTTPFetchRequest.this.db.findEntry(this.entry.parentUUID);
                        if (findEntry == null) {
                            this.entry.parent_id = 0L;
                            break;
                        } else {
                            this.entry.parent_id = findEntry.getId();
                            break;
                        }
                    } else {
                        this.entry.parent_id = SLInventoryHTTPFetchRequest.this.folderEntry.getId();
                        break;
                    }
                case type:
                    if (!lLSDNode.isInt()) {
                        SLAssetType byString = SLAssetType.getByString(lLSDNode.asString());
                        if (byString == SLAssetType.AT_UNKNOWN) {
                            this.entry.typeDefault = SLInventoryType.getByString(lLSDNode.asString()).getTypeCode();
                            break;
                        } else {
                            this.entry.typeDefault = byString.getInventoryType().getTypeCode();
                            break;
                        }
                    } else {
                        this.entry.typeDefault = lLSDNode.asInt();
                        break;
                    }
                case type_default:
                    this.entry.typeDefault = lLSDNode.asInt();
                    break;
                case version:
                    this.entry.version = lLSDNode.asInt();
                    break;
            }
        }
    }

    private enum FolderValueKey {
        category_id,
        folder_id,
        agent_id,
        name,
        type_default,
        type,
        version,
        parent_id,
        preferred_type;

        private static final Map<String, FolderValueKey> tagMap = new HashMap(valuesCustom().length * 2);

        static {
            for (FolderValueKey folderValueKey : valuesCustom()) {
                tagMap.put(folderValueKey.toString(), folderValueKey);
            }
        }

        public static FolderValueKey byTag(String str) {
            return tagMap.get(str);
        }

        /* renamed from: values, reason: to resolve conflict with enum method */
        public static FolderValueKey[] valuesCustom() {
            return values();
        }
    }

    private class ItemEntryContentHandler extends LLSDStreamingParser.LLSDDefaultContentHandler {

        private final DatabaseCommitThread commitThread;
        private final LLSDStreamingParser.LLSDContentHandler permissionsHandler = new LLSDStreamingParser.LLSDDefaultContentHandler() {

            @Override
            public void onPrimitiveValue(String str, LLSDNode lLSDNode) throws LLSDXMLException, LLSDValueTypeException {
                PermissionsValueKey byTag = PermissionsValueKey.byTag(str);
                if (byTag == null) {
                    Debug.Printf("InvFetch: Permissions unknown key '%s'", str);
                    return;
                }
                switch (byTag) {
                    case base_mask:
                        ItemEntryContentHandler.this.entry.baseMask = lLSDNode.asInt();
                        break;
                    case creator_id:
                        ItemEntryContentHandler.this.entry.creatorUUID = lLSDNode.asUUID();
                        break;
                    case everyone_mask:
                        ItemEntryContentHandler.this.entry.everyoneMask = lLSDNode.asInt();
                        break;
                    case group_id:
                        ItemEntryContentHandler.this.entry.groupUUID = lLSDNode.asUUID();
                        break;
                    case group_mask:
                        ItemEntryContentHandler.this.entry.groupMask = lLSDNode.asInt();
                        break;
                    case is_owner_group:
                        ItemEntryContentHandler.this.entry.isGroupOwned = lLSDNode.asBoolean();
                        break;
                    case last_owner_id:
                        ItemEntryContentHandler.this.entry.lastOwnerUUID = lLSDNode.asUUID();
                        break;
                    case next_owner_mask:
                        ItemEntryContentHandler.this.entry.nextOwnerMask = lLSDNode.asInt();
                        break;
                    case owner_id:
                        ItemEntryContentHandler.this.entry.ownerUUID = lLSDNode.asUUID();
                        break;
                    case owner_mask:
                        ItemEntryContentHandler.this.entry.ownerMask = lLSDNode.asInt();
                        break;
                }
            }
        };
        private final LLSDStreamingParser.LLSDContentHandler saleInfoHandler = new LLSDStreamingParser.LLSDDefaultContentHandler() {
            @Override
            public void onPrimitiveValue(String str, LLSDNode lLSDNode) throws LLSDXMLException, LLSDValueTypeException {
                if (str.equals("sale_type")) {
                    if (lLSDNode.isString()) {
                        ItemEntryContentHandler.this.entry.saleType = SLSaleType.getByString(lLSDNode.asString()).getTypeCode();
                        return;
                    } else {
                        ItemEntryContentHandler.this.entry.saleType = lLSDNode.asInt();
                        return;
                    }
                }
                if (str.equals("sale_price")) {
                    ItemEntryContentHandler.this.entry.salePrice = lLSDNode.asInt();
                } else {
                    Debug.Printf("InvFetch: Sale info unknown key '%s'", str);
                }
            }
        };
        private final SLInventoryEntry entry = new SLInventoryEntry();

        ItemEntryContentHandler(DatabaseCommitThread databaseCommitThread) {
            this.commitThread = databaseCommitThread;
            this.entry.isFolder = false;
        }

        @Override
        public LLSDStreamingParser.LLSDContentHandler onMapBegin(String str) throws LLSDXMLException {
            return str.equals("permissions") ? this.permissionsHandler : str.equals("sale_info") ? this.saleInfoHandler : super.onMapBegin(str);
        }

        @Override
        public void onMapEnd(String str) throws LLSDXMLException, InterruptedException {
            if (this.entry.parentUUID == null) {
                this.entry.parentUUID = SLInventoryHTTPFetchRequest.this.folderEntry.parentUUID;
                this.entry.parent_id = SLInventoryHTTPFetchRequest.this.folderEntry.getId();
            }
            if (this.entry.agentUUID == null) {
                this.entry.agentUUID = SLInventoryHTTPFetchRequest.this.folderEntry.agentUUID;
            }
            this.commitThread.addEntry(this.entry);
        }

        @Override
        public void onPrimitiveValue(String str, LLSDNode lLSDNode) throws LLSDXMLException, LLSDValueTypeException {
            ItemValueKey byTag = ItemValueKey.byTag(str);
            if (byTag == null) {
                Debug.Printf("InvFetch: Item unknown key '%s'", str);
                return;
            }
            switch (byTag) {
                case agent_id:
                    this.entry.agentUUID = lLSDNode.asUUID();
                    break;
                case asset_id:
                    this.entry.assetUUID = lLSDNode.asUUID();
                    break;
                case created_at:
                    this.entry.creationDate = lLSDNode.asInt();
                    break;
                case desc:
                    this.entry.description = lLSDNode.asString();
                    break;
                case flags:
                    this.entry.flags = lLSDNode.asInt();
                    break;
                case inv_type:
                    if (!lLSDNode.isInt()) {
                        this.entry.invType = SLInventoryType.getByString(lLSDNode.asString()).getTypeCode();
                        break;
                    } else {
                        this.entry.invType = lLSDNode.asInt();
                        break;
                    }
                case item_id:
                    this.entry.uuid = lLSDNode.asUUID();
                    break;
                case name:
                    this.entry.name = lLSDNode.asString();
                    break;
                case parent_id:
                    this.entry.parentUUID = lLSDNode.asUUID();
                    if (!this.entry.parentUUID.equals(SLInventoryHTTPFetchRequest.this.folderUUID)) {
                        SLInventoryEntry findEntry = SLInventoryHTTPFetchRequest.this.db.findEntry(this.entry.parentUUID);
                        if (findEntry == null) {
                            this.entry.parent_id = 0L;
                            break;
                        } else {
                            this.entry.parent_id = findEntry.getId();
                            break;
                        }
                    } else {
                        this.entry.parent_id = SLInventoryHTTPFetchRequest.this.folderEntry.getId();
                        break;
                    }
                case type:
                    if (!lLSDNode.isInt()) {
                        this.entry.assetType = SLAssetType.getByString(lLSDNode.asString()).getTypeCode();
                        break;
                    } else {
                        this.entry.assetType = lLSDNode.asInt();
                        break;
                    }
            }
        }
    }

    private enum ItemValueKey {
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

        private static final Map<String, ItemValueKey> tagMap = new HashMap(valuesCustom().length * 2);

        static {
            for (ItemValueKey itemValueKey : valuesCustom()) {
                tagMap.put(itemValueKey.toString(), itemValueKey);
            }
        }

        public static ItemValueKey byTag(String str) {
            return tagMap.get(str);
        }

        /* renamed from: values, reason: to resolve conflict with enum method */
        public static ItemValueKey[] valuesCustom() {
            return values();
        }
    }

    private enum PermissionsValueKey {
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

        private static final Map<String, PermissionsValueKey> tagMap = new HashMap(valuesCustom().length * 2);

        static {
            for (PermissionsValueKey permissionsValueKey : valuesCustom()) {
                tagMap.put(permissionsValueKey.toString(), permissionsValueKey);
            }
        }

        public static PermissionsValueKey byTag(String str) {
            return tagMap.get(str);
        }

        /* renamed from: values, reason: to resolve conflict with enum method */
        public static PermissionsValueKey[] valuesCustom() {
            return values();
        }
    }

    private class RootContentHandler extends LLSDStreamingParser.LLSDDefaultContentHandler {
        private final DatabaseCommitThread commitThread;

        private RootContentHandler(DatabaseCommitThread databaseCommitThread) {
            this.commitThread = databaseCommitThread;
        }

        @Override
        public LLSDStreamingParser.LLSDContentHandler onMapBegin(String str) throws LLSDXMLException {
            return new LLSDStreamingParser.LLSDDefaultContentHandler() {
                @Override
                public LLSDStreamingParser.LLSDContentHandler onArrayBegin(String str2) throws LLSDXMLException {
                    return str2.equals("folders") ? new LLSDStreamingParser.LLSDDefaultContentHandler() {
                        @Override
                        public LLSDStreamingParser.LLSDContentHandler onMapBegin(String str3) throws LLSDXMLException {
                            return new FolderDataContentHandler(RootContentHandler.this.commitThread);
                        }
                    } : super.onArrayBegin(str2);
                }
            };
        }
    }

    SLInventoryHTTPFetchRequest(SLInventory sLInventory, UUID uuid, String str) throws SLInventory.NoInventoryItemException {
        super(sLInventory, uuid);
        this.futureRef = new AtomicReference<>(null);
        this.streamingXmlReqRef = new AtomicReference<>(null);
        this.isCancelled = new AtomicBoolean(false);
        this.httpRequest = new Runnable() {
            /**
             * Fetch one folder through the FetchInventoryDescendents2 capability
             * (LLSD request <code>{folders: [{folder_id, fetch_folders, fetch_items}]}</code>).
             * The streamed reply is parsed on this thread and committed to the
             * database by a {@link DatabaseCommitThread}. Up to three attempts
             * are made; an attempt that fails interrupts its commit thread.
             */
            @Override
            public void run() {
                boolean success = false;
                try {
                    long startTime = System.currentTimeMillis();
                    Debug.Printf("InventoryFetcher: Going to fetch folder: %s", SLInventoryHTTPFetchRequest.this.folderUUID);
                    LLSDStreamingXMLRequest request = new LLSDStreamingXMLRequest();
                    LLSDArray folders = new LLSDArray();
                    folders.add(new LLSDMap(
                            new LLSDMap.LLSDMapEntry("folder_id", new LLSDUUID(SLInventoryHTTPFetchRequest.this.folderUUID)),
                            new LLSDMap.LLSDMapEntry("fetch_folders", new LLSDBoolean(true)),
                            new LLSDMap.LLSDMapEntry("fetch_items", new LLSDBoolean(true))));
                    LLSDMap body = new LLSDMap(new LLSDMap.LLSDMapEntry("folders", folders));
                    SLInventoryHTTPFetchRequest.this.streamingXmlReqRef.set(request);
                    for (int attempt = 0; attempt < 3; attempt++) {
                        DatabaseCommitThread commitThread = new DatabaseCommitThread();
                        try {
                            commitThread.start();
                            Debug.Printf("InventoryFetcher: Starting HTTP request for folder: %s", SLInventoryHTTPFetchRequest.this.folderUUID);
                            request.PerformRequest(SLInventoryHTTPFetchRequest.this.capURL, body, new RootContentHandler(commitThread));
                            Debug.Printf("InvFetch: done parsing,  waiting for commit thread", new Object[0]);
                            commitThread.stopAndWait(true);
                            Debug.Printf("InvFetch: commit thread finished", new Object[0]);
                            success = true;
                        } catch (LLSDXMLException e) {
                            e.printStackTrace();
                            try {
                                Debug.Log("InventoryFetcher: malformed xml after req = " + body.serializeToXML());
                            } catch (Exception ignored) {
                                // logging only
                            }
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                        if (success) {
                            break;
                        }
                        commitThread.interrupt();
                        if (Thread.interrupted() || SLInventoryHTTPFetchRequest.this.isCancelled.get()) {
                            break;
                        }
                    }
                    Debug.Printf("InventoryFetcher: Fetched folder: %s (fetch time = %d)",
                            SLInventoryHTTPFetchRequest.this.folderUUID.toString(), Long.valueOf(System.currentTimeMillis() - startTime));
                    SLInventoryHTTPFetchRequest.this.streamingXmlReqRef.set(null);
                } catch (Exception e) {
                    Debug.Warning(e);
                }
                boolean cancelled = Thread.interrupted() || SLInventoryHTTPFetchRequest.this.isCancelled.get();
                Debug.Printf("InventoryFetcher: done processing folder %s: success %s cancelled %b",
                        SLInventoryHTTPFetchRequest.this.folderUUID.toString(), success ? "true" : "false", Boolean.valueOf(cancelled));
                SLInventoryHTTPFetchRequest.this.completeFetch(success, cancelled);
            }
        };
        this.capURL = str;
    }

    @Override
    public void cancel() {
        this.isCancelled.set(true);
        LLSDStreamingXMLRequest lLSDStreamingXMLRequest = this.streamingXmlReqRef.get();
        if (lLSDStreamingXMLRequest != null) {
            lLSDStreamingXMLRequest.InterruptRequest();
        }
        Future<?> andSet = this.futureRef.getAndSet(null);
        if (andSet != null) {
            andSet.cancel(true);
        }
    }

    @Override
    public void start() {
        if (this.isCancelled.get() || this.futureRef.get() != null) {
            return;
        }
        this.futureRef.set(GenericHTTPExecutor.getInstance().submit(this.httpRequest));
    }
}
