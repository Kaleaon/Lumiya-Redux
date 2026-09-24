package com.lumiyaviewer.lumiya.slproto.modules;

import com.google.common.base.Objects;
import com.google.common.base.Strings;
import com.google.common.collect.HashBasedTable;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableTable;
import com.google.common.collect.Table;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.orm.InventoryDB;
import com.lumiyaviewer.lumiya.orm.InventoryEntryList;
import com.lumiyaviewer.lumiya.orm.InventoryQuery;
import com.lumiyaviewer.lumiya.react.AsyncRequestHandler;
import com.lumiyaviewer.lumiya.react.RequestHandler;
import com.lumiyaviewer.lumiya.react.ResultHandler;
import com.lumiyaviewer.lumiya.react.SimpleRequestHandler;
import com.lumiyaviewer.lumiya.react.SubscriptionData;
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey;
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit;
import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.SLParcelInfo;
import com.lumiyaviewer.lumiya.slproto.assets.SLWearable;
import com.lumiyaviewer.lumiya.slproto.assets.SLWearableData;
import com.lumiyaviewer.lumiya.slproto.assets.SLWearableType;
import com.lumiyaviewer.lumiya.slproto.avatar.SLAvatarParams;
import com.lumiyaviewer.lumiya.slproto.baker.BakeProcess;
import com.lumiyaviewer.lumiya.slproto.caps.SLCaps;
import com.lumiyaviewer.lumiya.slproto.events.SLBakingProgressEvent;
import com.lumiyaviewer.lumiya.slproto.handler.SLMessageHandler;
import com.lumiyaviewer.lumiya.slproto.https.GenericHTTPExecutor;
import com.lumiyaviewer.lumiya.slproto.https.LLSDXMLRequest;
import com.lumiyaviewer.lumiya.slproto.inventory.SLAssetType;
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventory;
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry;
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryType;
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode;
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDInt;
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDMap;
import com.lumiyaviewer.lumiya.slproto.messages.AgentIsNowWearing;
import com.lumiyaviewer.lumiya.slproto.messages.AgentSetAppearance;
import com.lumiyaviewer.lumiya.slproto.messages.AgentWearablesRequest;
import com.lumiyaviewer.lumiya.slproto.messages.AgentWearablesUpdate;
import com.lumiyaviewer.lumiya.slproto.messages.AvatarAppearance;
import com.lumiyaviewer.lumiya.slproto.messages.DetachAttachmentIntoInv;
import com.lumiyaviewer.lumiya.slproto.messages.ObjectDetach;
import com.lumiyaviewer.lumiya.slproto.messages.RezMultipleAttachmentsFromInv;
import com.lumiyaviewer.lumiya.slproto.messages.RezSingleAttachmentFromInv;
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController;
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectAvatarInfo;
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectInfo;
import com.lumiyaviewer.lumiya.slproto.textures.SLTextureEntry;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.UUID;
import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
import javax.annotation.Nonnull;

public class SLAvatarAppearance extends SLModule implements SLWearable.OnWearableStatusChangeListener {
    private static final int Param_agentSizeVPHeadSize = 682;
    private static final int Param_agentSizeVPHeelHeight = 198;
    private static final int Param_agentSizeVPHeight = 33;
    private static final int Param_agentSizeVPHipLength = 842;
    private static final int Param_agentSizeVPLegLength = 692;
    private static final int Param_agentSizeVPNeckLength = 756;
    private static final int Param_agentSizeVPPlatformHeight = 503;
    private SLTextureEntry agentBakedTextures;
    private boolean agentSizeKnown;
    private float agentSizeVPHeadSize;
    private float agentSizeVPHeelHeight;
    private float agentSizeVPHeight;
    private float agentSizeVPHipLength;
    private float agentSizeVPLegLength;
    private float agentSizeVPNeckLength;
    private float agentSizeVPPlatformHeight;
    private int[] agentVisualParams;
    private volatile BakeProcess bakeProcess;
    private Thread bakingThread;
    private final SLCaps caps;
    private final AtomicReference<UUID> cofFolderUUID;
    private volatile boolean cofReady;
    private volatile int currentCofAppearanceVersion;
    private volatile int currentCofInventoryVersion;
    private final SubscriptionData<InventoryQuery, InventoryEntryList> currentOutfitFolder;
    private final SubscriptionData<InventoryQuery, InventoryEntryList> findCofFolder;
    private final SLInventory inventory;
    private volatile boolean lastCofUpdateError;
    private volatile int lastCofUpdatedVersion;
    private volatile boolean legacyAppearanceReady;
    private volatile boolean multiLayerDone;
    private volatile boolean needUpdateAppearance;
    private final AtomicBoolean needUpdateCOF;
    private final SLParcelInfo parcelInfo;
    private Future<?> serverSideAppearanceUpdateTask;
    private int setAppearanceSerialNum;
    private final UserManager userManager;
    private final AtomicReference<Map<UUID, String>> wantedAttachments;
    private SLInventoryEntry wantedOutfitFolder;

    @Nonnull
    private volatile ImmutableMap<UUID, String> wornAttachments;
    private final RequestHandler<SubscriptionSingleKey> wornItemsRequestHandler;
    private final ResultHandler<SubscriptionSingleKey, ImmutableList<WornItem>> wornItemsResultHandler;

    @Nonnull
    private volatile Table<SLWearableType, UUID, SLWearable> wornWearables;

    public static class WornItem {
        private final int attachedTo;
        private final boolean isTouchable;
        private final UUID itemID;
        private final String name;
        private final int objectLocalID;
        private final SLWearableType wornOn;

        WornItem(SLWearableType wearableType, int attachedTo, UUID uuid, String name, int objectLocalID, boolean isTouchable) {
            this.wornOn = wearableType;
            this.attachedTo = attachedTo;
            this.itemID = uuid;
            this.name = name;
            this.objectLocalID = objectLocalID;
            this.isTouchable = isTouchable;
        }

        int getAttachedTo() {
            return this.attachedTo;
        }

        public boolean getIsTouchable() {
            return this.isTouchable;
        }

        public String getName() {
            return this.name;
        }

        public int getObjectLocalID() {
            return this.objectLocalID;
        }

        public SLWearableType getWornOn() {
            return this.wornOn;
        }

        public UUID itemID() {
            return this.itemID;
        }
    }

    public SLAvatarAppearance(SLAgentCircuit agentCircuit, SLInventory inventory, SLCaps caps) {
        super(agentCircuit);
        this.setAppearanceSerialNum = 1;
        this.agentSizeKnown = false;
        this.needUpdateAppearance = false;
        this.needUpdateCOF = new AtomicBoolean(false);
        this.wantedAttachments = new AtomicReference<>(ImmutableMap.of());
        this.wornAttachments = ImmutableMap.of();
        this.wornWearables = ImmutableTable.of();
        this.wantedOutfitFolder = null;
        this.bakingThread = null;
        this.serverSideAppearanceUpdateTask = null;
        this.currentCofInventoryVersion = 0;
        this.currentCofAppearanceVersion = 0;
        this.lastCofUpdatedVersion = 0;
        this.lastCofUpdateError = false;
        this.legacyAppearanceReady = false;
        this.cofReady = false;
        this.multiLayerDone = false;
        this.cofFolderUUID = new AtomicReference<>();
        this.wornItemsRequestHandler = new AsyncRequestHandler(this.agentCircuit, new SimpleRequestHandler<SubscriptionSingleKey>() {
            @Override
            public void onRequest(@Nonnull SubscriptionSingleKey subscriptionSingleKey) {
                if (SLAvatarAppearance.this.wornItemsResultHandler != null) {
                    SLAvatarAppearance.this.wornItemsResultHandler.onResultData(subscriptionSingleKey, SLAvatarAppearance.this.getWornItems());
                }
            }
        });
        this.bakeProcess = null;
        this.caps = caps;
        this.inventory = inventory;
        this.parcelInfo = agentCircuit.getGridConnection().parcelInfo;
        this.userManager = UserManager.getUserManager(agentCircuit.getAgentUUID());
        this.currentOutfitFolder = new SubscriptionData<>(agentCircuit, obj -> onCurrentOutfitFolder((InventoryEntryList) obj));
        this.findCofFolder = new SubscriptionData<>(agentCircuit, obj -> onCofFolderEntry((InventoryEntryList) obj));
        if (this.userManager != null) {
            this.wornItemsResultHandler = this.userManager.wornItems().attachRequestHandler(this.wornItemsRequestHandler);
        } else {
            this.wornItemsResultHandler = null;
        }
    }

    private void DetachItem(int i) {
        SLObjectAvatarInfo agentAvatar;
        boolean z;
        Debug.Log("Outfits: detaching item " + i);
        boolean z2 = false;
        Map<UUID, String> map = this.wantedAttachments.get();
        if (map != null) {
            HashMap hashMap = new HashMap(map);
            if (this.parcelInfo != null && (agentAvatar = this.parcelInfo.getAgentAvatar()) != null) {
                try {
                    Iterator<SLObjectInfo> it = agentAvatar.treeNode.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            z = false;
                            break;
                        }
                        SLObjectInfo next = it.next();
                        if (next.attachedToUUID != null && (!next.isDead) && next.localID == i) {
                            if (hashMap.remove(next.getId()) != null) {
                                z = true;
                                break;
                            } else if (hashMap.remove(next.attachedToUUID) != null) {
                                z = true;
                                break;
                            }
                        }
                    }
                    z2 = z;
                } catch (NoSuchElementException e) {
                    Debug.Warning(e);
                }
            }
            if (z2) {
                this.wantedAttachments.set(ImmutableMap.copyOf((Map) hashMap));
            }
        }
        ObjectDetach objectDetach = new ObjectDetach();
        objectDetach.AgentData_Field.AgentID = this.circuitInfo.agentID;
        objectDetach.AgentData_Field.SessionID = this.circuitInfo.sessionID;
        ObjectDetach.ObjectData objectData = new ObjectDetach.ObjectData();
        objectData.ObjectLocalID = i;
        objectDetach.ObjectData_Fields.add(objectData);
        objectDetach.isReliable = true;
        SendMessage(objectDetach);
        if (z2) {
            this.needUpdateCOF.set(true);
            UpdateCOFContents();
        }
    }

    private void ForceUpdateAppearance(boolean z) {
        this.needUpdateAppearance = true;
        if (this.caps.getCapability(SLCaps.SLCapability.UpdateAvatarAppearance) == null) {
            this.eventBus.publish(new SLBakingProgressEvent(true, false, 0));
        } else if (z) {
            this.lastCofUpdatedVersion = 0;
            this.currentCofAppearanceVersion = 0;
            RequestServerRebake();
        }
        StartUpdatingAppearance();
    }

    private void ProcessMultiLayer() {
        if (!this.multiLayerDone && this.cofReady && this.legacyAppearanceReady) {
            UpdateMultiLayer();
        }
    }

    private void RequestServerRebake() {
        SLInventoryEntry folder;
        String capability = this.caps.getCapability(SLCaps.SLCapability.UpdateAvatarAppearance);
        InventoryEntryList data = this.currentOutfitFolder.getData();
        if (capability == null || data == null || (folder = data.getFolder()) == null) {
            return;
        }
        this.currentCofInventoryVersion = folder.version;
        if ((this.currentCofInventoryVersion == this.lastCofUpdatedVersion || this.currentCofInventoryVersion == this.currentCofAppearanceVersion) && !this.lastCofUpdateError) {
            return;
        }
        this.lastCofUpdatedVersion = this.currentCofInventoryVersion;
        this.lastCofUpdateError = false;
        UpdateServerSideAppearance(capability, folder.version);
    }

    private void SendAgentIsNowWearing() {
        boolean z;
        AgentIsNowWearing agentIsNowWearing = new AgentIsNowWearing();
        agentIsNowWearing.AgentData_Field.AgentID = this.circuitInfo.agentID;
        agentIsNowWearing.AgentData_Field.SessionID = this.circuitInfo.sessionID;
        for (SLWearableType wearableType : SLWearableType.values()) {
            Map<UUID, SLWearable> row = this.wornWearables.row(wearableType);
            if (row != null) {
                z = true;
                for (SLWearable wearable : row.values()) {
                    AgentIsNowWearing.WearableData wearableData = new AgentIsNowWearing.WearableData();
                    wearableData.ItemID = wearable.itemID;
                    wearableData.WearableType = wearableType.getTypeCode();
                    agentIsNowWearing.WearableData_Fields.add(wearableData);
                    z = false;
                }
            } else {
                z = true;
            }
            if (z) {
                AgentIsNowWearing.WearableData wearableData2 = new AgentIsNowWearing.WearableData();
                wearableData2.ItemID = new UUID(0L, 0L);
                wearableData2.WearableType = wearableType.getTypeCode();
                agentIsNowWearing.WearableData_Fields.add(wearableData2);
            }
        }
        Debug.Log("AvatarAppearance: Sending AgentIsNowWearing, " + agentIsNowWearing.WearableData_Fields.size() + " wearables.");
        agentIsNowWearing.isReliable = true;
        SendMessage(agentIsNowWearing);
        this.needUpdateCOF.set(true);
        UpdateCOFContents();
    }

    private void SendAvatarSetAppearance() {
        UpdateCOFContents();
        if (this.caps.getCapability(SLCaps.SLCapability.UpdateAvatarAppearance) == null) {
            SLObjectAvatarInfo agentAvatar = this.parcelInfo != null ? this.parcelInfo.getAgentAvatar() : null;
            if (this.agentBakedTextures != null && agentAvatar != null) {
                agentAvatar.ApplyAvatarTextures(this.agentBakedTextures, true);
            }
            AgentSetAppearance agentSetAppearance = new AgentSetAppearance();
            agentSetAppearance.AgentData_Field.AgentID = this.circuitInfo.agentID;
            agentSetAppearance.AgentData_Field.SessionID = this.circuitInfo.sessionID;
            agentSetAppearance.AgentData_Field.SerialNum = this.setAppearanceSerialNum;
            agentSetAppearance.AgentData_Field.Size = new LLVector3();
            agentSetAppearance.AgentData_Field.Size.x = 1.0f;
            agentSetAppearance.AgentData_Field.Size.y = 1.0f;
            agentSetAppearance.AgentData_Field.Size.z = 1.0f;
            if (this.agentBakedTextures != null) {
                agentSetAppearance.ObjectData_Field.TextureEntry = this.agentBakedTextures.packByteArray();
            } else {
                agentSetAppearance.ObjectData_Field.TextureEntry = new byte[0];
            }
            this.agentVisualParams = getAppearanceParams();
            if (agentAvatar != null) {
                agentAvatar.ApplyAvatarVisualParams(this.agentVisualParams);
            }
            for (int agentVisualParam : this.agentVisualParams) {
                AgentSetAppearance.VisualParam visualParam = new AgentSetAppearance.VisualParam();
                visualParam.ParamValue = agentVisualParam;
                agentSetAppearance.VisualParam_Fields.add(visualParam);
            }
            if (this.agentSizeKnown && areWearablesReady()) {
                agentSetAppearance.AgentData_Field.Size.x = 0.45f;
                agentSetAppearance.AgentData_Field.Size.y = 0.6f;
                agentSetAppearance.AgentData_Field.Size.z = getAgentHeight();
                Debug.Log("set agent height to " + agentSetAppearance.AgentData_Field.Size.z);
            }
            agentSetAppearance.isReliable = true;
            Debug.Log("AvatarAppearance: Sending agentSetAppearance: " + agentSetAppearance.VisualParam_Fields.size() + " params, hasTextures = " + (this.agentBakedTextures != null ? "yes" : "no"));
            SendMessage(agentSetAppearance);
            this.setAppearanceSerialNum++;
        }
    }

    private void StartUpdatingAppearance() {
        updateIfWearablesReady();
    }

    private void UpdateCOFContents() {
        InventoryEntryList data;
        SLInventoryEntry folder;
        boolean z;
        boolean z2;
        boolean areWearablesReady = areWearablesReady();
        Debug.Printf("Wearables ready %b, cofReady %b", Boolean.valueOf(areWearablesReady), Boolean.valueOf(this.cofReady));
        if ((areWearablesReady ? this.cofReady : false) && (data = this.currentOutfitFolder.getData()) != null && (folder = data.getFolder()) != null && this.needUpdateCOF.getAndSet(false)) {
            this.currentCofInventoryVersion = folder.version;
            LinkedList linkedList = new LinkedList();
            HashMap<UUID, SLWearable> hashMap = new HashMap<>();
            HashMap<UUID, String> hashMap2 = new HashMap<>();
            HashSet hashSet = new HashSet();
            for (SLWearable wearable : this.wornWearables.values()) {
                if (!wearable.getIsFailed()) {
                    hashSet.add(wearable.itemID);
                    hashMap.put(wearable.itemID, wearable);
                }
            }
            Map<UUID, String> map = this.wantedAttachments.get();
            if (map != null) {
                hashMap2.putAll(map);
            }
            boolean z3 = true;
            for (SLInventoryEntry inventoryEntry : data) {
                if (inventoryEntry.assetType == SLAssetType.AT_LINK.getTypeCode()) {
                    if (inventoryEntry.invType == SLInventoryType.IT_WEARABLE.getTypeCode()) {
                        if (!hashSet.contains(inventoryEntry.assetUUID)) {
                            linkedList.add(inventoryEntry.uuid);
                        }
                    } else if (inventoryEntry.invType == SLInventoryType.IT_OBJECT.getTypeCode() && map != null && !map.containsKey(inventoryEntry.assetUUID)) {
                        Debug.Printf("Attached entry %s (%s) not found in wanted attachments", inventoryEntry.assetUUID, inventoryEntry.name);
                        linkedList.add(inventoryEntry.uuid);
                    }
                    hashMap.remove(inventoryEntry.assetUUID);
                    hashMap2.remove(inventoryEntry.assetUUID);
                    z2 = z3;
                } else if (inventoryEntry.assetType != SLAssetType.AT_LINK_FOLDER.getTypeCode() || this.wantedOutfitFolder == null) {
                    z2 = z3;
                } else if (this.wantedOutfitFolder.uuid.equals(inventoryEntry.assetUUID)) {
                    z2 = false;
                } else {
                    linkedList.add(inventoryEntry.uuid);
                    z2 = z3;
                }
                z3 = z2;
            }
            Debug.Printf("Update COF: addWearablesList %d, killList %d", Integer.valueOf(hashMap.size()), Integer.valueOf(linkedList.size()));
            if (linkedList.isEmpty()) {
                z = false;
            } else {
                this.inventory.DeleteMultiInventoryItemRaw(folder, linkedList);
                z = true;
            }
            for (SLWearable wearable2 : hashMap.values()) {
                Debug.Printf("Update COF: adding %s, name = '%s'", wearable2.itemID, wearable2.getName());
                this.inventory.LinkInventoryItem(folder, wearable2.itemID, SLInventoryType.IT_WEARABLE.getTypeCode(), SLAssetType.AT_LINK.getTypeCode(), wearable2.getName(), "");
                z = true;
            }
            for (Object entryObj : hashMap2.entrySet()) {
                Map.Entry entry = (Map.Entry) entryObj;
                Debug.Printf("Update COF: adding attachment %s, name = '%s'", entry.getKey(), entry.getValue());
                this.inventory.LinkInventoryItem(folder, (UUID) entry.getKey(), SLInventoryType.IT_OBJECT.getTypeCode(), SLAssetType.AT_LINK.getTypeCode(), (String) entry.getValue(), "");
                z = true;
            }
            if (z3 && this.wantedOutfitFolder != null) {
                Debug.Printf("Update COF: adding outfit link for outfit folder %s", this.wantedOutfitFolder.uuid);
                this.inventory.LinkInventoryItem(folder, this.wantedOutfitFolder.uuid, SLInventoryType.IT_CATEGORY.getTypeCode(), SLAssetType.AT_LINK_FOLDER.getTypeCode(), this.wantedOutfitFolder.name, "");
                z = true;
            }
            Debug.Printf("Update COF: COF updated (had changes: %b).", Boolean.valueOf(z));
            if (z && this.userManager != null) {
                this.userManager.getInventoryManager().requestFolderUpdate(folder.uuid);
            }
            RequestServerRebake();
        }
    }

    private void UpdateCurrentOutfitLink(@Nonnull InventoryEntryList inventoryEntryList) {
        for (SLInventoryEntry inventoryEntry : inventoryEntryList) {
            if (inventoryEntry.assetType == SLAssetType.AT_LINK_FOLDER.getTypeCode()) {
                this.userManager.wornOutfitLink().setData(SubscriptionSingleKey.Value, inventoryEntry.assetUUID);
                return;
            }
        }
    }

    private synchronized void UpdateMultiLayer() {
        RezMultipleAttachmentsFromInv rezMultipleAttachmentsFromInv;
        Debug.Printf("AvatarAppearance: MultiLayer: Updating multi layer appearance.", new Object[0]);
        InventoryEntryList data = this.currentOutfitFolder.getData();
        InventoryDB database = this.userManager != null ? this.userManager.getInventoryManager().getDatabase() : null;
        if (data != null && database != null) {
            List<SLInventoryEntry> linkedList = new LinkedList<>();
            LinkedList<SLInventoryEntry> linkedList2 = new LinkedList();
            for (SLInventoryEntry inventoryEntry : data) {
                if (inventoryEntry.invType == SLInventoryType.IT_WEARABLE.getTypeCode()) {
                    linkedList.add(inventoryEntry);
                } else if (inventoryEntry.assetType == SLAssetType.AT_OBJECT.getTypeCode() || (inventoryEntry.isLink() && inventoryEntry.invType == SLInventoryType.IT_OBJECT.getTypeCode())) {
                    linkedList2.add(inventoryEntry);
                }
            }
            if (WearItemList(database, linkedList, false)) {
                Debug.Printf("AvatarAppearance: MultiLayer: had some extra layers.", new Object[0]);
                SendAgentIsNowWearing();
                StartUpdatingAppearance();
            } else {
                Debug.Printf("AvatarAppearance: MultiLayer: no extra layers.", new Object[0]);
            }
            if (linkedList2.size() != 0) {
                Debug.Printf("AvatarAppearance: Re-attaching %d attachments from COF.", Integer.valueOf(linkedList2.size()));
                HashMap hashMap = new HashMap();
                UUID randomUUID = UUID.randomUUID();
                RezMultipleAttachmentsFromInv rezMultipleAttachmentsFromInv2 = null;
                for (SLInventoryEntry inventoryEntry2 : linkedList2) {
                    SLInventoryEntry resolveLink = database.resolveLink(inventoryEntry2);
                    if (resolveLink != null) {
                        if (rezMultipleAttachmentsFromInv2 == null) {
                            rezMultipleAttachmentsFromInv2 = new RezMultipleAttachmentsFromInv();
                            rezMultipleAttachmentsFromInv2.AgentData_Field.AgentID = this.circuitInfo.agentID;
                            rezMultipleAttachmentsFromInv2.AgentData_Field.SessionID = this.circuitInfo.sessionID;
                            rezMultipleAttachmentsFromInv2.HeaderData_Field.CompoundMsgID = randomUUID;
                            rezMultipleAttachmentsFromInv2.HeaderData_Field.TotalObjects = linkedList2.size();
                            rezMultipleAttachmentsFromInv2.HeaderData_Field.FirstDetachAll = false;
                        }
                        RezMultipleAttachmentsFromInv.ObjectData objectData = new RezMultipleAttachmentsFromInv.ObjectData();
                        Debug.Printf("Re-attaching attachment: entry %s (%s)", resolveLink.uuid, inventoryEntry2.name);
                        hashMap.put(resolveLink.uuid, inventoryEntry2.name);
                        objectData.ItemID = resolveLink.uuid;
                        objectData.OwnerID = resolveLink.ownerUUID;
                        objectData.AttachmentPt = 128;
                        objectData.ItemFlags = resolveLink.flags;
                        objectData.GroupMask = resolveLink.groupMask;
                        objectData.EveryoneMask = resolveLink.everyoneMask;
                        objectData.NextOwnerMask = resolveLink.nextOwnerMask;
                        objectData.Name = SLMessage.stringToVariableOEM(inventoryEntry2.name);
                        objectData.Description = SLMessage.stringToVariableOEM(inventoryEntry2.description);
                        rezMultipleAttachmentsFromInv2.ObjectData_Fields.add(objectData);
                        if (rezMultipleAttachmentsFromInv2.ObjectData_Fields.size() >= 4) {
                            rezMultipleAttachmentsFromInv2.isReliable = true;
                            SendMessage(rezMultipleAttachmentsFromInv2);
                            rezMultipleAttachmentsFromInv = null;
                            rezMultipleAttachmentsFromInv2 = rezMultipleAttachmentsFromInv;
                        }
                    }
                    rezMultipleAttachmentsFromInv = rezMultipleAttachmentsFromInv2;
                    rezMultipleAttachmentsFromInv2 = rezMultipleAttachmentsFromInv;
                }
                this.wantedAttachments.set(ImmutableMap.copyOf((Map) hashMap));
                if (rezMultipleAttachmentsFromInv2 != null) {
                    rezMultipleAttachmentsFromInv2.isReliable = true;
                    SendMessage(rezMultipleAttachmentsFromInv2);
                }
            } else {
                Debug.Printf("AvatarAppearance: No attachments in COF.", new Object[0]);
            }
        }
        this.multiLayerDone = true;
    }

    private synchronized void UpdateServerSideAppearance(final String str, final int i) {
        Debug.Printf("AvatarAppearance: capURL '%s', cofVersion %d", str, Integer.valueOf(i));
        if (this.serverSideAppearanceUpdateTask != null) {
            this.serverSideAppearanceUpdateTask.cancel(true);
        }
        this.serverSideAppearanceUpdateTask = GenericHTTPExecutor.getInstance().submit(new Runnable() {
            private final /* synthetic */ void $m$0() {
                m212x366f8fcf(i, (String) str);
            }

            @Override
            public final void run() {
                $m$0();
            }
        });
    }

    private void UpdateWearableNames() {
        SLInventoryEntry resolveLink;
        SLWearableType byCode;
        SLWearable wearable;
        InventoryEntryList data = this.currentOutfitFolder.getData();
        InventoryDB database = this.userManager != null ? this.userManager.getInventoryManager().getDatabase() : null;
        if (data == null || database == null) {
            return;
        }
        for (SLInventoryEntry inventoryEntry : data) {
            if (!inventoryEntry.isFolderOrFolderLink() && (resolveLink = database.resolveLink(inventoryEntry)) != null && resolveLink.invType == SLInventoryType.IT_WEARABLE.getTypeCode() && (byCode = SLWearableType.getByCode(resolveLink.flags & 255)) != null && (wearable = this.wornWearables.get(byCode, resolveLink.assetUUID)) != null) {
                wearable.setInventoryName(resolveLink.name);
            }
        }
    }

    private boolean WearItemList(InventoryDB inventoryDB, List<SLInventoryEntry> list, boolean z) {
        boolean z2;
        SLWearableType byCode;
        boolean z3;
        boolean z4;
        boolean z5 = false;
        RLVController rlvController = this.agentCircuit.getModules().rlvController;
        HashBasedTable create = HashBasedTable.create(this.wornWearables);
        Iterator<SLInventoryEntry> it = list.iterator();
        while (true) {
            z2 = z5;
            if (!it.hasNext()) {
                break;
            }
            SLInventoryEntry resolveLink = inventoryDB.resolveLink((SLInventoryEntry) it.next());
            if (resolveLink != null && (byCode = SLWearableType.getByCode(resolveLink.flags & 255)) != null) {
                boolean isBodyPart = !z ? byCode.isBodyPart() : true;
                if (!rlvController.canWearItem(byCode)) {
                    z3 = false;
                } else if (isBodyPart) {
                    if (!rlvController.canTakeItemOff(byCode)) {
                        boolean z6 = false;
                        Iterator<UUID> iterator = create.row(byCode).keySet().iterator();
                        while (true) {
                            z4 = z6;
                            if (!iterator.hasNext()) {
                                break;
                            }
                            z6 = !((UUID) iterator.next()).equals(resolveLink.assetUUID) ? true : z4;
                        }
                        if (z4) {
                            z3 = false;
                        }
                    }
                    z3 = true;
                } else {
                    z3 = true;
                }
                if (z3 && !create.contains(byCode, resolveLink.assetUUID)) {
                    if (isBodyPart) {
                        HashSet hashSet = new HashSet(create.row(byCode).keySet());
                        hashSet.remove(resolveLink.assetUUID);
                        Iterator iterator2 = hashSet.iterator();
                        while (iterator2.hasNext()) {
                            SLWearable remove = (SLWearable) create.remove(byCode, (UUID) iterator2.next());
                            if (remove != null) {
                                remove.dispose();
                            }
                        }
                    }
                    addWearable(create, byCode, resolveLink.uuid, resolveLink.assetUUID, resolveLink.name);
                    z2 = true;
                }
            }
            z5 = z2;
        }
        if (z2) {
            this.wornWearables = ImmutableTable.copyOf(create);
            this.userManager.getWornWearablesPool().setData(SubscriptionSingleKey.Value, this.wornWearables);
            this.userManager.wornItems().requestUpdate(SubscriptionSingleKey.Value);
        }
        return z2;
    }

    private SLWearable addWearable(Table<SLWearableType, UUID, SLWearable> table, SLWearableType wearableType, UUID uuid, UUID uuid2, String str) {
        SLWearable wearable = new SLWearable(this.userManager, this.agentCircuit, uuid, uuid2, wearableType, this);
        if (str != null) {
            wearable.setInventoryName(str);
        }
        table.put(wearableType, uuid2, wearable);
        return wearable;
    }

    private boolean areWearablesReady() {
        boolean z;
        boolean z2;
        boolean z3;
        boolean z4;
        boolean z5;
        SLWearableType[] valuesCustom = SLWearableType.values();
        int length = valuesCustom.length;
        int i = 0;
        boolean z6 = false;
        boolean z7 = false;
        while (i < length) {
            SLWearableType wearableType = valuesCustom[i];
            boolean isCritical = wearableType.getIsCritical();
            Map<UUID, SLWearable> row = this.wornWearables.row(wearableType);
            if (row != null) {
                z = false;
                z2 = z7;
                for (SLWearable wearable : row.values()) {
                    if (wearable.getIsValid()) {
                        z4 = true;
                        z5 = z2;
                    } else if (wearable.getIsFailed()) {
                        z4 = z;
                        z5 = z2;
                    } else {
                        z4 = z;
                        z5 = true;
                    }
                    z2 = z5;
                    z = z4;
                }
            } else {
                z = false;
                z2 = z7;
            }
            if (!isCritical) {
                z3 = z6;
            } else if (!z) {
                Object[] objArr = new Object[2];
                objArr[0] = wearableType;
                objArr[1] = Integer.valueOf(row != null ? row.size() : 0);
                Debug.Printf("missing wearables on critical layer %s (worn: %d entries)", objArr);
                z3 = true;
            } else {
                z3 = z6;
            }
            i++;
            z6 = z3;
            z7 = z2;
        }
        Debug.Printf("hasNotDownloaded %b, hasCriticalMissing %b", Boolean.valueOf(z7), Boolean.valueOf(z6));
        if (z7) {
            return false;
        }
        return !z6;
    }

    private boolean canDetachItem(UUID uuid) {
        SLObjectAvatarInfo agentAvatar;
        if (this.parcelInfo == null || (agentAvatar = this.parcelInfo.getAgentAvatar()) == null) {
            return true;
        }
        try {
            for (SLObjectInfo objectInfo : agentAvatar.treeNode) {
                if (objectInfo.attachedToUUID != null && (!objectInfo.isDead) && objectInfo.attachedToUUID.equals(uuid)) {
                    if (!this.agentCircuit.getModules().rlvController.canDetachItem(objectInfo.attachmentID, objectInfo.getId())) {
                        return false;
                    }
                }
            }
            return true;
        } catch (NoSuchElementException e) {
            Debug.Warning(e);
            return true;
        }
    }

    private boolean canWearItem(SLWearableType wearableType) {
        return this.agentCircuit.getModules().rlvController.canWearItem(wearableType);
    }

    private float getAgentHeight() {
        return (this.agentSizeVPLegLength * 0.1918f) + 1.706f + (this.agentSizeVPHipLength * 0.0375f) + (this.agentSizeVPHeight * 0.12022f) + (this.agentSizeVPHeadSize * 0.01117f) + (this.agentSizeVPNeckLength * 0.038f) + (this.agentSizeVPHeelHeight * 0.08f) + (this.agentSizeVPPlatformHeight * 0.07f);
    }

    private int[] getAppearanceParams() {
        SLAvatarParams.AvatarParam avatarParam;
        int[] ints = new int[218];
        for (int i = 0; i < 218; i++) {
            ints[i] = 0;
            SLAvatarParams.ParamSet paramSet = SLAvatarParams.paramDefs[i];
            if (paramSet != null && paramSet.params.size() > 0 && (avatarParam = paramSet.params.get(0)) != null) {
                int round = Math.round(((avatarParam.defValue - avatarParam.minValue) * 255.0f) / (avatarParam.maxValue - avatarParam.minValue));
                if (round < 0) {
                    round = 0;
                } else if (round > 255) {
                    round = 255;
                }
                ints[i] = round;
            }
        }
        Iterator<SLWearable> it = this.wornWearables.values().iterator();
        while (it.hasNext()) {
            SLWearableData wearableData = ((SLWearable) it.next()).getWearableData();
            if (wearableData != null) {
                for (SLWearableData.WearableParam wearableParam : wearableData.params) {
                    SLAvatarParams.ParamSet paramSet2 = SLAvatarParams.paramByIDs.get(Integer.valueOf(wearableParam.paramIndex));
                    if (paramSet2 != null && paramSet2.params.size() > 0 && paramSet2.appearanceIndex >= 0) {
                        SLAvatarParams.AvatarParam avatarParam2 = paramSet2.params.get(0);
                        int round2 = Math.round(((wearableParam.paramValue - avatarParam2.minValue) * 255.0f) / (avatarParam2.maxValue - avatarParam2.minValue));
                        if (round2 < 0) {
                            round2 = 0;
                        } else if (round2 > 255) {
                            round2 = 255;
                        }
                        ints[paramSet2.appearanceIndex] = round2;
                        switch (paramSet2.id) {
                            case 33:
                                this.agentSizeVPHeight = wearableParam.paramValue;
                                break;
                            case Param_agentSizeVPHeelHeight /* 198 */:
                                this.agentSizeVPHeelHeight = wearableParam.paramValue;
                                break;
                            case Param_agentSizeVPPlatformHeight /* 503 */:
                                this.agentSizeVPPlatformHeight = wearableParam.paramValue;
                                break;
                            case Param_agentSizeVPHeadSize /* 682 */:
                                this.agentSizeVPHeadSize = wearableParam.paramValue;
                                break;
                            case Param_agentSizeVPLegLength /* 692 */:
                                this.agentSizeVPLegLength = wearableParam.paramValue;
                                break;
                            case Param_agentSizeVPNeckLength /* 756 */:
                                this.agentSizeVPNeckLength = wearableParam.paramValue;
                                break;
                            case Param_agentSizeVPHipLength /* 842 */:
                                this.agentSizeVPHipLength = wearableParam.paramValue;
                                break;
                        }
                    }
                }
            }
        }
        this.agentSizeKnown = true;
        return ints;
    }

    public ImmutableList<WornItem> getWornItems() {
        SLObjectAvatarInfo agentAvatar;
        ImmutableList.Builder builder = ImmutableList.builder();
        Iterator<Table.Cell<SLWearableType, UUID, SLWearable>> it = this.wornWearables.cellSet().iterator();
        while (it.hasNext()) {
            Table.Cell cell = (Table.Cell) it.next();
            SLWearable wearable = (SLWearable) cell.getValue();
            if (wearable != null) {
                builder.add(new WornItem((SLWearableType) cell.getRowKey(), 0, (UUID) cell.getColumnKey(), wearable.getName(), 0, false));
            }
        }
        if (this.parcelInfo != null && (agentAvatar = this.parcelInfo.getAgentAvatar()) != null) {
            try {
                for (SLObjectInfo objectInfo : agentAvatar.treeNode) {
                    builder.add(new WornItem(null, objectInfo.attachmentID, objectInfo.getId(), objectInfo.getName(), objectInfo.localID, objectInfo.isTouchable()));
                }
            } catch (NoSuchElementException e) {
                Debug.Warning(e);
            }
        }
        return builder.build();
    }

    private boolean isItemWorn(SLInventoryEntry inventoryEntry, boolean z) {
        return inventoryEntry.whatIsItemWornOn(this.wornAttachments, this.wornWearables, z) != null;
    }

    public void onCofFolderEntry(InventoryEntryList inventoryEntryList) {
        if (inventoryEntryList != null) {
            for (SLInventoryEntry inventoryEntry : inventoryEntryList) {
                if (inventoryEntry != null && inventoryEntry.isFolder && inventoryEntry.typeDefault == 46) {
                    this.cofFolderUUID.set(inventoryEntry.uuid);
                    this.findCofFolder.unsubscribe();
                    this.currentOutfitFolder.subscribe(this.userManager.getInventoryManager().getInventoryEntries(), InventoryQuery.create(inventoryEntry.uuid, (String) null, true, true, false, (SLAssetType) null));
                    return;
                }
            }
        }
    }

    public void onCurrentOutfitFolder(InventoryEntryList inventoryEntryList) {
        SLInventoryEntry folder;
        if (inventoryEntryList == null || (folder = inventoryEntryList.getFolder()) == null || !Objects.equal(folder.sessionID, this.agentCircuit.circuitInfo.sessionID)) {
            return;
        }
        Debug.Log("AvatarAppearance: COF has been fetched from inventory.");
        UpdateWearableNames();
        this.cofReady = true;
        UpdateCurrentOutfitLink(inventoryEntryList);
        ProcessMultiLayer();
        UpdateCOFContents();
        RequestServerRebake();
    }

    private void startBaking() {
        BakeProcess bakeProcess = this.bakeProcess;
        if (bakeProcess != null) {
            bakeProcess.cancel();
        }
        this.bakeProcess = new BakeProcess(this.wornWearables, this, this.agentCircuit.getModules().textureUploader, this.eventBus);
    }

    private void updateIfWearablesReady() {
        if (areWearablesReady()) {
            SendAvatarSetAppearance();
            if (!this.needUpdateAppearance) {
                UpdateCOFContents();
            } else if (this.caps.getCapability(SLCaps.SLCapability.UpdateAvatarAppearance) == null) {
                startBaking();
            }
        }
    }

    public void AttachInventoryItem(SLInventoryEntry inventoryEntry, int i, boolean z) {
        boolean z2;
        InventoryDB database = this.userManager != null ? this.userManager.getInventoryManager().getDatabase() : null;
        if (database != null) {
            inventoryEntry = database.resolveLink(inventoryEntry);
        }
        if (inventoryEntry == null) {
            return;
        }
        if (inventoryEntry.assetType == SLAssetType.AT_CLOTHING.getTypeCode() || inventoryEntry.assetType == SLAssetType.AT_BODYPART.getTypeCode()) {
            WearItem(inventoryEntry, z);
            return;
        }
        Debug.Printf("Outfits: Attaching inventory item %s", inventoryEntry.uuid.toString());
        Map<UUID, String> map = this.wantedAttachments.get();
        if (map == null || (!map.containsKey(inventoryEntry.uuid))) {
            HashMap hashMap = new HashMap();
            if (map != null) {
                hashMap.putAll(map);
            }
            hashMap.put(inventoryEntry.uuid, inventoryEntry.name);
            this.wantedAttachments.set(ImmutableMap.copyOf((Map) hashMap));
            z2 = true;
        } else {
            z2 = false;
        }
        RezSingleAttachmentFromInv rezSingleAttachmentFromInv = new RezSingleAttachmentFromInv();
        rezSingleAttachmentFromInv.AgentData_Field.AgentID = this.circuitInfo.agentID;
        rezSingleAttachmentFromInv.AgentData_Field.SessionID = this.circuitInfo.sessionID;
        if (!z) {
            i |= 128;
        }
        rezSingleAttachmentFromInv.ObjectData_Field.ItemID = inventoryEntry.uuid;
        rezSingleAttachmentFromInv.ObjectData_Field.OwnerID = inventoryEntry.ownerUUID;
        rezSingleAttachmentFromInv.ObjectData_Field.AttachmentPt = i;
        rezSingleAttachmentFromInv.ObjectData_Field.ItemFlags = inventoryEntry.flags;
        rezSingleAttachmentFromInv.ObjectData_Field.GroupMask = inventoryEntry.groupMask;
        rezSingleAttachmentFromInv.ObjectData_Field.EveryoneMask = inventoryEntry.everyoneMask;
        rezSingleAttachmentFromInv.ObjectData_Field.NextOwnerMask = inventoryEntry.nextOwnerMask;
        rezSingleAttachmentFromInv.ObjectData_Field.Name = SLMessage.stringToVariableOEM(inventoryEntry.name);
        rezSingleAttachmentFromInv.ObjectData_Field.Description = SLMessage.stringToVariableOEM(inventoryEntry.description);
        rezSingleAttachmentFromInv.isReliable = true;
        SendMessage(rezSingleAttachmentFromInv);
        if (z2) {
            this.needUpdateCOF.set(true);
            UpdateCOFContents();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void ChangeOutfit(List<SLInventoryEntry> list, boolean z, SLInventoryEntry wantedOutfitFolder) {
        boolean z2;
        boolean z3;
        boolean z4;
        RezMultipleAttachmentsFromInv rezMultipleAttachmentsFromInv;
        boolean z5;
        boolean z6;
        SLWearableType byCode;
        boolean z7;
        boolean z8;
        SLWearable removed;
        RezMultipleAttachmentsFromInv rezMultipleAttachmentsFromInv2;
        InventoryDB database = this.userManager != null ? this.userManager.getInventoryManager().getDatabase() : null;
        Map<UUID, String> map = this.wantedAttachments.get();
        HashMap hashMap = map != null ? new HashMap(map) : new HashMap();
        if (z) {
            z2 = true;
            hashMap.clear();
        } else {
            z2 = false;
        }
        if (wantedOutfitFolder != null) {
            if (z) {
                if (this.wantedOutfitFolder == null) {
                    this.wantedOutfitFolder = wantedOutfitFolder;
                    z3 = true;
                } else if (!this.wantedOutfitFolder.uuid.equals(wantedOutfitFolder.uuid)) {
                    this.wantedOutfitFolder = wantedOutfitFolder;
                    z3 = true;
                }
            }
            z3 = z2;
        } else {
            z3 = z2;
        }
        UUID randomUUID = UUID.randomUUID();
        ArrayList arrayList = new ArrayList();
        for (SLInventoryEntry inventoryEntry : list) {
            SLInventoryEntry resolveLink = database != null ? database.resolveLink(inventoryEntry) : inventoryEntry;
            if (resolveLink != null) {
                inventoryEntry = resolveLink;
            }
            if (inventoryEntry != null && (inventoryEntry.assetType == SLAssetType.AT_OBJECT.getTypeCode() || (inventoryEntry.isLink() && inventoryEntry.invType == SLInventoryType.IT_OBJECT.getTypeCode()))) {
                arrayList.add(inventoryEntry);
            }
        }
        RezMultipleAttachmentsFromInv rezMultipleAttachmentsFromInv3 = new RezMultipleAttachmentsFromInv();
        rezMultipleAttachmentsFromInv3.AgentData_Field.AgentID = this.circuitInfo.agentID;
        rezMultipleAttachmentsFromInv3.AgentData_Field.SessionID = this.circuitInfo.sessionID;
        rezMultipleAttachmentsFromInv3.HeaderData_Field.CompoundMsgID = randomUUID;
        rezMultipleAttachmentsFromInv3.HeaderData_Field.TotalObjects = arrayList.size();
        rezMultipleAttachmentsFromInv3.HeaderData_Field.FirstDetachAll = z;
        Debug.Printf("Wearing: totalAttachments %d", Integer.valueOf(arrayList.size()));
        Iterator it = arrayList.iterator();
        while (true) {
            z4 = z3;
            rezMultipleAttachmentsFromInv = rezMultipleAttachmentsFromInv3;
            if (!it.hasNext()) {
                break;
            }
            SLInventoryEntry inventoryEntry2 = (SLInventoryEntry) it.next();
            if (rezMultipleAttachmentsFromInv == null) {
                RezMultipleAttachmentsFromInv rezMultipleAttachmentsFromInv4 = new RezMultipleAttachmentsFromInv();
                rezMultipleAttachmentsFromInv4.AgentData_Field.AgentID = this.circuitInfo.agentID;
                rezMultipleAttachmentsFromInv4.AgentData_Field.SessionID = this.circuitInfo.sessionID;
                rezMultipleAttachmentsFromInv4.HeaderData_Field.CompoundMsgID = randomUUID;
                rezMultipleAttachmentsFromInv4.HeaderData_Field.TotalObjects = arrayList.size();
                rezMultipleAttachmentsFromInv4.HeaderData_Field.FirstDetachAll = z;
                rezMultipleAttachmentsFromInv2 = rezMultipleAttachmentsFromInv4;
            } else {
                rezMultipleAttachmentsFromInv2 = rezMultipleAttachmentsFromInv;
            }
            RezMultipleAttachmentsFromInv.ObjectData objectData = new RezMultipleAttachmentsFromInv.ObjectData();
            UUID uuid = inventoryEntry2.uuid;
            Debug.Printf("Wearing: entry '%s' actualUUID %s", inventoryEntry2.name, uuid);
            hashMap.put(uuid, inventoryEntry2.name);
            z3 = true;
            objectData.ItemID = uuid;
            objectData.OwnerID = inventoryEntry2.ownerUUID;
            objectData.AttachmentPt = 128;
            objectData.ItemFlags = inventoryEntry2.flags;
            objectData.GroupMask = inventoryEntry2.groupMask;
            objectData.EveryoneMask = inventoryEntry2.everyoneMask;
            objectData.NextOwnerMask = inventoryEntry2.nextOwnerMask;
            objectData.Name = SLMessage.stringToVariableOEM(inventoryEntry2.name);
            objectData.Description = SLMessage.stringToVariableOEM(inventoryEntry2.description);
            rezMultipleAttachmentsFromInv2.ObjectData_Fields.add(objectData);
            if (rezMultipleAttachmentsFromInv2.ObjectData_Fields.size() >= 4) {
                rezMultipleAttachmentsFromInv2.isReliable = true;
                SendMessage(rezMultipleAttachmentsFromInv2);
                rezMultipleAttachmentsFromInv3 = null;
            } else {
                rezMultipleAttachmentsFromInv3 = rezMultipleAttachmentsFromInv2;
            }
        }
        if (rezMultipleAttachmentsFromInv != null) {
            rezMultipleAttachmentsFromInv.isReliable = true;
            SendMessage(rezMultipleAttachmentsFromInv);
        }
        boolean z9 = false;
        RLVController rlvController = this.agentCircuit.getModules().rlvController;
        HashSet hashSet = new HashSet();
        Table<SLWearableType, UUID, SLWearable> create = HashBasedTable.create(this.wornWearables);
        Iterator<SLInventoryEntry> iterator = list.iterator();
        while (true) {
            z5 = z9;
            if (!iterator.hasNext()) {
                break;
            }
            SLInventoryEntry inventoryEntry3 = (SLInventoryEntry) iterator.next();
            SLInventoryEntry inventoryEntry4 = database != null ? database.resolveLink(inventoryEntry3) : inventoryEntry3;
            if (inventoryEntry4 != null && ((inventoryEntry4.assetType == SLAssetType.AT_BODYPART.getTypeCode() || inventoryEntry4.assetType == SLAssetType.AT_CLOTHING.getTypeCode()) && (byCode = SLWearableType.getByCode(inventoryEntry4.flags & 255)) != null)) {
                if (!rlvController.canWearItem(byCode)) {
                    z7 = false;
                } else if (byCode.isBodyPart()) {
                    if (!rlvController.canTakeItemOff(byCode)) {
                        boolean z10 = false;
                        Iterator iterator2 = create.row(byCode).keySet().iterator();
                        while (true) {
                            z8 = z10;
                            if (!iterator2.hasNext()) {
                                break;
                            } else {
                                z10 = !((UUID) iterator2.next()).equals(inventoryEntry4.assetUUID) ? true : z8;
                            }
                        }
                        if (z8) {
                            z7 = false;
                        }
                    }
                    z7 = true;
                } else {
                    z7 = true;
                }
                if (z7) {
                    hashSet.add(inventoryEntry4.assetUUID);
                    if (!create.contains(byCode, inventoryEntry4.assetUUID)) {
                        addWearable(create, byCode, inventoryEntry4.uuid, inventoryEntry4.assetUUID, inventoryEntry4.name);
                        z5 = true;
                        if (byCode.isBodyPart()) {
                            HashSet<UUID> hashSet2 = new HashSet();
                            for (UUID uuid2 : create.row(byCode).keySet()) {
                                if (!uuid2.equals(inventoryEntry4.assetUUID)) {
                                    hashSet2.add(uuid2);
                                }
                            }
                            for (UUID uuid3 : hashSet2) {
                                if (create.row(byCode).size() > 1 && (removed = (SLWearable) create.remove(byCode, uuid3)) != null) {
                                    removed.dispose();
                                }
                            }
                        }
                    }
                }
            }
            z9 = z5;
        }
        if (z) {
            z6 = z5;
            for (SLWearableType wearableType : SLWearableType.values()) {
                if (!wearableType.isBodyPart() && rlvController.canTakeItemOff(wearableType)) {
                    Map<UUID, SLWearable> row = create.row(wearableType);
                    HashSet hashSet3 = new HashSet();
                    for (UUID uuid4 : row.keySet()) {
                        if (!hashSet.contains(uuid4)) {
                            hashSet3.add(uuid4);
                        }
                    }
                    Iterator iterator3 = hashSet3.iterator();
                    boolean z11 = z6;
                    while (iterator3.hasNext()) {
                        SLWearable removed2 = (SLWearable) row.remove((UUID) iterator3.next());
                        if (removed2 != null) {
                            removed2.dispose();
                        }
                        z11 = true;
                    }
                    z6 = z11;
                }
            }
        } else {
            z6 = z5;
        }
        if (z6) {
            this.wornWearables = ImmutableTable.copyOf(create);
            this.userManager.getWornWearablesPool().setData(SubscriptionSingleKey.Value, this.wornWearables);
            this.userManager.wornItems().requestUpdate(SubscriptionSingleKey.Value);
        }
        if (z4) {
            this.wantedAttachments.set(ImmutableMap.copyOf((Map) hashMap));
        }
        if (z6) {
            SendAgentIsNowWearing();
            ForceUpdateAppearance(false);
            z4 = false;
        }
        if (z4) {
            this.needUpdateCOF.set(true);
            UpdateCOFContents();
        }
    }

    public void DetachInventoryItem(SLInventoryEntry inventoryEntry) {
        boolean z;
        if (canDetachItem(inventoryEntry)) {
            UUID uuid = inventoryEntry.isLink() ? inventoryEntry.assetUUID : inventoryEntry.uuid;
            Debug.Log("Outfits: Detaching inventory item " + uuid);
            Map<UUID, String> map = this.wantedAttachments.get();
            if (map == null) {
                z = false;
            } else if (map.containsKey(uuid)) {
                HashMap hashMap = new HashMap(map);
                hashMap.remove(uuid);
                this.wantedAttachments.set(ImmutableMap.copyOf((Map) hashMap));
                z = true;
            } else {
                z = false;
            }
            DetachAttachmentIntoInv detachAttachmentIntoInv = new DetachAttachmentIntoInv();
            detachAttachmentIntoInv.ObjectData_Field.AgentID = this.circuitInfo.agentID;
            detachAttachmentIntoInv.ObjectData_Field.ItemID = uuid;
            detachAttachmentIntoInv.isReliable = true;
            SendMessage(detachAttachmentIntoInv);
            if (z) {
                this.needUpdateCOF.set(true);
                UpdateCOFContents();
            }
        }
    }

    public void DetachItem(WornItem wornItem) {
        if (canDetachItem(wornItem)) {
            DetachItem(wornItem.objectLocalID);
        }
    }

    public void DetachItemFromPoint(int i) {
        SLObjectAvatarInfo agentAvatar;
        HashSet hashSet = null;
        if (this.parcelInfo != null && (agentAvatar = this.parcelInfo.getAgentAvatar()) != null) {
            try {
                for (SLObjectInfo objectInfo : agentAvatar.treeNode) {
                    if (objectInfo.attachedToUUID != null && (!objectInfo.isDead) && objectInfo.attachmentID == i && this.agentCircuit.getModules().rlvController.canDetachItem(i, objectInfo.getId())) {
                        if (hashSet == null) {
                            hashSet = new HashSet();
                        }
                        hashSet.add(Integer.valueOf(objectInfo.localID));
                    }
                    hashSet = hashSet;
                }
            } catch (NoSuchElementException e) {
                Debug.Warning(e);
            }
        }
        if (hashSet != null) {
            Iterator it = hashSet.iterator();
            while (it.hasNext()) {
                DetachItem(((Integer) it.next()).intValue());
            }
        }
    }

    public void ForceTakeItemOff(SLWearableType wearableType) {
        boolean z;
        if (this.wornWearables.row(wearableType).isEmpty()) {
            z = false;
        } else {
            z = true;
            HashBasedTable create = HashBasedTable.create(this.wornWearables);
            create.rowKeySet().remove(wearableType);
            this.wornWearables = ImmutableTable.copyOf(create);
            this.userManager.getWornWearablesPool().setData(SubscriptionSingleKey.Value, this.wornWearables);
            this.userManager.wornItems().requestUpdate(SubscriptionSingleKey.Value);
        }
        if (z) {
            SendAgentIsNowWearing();
            ForceUpdateAppearance(false);
        }
    }

    @SLMessageHandler
    public void HandleAgentWearablesUpdate(AgentWearablesUpdate agentWearablesUpdate) {
        Debug.Log("AvatarAppearance: Got AgentWearablesUpdate, " + agentWearablesUpdate.WearableData_Fields.size() + " wearables.");
        HashSet hashSet = new HashSet();
        HashBasedTable create = HashBasedTable.create(this.wornWearables);
        for (AgentWearablesUpdate.WearableData wearableData : agentWearablesUpdate.WearableData_Fields) {
            Debug.Log("Wearable: type = " + wearableData.WearableType + ", itemID = " + wearableData.ItemID + ", assetID = " + wearableData.AssetID);
            if (wearableData.AssetID.getLeastSignificantBits() != 0 || wearableData.AssetID.getMostSignificantBits() != 0) {
                hashSet.add(wearableData.AssetID);
                SLWearableType byCode = SLWearableType.getByCode(wearableData.WearableType);
                if (byCode != null && create.get(byCode, wearableData.AssetID) == null) {
                    addWearable(create, byCode, wearableData.ItemID, wearableData.AssetID, null);
                }
            }
        }
        Debug.Log("AvatarAppearance: AgentWearablesUpdate: wearing now: " + hashSet.size() + " ids");
        HashSet hashSet2 = new HashSet();
        for (Object uuidObj : create.columnKeySet()) {
            UUID uuid = (UUID) uuidObj;
            if (!hashSet.contains(uuid)) {
                hashSet2.add(uuid);
            }
        }
        Iterator it = hashSet2.iterator();
        while (it.hasNext()) {
            Map<SLWearableType, SLWearable> column = create.column((UUID) it.next());
            Iterator<SLWearable> iterator = column.values().iterator();
            while (iterator.hasNext()) {
                ((SLWearable) iterator.next()).dispose();
            }
            column.clear();
        }
        this.wornWearables = ImmutableTable.copyOf(create);
        this.userManager.getWornWearablesPool().setData(SubscriptionSingleKey.Value, this.wornWearables);
        this.userManager.wornItems().requestUpdate(SubscriptionSingleKey.Value);
        UpdateWearableNames();
        this.legacyAppearanceReady = true;
        ProcessMultiLayer();
        SendAgentIsNowWearing();
        StartUpdatingAppearance();
    }

    public void HandleAvatarAppearance(AvatarAppearance avatarAppearance) {
        if (avatarAppearance.AppearanceData_Fields.size() > 0) {
            this.currentCofAppearanceVersion = avatarAppearance.AppearanceData_Fields.get(0).CofVersion;
            Debug.Printf("AvatarAppearance: inventory COF %d, last updated COF %d, appearance COF %d", Integer.valueOf(this.currentCofInventoryVersion), Integer.valueOf(this.lastCofUpdatedVersion), Integer.valueOf(this.currentCofAppearanceVersion));
        }
    }

    @Override
    public void HandleCircuitReady() {
        SLInventoryEntry findSpecialFolder;
        boolean z = true;
        super.HandleCircuitReady();
        if (this.userManager != null) {
            UUID rootFolder = this.userManager.getInventoryManager().getRootFolder();
            if (rootFolder == null || (findSpecialFolder = this.userManager.getInventoryManager().getDatabase().findSpecialFolder(rootFolder, 46)) == null) {
                z = false;
            } else {
                Debug.Printf("Found existing COF folder: %s", findSpecialFolder.uuid);
                this.cofFolderUUID.set(findSpecialFolder.uuid);
                this.currentOutfitFolder.subscribe(this.userManager.getInventoryManager().getInventoryEntries(), InventoryQuery.create(findSpecialFolder.uuid, (String) null, true, true, false, (SLAssetType) null));
            }
            if (z) {
                return;
            }
            Debug.Printf("Existing COF folder not found, requesting.", new Object[0]);
            this.findCofFolder.subscribe(this.userManager.getInventoryManager().getInventoryEntries(), InventoryQuery.findFolderWithType(null, 46));
        }
    }

    @Override
    public void HandleCloseCircuit() {
        this.findCofFolder.unsubscribe();
        this.currentOutfitFolder.unsubscribe();
        if (this.userManager != null) {
            this.userManager.getWornAttachmentsPool().setData(SubscriptionSingleKey.Value, null);
            this.userManager.getWornWearablesPool().setData(SubscriptionSingleKey.Value, null);
            this.userManager.wornItems().detachRequestHandler(this.wornItemsRequestHandler);
        }
        if (this.bakingThread != null) {
            this.bakingThread.interrupt();
            this.bakingThread = null;
        }
        if (this.serverSideAppearanceUpdateTask != null) {
            this.serverSideAppearanceUpdateTask.cancel(true);
        }
        super.HandleCloseCircuit();
    }

    public void OnMyAvatarCreated(SLObjectAvatarInfo objectAvatarInfo) {
        if (this.agentVisualParams != null) {
            objectAvatarInfo.ApplyAvatarVisualParams(this.agentVisualParams);
        }
    }

    public void SendAgentWearablesRequest() {
        AgentWearablesRequest agentWearablesRequest = new AgentWearablesRequest();
        agentWearablesRequest.AgentData_Field.AgentID = this.circuitInfo.agentID;
        agentWearablesRequest.AgentData_Field.SessionID = this.circuitInfo.sessionID;
        agentWearablesRequest.isReliable = true;
        SendMessage(agentWearablesRequest);
    }

    public void TakeItemOff(SLInventoryEntry inventoryEntry) {
        InventoryDB database = this.userManager != null ? this.userManager.getInventoryManager().getDatabase() : null;
        if (database != null) {
            inventoryEntry = database.resolveLink(inventoryEntry);
        }
        if (inventoryEntry != null) {
            TakeItemOff(inventoryEntry.assetUUID);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void TakeItemOff(UUID uuid) {
        boolean z;
        RLVController rlvController = this.agentCircuit.getModules().rlvController;
        HashBasedTable create = HashBasedTable.create(this.wornWearables);
        SLWearableType[] valuesCustom = SLWearableType.values();
        int length = valuesCustom.length;
        int i = 0;
        boolean z2 = false;
        while (i < length) {
            SLWearableType wearableType = valuesCustom[i];
            if (rlvController.canTakeItemOff(wearableType)) {
                SLWearable removed = (SLWearable) create.remove(wearableType, uuid);
                if (removed != null) {
                    removed.dispose();
                    create.columnKeySet().remove(uuid);
                    z = true;
                } else {
                    z = z2;
                }
            } else {
                z = z2;
            }
            i++;
            z2 = z;
        }
        if (z2) {
            this.wornWearables = ImmutableTable.copyOf(create);
            this.userManager.getWornWearablesPool().setData(SubscriptionSingleKey.Value, this.wornWearables);
            this.userManager.wornItems().requestUpdate(SubscriptionSingleKey.Value);
            SendAgentIsNowWearing();
            ForceUpdateAppearance(false);
        }
    }

    public void UpdateMyAttachments() {
        SLObjectAvatarInfo agentAvatar;
        HashMap hashMap = new HashMap();
        if (this.parcelInfo != null && (agentAvatar = this.parcelInfo.getAgentAvatar()) != null) {
            try {
                for (SLObjectInfo objectInfo : agentAvatar.treeNode) {
                    if (objectInfo.attachedToUUID != null && (!objectInfo.isDead)) {
                        hashMap.put(objectInfo.attachedToUUID, Strings.nullToEmpty(objectInfo.getName()));
                    }
                }
            } catch (NoSuchElementException e) {
                e.printStackTrace();
            }
        }
        ImmutableMap<UUID, String> copyOf = ImmutableMap.copyOf((Map) hashMap);
        if (this.wornAttachments.equals(copyOf)) {
            return;
        }
        Debug.Log("AvatarAppearance: attachments changed.");
        this.wornAttachments = copyOf;
        this.userManager.getWornAttachmentsPool().setData(SubscriptionSingleKey.Value, this.wornAttachments);
        this.userManager.getObjectsManager().myAvatarState().requestUpdate(SubscriptionSingleKey.Value);
        this.userManager.wornItems().requestUpdate(SubscriptionSingleKey.Value);
    }

    public void WearItem(SLInventoryEntry inventoryEntry, boolean z) {
        InventoryDB database = this.userManager != null ? this.userManager.getInventoryManager().getDatabase() : null;
        if (database != null) {
            WearItemList(database, ImmutableList.of(inventoryEntry), z);
            SendAgentIsNowWearing();
            ForceUpdateAppearance(false);
        }
    }

    public boolean canDetachItem(SLInventoryEntry inventoryEntry) {
        if (inventoryEntry.assetType == SLAssetType.AT_LINK.getTypeCode()) {
            if (inventoryEntry.invType == SLInventoryType.IT_WEARABLE.getTypeCode()) {
                return true;
            }
            if (inventoryEntry.invType == SLInventoryType.IT_OBJECT.getTypeCode() && this.wornAttachments.containsKey(inventoryEntry.assetUUID)) {
                return canDetachItem(inventoryEntry.assetUUID);
            }
        } else {
            if (inventoryEntry.assetType == SLAssetType.AT_BODYPART.getTypeCode() || inventoryEntry.assetType == SLAssetType.AT_CLOTHING.getTypeCode()) {
                return true;
            }
            if (inventoryEntry.assetType == SLAssetType.AT_OBJECT.getTypeCode()) {
                if (!this.wornAttachments.containsKey(inventoryEntry.uuid) || canDetachItem(inventoryEntry.uuid)) {
                    return !this.wornAttachments.containsKey(inventoryEntry.assetUUID) || canDetachItem(inventoryEntry.assetUUID);
                }
                return false;
            }
        }
        return false;
    }

    public boolean canDetachItem(WornItem wornItem) {
        return this.agentCircuit.getModules().rlvController.canDetachItem(wornItem.getAttachedTo(), wornItem.itemID());
    }

    public boolean canTakeItemOff(SLWearableType wearableType) {
        return this.agentCircuit.getModules().rlvController.canTakeItemOff(wearableType);
    }

    public boolean canTakeItemOff(SLInventoryEntry inventoryEntry) {
        Object whatIsItemWornOn = inventoryEntry.whatIsItemWornOn(this.wornAttachments, this.wornWearables, false);
        if (whatIsItemWornOn == null) {
            return true;
        }
        RLVController rlvController = this.agentCircuit.getModules().rlvController;
        if (whatIsItemWornOn instanceof SLWearableType) {
            return rlvController.canTakeItemOff((SLWearableType) whatIsItemWornOn);
        }
        return true;
    }

    public boolean canWearItem(SLInventoryEntry inventoryEntry) {
        InventoryDB database = this.userManager != null ? this.userManager.getInventoryManager().getDatabase() : null;
        if (database != null) {
            inventoryEntry = database.resolveLink(inventoryEntry);
        }
        if (inventoryEntry == null) {
            return false;
        }
        SLWearableType byCode = SLWearableType.getByCode(inventoryEntry.flags & 255);
        return byCode == null || canWearItem(byCode);
    }

    public void finishBaking(BakeProcess bakeProcess, SLTextureEntry textureEntry) {
        if (textureEntry != null) {
            this.agentBakedTextures = textureEntry;
            SendAvatarSetAppearance();
        }
        if (this.bakeProcess == bakeProcess) {
            this.bakeProcess = null;
        }
    }

    public UUID getAttachmentUUID(int i) {
        SLObjectAvatarInfo agentAvatar;
        if (this.parcelInfo != null && (agentAvatar = this.parcelInfo.getAgentAvatar()) != null) {
            try {
                for (SLObjectInfo objectInfo : agentAvatar.treeNode) {
                    if (objectInfo.attachedToUUID != null && (!objectInfo.isDead) && objectInfo.attachmentID == i) {
                        return objectInfo.getId();
                    }
                }
            } catch (NoSuchElementException e) {
                Debug.Warning(e);
            }
        }
        return null;
    }

    public boolean hasWornWearable(SLWearableType wearableType) {
        return this.wornWearables.containsRow(wearableType);
    }

    public boolean isItemWorn(SLInventoryEntry inventoryEntry) {
        return isItemWorn(inventoryEntry, false);
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_modules_SLAvatarAppearance_17963, reason: not valid java name */
    /* synthetic */ void m212x366f8fcf(int i, String str) {
        LLSDXMLRequest llsdxmlRequest = new LLSDXMLRequest();
        LLSDMap llsdMap = new LLSDMap(new LLSDMap.LLSDMapEntry("cof_version", new LLSDInt(i)));
        int i2 = 3;
        while (i2 > 0) {
            try {
                LLSDNode PerformRequest = llsdxmlRequest.PerformRequest(str, llsdMap);
                if (PerformRequest != null && PerformRequest.keyExists("error")) {
                    LLSDNode byKey = PerformRequest.byKey("error");
                    if (byKey.isString()) {
                        Debug.Printf("AvatarAppearance: server-side error: %s", byKey.asString());
                    } else {
                        Debug.Printf("AvatarAppearance: server-side update ok.", new Object[0]);
                    }
                }
                this.lastCofUpdateError = false;
                return;
            } catch (Exception e) {
                Debug.Printf("AvatarAppearance: server-side update error: [exception %s]", e.toString());
                this.lastCofUpdateError = true;
                int i3 = i2 - 1;
                try {
                    Thread.sleep(1000L);
                    i2 = i3;
                } catch (InterruptedException e2) {
                    return;
                }
            }
        }
    }

    @Override
    public void onWearableStatusChanged(SLWearable wearable) {
        updateIfWearablesReady();
    }
}
