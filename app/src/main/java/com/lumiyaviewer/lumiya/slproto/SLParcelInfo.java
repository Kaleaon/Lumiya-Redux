package com.lumiyaviewer.lumiya.slproto;

import com.google.common.base.Strings;
import com.google.common.collect.ImmutableList;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.render.spatial.DrawListObjectEntry;
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey;
import com.lumiyaviewer.lumiya.slproto.messages.AvatarAnimation;
import com.lumiyaviewer.lumiya.slproto.messages.AvatarAppearance;
import com.lumiyaviewer.lumiya.slproto.modules.SLAvatarControl;
import com.lumiyaviewer.lumiya.slproto.objects.SLAvatarObjectDisplayInfo;
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectAvatarInfo;
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectDisplayInfo;
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectFilterInfo;
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectInfo;
import com.lumiyaviewer.lumiya.slproto.objects.SLPrimObjectDisplayInfo;
import com.lumiyaviewer.lumiya.slproto.objects.SLPrimObjectDisplayInfoWithChildren;
import com.lumiyaviewer.lumiya.slproto.terrain.TerrainData;
import com.lumiyaviewer.lumiya.slproto.types.ImmutableVector;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import com.lumiyaviewer.lumiya.slproto.users.MultipleChatterNameRetriever;
import com.lumiyaviewer.lumiya.slproto.users.manager.ObjectsManager;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import com.lumiyaviewer.lumiya.utils.LinkedTreeNode;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.ConcurrentModificationException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import javax.annotation.Nullable;

public class SLParcelInfo {
    private volatile UserManager userManager;
    private float drawDistance = 0.0f;
    public final TerrainData terrainData = new TerrainData();
    private final Object agentAvatarLock = new Object();
    private SLObjectAvatarInfo agentAvatar = null;
    private final Object simSunHourLock = new Object();
    private float simSunHour = 0.5f;
    private boolean simSunHourDirty = true;
    public final Map<Integer, UUID> uuidsNearby = new HashMap();
    public final Map<UUID, SLObjectInfo> allObjectsNearby = new ConcurrentHashMap(1024, 0.75f, 1);
    private final Map<Integer, SLObjectInfo> rootObjects = new ConcurrentHashMap(128, 0.75f, 1);
    private final Map<Integer, LinkedList<SLObjectInfo>> orphanObjects = new HashMap();
    public final Map<UUID, SLObjectInfo> objectNamesQueue = Collections.synchronizedMap(new LinkedHashMap());
    private final Comparator<SLObjectDisplayInfo> objectDisplayInfoComparator = new Comparator() {
        private final /* synthetic */ int $m$0(Object obj, Object obj2) {
            int compare;
            compare = Float.compare(((SLObjectDisplayInfo) obj).distance, ((SLObjectDisplayInfo) obj2).distance);
            return compare;
        }

        @Override
        public final int compare(Object obj, Object obj2) {
            return $m$0(obj, obj2);
        }
    };

    @Nullable
    private ArrayList<SLObjectDisplayInfo> addDisplayObjects(Iterable<SLObjectInfo> iterable, SLObjectFilterInfo objectFilterInfo, ImmutableVector immutableVector, boolean z, MultipleChatterNameRetriever multipleChatterNameRetriever, Set<UUID> set, boolean z2) {
        ArrayList<SLObjectDisplayInfo> arrayList;
        boolean z3;
        ArrayList<SLObjectDisplayInfo> objectDisplayInfos = null;
        Iterator<SLObjectInfo> it = iterable.iterator();
        while (true) {
            ArrayList<SLObjectDisplayInfo> objectDisplayInfos2 = objectDisplayInfos;
            if (!it.hasNext()) {
                return objectDisplayInfos2;
            }
            SLObjectInfo next = it.next();
            if (next != null) {
                LinkedTreeNode<SLObjectInfo> linkedTreeNode = next.treeNode;
                if (linkedTreeNode.hasChildren()) {
                    arrayList = addDisplayObjects(linkedTreeNode, objectFilterInfo, immutableVector, false, multipleChatterNameRetriever, set, !next.isAvatar() ? z2 : true);
                } else {
                    arrayList = null;
                }
                LLVector3 absolutePosition = next.getAbsolutePosition();
                float distanceTo = immutableVector.distanceTo(absolutePosition.x, absolutePosition.y, absolutePosition.z);
                boolean z4 = arrayList != null ? !arrayList.isEmpty() : false;
                boolean objectMatches = objectFilterInfo.objectMatches(next, distanceTo, z2);
                if (z4 || objectMatches) {
                    String knownName = getKnownName(next, multipleChatterNameRetriever, set);
                    boolean nameMatches = objectFilterInfo.nameMatches(knownName);
                    if (z4 || nameMatches) {
                        if (z4) {
                            z3 = !(objectMatches ? nameMatches : false);
                        } else {
                            z3 = false;
                        }
                        if (objectDisplayInfos2 == null) {
                            objectDisplayInfos2 = new ArrayList<>();
                        }
                        if (!z) {
                            objectDisplayInfos2.add(next.isAvatar() ? new SLAvatarObjectDisplayInfo(knownName, next, distanceTo, ImmutableList.of(), z3) : new SLPrimObjectDisplayInfo(next, distanceTo));
                            if (arrayList != null) {
                                objectDisplayInfos2.addAll(arrayList);
                            }
                        } else if (next.isAvatar()) {
                            objectDisplayInfos2.add(new SLAvatarObjectDisplayInfo(knownName, next, distanceTo, arrayList != null ? ImmutableList.copyOf((Collection) arrayList) : ImmutableList.of(), z3));
                        } else if (arrayList == null || arrayList.isEmpty()) {
                            objectDisplayInfos2.add(new SLPrimObjectDisplayInfo(next, distanceTo));
                        } else {
                            objectDisplayInfos2.add(new SLPrimObjectDisplayInfoWithChildren(next, distanceTo, ImmutableList.copyOf((Collection) arrayList), z3));
                        }
                    }
                }
            }
            objectDisplayInfos = objectDisplayInfos2;
        }
    }

    @Nullable
    private String getKnownName(SLObjectInfo objectInfo, MultipleChatterNameRetriever multipleChatterNameRetriever, Set<UUID> set) {
        if (objectInfo.isAvatar()) {
            UUID id = objectInfo.getId();
            if (id == null) {
                return null;
            }
            set.add(id);
            return multipleChatterNameRetriever.addChatter(id);
        }
        if (!objectInfo.nameKnown && (!this.objectNamesQueue.containsKey(objectInfo.getId()))) {
            this.objectNamesQueue.put(objectInfo.getId(), objectInfo);
        }
        if (objectInfo.nameKnown) {
            return Strings.nullToEmpty(objectInfo.name);
        }
        return null;
    }

    synchronized void ApplyAvatarAnimation(AvatarAnimation avatarAnimation, SLAvatarControl avatarControl) {
        SLObjectInfo objectInfo = this.allObjectsNearby.get(avatarAnimation.Sender_Field.ID);
        if (objectInfo instanceof SLObjectAvatarInfo) {
            SLObjectAvatarInfo objectAvatarInfo = (SLObjectAvatarInfo) objectInfo;
            objectAvatarInfo.ApplyAvatarAnimation(avatarAnimation);
            if (objectAvatarInfo.isMyAvatar() && avatarControl != null) {
                avatarControl.ApplyAvatarAnimation(objectAvatarInfo, avatarAnimation);
            }
        }
    }

    synchronized void ApplyAvatarAppearance(AvatarAppearance avatarAppearance) {
        SLObjectInfo objectInfo = this.allObjectsNearby.get(avatarAppearance.Sender_Field.ID);
        if (objectInfo instanceof SLObjectAvatarInfo) {
            ((SLObjectAvatarInfo) objectInfo).ApplyAvatarAppearance(avatarAppearance);
        }
    }

    synchronized boolean addObject(SLObjectInfo objectInfo3) {
        synchronized (this) {
            if (this.uuidsNearby.containsKey(Integer.valueOf(objectInfo3.localID)) || this.allObjectsNearby.containsKey(objectInfo3.getId())) {
                return false;
            }
            this.uuidsNearby.put(Integer.valueOf(objectInfo3.localID), objectInfo3.getId());
            this.allObjectsNearby.put(objectInfo3.getId(), objectInfo3);
            if (objectInfo3.parentID != 0) {
                UUID uuid = this.uuidsNearby.get(Integer.valueOf(objectInfo3.parentID));
                SLObjectInfo objectInfo = uuid != null ? this.allObjectsNearby.get(uuid) : null;
                if (objectInfo != null) {
                    objectInfo3.hierLevel = objectInfo.hierLevel + 1;
                    objectInfo3.setIsAttachmentAll(!objectInfo.isAvatar() ? objectInfo.isAttachment : true);
                    objectInfo.addChild(objectInfo3);
                } else {
                    LinkedList<SLObjectInfo> linkedList = this.orphanObjects.get(Integer.valueOf(objectInfo3.parentID));
                    if (linkedList == null) {
                        linkedList = new LinkedList<>();
                        this.orphanObjects.put(Integer.valueOf(objectInfo3.parentID), linkedList);
                    }
                    linkedList.add(objectInfo3);
                }
            } else {
                this.rootObjects.put(Integer.valueOf(objectInfo3.localID), objectInfo3);
            }
            LinkedList<SLObjectInfo> remove = this.orphanObjects.remove(Integer.valueOf(objectInfo3.localID));
            if (remove != null) {
                for (SLObjectInfo objectInfo2 : remove) {
                    objectInfo2.hierLevel = objectInfo3.hierLevel + 1;
                    objectInfo2.setIsAttachmentAll(!objectInfo3.isAttachment ? objectInfo3.isAttachment : true);
                    objectInfo3.addChild(objectInfo2);
                }
            }
            objectInfo3.updateSpatialIndex(false);
            return true;
        }
    }

    @Nullable
    public SLObjectAvatarInfo getAgentAvatar() {
        SLObjectAvatarInfo agentAvatar;
        synchronized (this.agentAvatarLock) {
            agentAvatar = this.agentAvatar;
        }
        return agentAvatar;
    }

    public synchronized SLObjectInfo getAvatarObject(UUID uuid) {
        return this.allObjectsNearby.get(uuid);
    }

    public ObjectsManager.ObjectDisplayList getDisplayObjects(ImmutableVector immutableVector, SLObjectFilterInfo objectFilterInfo, MultipleChatterNameRetriever multipleChatterNameRetriever) {
        ArrayList<SLObjectDisplayInfo> addDisplayObjects;
        int size;
        HashSet hashSet = new HashSet();
        synchronized (this) {
            addDisplayObjects = addDisplayObjects(this.rootObjects.values(), objectFilterInfo, immutableVector, true, multipleChatterNameRetriever, hashSet, false);
            size = this.objectNamesQueue.size();
        }
        multipleChatterNameRetriever.retainChatters(hashSet);
        Object[] objArr = new Object[2];
        objArr[0] = addDisplayObjects != null ? Integer.toString(addDisplayObjects.size()) : "null";
        objArr[1] = Integer.valueOf(size);
        Debug.Printf("getDisplayObjects: objectList is %s, load queue %d", objArr);
        if (addDisplayObjects == null) {
            return new ObjectsManager.ObjectDisplayList(ImmutableList.of(), size != 0);
        }
        Collections.sort(addDisplayObjects, this.objectDisplayInfoComparator);
        return new ObjectsManager.ObjectDisplayList(ImmutableList.copyOf((Collection) addDisplayObjects), size != 0);
    }

    @Nullable
    public synchronized SLObjectInfo getObjectInfo(int i) {
        UUID uuid = this.uuidsNearby.get(Integer.valueOf(i));
        if (uuid == null) {
            return null;
        }
        return this.allObjectsNearby.get(uuid);
    }

    public int getObjectLocalID(@Nullable UUID uuid) {
        int localID;
        synchronized (this) {
            if (uuid != null) {
                SLObjectInfo objectInfo = this.allObjectsNearby.get(uuid);
                if (objectInfo != null) {
                    localID = objectInfo.localID;
                }
            }
            localID = -1;
        }
        return localID;
    }

    @Nullable
    public UUID getObjectUUID(int i) {
        UUID uuid;
        synchronized (this) {
            uuid = this.uuidsNearby.get(Integer.valueOf(i));
        }
        return uuid;
    }

    /** The simulator's sun hour (0..1), without consuming the legacy renderer's change flag. */
    public float peekSunHour() {
        synchronized (this.simSunHourLock) {
            return this.simSunHour;
        }
    }

    public boolean getSunHour(float[] floats, boolean z) {
        synchronized (this.simSunHourLock) {
            if (!this.simSunHourDirty && !z) {
                return false;
            }
            floats[0] = this.simSunHour;
            this.simSunHourDirty = false;
            return true;
        }
    }

    public ImmutableList<SLObjectInfo> getUserTouchableObjects(SLAgentCircuit agentCircuit, UUID uuid) {
        ImmutableList.Builder builder = ImmutableList.builder();
        synchronized (this) {
            SLObjectInfo objectInfo = this.allObjectsNearby.get(uuid);
            if (objectInfo != null) {
                try {
                    for (SLObjectInfo objectInfo2 : objectInfo.treeNode) {
                        if (objectInfo2.isTouchable()) {
                            if (!objectInfo2.nameKnown) {
                                agentCircuit.RequestObjectName(objectInfo2);
                            }
                            builder.add(objectInfo2);
                        }
                    }
                } catch (NoSuchElementException e) {
                    Debug.Warning(e);
                }
            }
        }
        return builder.build();
    }

    public synchronized void initSpatialIndex() {
        try {
            Iterator<SLObjectInfo> it = this.rootObjects.values().iterator();
            while (it.hasNext()) {
                ((SLObjectInfo) it.next()).updateSpatialIndex(true);
            }
        } catch (ConcurrentModificationException e) {
            Debug.Warning(e);
        }
    }

    public synchronized boolean isParentOrSame(UUID uuid, UUID uuid2) {
        if (uuid2.equals(uuid)) {
            return true;
        }
        SLObjectInfo objectInfo = this.allObjectsNearby.get(uuid2);
        if (objectInfo != null) {
            for (SLObjectInfo parentObject = objectInfo.getParentObject(); parentObject != null; parentObject = parentObject.getParentObject()) {
                if (parentObject.getId().equals(uuid)) {
                    return true;
                }
            }
        }
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:46:0x00f1  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00f7  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    boolean killObject(SLAgentCircuit agentCircuit, int i) {
        boolean z = false;
        boolean z2 = false;
        boolean z3 = false;
        boolean z4 = false;
        LinkedList linkedList;
        LinkedList<SLObjectInfo> objectInfos = null;
        synchronized (this) {
            UUID uuidRemove = this.uuidsNearby.remove(Integer.valueOf(i));
            if (uuidRemove != null) {
                this.objectNamesQueue.remove(uuidRemove);
                SLObjectInfo removed = this.allObjectsNearby.remove(uuidRemove);
                if (removed != null) {
                    removed.isDead = true;
                    if (removed.parentID == 0) {
                        this.rootObjects.remove(Integer.valueOf(i));
                    } else {
                        UUID uuid = this.uuidsNearby.get(Integer.valueOf(removed.parentID));
                        SLObjectInfo objectInfo = uuid != null ? this.allObjectsNearby.get(uuid) : null;
                        if (objectInfo != null) {
                            objectInfo.removeChild(removed);
                            if (objectInfo instanceof SLObjectAvatarInfo) {
                                SLObjectAvatarInfo objectAvatarInfo = (SLObjectAvatarInfo) objectInfo;
                                if (objectAvatarInfo.isMyAvatar()) {
                                    agentCircuit.processMyAttachmentUpdate(objectAvatarInfo);
                                }
                            }
                        } else {
                            LinkedList<SLObjectInfo> objectInfos2 = this.orphanObjects.get(Integer.valueOf(removed.parentID));
                            if (objectInfos2 != null) {
                                objectInfos2.remove(removed);
                                if (objectInfos2.isEmpty()) {
                                    this.orphanObjects.remove(Integer.valueOf(removed.parentID));
                                }
                            }
                        }
                    }
                    try {
                        for (SLObjectInfo objectInfo2 : removed.treeNode) {
                            if (objectInfo2.isAvatar()) {
                                if (objectInfos == null) {
                                    objectInfos = new LinkedList();
                                }
                                objectInfos.add(objectInfo2);
                                linkedList = objectInfos;
                            } else {
                                killObject(agentCircuit, objectInfo2.localID);
                                linkedList = objectInfos;
                            }
                            objectInfos = linkedList;
                        }
                        if (objectInfos != null) {
                            z3 = false;
                            for (SLObjectInfo objectInfo3 : objectInfos) {
                                try {
                                    removed.removeChild(objectInfo3);
                                    objectInfo3.parentID = 0;
                                    if ((objectInfo3 instanceof SLObjectAvatarInfo) && ((SLObjectAvatarInfo) objectInfo3).isMyAvatar()) {
                                        z3 = true;
                                    }
                                    this.rootObjects.put(Integer.valueOf(objectInfo3.localID), objectInfo3);
                                } catch (NoSuchElementException exception) {
                                    Debug.Warning(exception);
                                    z4 = z3;
                                }
                            }
                            z4 = z3;
                        } else {
                            z4 = false;
                        }
                    } catch (NoSuchElementException exception) {
                        Debug.Warning(exception);
                        z3 = false;
                        z4 = false;
                    }
                    removed.removeFromSpatialIndex();
                    z = z4;
                } else {
                    z = false;
                }
            }
            z2 = uuidRemove != null;
        }
        if (this.userManager != null) {
            this.userManager.getObjectsManager().requestObjectProfileUpdate(i);
            if (z) {
                this.userManager.getObjectsManager().myAvatarState().requestUpdate(SubscriptionSingleKey.Value);
            }
        }
        return z2;
    }

    public synchronized void reset(UserManager userManager) {
        if (userManager != this.userManager) {
            if (this.userManager != null) {
                this.userManager.getObjectsManager().clearParcelInfo(this);
            }
            this.userManager = userManager;
            if (this.userManager != null) {
                this.userManager.getObjectsManager().setParcelInfo(this);
            }
        }
        this.uuidsNearby.clear();
        for (SLObjectInfo objectInfo : this.allObjectsNearby.values()) {
            DrawListObjectEntry existingDrawListEntry = objectInfo.getExistingDrawListEntry();
            if (existingDrawListEntry != null) {
                existingDrawListEntry.requestEntryRemoval();
            }
            objectInfo.clearDrawListEntry();
        }
        this.allObjectsNearby.clear();
        this.rootObjects.clear();
        this.orphanObjects.clear();
        this.objectNamesQueue.clear();
        this.terrainData.reset();
        this.simSunHour = 0.5f;
        this.simSunHourDirty = false;
    }

    public void setAgentAvatar(SLObjectAvatarInfo objectAvatarInfo) {
        synchronized (this.agentAvatarLock) {
            this.agentAvatar = objectAvatarInfo;
        }
    }

    public void setDrawDistance(float drawDistance) {
        synchronized (this) {
            if (this.drawDistance != drawDistance) {
                this.drawDistance = drawDistance;
            }
        }
    }

    void setSunHour(float simSunHour) {
        Debug.Printf("Windlight: Simulator sun hour set to %f", Float.valueOf(simSunHour));
        synchronized (this.simSunHourLock) {
            this.simSunHour = simSunHour;
            this.simSunHourDirty = true;
        }
    }

    synchronized boolean updateObjectParent(int i, SLObjectInfo objectInfo3) {
        synchronized (this) {
            if (i == objectInfo3.parentID) {
                return false;
            }
            if (i != 0) {
                UUID uuid = this.uuidsNearby.get(Integer.valueOf(i));
                SLObjectInfo objectInfo = uuid != null ? this.allObjectsNearby.get(uuid) : null;
                if (objectInfo != null) {
                    objectInfo.removeChild(objectInfo3);
                    objectInfo.updateSpatialIndex(false);
                }
                LinkedList<SLObjectInfo> linkedList = this.orphanObjects.get(Integer.valueOf(i));
                if (linkedList != null) {
                    linkedList.remove(objectInfo3);
                }
            } else {
                this.rootObjects.remove(Integer.valueOf(objectInfo3.localID));
            }
            if (objectInfo3.parentID != 0) {
                UUID uuid2 = this.uuidsNearby.get(Integer.valueOf(objectInfo3.parentID));
                SLObjectInfo objectInfo2 = uuid2 != null ? this.allObjectsNearby.get(uuid2) : null;
                if (objectInfo2 != null) {
                    objectInfo3.hierLevel = objectInfo2.hierLevel + 1;
                    objectInfo3.setIsAttachmentAll(!objectInfo2.isAvatar() ? objectInfo2.isAttachment : true);
                    objectInfo2.addChild(objectInfo3);
                } else {
                    LinkedList<SLObjectInfo> objectInfos = this.orphanObjects.get(Integer.valueOf(objectInfo3.parentID));
                    if (objectInfos == null) {
                        objectInfos = new LinkedList<>();
                        this.orphanObjects.put(Integer.valueOf(objectInfo3.parentID), objectInfos);
                    }
                    objectInfos.add(objectInfo3);
                }
            } else {
                objectInfo3.hierLevel = 0;
                objectInfo3.setIsAttachmentAll(false);
                this.rootObjects.put(Integer.valueOf(objectInfo3.localID), objectInfo3);
            }
            objectInfo3.updateSpatialIndex(false);
            return true;
        }
    }
}
