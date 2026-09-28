package com.lumiyaviewer.lumiya.slproto.modules

import com.google.common.base.Objects
import com.google.common.base.Strings
import com.google.common.collect.HashBasedTable
import com.google.common.collect.ImmutableList
import com.google.common.collect.ImmutableMap
import com.google.common.collect.ImmutableTable
import com.google.common.collect.Table
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.orm.InventoryDB
import com.lumiyaviewer.lumiya.orm.InventoryEntryList
import com.lumiyaviewer.lumiya.orm.InventoryQuery
import com.lumiyaviewer.lumiya.react.AsyncRequestHandler
import com.lumiyaviewer.lumiya.react.RequestHandler
import com.lumiyaviewer.lumiya.react.ResultHandler
import com.lumiyaviewer.lumiya.react.SimpleRequestHandler
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.SLParcelInfo
import com.lumiyaviewer.lumiya.slproto.assets.SLWearable
import com.lumiyaviewer.lumiya.slproto.assets.SLWearableData
import com.lumiyaviewer.lumiya.slproto.assets.SLWearableType
import com.lumiyaviewer.lumiya.slproto.avatar.SLAvatarParams
import com.lumiyaviewer.lumiya.slproto.baker.BakeProcess
import com.lumiyaviewer.lumiya.slproto.caps.SLCaps
import com.lumiyaviewer.lumiya.slproto.events.SLBakingProgressEvent
import com.lumiyaviewer.lumiya.slproto.handler.SLMessageHandler
import com.lumiyaviewer.lumiya.slproto.https.GenericHTTPExecutor
import com.lumiyaviewer.lumiya.slproto.https.LLSDXMLRequest
import com.lumiyaviewer.lumiya.slproto.inventory.SLAssetType
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventory
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryType
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDInt
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDMap
import com.lumiyaviewer.lumiya.slproto.messages.AgentIsNowWearing
import com.lumiyaviewer.lumiya.slproto.messages.AgentSetAppearance
import com.lumiyaviewer.lumiya.slproto.messages.AgentWearablesRequest
import com.lumiyaviewer.lumiya.slproto.messages.AgentWearablesUpdate
import com.lumiyaviewer.lumiya.slproto.messages.AvatarAppearance
import com.lumiyaviewer.lumiya.slproto.messages.DetachAttachmentIntoInv
import com.lumiyaviewer.lumiya.slproto.messages.ObjectDetach
import com.lumiyaviewer.lumiya.slproto.messages.RezMultipleAttachmentsFromInv
import com.lumiyaviewer.lumiya.slproto.messages.RezSingleAttachmentFromInv
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectAvatarInfo
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectInfo
import com.lumiyaviewer.lumiya.slproto.textures.SLTextureEntry
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.util.ArrayList
import java.util.HashMap
import java.util.HashSet
import java.util.Iterator
import java.util.LinkedList
import java.util.List
import java.util.Map
import java.util.NoSuchElementException
import java.util.UUID
import java.util.concurrent.Future
import java.util.concurrent.atomic.AtomicBoolean
import java.util.concurrent.atomic.AtomicReference

open class SLAvatarAppearance : SLModule(), SLWearable.OnWearableStatusChangeListener {
    @JvmStatic private var Param_agentSizeVPHeadSize: Int = 682
    @JvmStatic private var Param_agentSizeVPHeelHeight: Int = 198
    @JvmStatic private var Param_agentSizeVPHeight: Int = 33
    @JvmStatic private var Param_agentSizeVPHipLength: Int = 842
    @JvmStatic private var Param_agentSizeVPLegLength: Int = 692
    @JvmStatic private var Param_agentSizeVPNeckLength: Int = 756
    @JvmStatic private var Param_agentSizeVPPlatformHeight: Int = 503
    private var agentBakedTextures: SLTextureEntry? = null
    private var agentSizeKnown: Boolean = false
    private var agentSizeVPHeadSize: Float = 0.0f
    private var agentSizeVPHeelHeight: Float = 0.0f
    private var agentSizeVPHeight: Float = 0.0f
    private var agentSizeVPHipLength: Float = 0.0f
    private var agentSizeVPLegLength: Float = 0.0f
    private var agentSizeVPNeckLength: Float = 0.0f
    private var agentSizeVPPlatformHeight: Float = 0.0f
    private var agentVisualParams: IntArray? = null
    private var bakeProcess: BakeProcess? = null
    private var bakingThread: Thread? = null
    private var caps: SLCaps? = null
    private var cofFolderUUID: AtomicReference<UUID>? = null
    private var cofReady: Boolean = false
    private var currentCofAppearanceVersion: Int = 0
    private var currentCofInventoryVersion: Int = 0
    private var currentOutfitFolder: SubscriptionData<InventoryQuery, InventoryEntryList>? = null
    private var findCofFolder: SubscriptionData<InventoryQuery, InventoryEntryList>? = null
    private var inventory: SLInventory? = null
    private var lastCofUpdateError: Boolean = false
    private var lastCofUpdatedVersion: Int = 0
    private var legacyAppearanceReady: Boolean = false
    private var multiLayerDone: Boolean = false
    private var needUpdateAppearance: Boolean = false
    private var needUpdateCOF: AtomicBoolean? = null
    private var parcelInfo: SLParcelInfo? = null
    private var serverSideAppearanceUpdateTask: Future<?> = null
    private var setAppearanceSerialNum: Int = 0
    private var userManager: UserManager? = null
    private AtomicReference<Map<UUID, String>> wantedAttachments
    private var wantedOutfitFolder: SLInventoryEntry? = null

    private var wornAttachments: ImmutableMap<UUID, String>? = null
    private var wornItemsRequestHandler: RequestHandler<SubscriptionSingleKey>? = null
    private ResultHandler<SubscriptionSingleKey, ImmutableList<WornItem>> wornItemsResultHandler

    private var wornWearables: Table<SLWearableType, UUID, SLWearable>? = null

    open class WornItem {
        private var attachedTo: Int
        private var isTouchable: Boolean
        private UUID itemID
        private var name: String
        private var objectLocalID: Int
        private SLWearableType wornOn

        WornItem(SLWearableType wearableType, int attachedTo, UUID uuid, String name, int objectLocalID, boolean isTouchable) {
            this.wornOn = wearableType
            this.attachedTo = attachedTo
            this.itemID = uuid
            this.name = name
            this.objectLocalID = objectLocalID
            this.isTouchable = isTouchable
        }

        fun getAttachedTo(): Int {
            return this.attachedTo
        }

        fun getIsTouchable(): Boolean {
            return this.isTouchable
        }

        fun getName(): String {
            return this.name
        }

        fun getObjectLocalID(): Int {
            return this.objectLocalID
        }

        fun getWornOn(): SLWearableType {
            return this.wornOn
        }

        fun itemID(): UUID {
            return this.itemID
        }
    }

    constructor(agentCircuit: SLAgentCircuit, inventory: SLInventory, caps: SLCaps) {
        superthis as agentCircuit.setAppearanceSerialNum = 1
        this.agentSizeKnown = false
        this.needUpdateAppearance = false
        this.needUpdateCOF = AtomicBooleanthis as false.wantedAttachments = AtomicReference<>(ImmutableMap.of())
        this.wornAttachments = ImmutableMap.of()
        this.wornWearables = ImmutableTable.of()
        this.wantedOutfitFolder = null
        this.bakingThread = null
        this.serverSideAppearanceUpdateTask = null
        this.currentCofInventoryVersion = 0
        this.currentCofAppearanceVersion = 0
        this.lastCofUpdatedVersion = 0
        this.lastCofUpdateError = false
        this.legacyAppearanceReady = false
        this.cofReady = false
        this.multiLayerDone = false
        this.cofFolderUUID = AtomicReference<>()
        this.wornItemsRequestHandler = AsyncRequestHandler(this.agentCircuit, SimpleRequestHandler<SubscriptionSingleKey>() {
            fun onRequest(subscriptionSingleKey: SubscriptionSingleKey) {
                if (SLAvatarAppearance.this.wornItemsResultHandler != null) {
                    SLAvatarAppearance.this.wornItemsResultHandler.onResultData(subscriptionSingleKey, SLAvatarAppearance.this.getWornItems())
                }
            }
        })
        this.bakeProcess = null
        this.caps = caps
        this.inventory = inventory
        this.parcelInfo = agentCircuit.getGridConnection().parcelInfo
        this.userManager = UserManager.getUserManager(agentCircuit.getAgentUUID())
        this.currentOutfitFolder = SubscriptionData<>(agentCircuit, obj -> onCurrentOutfitFolder(obj as InventoryEntryList))
        this.findCofFolder = SubscriptionData<>(agentCircuit, obj -> onCofFolderEntry(obj as InventoryEntryList))
        if (this.userManager != null) {
            this.wornItemsResultHandler = this.userManager.wornItems().attachRequestHandler(this.wornItemsRequestHandler)
        } else {
            this.wornItemsResultHandler = null
        }
    }

    private fun DetachItem(i: Int) {
        var agentAvatar: SLObjectAvatarInfo? = null
        var z: Boolean = false
        Debug.Log("Outfits: detaching item " + i)
        var z2: Boolean = false
        var map: MutableMap<UUID, String> = this.wantedAttachments.get()
        if (map != null) {
            var hashMap: HashMap = HashMap(map)
            if (this.parcelInfo != null && (agentAvatar = this.parcelInfo.getAgentAvatar()) != null) {
                try {
                    var it: Iterator<SLObjectInfo> = agentAvatar.treeNode.iterator()
                    while (true) {
                        if (!it.hasNext()) {
                            z = false

                        }
                        var next: SLObjectInfo = it.next()
                        if (next.attachedToUUID != null && (!next.isDead) && next.localID == i) {
                            if (hashMap.remove(next.getId()) != null) {
                                z = true

                            } else if (hashMap.remove(next.attachedToUUID) != null) {
                                z = true

                            }
                        }
                    }
                    z2 = z
                } catch (e: NoSuchElementException) {
                    Debug.Warning(e)
                }
            }
            if (z2) {
                this.wantedAttachments.set(ImmutableMap.copyOf(hashMap as Map))
            }
        }
        var objectDetach: ObjectDetach = ObjectDetach()
        objectDetach.AgentData_Field.AgentID = this.circuitInfo.agentID
        objectDetach.AgentData_Field.SessionID = this.circuitInfo.sessionID
        var objectData: ObjectDetach.ObjectData = ObjectDetach.ObjectData()
        objectData.ObjectLocalID = i
        objectDetach.ObjectData_Fields.addobjectDetach as objectData.isReliable = true
        SendMessage(objectDetach)
        if (z2) {
            this.needUpdateCOF.set(true)
            UpdateCOFContents()
        }
    }

    private fun ForceUpdateAppearance(z: Boolean) {
        this.needUpdateAppearance = true
        if (this.caps.getCapability(SLCaps.SLCapability.UpdateAvatarAppearance) == null) {
            this.eventBus.publish(SLBakingProgressEvent(true, false, 0))
        } else if (z) {
            this.lastCofUpdatedVersion = 0
            this.currentCofAppearanceVersion = 0
            RequestServerRebake()
        }
        StartUpdatingAppearance()
    }

    private fun ProcessMultiLayer() {
        if (!this.multiLayerDone && this.cofReady && this.legacyAppearanceReady) {
            UpdateMultiLayer()
        }
    }

    private fun RequestServerRebake() {
        var folder: SLInventoryEntry? = null
        var capability: String = this.caps.getCapability(SLCaps.SLCapability.UpdateAvatarAppearance)
        var data: InventoryEntryList = this.currentOutfitFolder.getData()
        if (capability == null || data == null || (folder = data.getFolder()) == null) {
            return
        }
        this.currentCofInventoryVersion = folder.version
        if ((this.currentCofInventoryVersion == this.lastCofUpdatedVersion || this.currentCofInventoryVersion == this.currentCofAppearanceVersion) && !this.lastCofUpdateError) {
            return
        }
        this.lastCofUpdatedVersion = this.currentCofInventoryVersion
        this.lastCofUpdateError = false
        UpdateServerSideAppearance(capability, folder.version)
    }

    private fun SendAgentIsNowWearing() {
        var z: Boolean = false
        var agentIsNowWearing: AgentIsNowWearing = AgentIsNowWearing()
        agentIsNowWearing.AgentData_Field.AgentID = this.circuitInfo.agentID
        agentIsNowWearing.AgentData_Field.SessionID = this.circuitInfo.sessionID
        for (wearableType in SLWearableType.values()) {
            var row: MutableMap<UUID, SLWearable> = this.wornWearables.row(wearableType)
            if (row != null) {
                z = true
                for (wearable in row.values()) {
                    var wearableData: AgentIsNowWearing.WearableData = AgentIsNowWearing.WearableData()
                    wearableData.ItemID = wearable.itemID
                    wearableData.WearableType = wearableType.getTypeCode()
                    agentIsNowWearing.WearableData_Fields.add(wearableData)
                    z = false
                }
            } else {
                z = true
            }
            if (z) {
                var wearableData2: AgentIsNowWearing.WearableData = AgentIsNowWearing.WearableData()
                wearableData2.ItemID = UUID(0L, 0L)
                wearableData2.WearableType = wearableType.getTypeCode()
                agentIsNowWearing.WearableData_Fields.add(wearableData2)
            }
        }
        Debug.Log("AvatarAppearance: Sending AgentIsNowWearing, " + agentIsNowWearing.WearableData_Fields.size() + " wearables.")
        agentIsNowWearing.isReliable = true
        SendMessagethis as agentIsNowWearing.needUpdateCOF.set(true)
        UpdateCOFContents()
    }

    private fun SendAvatarSetAppearance() {
        UpdateCOFContents()
        if (this.caps.getCapability(SLCaps.SLCapability.UpdateAvatarAppearance) == null) {
            var agentAvatar: SLObjectAvatarInfo = if (this.parcelInfo != null) this.parcelInfo.getAgentAvatar() else null
            if (this.agentBakedTextures != null && agentAvatar != null) {
                agentAvatar.ApplyAvatarTextures(this.agentBakedTextures, true)
            }
            var agentSetAppearance: AgentSetAppearance = AgentSetAppearance()
            agentSetAppearance.AgentData_Field.AgentID = this.circuitInfo.agentID
            agentSetAppearance.AgentData_Field.SessionID = this.circuitInfo.sessionID
            agentSetAppearance.AgentData_Field.SerialNum = this.setAppearanceSerialNum
            agentSetAppearance.AgentData_Field.Size = LLVector3()
            agentSetAppearance.AgentData_Field.Size.x = 1.0f
            agentSetAppearance.AgentData_Field.Size.y = 1.0f
            agentSetAppearance.AgentData_Field.Size.z = 1.0f
            if (this.agentBakedTextures != null) {
                agentSetAppearance.ObjectData_Field.TextureEntry = this.agentBakedTextures.packByteArray()
            } else {
                agentSetAppearance.ObjectData_Field.TextureEntry = ByteArray(0)
            }
            this.agentVisualParams = getAppearanceParams()
            if (agentAvatar != null) {
                agentAvatar.ApplyAvatarVisualParams(this.agentVisualParams)
            }
            for (agentVisualParam in this.agentVisualParams) {
                var visualParam: AgentSetAppearance.VisualParam = AgentSetAppearance.VisualParam()
                visualParam.ParamValue = agentVisualParam
                agentSetAppearance.VisualParam_Fields.add(visualParam)
            }
            if (this.agentSizeKnown && areWearablesReady()) {
                agentSetAppearance.AgentData_Field.Size.x = 0.45f
                agentSetAppearance.AgentData_Field.Size.y = 0.6f
                agentSetAppearance.AgentData_Field.Size.z = getAgentHeight()
                Debug.Log("set agent height to " + agentSetAppearance.AgentData_Field.Size.z)
            }
            agentSetAppearance.isReliable = true
            Debug.Log("AvatarAppearance: Sending agentSetAppearance: " + agentSetAppearance.VisualParam_Fields.size() + " params, hasTextures = " + (if (this.agentBakedTextures != null) "yes" else "no"))
            SendMessagethis as agentSetAppearance.setAppearanceSerialNum++
        }
    }

    private fun StartUpdatingAppearance() {
        updateIfWearablesReady()
    }

    private fun UpdateCOFContents() {
        var data: InventoryEntryList? = null
        var folder: SLInventoryEntry? = null
        var z: Boolean = false
        var z2: Boolean = false
        var areWearablesReady: Boolean = areWearablesReady()
        Debug.Printf("Wearables ready %b, cofReady %b", areWearablesReady, this.cofReady)
        if ((if this as areWearablesReady.cofReady else false) && (data = this.currentOutfitFolder.getData()) != null && (folder = data.getFolder()) != null && this.needUpdateCOF.getAndSet(false)) {
            this.currentCofInventoryVersion = folder.version
            var linkedList: LinkedList = LinkedList()
            var hashMap: HashMap<UUID, SLWearable> = HashMap<>()
            var hashMap2: HashMap<UUID, String> = HashMap<>()
            var hashSet: HashSet = HashSet()
            for (wearable in this.wornWearables.values()) {
                if (!wearable.getIsFailed()) {
                    hashSet.add(wearable.itemID)
                    hashMap.put(wearable.itemID, wearable)
                }
            }
            var map: MutableMap<UUID, String> = this.wantedAttachments.get()
            if (map != null) {
                hashMap2.putAll(map)
            }
            var z3: Boolean = true
            for (inventoryEntry in data) {
                if (inventoryEntry.assetType == SLAssetType.AT_LINK.getTypeCode()) {
                    if (inventoryEntry.invType == SLInventoryType.IT_WEARABLE.getTypeCode()) {
                        if (!hashSet.contains(inventoryEntry.assetUUID)) {
                            linkedList.add(inventoryEntry.uuid)
                        }
                    } else if (inventoryEntry.invType == SLInventoryType.IT_OBJECT.getTypeCode() && map != null && !map.containsKey(inventoryEntry.assetUUID)) {
                        Debug.Printf("Attached entry %s (%s) not found in wanted attachments", inventoryEntry.assetUUID, inventoryEntry.name)
                        linkedList.add(inventoryEntry.uuid)
                    }
                    hashMap.remove(inventoryEntry.assetUUID)
                    hashMap2.remove(inventoryEntry.assetUUID)
                    z2 = z3
                } else if (inventoryEntry.assetType != SLAssetType.AT_LINK_FOLDER.getTypeCode() || this.wantedOutfitFolder == null) {
                    z2 = z3
                } else if (this.wantedOutfitFolder.uuid.equals(inventoryEntry.assetUUID)) {
                    z2 = false
                } else {
                    linkedList.add(inventoryEntry.uuid)
                    z2 = z3
                }
                z3 = z2
            }
            Debug.Printf("Update COF: addWearablesList %d, killList %d", hashMap.size(), linkedList.size())
            if (linkedList.isEmpty()) {
                z = false
            } else {
                this.inventory.DeleteMultiInventoryItemRaw(folder, linkedList)
                z = true
            }
            for (wearable2 in hashMap.values()) {
                Debug.Printf("Update COF: adding %s, name = '%s'", wearable2.itemID, wearable2.getName())
                this.inventory.LinkInventoryItem(folder, wearable2.itemID, SLInventoryType.IT_WEARABLE.getTypeCode(), SLAssetType.AT_LINK.getTypeCode(), wearable2.getName(), "")
                z = true
            }
            for (entryObj in hashMap2.entrySet()) {
                var entry: Map.Entry = (Map.Entry) entryObj
                Debug.Printf("Update COF: adding attachment %s, name = '%s'", entry.getKey(), entry.getValue())
                this.inventory.LinkInventoryItem(folder, entry as UUID.getKey(), SLInventoryType.IT_OBJECT.getTypeCode(), SLAssetType.AT_LINK.getTypeCode(), entry as String.getValue(), "")
                z = true
            }
            if (z3 && this.wantedOutfitFolder != null) {
                Debug.Printf("Update COF: adding outfit link for outfit folder %s", this.wantedOutfitFolder.uuid)
                this.inventory.LinkInventoryItem(folder, this.wantedOutfitFolder.uuid, SLInventoryType.IT_CATEGORY.getTypeCode(), SLAssetType.AT_LINK_FOLDER.getTypeCode(), this.wantedOutfitFolder.name, "")
                z = true
            }
            Debug.Printf("Update COF: COF updated (had changes: %b).", z)
            if (z && this.userManager != null) {
                this.userManager.getInventoryManager().requestFolderUpdate(folder.uuid)
            }
            RequestServerRebake()
        }
    }

    private fun UpdateCurrentOutfitLink(inventoryEntryList: InventoryEntryList) {
        for (inventoryEntry in inventoryEntryList) {
            if (inventoryEntry.assetType == SLAssetType.AT_LINK_FOLDER.getTypeCode()) {
                this.userManager.wornOutfitLink().setData(SubscriptionSingleKey.Value, inventoryEntry.assetUUID)
                return
            }
        }
    }

    private fun UpdateMultiLayer() {
        var rezMultipleAttachmentsFromInv: RezMultipleAttachmentsFromInv? = null
        Debug.Printf("AvatarAppearance: MultiLayer: Updating multi layer appearance.", arrayOfNulls<Object>(0))
        var data: InventoryEntryList = this.currentOutfitFolder.getData()
        var database: InventoryDB = if (this.userManager != null) this.userManager.getInventoryManager().getDatabase() else null
        if (data != null && database != null) {
            var linkedList: MutableList<SLInventoryEntry> = LinkedList<>()
            var linkedList2: LinkedList<SLInventoryEntry> = LinkedList()
            for (inventoryEntry in data) {
                if (inventoryEntry.invType == SLInventoryType.IT_WEARABLE.getTypeCode()) {
                    linkedList.add(inventoryEntry)
                } else if (inventoryEntry.assetType == SLAssetType.AT_OBJECT.getTypeCode() || (inventoryEntry.isLink() && inventoryEntry.invType == SLInventoryType.IT_OBJECT.getTypeCode())) {
                    linkedList2.add(inventoryEntry)
                }
            }
            if (WearItemList(database, linkedList, false)) {
                Debug.Printf("AvatarAppearance: MultiLayer: had some extra layers.", arrayOfNulls<Object>(0))
                SendAgentIsNowWearing()
                StartUpdatingAppearance()
            } else {
                Debug.Printf("AvatarAppearance: MultiLayer: no extra layers.", arrayOfNulls<Object>(0))
            }
            if (linkedList2.size() != 0) {
                Debug.Printf("AvatarAppearance: Re-attaching %d attachments from COF.", linkedList2.size())
                var hashMap: HashMap = HashMap()
                var randomUUID: UUID = UUID.randomUUID()
                var rezMultipleAttachmentsFromInv2: RezMultipleAttachmentsFromInv? = null
                for (inventoryEntry2 in linkedList2) {
                    var resolveLink: SLInventoryEntry = database.resolveLink(inventoryEntry2)
                    if (resolveLink != null) {
                        if (rezMultipleAttachmentsFromInv2 == null) {
                            rezMultipleAttachmentsFromInv2 = RezMultipleAttachmentsFromInv()
                            rezMultipleAttachmentsFromInv2.AgentData_Field.AgentID = this.circuitInfo.agentID
                            rezMultipleAttachmentsFromInv2.AgentData_Field.SessionID = this.circuitInfo.sessionID
                            rezMultipleAttachmentsFromInv2.HeaderData_Field.CompoundMsgID = randomUUID
                            rezMultipleAttachmentsFromInv2.HeaderData_Field.TotalObjects = linkedList2.size()
                            rezMultipleAttachmentsFromInv2.HeaderData_Field.FirstDetachAll = false
                        }
                        var objectData: RezMultipleAttachmentsFromInv.ObjectData = RezMultipleAttachmentsFromInv.ObjectData()
                        Debug.Printf("Re-attaching attachment: entry %s (%s)", resolveLink.uuid, inventoryEntry2.name)
                        hashMap.put(resolveLink.uuid, inventoryEntry2.name)
                        objectData.ItemID = resolveLink.uuid
                        objectData.OwnerID = resolveLink.ownerUUID
                        objectData.AttachmentPt = 128
                        objectData.ItemFlags = resolveLink.flags
                        objectData.GroupMask = resolveLink.groupMask
                        objectData.EveryoneMask = resolveLink.everyoneMask
                        objectData.NextOwnerMask = resolveLink.nextOwnerMask
                        objectData.Name = SLMessage.stringToVariableOEM(inventoryEntry2.name)
                        objectData.Description = SLMessage.stringToVariableOEM(inventoryEntry2.description)
                        rezMultipleAttachmentsFromInv2.ObjectData_Fields.add(objectData)
                        if (rezMultipleAttachmentsFromInv2.ObjectData_Fields.size() >= 4) {
                            rezMultipleAttachmentsFromInv2.isReliable = true
                            SendMessage(rezMultipleAttachmentsFromInv2)
                            rezMultipleAttachmentsFromInv = null
                            rezMultipleAttachmentsFromInv2 = rezMultipleAttachmentsFromInv
                        }
                    }
                    rezMultipleAttachmentsFromInv = rezMultipleAttachmentsFromInv2
                    rezMultipleAttachmentsFromInv2 = rezMultipleAttachmentsFromInv
                }
                this.wantedAttachments.set(ImmutableMap.copyOf(hashMap as Map))
                if (rezMultipleAttachmentsFromInv2 != null) {
                    rezMultipleAttachmentsFromInv2.isReliable = true
                    SendMessage(rezMultipleAttachmentsFromInv2)
                }
            } else {
                Debug.Printf("AvatarAppearance: No attachments in COF.", arrayOfNulls<Object>(0))
            }
        }
        this.multiLayerDone = true
    }

    private fun UpdateServerSideAppearance(str: final String, i: Int) {
        Debug.Printf("AvatarAppearance: capURL '%s', cofVersion %d", str, i)
        if (this.serverSideAppearanceUpdateTask != null) {
            this.serverSideAppearanceUpdateTask.cancel(true)
        }
        this.serverSideAppearanceUpdateTask = GenericHTTPExecutor.getInstance().submit(Runnable() {
            private /* synthetic */ void $m$0() {
                m212x366f8fcf(i, str as String)
            }
            fun run() {
                $m$0()
            }
        })
    }

    private fun UpdateWearableNames() {
        var resolveLink: SLInventoryEntry? = null
        var byCode: SLWearableType? = null
        var wearable: SLWearable? = null
        var data: InventoryEntryList = this.currentOutfitFolder.getData()
        var database: InventoryDB = if (this.userManager != null) this.userManager.getInventoryManager().getDatabase() else null
        if (data == null || database == null) {
            return
        }
        for (inventoryEntry in data) {
            if (!inventoryEntry.isFolderOrFolderLink() && (resolveLink = database.resolveLink(inventoryEntry)) != null && resolveLink.invType == SLInventoryType.IT_WEARABLE.getTypeCode() && (byCode = SLWearableType.getByCode(resolveLink.flags & 255)) != null && (wearable = this.wornWearables.get(byCode, resolveLink.assetUUID)) != null) {
                wearable.setInventoryName(resolveLink.name)
            }
        }
    }

    private fun WearItemList(inventoryDB: InventoryDB, list: MutableList<SLInventoryEntry>, z: Boolean): Boolean {
        var z2: Boolean = false
        var byCode: SLWearableType? = null
        var z3: Boolean = false
        var z4: Boolean = false
        var z5: Boolean = false
        var rlvController: RLVController = this.agentCircuit.getModules().rlvController
        var create: HashBasedTable = HashBasedTable.create(this.wornWearables)
        var it: Iterator<SLInventoryEntry> = list.iterator()
        while (true) {
            z2 = z5
            if (!it.hasNext()) {

            }
            var resolveLink: SLInventoryEntry = inventoryDB.resolveLink(it as SLInventoryEntry.next())
            if (resolveLink != null && (byCode = SLWearableType.getByCode(resolveLink.flags & 255)) != null) {
                var isBodyPart: Boolean = !if byCode as z.isBodyPart() else true
                if (!rlvController.canWearItem(byCode)) {
                    z3 = false
                } else if (isBodyPart) {
                    if (!rlvController.canTakeItemOff(byCode)) {
                        var z6: Boolean = false
                        var iterator: Iterator<UUID> = create.row(byCode).keySet().iterator()
                        while (true) {
                            z4 = z6
                            if (!iterator.hasNext()) {

                            }
                            z6 = !(iterator as UUID.next()).if (equals(resolveLink.assetUUID)) true else z4
                        }
                        if (z4) {
                            z3 = false
                        }
                    }
                    z3 = true
                } else {
                    z3 = true
                }
                if (z3 && !create.contains(byCode, resolveLink.assetUUID)) {
                    if (isBodyPart) {
                        var hashSet: HashSet = HashSet(create.row(byCode).keySet())
                        hashSet.remove(resolveLink.assetUUID)
                        var iterator2: Iterator = hashSet.iterator()
                        while (iterator2.hasNext()) {
                            var remove: SLWearable = create as SLWearable.remove(byCode, iterator2 as UUID.next())
                            if (remove != null) {
                                remove.dispose()
                            }
                        }
                    }
                    addWearable(create, byCode, resolveLink.uuid, resolveLink.assetUUID, resolveLink.name)
                    z2 = true
                }
            }
            z5 = z2
        }
        if (z2) {
            this.wornWearables = ImmutableTable.copyOfthis as create.userManager.getWornWearablesPool().setData(SubscriptionSingleKey.Value, this.wornWearables)
            this.userManager.wornItems().requestUpdate(SubscriptionSingleKey.Value)
        }
        return z2
    }

    private fun addWearable(table: Table<SLWearableType, UUID, SLWearable>, wearableType: SLWearableType, uuid: UUID, uuid2: UUID, str: String): SLWearable {
        var wearable: SLWearable = SLWearable(this.userManager, this.agentCircuit, uuid, uuid2, wearableType, this)
        if (str != null) {
            wearable.setInventoryName(str)
        }
        table.put(wearableType, uuid2, wearable)
        return wearable
    }

    private fun areWearablesReady(): Boolean {
        var z: Boolean = false
        var z2: Boolean = false
        var z3: Boolean = false
        var z4: Boolean = false
        var z5: Boolean = false
        var valuesCustom: Array<SLWearableType> = SLWearableType.values()
        var length: Int = valuesCustom.length
        var i: Int = 0
        var z6: Boolean = false
        var z7: Boolean = false
        while (i < length) {
            var wearableType: SLWearableType = valuesCustom[i]
            var isCritical: Boolean = wearableType.getIsCritical()
            var row: MutableMap<UUID, SLWearable> = this.wornWearables.row(wearableType)
            if (row != null) {
                z = false
                z2 = z7
                for (wearable in row.values()) {
                    if (wearable.getIsValid()) {
                        z4 = true
                        z5 = z2
                    } else if (wearable.getIsFailed()) {
                        z4 = z
                        z5 = z2
                    } else {
                        z4 = z
                        z5 = true
                    }
                    z2 = z5
                    z = z4
                }
            } else {
                z = false
                z2 = z7
            }
            if (!isCritical) {
                z3 = z6
            } else if (!z) {
                var objArr: Array<Any> = arrayOfNulls<Object>(2)
                objArr[0] = wearableType
                objArr[1] = if (row != null) row.size( else 0)
                Debug.Printf("missing wearables on critical layer %s (worn: %d entries)", objArr)
                z3 = true
            } else {
                z3 = z6
            }
            i++
            z6 = z3
            z7 = z2
        }
        Debug.Printf("hasNotDownloaded %b, hasCriticalMissing %b", z7, z6)
        if (z7) {
        return false
        }
        return !z6
    }

    private fun canDetachItem(uuid: UUID): Boolean {
        var agentAvatar: SLObjectAvatarInfo? = null
        if (this.parcelInfo == null || (agentAvatar = this.parcelInfo.getAgentAvatar()) == null) {
        return true
        }
        try {
            for (objectInfo in agentAvatar.treeNode) {
                if (objectInfo.attachedToUUID != null && (!objectInfo.isDead) && objectInfo.attachedToUUID.equals(uuid)) {
                    if (!this.agentCircuit.getModules().rlvController.canDetachItem(objectInfo.attachmentID, objectInfo.getId())) {
        return false
                    }
                }
            }
        return true
        } catch (e: NoSuchElementException) {
            Debug.Warning(e)
        return true
        }
    }

    private fun canWearItem(wearableType: SLWearableType): Boolean {
        return this.agentCircuit.getModules().rlvController.canWearItem(wearableType)
    }

    private fun getAgentHeight(): Float {
        return (this.agentSizeVPLegLength * 0.1918f) + 1.706f + (this.agentSizeVPHipLength * 0.0375f) + (this.agentSizeVPHeight * 0.12022f) + (this.agentSizeVPHeadSize * 0.01117f) + (this.agentSizeVPNeckLength * 0.038f) + (this.agentSizeVPHeelHeight * 0.08f) + (this.agentSizeVPPlatformHeight * 0.07f)
    }

    private fun getAppearanceParams(): IntArray {
        var avatarParam: SLAvatarParams.AvatarParam? = null
        var ints: IntArray = IntArray(218)
        for (int i = 0; i < 218; i++) {
            ints[i] = 0
            var paramSet: SLAvatarParams.ParamSet = SLAvatarParams.paramDefs[i]
            if (paramSet != null && paramSet.params.size() > 0 && (avatarParam = paramSet.params.get(0)) != null) {
                var round: Int = Math.round(((avatarParam.defValue - avatarParam.minValue) * 255.0f) / (avatarParam.maxValue - avatarParam.minValue))
                if (round < 0) {
                    round = 0
                } else if (round > 255) {
                    round = 255
                }
                ints[i] = round
            }
        }
        var it: Iterator<SLWearable> = this.wornWearables.values().iterator()
        while (it.hasNext()) {
            var wearableData: SLWearableData = (it as SLWearable.next()).getWearableData()
            if (wearableData != null) {
                for (wearableParam in wearableData.params) {
                    var paramSet2: SLAvatarParams.ParamSet = SLAvatarParams.paramByIDs.get(wearableParam.paramIndex)
                    if (paramSet2 != null && paramSet2.params.size() > 0 && paramSet2.appearanceIndex >= 0) {
                        var avatarParam2: SLAvatarParams.AvatarParam = paramSet2.params.get(0)
                        var round2: Int = Math.round(((wearableParam.paramValue - avatarParam2.minValue) * 255.0f) / (avatarParam2.maxValue - avatarParam2.minValue))
                        if (round2 < 0) {
                            round2 = 0
                        } else if (round2 > 255) {
                            round2 = 255
                        }
                        ints[paramSet2.appearanceIndex] = round2
                        when (paramSet2.id) {
                            33 ->
                                this.agentSizeVPHeight = wearableParam.paramValue

                            Param_agentSizeVPHeelHeight /* 198 */ ->
                                this.agentSizeVPHeelHeight = wearableParam.paramValue

                            Param_agentSizeVPPlatformHeight /* 503 */ ->
                                this.agentSizeVPPlatformHeight = wearableParam.paramValue

                            Param_agentSizeVPHeadSize /* 682 */ ->
                                this.agentSizeVPHeadSize = wearableParam.paramValue

                            Param_agentSizeVPLegLength /* 692 */ ->
                                this.agentSizeVPLegLength = wearableParam.paramValue

                            Param_agentSizeVPNeckLength /* 756 */ ->
                                this.agentSizeVPNeckLength = wearableParam.paramValue

                            Param_agentSizeVPHipLength /* 842 */ ->
                                this.agentSizeVPHipLength = wearableParam.paramValue

                        }
                    }
                }
            }
        }
        this.agentSizeKnown = true
        return ints
    }

    fun getWornItems(): ImmutableList<WornItem> {
        var agentAvatar: SLObjectAvatarInfo? = null
        var builder: ImmutableList.Builder = ImmutableList.builder()
        Iterator<Table.Cell<SLWearableType, UUID, SLWearable>> it = this.wornWearables.cellSet().iterator()
        while (it.hasNext()) {
            var cell: Table.Cell = (Table.Cell) it.next()
            var wearable: SLWearable = cell as SLWearable.getValue()
            if (wearable != null) {
                builder.add(WornItem(cell as SLWearableType.getRowKey(), 0, cell as UUID.getColumnKey(), wearable.getName(), 0, false))
            }
        }
        if (this.parcelInfo != null && (agentAvatar = this.parcelInfo.getAgentAvatar()) != null) {
            try {
                for (objectInfo in agentAvatar.treeNode) {
                    builder.add(WornItem(null, objectInfo.attachmentID, objectInfo.getId(), objectInfo.getName(), objectInfo.localID, objectInfo.isTouchable()))
                }
            } catch (e: NoSuchElementException) {
                Debug.Warning(e)
            }
        }
        return builder.build()
    }

    private fun isItemWorn(inventoryEntry: SLInventoryEntry, z: Boolean): Boolean {
        return inventoryEntry.whatIsItemWornOn(this.wornAttachments, this.wornWearables, z) != null
    }

    fun onCofFolderEntry(inventoryEntryList: InventoryEntryList) {
        if (inventoryEntryList != null) {
            for (inventoryEntry in inventoryEntryList) {
                if (inventoryEntry != null && inventoryEntry.isFolder && inventoryEntry.typeDefault == 46) {
                    this.cofFolderUUID.set(inventoryEntry.uuid)
                    this.findCofFolder.unsubscribe()
                    this.currentOutfitFolder.subscribe(this.userManager.getInventoryManager().getInventoryEntries(), InventoryQuery.create(inventoryEntry.uuid, null as String, true, true, false, null as SLAssetType))
                    return
                }
            }
        }
    }

    fun onCurrentOutfitFolder(inventoryEntryList: InventoryEntryList) {
        var folder: SLInventoryEntry? = null
        if (inventoryEntryList == null || (folder = inventoryEntryList.getFolder()) == null || !Objects.equal(folder.sessionID, this.agentCircuit.circuitInfo.sessionID)) {
            return
        }
        Debug.Log("AvatarAppearance: COF has been fetched from inventory.")
        UpdateWearableNames()
        this.cofReady = true
        UpdateCurrentOutfitLink(inventoryEntryList)
        ProcessMultiLayer()
        UpdateCOFContents()
        RequestServerRebake()
    }

    private fun startBaking() {
        var bakeProcess: BakeProcess = this.bakeProcess
        if (bakeProcess != null) {
            bakeProcess.cancel()
        }
        this.bakeProcess = BakeProcess(this.wornWearables, this, this.agentCircuit.getModules().textureUploader, this.eventBus)
    }

    private fun updateIfWearablesReady() {
        if (areWearablesReady()) {
            SendAvatarSetAppearance()
            if (!this.needUpdateAppearance) {
                UpdateCOFContents()
            } else if (this.caps.getCapability(SLCaps.SLCapability.UpdateAvatarAppearance) == null) {
                startBaking()
            }
        }
    }

    fun AttachInventoryItem(inventoryEntry: SLInventoryEntry, i: Int, z: Boolean) {
        var z2: Boolean = false
        var database: InventoryDB = if (this.userManager != null) this.userManager.getInventoryManager().getDatabase() else null
        if (database != null) {
            inventoryEntry = database.resolveLink(inventoryEntry)
        }
        if (inventoryEntry == null) {
            return
        }
        if (inventoryEntry.assetType == SLAssetType.AT_CLOTHING.getTypeCode() || inventoryEntry.assetType == SLAssetType.AT_BODYPART.getTypeCode()) {
            WearItem(inventoryEntry, z)
            return
        }
        Debug.Printf("Outfits: Attaching inventory item %s", inventoryEntry.uuid.toString())
        var map: MutableMap<UUID, String> = this.wantedAttachments.get()
        if (map == null || (!map.containsKey(inventoryEntry.uuid))) {
            var hashMap: HashMap = HashMap()
            if (map != null) {
                hashMap.putAll(map)
            }
            hashMap.put(inventoryEntry.uuid, inventoryEntry.name)
            this.wantedAttachments.set(ImmutableMap.copyOf(hashMap as Map))
            z2 = true
        } else {
            z2 = false
        }
        var rezSingleAttachmentFromInv: RezSingleAttachmentFromInv = RezSingleAttachmentFromInv()
        rezSingleAttachmentFromInv.AgentData_Field.AgentID = this.circuitInfo.agentID
        rezSingleAttachmentFromInv.AgentData_Field.SessionID = this.circuitInfo.sessionID
        if (!z) {
            i |= 128
        }
        rezSingleAttachmentFromInv.ObjectData_Field.ItemID = inventoryEntry.uuid
        rezSingleAttachmentFromInv.ObjectData_Field.OwnerID = inventoryEntry.ownerUUID
        rezSingleAttachmentFromInv.ObjectData_Field.AttachmentPt = i
        rezSingleAttachmentFromInv.ObjectData_Field.ItemFlags = inventoryEntry.flags
        rezSingleAttachmentFromInv.ObjectData_Field.GroupMask = inventoryEntry.groupMask
        rezSingleAttachmentFromInv.ObjectData_Field.EveryoneMask = inventoryEntry.everyoneMask
        rezSingleAttachmentFromInv.ObjectData_Field.NextOwnerMask = inventoryEntry.nextOwnerMask
        rezSingleAttachmentFromInv.ObjectData_Field.Name = SLMessage.stringToVariableOEM(inventoryEntry.name)
        rezSingleAttachmentFromInv.ObjectData_Field.Description = SLMessage.stringToVariableOEM(inventoryEntry.description)
        rezSingleAttachmentFromInv.isReliable = true
        SendMessage(rezSingleAttachmentFromInv)
        if (z2) {
            this.needUpdateCOF.set(true)
            UpdateCOFContents()
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    fun ChangeOutfit(list: MutableList<SLInventoryEntry>, z: Boolean, wantedOutfitFolder: SLInventoryEntry) {
        var z2: Boolean = false
        var z3: Boolean = false
        var z4: Boolean = false
        var rezMultipleAttachmentsFromInv: RezMultipleAttachmentsFromInv? = null
        var z5: Boolean = false
        var z6: Boolean = false
        var byCode: SLWearableType? = null
        var z7: Boolean = false
        var z8: Boolean = false
        var removed: SLWearable? = null
        var rezMultipleAttachmentsFromInv2: RezMultipleAttachmentsFromInv? = null
        var database: InventoryDB = if (this.userManager != null) this.userManager.getInventoryManager().getDatabase() else null
        var map: MutableMap<UUID, String> = this.wantedAttachments.get()
        var hashMap: HashMap = if (map != null) HashMap(map) else HashMap()
        if (z) {
            z2 = true
            hashMap.clear()
        } else {
            z2 = false
        }
        if (wantedOutfitFolder != null) {
            if (z) {
                if (this.wantedOutfitFolder == null) {
                    this.wantedOutfitFolder = wantedOutfitFolder
                    z3 = true
                } else if (!this.wantedOutfitFolder.uuid.equals(wantedOutfitFolder.uuid)) {
                    this.wantedOutfitFolder = wantedOutfitFolder
                    z3 = true
                }
            }
            z3 = z2
        } else {
            z3 = z2
        }
        var randomUUID: UUID = UUID.randomUUID()
        var arrayList: ArrayList = ArrayList()
        for (inventoryEntry in list) {
            var resolveLink: SLInventoryEntry = if (database != null) database.resolveLink(inventoryEntry) else inventoryEntry
            if (resolveLink != null) {
                inventoryEntry = resolveLink
            }
            if (inventoryEntry != null && (inventoryEntry.assetType == SLAssetType.AT_OBJECT.getTypeCode() || (inventoryEntry.isLink() && inventoryEntry.invType == SLInventoryType.IT_OBJECT.getTypeCode()))) {
                arrayList.add(inventoryEntry)
            }
        }
        var rezMultipleAttachmentsFromInv3: RezMultipleAttachmentsFromInv = RezMultipleAttachmentsFromInv()
        rezMultipleAttachmentsFromInv3.AgentData_Field.AgentID = this.circuitInfo.agentID
        rezMultipleAttachmentsFromInv3.AgentData_Field.SessionID = this.circuitInfo.sessionID
        rezMultipleAttachmentsFromInv3.HeaderData_Field.CompoundMsgID = randomUUID
        rezMultipleAttachmentsFromInv3.HeaderData_Field.TotalObjects = arrayList.size()
        rezMultipleAttachmentsFromInv3.HeaderData_Field.FirstDetachAll = z
        Debug.Printf("Wearing: totalAttachments %d", arrayList.size())
        var it: Iterator = arrayList.iterator()
        while (true) {
            z4 = z3
            rezMultipleAttachmentsFromInv = rezMultipleAttachmentsFromInv3
            if (!it.hasNext()) {

            }
            var inventoryEntry2: SLInventoryEntry = it as SLInventoryEntry.next()
            if (rezMultipleAttachmentsFromInv == null) {
                var rezMultipleAttachmentsFromInv4: RezMultipleAttachmentsFromInv = RezMultipleAttachmentsFromInv()
                rezMultipleAttachmentsFromInv4.AgentData_Field.AgentID = this.circuitInfo.agentID
                rezMultipleAttachmentsFromInv4.AgentData_Field.SessionID = this.circuitInfo.sessionID
                rezMultipleAttachmentsFromInv4.HeaderData_Field.CompoundMsgID = randomUUID
                rezMultipleAttachmentsFromInv4.HeaderData_Field.TotalObjects = arrayList.size()
                rezMultipleAttachmentsFromInv4.HeaderData_Field.FirstDetachAll = z
                rezMultipleAttachmentsFromInv2 = rezMultipleAttachmentsFromInv4
            } else {
                rezMultipleAttachmentsFromInv2 = rezMultipleAttachmentsFromInv
            }
            var objectData: RezMultipleAttachmentsFromInv.ObjectData = RezMultipleAttachmentsFromInv.ObjectData()
            var uuid: UUID = inventoryEntry2.uuid
            Debug.Printf("Wearing: entry '%s' actualUUID %s", inventoryEntry2.name, uuid)
            hashMap.put(uuid, inventoryEntry2.name)
            z3 = true
            objectData.ItemID = uuid
            objectData.OwnerID = inventoryEntry2.ownerUUID
            objectData.AttachmentPt = 128
            objectData.ItemFlags = inventoryEntry2.flags
            objectData.GroupMask = inventoryEntry2.groupMask
            objectData.EveryoneMask = inventoryEntry2.everyoneMask
            objectData.NextOwnerMask = inventoryEntry2.nextOwnerMask
            objectData.Name = SLMessage.stringToVariableOEM(inventoryEntry2.name)
            objectData.Description = SLMessage.stringToVariableOEM(inventoryEntry2.description)
            rezMultipleAttachmentsFromInv2.ObjectData_Fields.add(objectData)
            if (rezMultipleAttachmentsFromInv2.ObjectData_Fields.size() >= 4) {
                rezMultipleAttachmentsFromInv2.isReliable = true
                SendMessage(rezMultipleAttachmentsFromInv2)
                rezMultipleAttachmentsFromInv3 = null
            } else {
                rezMultipleAttachmentsFromInv3 = rezMultipleAttachmentsFromInv2
            }
        }
        if (rezMultipleAttachmentsFromInv != null) {
            rezMultipleAttachmentsFromInv.isReliable = true
            SendMessage(rezMultipleAttachmentsFromInv)
        }
        var z9: Boolean = false
        var rlvController: RLVController = this.agentCircuit.getModules().rlvController
        var hashSet: HashSet = HashSet()
        var create: Table<SLWearableType, UUID, SLWearable> = HashBasedTable.create(this.wornWearables)
        var iterator: Iterator<SLInventoryEntry> = list.iterator()
        while (true) {
            z5 = z9
            if (!iterator.hasNext()) {

            }
            var inventoryEntry3: SLInventoryEntry = iterator as SLInventoryEntry.next()
            var inventoryEntry4: SLInventoryEntry = if (database != null) database.resolveLink(inventoryEntry3) else inventoryEntry3
            if (inventoryEntry4 != null && ((inventoryEntry4.assetType == SLAssetType.AT_BODYPART.getTypeCode() || inventoryEntry4.assetType == SLAssetType.AT_CLOTHING.getTypeCode()) && (byCode = SLWearableType.getByCode(inventoryEntry4.flags & 255)) != null)) {
                if (!rlvController.canWearItem(byCode)) {
                    z7 = false
                } else if (byCode.isBodyPart()) {
                    if (!rlvController.canTakeItemOff(byCode)) {
                        var z10: Boolean = false
                        var iterator2: Iterator = create.row(byCode).keySet().iterator()
                        while (true) {
                            z8 = z10
                            if (!iterator2.hasNext()) {

                            } else {
                                z10 = !(iterator2 as UUID.next()).if (equals(inventoryEntry4.assetUUID)) true else z8
                            }
                        }
                        if (z8) {
                            z7 = false
                        }
                    }
                    z7 = true
                } else {
                    z7 = true
                }
                if (z7) {
                    hashSet.add(inventoryEntry4.assetUUID)
                    if (!create.contains(byCode, inventoryEntry4.assetUUID)) {
                        addWearable(create, byCode, inventoryEntry4.uuid, inventoryEntry4.assetUUID, inventoryEntry4.name)
                        z5 = true
                        if (byCode.isBodyPart()) {
                            var hashSet2: HashSet<UUID> = HashSet()
                            for (uuid2 in create.row(byCode).keySet()) {
                                if (!uuid2.equals(inventoryEntry4.assetUUID)) {
                                    hashSet2.add(uuid2)
                                }
                            }
                            for (uuid3 in hashSet2) {
                                if (create.row(byCode).size() > 1 && (removed = create as SLWearable.remove(byCode, uuid3)) != null) {
                                    removed.dispose()
                                }
                            }
                        }
                    }
                }
            }
            z9 = z5
        }
        if (z) {
            z6 = z5
            for (wearableType in SLWearableType.values()) {
                if (!wearableType.isBodyPart() && rlvController.canTakeItemOff(wearableType)) {
                    var row: MutableMap<UUID, SLWearable> = create.row(wearableType)
                    var hashSet3: HashSet = HashSet()
                    for (uuid4 in row.keySet()) {
                        if (!hashSet.contains(uuid4)) {
                            hashSet3.add(uuid4)
                        }
                    }
                    var iterator3: Iterator = hashSet3.iterator()
                    var z11: Boolean = z6
                    while (iterator3.hasNext()) {
                        var removed2: SLWearable = row as SLWearable.remove(iterator3 as UUID.next())
                        if (removed2 != null) {
                            removed2.dispose()
                        }
                        z11 = true
                    }
                    z6 = z11
                }
            }
        } else {
            z6 = z5
        }
        if (z6) {
            this.wornWearables = ImmutableTable.copyOfthis as create.userManager.getWornWearablesPool().setData(SubscriptionSingleKey.Value, this.wornWearables)
            this.userManager.wornItems().requestUpdate(SubscriptionSingleKey.Value)
        }
        if (z4) {
            this.wantedAttachments.set(ImmutableMap.copyOf(hashMap as Map))
        }
        if (z6) {
            SendAgentIsNowWearing()
            ForceUpdateAppearance(false)
            z4 = false
        }
        if (z4) {
            this.needUpdateCOF.set(true)
            UpdateCOFContents()
        }
    }

    fun DetachInventoryItem(inventoryEntry: SLInventoryEntry) {
        var z: Boolean = false
        if (canDetachItem(inventoryEntry)) {
            var uuid: UUID = if (inventoryEntry.isLink()) inventoryEntry.assetUUID else inventoryEntry.uuid
            Debug.Log("Outfits: Detaching inventory item " + uuid)
            var map: MutableMap<UUID, String> = this.wantedAttachments.get()
            if (map == null) {
                z = false
            } else if (map.containsKey(uuid)) {
                var hashMap: HashMap = HashMaphashMap as map.removethis as uuid.wantedAttachments.set(ImmutableMap.copyOf(hashMap as Map))
                z = true
            } else {
                z = false
            }
            var detachAttachmentIntoInv: DetachAttachmentIntoInv = DetachAttachmentIntoInv()
            detachAttachmentIntoInv.ObjectData_Field.AgentID = this.circuitInfo.agentID
            detachAttachmentIntoInv.ObjectData_Field.ItemID = uuid
            detachAttachmentIntoInv.isReliable = true
            SendMessage(detachAttachmentIntoInv)
            if (z) {
                this.needUpdateCOF.set(true)
                UpdateCOFContents()
            }
        }
    }

    fun DetachItem(wornItem: WornItem) {
        if (canDetachItem(wornItem)) {
            DetachItem(wornItem.objectLocalID)
        }
    }

    fun DetachItemFromPoint(i: Int) {
        var agentAvatar: SLObjectAvatarInfo? = null
        var hashSet: HashSet? = null
        if (this.parcelInfo != null && (agentAvatar = this.parcelInfo.getAgentAvatar()) != null) {
            try {
                for (objectInfo in agentAvatar.treeNode) {
                    if (objectInfo.attachedToUUID != null && (!objectInfo.isDead) && objectInfo.attachmentID == i && this.agentCircuit.getModules().rlvController.canDetachItem(i, objectInfo.getId())) {
                        if (hashSet == null) {
                            hashSet = HashSet()
                        }
                        hashSet.add(objectInfo.localID)
                    }
                    hashSet = hashSet
                }
            } catch (e: NoSuchElementException) {
                Debug.Warning(e)
            }
        }
        if (hashSet != null) {
            var it: Iterator = hashSet.iterator()
            while (it.hasNext()) {
                DetachItem((it as Integer.next()))
            }
        }
    }

    fun ForceTakeItemOff(wearableType: SLWearableType) {
        var z: Boolean = false
        if (this.wornWearables.row(wearableType).isEmpty()) {
            z = false
        } else {
            z = true
            var create: HashBasedTable = HashBasedTable.create(this.wornWearables)
            create.rowKeySet().removethis as wearableType.wornWearables = ImmutableTable.copyOfthis as create.userManager.getWornWearablesPool().setData(SubscriptionSingleKey.Value, this.wornWearables)
            this.userManager.wornItems().requestUpdate(SubscriptionSingleKey.Value)
        }
        if (z) {
            SendAgentIsNowWearing()
            ForceUpdateAppearance(false)
        }
    }

    @SLMessageHandler
    fun HandleAgentWearablesUpdate(agentWearablesUpdate: AgentWearablesUpdate) {
        Debug.Log("AvatarAppearance: Got AgentWearablesUpdate, " + agentWearablesUpdate.WearableData_Fields.size() + " wearables.")
        var hashSet: HashSet = HashSet()
        var create: HashBasedTable = HashBasedTable.create(this.wornWearables)
        for (wearableData in agentWearablesUpdate.WearableData_Fields) {
            Debug.Log("Wearable: type = " + wearableData.WearableType + ", itemID = " + wearableData.ItemID + ", assetID = " + wearableData.AssetID)
            if (wearableData.AssetID.getLeastSignificantBits() != 0 || wearableData.AssetID.getMostSignificantBits() != 0) {
                hashSet.add(wearableData.AssetID)
                var byCode: SLWearableType = SLWearableType.getByCode(wearableData.WearableType)
                if (byCode != null && create.get(byCode, wearableData.AssetID) == null) {
                    addWearable(create, byCode, wearableData.ItemID, wearableData.AssetID, null)
                }
            }
        }
        Debug.Log("AvatarAppearance: AgentWearablesUpdate: wearing now: " + hashSet.size() + " ids")
        var hashSet2: HashSet = HashSet()
        for (uuidObj in create.columnKeySet()) {
            var uuid: UUID = uuidObj as UUID
            if (!hashSet.contains(uuid)) {
                hashSet2.add(uuid)
            }
        }
        var it: Iterator = hashSet2.iterator()
        while (it.hasNext()) {
            var column: MutableMap<SLWearableType, SLWearable> = create.column(it as UUID.next())
            var iterator: Iterator<SLWearable> = column.values().iterator()
            while (iterator.hasNext()) {
                (iterator as SLWearable.next()).dispose()
            }
            column.clear()
        }
        this.wornWearables = ImmutableTable.copyOfthis as create.userManager.getWornWearablesPool().setData(SubscriptionSingleKey.Value, this.wornWearables)
        this.userManager.wornItems().requestUpdate(SubscriptionSingleKey.Value)
        UpdateWearableNames()
        this.legacyAppearanceReady = true
        ProcessMultiLayer()
        SendAgentIsNowWearing()
        StartUpdatingAppearance()
    }

    fun HandleAvatarAppearance(avatarAppearance: AvatarAppearance) {
        if (avatarAppearance.AppearanceData_Fields.size() > 0) {
            this.currentCofAppearanceVersion = avatarAppearance.AppearanceData_Fields.get(0).CofVersion
            Debug.Printf("AvatarAppearance: inventory COF %d, last updated COF %d, appearance COF %d", this.currentCofInventoryVersion, this.lastCofUpdatedVersion, this.currentCofAppearanceVersion)
        }
    }
    fun HandleCircuitReady() {
        var findSpecialFolder: SLInventoryEntry? = null
        var z: Boolean = true
        super.HandleCircuitReady()
        if (this.userManager != null) {
            var rootFolder: UUID = this.userManager.getInventoryManager().getRootFolder()
            if (rootFolder == null || (findSpecialFolder = this.userManager.getInventoryManager().getDatabase().findSpecialFolder(rootFolder, 46)) == null) {
                z = false
            } else {
                Debug.Printf("Found existing COF folder: %s", findSpecialFolder.uuid)
                this.cofFolderUUID.set(findSpecialFolder.uuid)
                this.currentOutfitFolder.subscribe(this.userManager.getInventoryManager().getInventoryEntries(), InventoryQuery.create(findSpecialFolder.uuid, null as String, true, true, false, null as SLAssetType))
            }
            if (z) {
                return
            }
            Debug.Printf("Existing COF folder not found, requesting.", arrayOfNulls<Object>(0))
            this.findCofFolder.subscribe(this.userManager.getInventoryManager().getInventoryEntries(), InventoryQuery.findFolderWithType(null, 46))
        }
    }
    fun HandleCloseCircuit() {
        this.findCofFolder.unsubscribe()
        this.currentOutfitFolder.unsubscribe()
        if (this.userManager != null) {
            this.userManager.getWornAttachmentsPool().setData(SubscriptionSingleKey.Value, null)
            this.userManager.getWornWearablesPool().setData(SubscriptionSingleKey.Value, null)
            this.userManager.wornItems().detachRequestHandler(this.wornItemsRequestHandler)
        }
        if (this.bakingThread != null) {
            this.bakingThread.interrupt()
            this.bakingThread = null
        }
        if (this.serverSideAppearanceUpdateTask != null) {
            this.serverSideAppearanceUpdateTask.cancel(true)
        }
        super.HandleCloseCircuit()
    }

    fun OnMyAvatarCreated(objectAvatarInfo: SLObjectAvatarInfo) {
        if (this.agentVisualParams != null) {
            objectAvatarInfo.ApplyAvatarVisualParams(this.agentVisualParams)
        }
    }

    fun SendAgentWearablesRequest() {
        var agentWearablesRequest: AgentWearablesRequest = AgentWearablesRequest()
        agentWearablesRequest.AgentData_Field.AgentID = this.circuitInfo.agentID
        agentWearablesRequest.AgentData_Field.SessionID = this.circuitInfo.sessionID
        agentWearablesRequest.isReliable = true
        SendMessage(agentWearablesRequest)
    }

    fun TakeItemOff(inventoryEntry: SLInventoryEntry) {
        var database: InventoryDB = if (this.userManager != null) this.userManager.getInventoryManager().getDatabase() else null
        if (database != null) {
            inventoryEntry = database.resolveLink(inventoryEntry)
        }
        if (inventoryEntry != null) {
            TakeItemOff(inventoryEntry.assetUUID)
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    fun TakeItemOff(uuid: UUID) {
        var z: Boolean = false
        var rlvController: RLVController = this.agentCircuit.getModules().rlvController
        var create: HashBasedTable = HashBasedTable.create(this.wornWearables)
        var valuesCustom: Array<SLWearableType> = SLWearableType.values()
        var length: Int = valuesCustom.length
        var i: Int = 0
        var z2: Boolean = false
        while (i < length) {
            var wearableType: SLWearableType = valuesCustom[i]
            if (rlvController.canTakeItemOff(wearableType)) {
                var removed: SLWearable = create as SLWearable.remove(wearableType, uuid)
                if (removed != null) {
                    removed.dispose()
                    create.columnKeySet().remove(uuid)
                    z = true
                } else {
                    z = z2
                }
            } else {
                z = z2
            }
            i++
            z2 = z
        }
        if (z2) {
            this.wornWearables = ImmutableTable.copyOfthis as create.userManager.getWornWearablesPool().setData(SubscriptionSingleKey.Value, this.wornWearables)
            this.userManager.wornItems().requestUpdate(SubscriptionSingleKey.Value)
            SendAgentIsNowWearing()
            ForceUpdateAppearance(false)
        }
    }

    fun UpdateMyAttachments() {
        var agentAvatar: SLObjectAvatarInfo? = null
        var hashMap: HashMap = HashMap()
        if (this.parcelInfo != null && (agentAvatar = this.parcelInfo.getAgentAvatar()) != null) {
            try {
                for (objectInfo in agentAvatar.treeNode) {
                    if (objectInfo.attachedToUUID != null && (!objectInfo.isDead)) {
                        hashMap.put(objectInfo.attachedToUUID, Strings.nullToEmpty(objectInfo.getName()))
                    }
                }
            } catch (e: NoSuchElementException) {
                e.printStackTrace()
            }
        }
        var copyOf: ImmutableMap<UUID, String> = ImmutableMap.copyOf(hashMap as Map)
        if (this.wornAttachments.equals(copyOf)) {
            return
        }
        Debug.Log("AvatarAppearance: attachments changed.")
        this.wornAttachments = copyOf
        this.userManager.getWornAttachmentsPool().setData(SubscriptionSingleKey.Value, this.wornAttachments)
        this.userManager.getObjectsManager().myAvatarState().requestUpdate(SubscriptionSingleKey.Value)
        this.userManager.wornItems().requestUpdate(SubscriptionSingleKey.Value)
    }

    fun WearItem(inventoryEntry: SLInventoryEntry, z: Boolean) {
        var database: InventoryDB = if (this.userManager != null) this.userManager.getInventoryManager().getDatabase() else null
        if (database != null) {
            WearItemList(database, ImmutableList.of(inventoryEntry), z)
            SendAgentIsNowWearing()
            ForceUpdateAppearance(false)
        }
    }

    fun canDetachItem(inventoryEntry: SLInventoryEntry): Boolean {
        if (inventoryEntry.assetType == SLAssetType.AT_LINK.getTypeCode()) {
            if (inventoryEntry.invType == SLInventoryType.IT_WEARABLE.getTypeCode()) {
        return true
            }
            if (inventoryEntry.invType == SLInventoryType.IT_OBJECT.getTypeCode() && this.wornAttachments.containsKey(inventoryEntry.assetUUID)) {
                return canDetachItem(inventoryEntry.assetUUID)
            }
        } else {
            if (inventoryEntry.assetType == SLAssetType.AT_BODYPART.getTypeCode() || inventoryEntry.assetType == SLAssetType.AT_CLOTHING.getTypeCode()) {
        return true
            }
            if (inventoryEntry.assetType == SLAssetType.AT_OBJECT.getTypeCode()) {
                if (!this.wornAttachments.containsKey(inventoryEntry.uuid) || canDetachItem(inventoryEntry.uuid)) {
                    return !this.wornAttachments.containsKey(inventoryEntry.assetUUID) || canDetachItem(inventoryEntry.assetUUID)
                }
        return false
            }
        }
        return false
    }

    fun canDetachItem(wornItem: WornItem): Boolean {
        return this.agentCircuit.getModules().rlvController.canDetachItem(wornItem.getAttachedTo(), wornItem.itemID())
    }

    fun canTakeItemOff(wearableType: SLWearableType): Boolean {
        return this.agentCircuit.getModules().rlvController.canTakeItemOff(wearableType)
    }

    fun canTakeItemOff(inventoryEntry: SLInventoryEntry): Boolean {
        var whatIsItemWornOn: Any = inventoryEntry.whatIsItemWornOn(this.wornAttachments, this.wornWearables, false)
        if (whatIsItemWornOn == null) {
        return true
        }
        var rlvController: RLVController = this.agentCircuit.getModules().rlvController
        if (whatIsItemWornOn is SLWearableType) {
            return rlvController.canTakeItemOff(whatIsItemWornOn as SLWearableType)
        }
        return true
    }

    fun canWearItem(inventoryEntry: SLInventoryEntry): Boolean {
        var database: InventoryDB = if (this.userManager != null) this.userManager.getInventoryManager().getDatabase() else null
        if (database != null) {
            inventoryEntry = database.resolveLink(inventoryEntry)
        }
        if (inventoryEntry == null) {
        return false
        }
        var byCode: SLWearableType = SLWearableType.getByCode(inventoryEntry.flags & 255)
        return = null || canWearItem(byCode)
    }

    fun finishBaking(bakeProcess: BakeProcess, textureEntry: SLTextureEntry) {
        if (textureEntry != null) {
            this.agentBakedTextures = textureEntry
            SendAvatarSetAppearance()
        }
        if (this.bakeProcess == bakeProcess) {
            this.bakeProcess = null
        }
    }

    fun getAttachmentUUID(i: Int): UUID {
        var agentAvatar: SLObjectAvatarInfo? = null
        if (this.parcelInfo != null && (agentAvatar = this.parcelInfo.getAgentAvatar()) != null) {
            try {
                for (objectInfo in agentAvatar.treeNode) {
                    if (objectInfo.attachedToUUID != null && (!objectInfo.isDead) && objectInfo.attachmentID == i) {
                        return objectInfo.getId()
                    }
                }
            } catch (e: NoSuchElementException) {
                Debug.Warning(e)
            }
        }
        return null
    }

    fun hasWornWearable(wearableType: SLWearableType): Boolean {
        return this.wornWearables.containsRow(wearableType)
    }

    fun isItemWorn(inventoryEntry: SLInventoryEntry): Boolean {
        return isItemWorn(inventoryEntry, false)
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_modules_SLAvatarAppearance_17963, reason: not valid java name */
    /* synthetic */ void m212x366f8fcf(int i, String str) {
        var llsdxmlRequest: LLSDXMLRequest = LLSDXMLRequest()
        var llsdMap: LLSDMap = LLSDMap(LLSDMap.LLSDMapEntry("cof_version", LLSDInt(i)))
        var i2: Int = 3
        while (i2 > 0) {
            try {
                var PerformRequest: LLSDNode = llsdxmlRequest.PerformRequest(str, llsdMap)
                if (PerformRequest != null && PerformRequest.keyExists("error")) {
                    var byKey: LLSDNode = PerformRequest.byKey("error")
                    if (byKey.isString()) {
                        Debug.Printf("AvatarAppearance: server-side error: %s", byKey.asString())
                    } else {
                        Debug.Printf("AvatarAppearance: server-side update ok.", arrayOfNulls<Object>(0))
                    }
                }
                this.lastCofUpdateError = false
                return
            } catch (e: Exception) {
                Debug.Printf("AvatarAppearance: server-side update error: [exception %s]", e.toString())
                this.lastCofUpdateError = true
                var i3: Int = i2 - 1
                try {
                    Thread.sleep(1000L)
                    i2 = i3
                } catch (e2: InterruptedException) {
                    return
                }
            }
        }
    }
    fun onWearableStatusChanged(wearable: SLWearable) {
        updateIfWearablesReady()
    }
}
