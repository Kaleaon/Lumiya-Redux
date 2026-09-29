package com.lumiyaviewer.lumiya.slproto

import com.google.common.base.Strings
import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.render.spatial.DrawListObjectEntry
import com.lumiyaviewer.lumiya.slproto.messages.AvatarAnimation
import com.lumiyaviewer.lumiya.slproto.messages.AvatarAppearance
import com.lumiyaviewer.lumiya.slproto.modules.SLAvatarControl
import com.lumiyaviewer.lumiya.slproto.objects.SLAvatarObjectDisplayInfo
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectAvatarInfo
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectDisplayInfo
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectFilterInfo
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectInfo
import com.lumiyaviewer.lumiya.slproto.objects.SLPrimObjectDisplayInfo
import com.lumiyaviewer.lumiya.slproto.objects.SLPrimObjectDisplayInfoWithChildren
import com.lumiyaviewer.lumiya.slproto.terrain.TerrainData
import com.lumiyaviewer.lumiya.slproto.types.ImmutableVector
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import com.lumiyaviewer.lumiya.slproto.users.MultipleChatterNameRetriever
import com.lumiyaviewer.lumiya.slproto.users.manager.ObjectsManager
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.utils.LinkedTreeNode
import java.util.ArrayList
import java.util.Collection
import java.util.Collections
import java.util.Comparator
import java.util.ConcurrentModificationException
import java.util.HashMap
import java.util.HashSet
import java.util.Iterator
import java.util.LinkedHashMap
import java.util.LinkedList
import java.util.Map
import java.util.NoSuchElementException
import java.util.Set
import java.util.UUID
import java.util.concurrent.ConcurrentHashMap

open class SLParcelInfo {
    private var userManager: UserManager? = null
    private var drawDistance: Float = 0.0f
    var terrainData: TerrainData = TerrainData()
    private var agentAvatarLock: Any = Object()
    private var agentAvatar: SLObjectAvatarInfo? = null
    private var simSunHourLock: Any = Object()
    private var simSunHour: Float = 0.5f
    private var simSunHourDirty: Boolean = true
    var uuidsNearby: if (MutableMap<Int) , UUID> = HashMap()
    var allObjectsNearby else MutableMap<UUID, SLObjectInfo> = ConcurrentHashMap(1024, 0.75f, 1)
    private var rootObjects: if (MutableMap<Int) , SLObjectInfo> = ConcurrentHashMap(128, 0.75f, 1)
    private Map<Integer, LinkedList<SLObjectInfo>> orphanObjects = HashMap()
    var objectNamesQueue else MutableMap<UUID, SLObjectInfo> = Collections.synchronizedMap(LinkedHashMap())
    private var objectDisplayInfoComparator: Comparator<SLObjectDisplayInfo> = Comparator() {
        private /* synthetic */ int $m$0(Object obj, Object obj2) {
            var compare: Int = 0
            compare = Float.compare((obj as SLObjectDisplayInfo).distance, (obj2 as SLObjectDisplayInfo).distance)
        return compare
        }
        fun compare(obj: Any, obj2: Any): Int {
            return $m$0(obj, obj2)
        }
    }

    private fun addDisplayObjects(iterable: Iterable<SLObjectInfo>, objectFilterInfo: SLObjectFilterInfo, immutableVector: ImmutableVector, z: Boolean, multipleChatterNameRetriever: MultipleChatterNameRetriever, set: MutableSet<UUID>, z2: Boolean): ArrayList<SLObjectDisplayInfo> {
        var arrayList: ArrayList<SLObjectDisplayInfo>? = null
        var z3: Boolean = false
        var objectDisplayInfos: ArrayList<SLObjectDisplayInfo>? = null
        var it: Iterator<SLObjectInfo> = iterable.iterator()
        while (true) {
            var objectDisplayInfos2: ArrayList<SLObjectDisplayInfo> = objectDisplayInfos
            if (!it.hasNext()) {
        return objectDisplayInfos2
            }
            var next: SLObjectInfo = it.next()
            if (next != null) {
                var linkedTreeNode: LinkedTreeNode<SLObjectInfo> = next.treeNode
                if (linkedTreeNode.hasChildren()) {
                    arrayList = if (addDisplayObjects(linkedTreeNode, objectFilterInfo, immutableVector, false, multipleChatterNameRetriever, set, !next.isAvatar()) z2 else true)
                } else {
                    arrayList = null
                }
                var absolutePosition: LLVector3 = next.getAbsolutePosition()
                var distanceTo: Float = immutableVector.distanceTo(absolutePosition.x, absolutePosition.y, absolutePosition.z)
                var z4: Boolean = if (arrayList != null) !arrayList.isEmpty() else false
                var objectMatches: Boolean = objectFilterInfo.objectMatches(next, distanceTo, z2)
                if (z4 || objectMatches) {
                    var knownName: String = getKnownName(next, multipleChatterNameRetriever, set)
                    var nameMatches: Boolean = objectFilterInfo.nameMatches(knownName)
                    if (z4 || nameMatches) {
                        if (z4) {
                            z3 = !(if (objectMatches) nameMatches else false)
                        } else {
                            z3 = false
                        }
                        if (objectDisplayInfos2 == null) {
                            objectDisplayInfos2 = ArrayList<>()
                        }
                        if (!z) {
                            if (objectDisplayInfos2.add(next.isAvatar()) SLAvatarObjectDisplayInfo(knownName, next, distanceTo, ImmutableList.of(), z3) else SLPrimObjectDisplayInfo(next, distanceTo))
                            if (arrayList != null) {
                                objectDisplayInfos2.addAll(arrayList)
                            }
                        } else if (next.isAvatar()) {
                            objectDisplayInfos2.add(SLAvatarObjectDisplayInfo(knownName, next, distanceTo, if (arrayList != null) ImmutableList.copyOf(arrayList as Collection) else ImmutableList.of(), z3))
                        } else if (arrayList == null || arrayList.isEmpty()) {
                            objectDisplayInfos2.add(SLPrimObjectDisplayInfo(next, distanceTo))
                        } else {
                            objectDisplayInfos2.add(SLPrimObjectDisplayInfoWithChildren(next, distanceTo, ImmutableList.copyOf(arrayList as Collection), z3))
                        }
                    }
                }
            }
            objectDisplayInfos = objectDisplayInfos2
        }
    }

    private fun getKnownName(objectInfo: SLObjectInfo, multipleChatterNameRetriever: MultipleChatterNameRetriever, set: MutableSet<UUID>): String {
        if (objectInfo.isAvatar()) {
            var id: UUID = objectInfo.getId()
            if (id == null) {
        return null
            }
            set.add(id)
            return multipleChatterNameRetriever.addChatter(id)
        }
        if (!objectInfo.nameKnown && (!this.objectNamesQueue.containsKey(objectInfo.getId()))) {
            this.objectNamesQueue.put(objectInfo.getId(), objectInfo)
        }
        if (objectInfo.nameKnown) {
            return Strings.nullToEmpty(objectInfo.name)
        }
        return null
    }

    fun ApplyAvatarAnimation(avatarAnimation: AvatarAnimation, avatarControl: SLAvatarControl) {
        var objectInfo: SLObjectInfo = this.allObjectsNearby.get(avatarAnimation.Sender_Field.ID)
        if (objectInfo is SLObjectAvatarInfo) {
            var objectAvatarInfo: SLObjectAvatarInfo = objectInfo as SLObjectAvatarInfo
            objectAvatarInfo.ApplyAvatarAnimation(avatarAnimation)
            if (objectAvatarInfo.isMyAvatar() && avatarControl != null) {
                avatarControl.ApplyAvatarAnimation(objectAvatarInfo, avatarAnimation)
            }
        }
    }

    fun ApplyAvatarAppearance(avatarAppearance: AvatarAppearance) {
        var objectInfo: SLObjectInfo = this.allObjectsNearby.get(avatarAppearance.Sender_Field.ID)
        if (objectInfo is SLObjectAvatarInfo) {
            (objectInfo as SLObjectAvatarInfo).ApplyAvatarAppearance(avatarAppearance)
        }
    }

    fun addObject(objectInfo3: SLObjectInfo): Boolean {
        synchronized(this) {
            if (this.uuidsNearby.containsKey(objectInfo3.localID) || this.allObjectsNearby.containsKey(objectInfo3.getId())) {
        return false
            }
            this.uuidsNearby.put(objectInfo3.localID, objectInfo3.getId())
            this.allObjectsNearby.put(objectInfo3.getId(), objectInfo3)
            if (objectInfo3.parentID != 0) {
                var uuid: UUID = this.uuidsNearby.get(objectInfo3.parentID)
                var objectInfo: SLObjectInfo = if (uuid != null) this.allObjectsNearby.get(uuid) else null
                if (objectInfo != null) {
                    objectInfo3.hierLevel = objectInfo.hierLevel + 1
                    if (objectInfo3.setIsAttachmentAll(!objectInfo.isAvatar()) objectInfo.isAttachment else true)
                    objectInfo.addChild(objectInfo3)
                } else {
                    var linkedList: LinkedList<SLObjectInfo> = this.orphanObjects.get(objectInfo3.parentID)
                    if (linkedList == null) {
                        linkedList = LinkedList<>()
                        this.orphanObjects.put(objectInfo3.parentID, linkedList)
                    }
                    linkedList.add(objectInfo3)
                }
            } else {
                this.rootObjects.put(objectInfo3.localID, objectInfo3)
            }
            var remove: LinkedList<SLObjectInfo> = this.orphanObjects.remove(objectInfo3.localID)
            if (remove != null) {
                for (objectInfo2 in remove) {
                    objectInfo2.hierLevel = objectInfo3.hierLevel + 1
                    objectInfo2.setIsAttachmentAll(!if (objectInfo3.isAttachment) objectInfo3.isAttachment else true)
                    objectInfo3.addChild(objectInfo2)
                }
            }
            objectInfo3.updateSpatialIndex(false)
        return true
        }
    }

    fun getAgentAvatar(): SLObjectAvatarInfo {
        var agentAvatar: SLObjectAvatarInfo? = null
        synchronized(this.agentAvatarLock) {
            agentAvatar = this.agentAvatar
        }
        return agentAvatar
    }

    fun getAvatarObject(uuid: UUID): SLObjectInfo {
        return this.allObjectsNearby.get(uuid)
    }

    fun getDisplayObjects(immutableVector: ImmutableVector, objectFilterInfo: SLObjectFilterInfo, multipleChatterNameRetriever: MultipleChatterNameRetriever): ObjectsManager.ObjectDisplayList {
        var addDisplayObjects: ArrayList<SLObjectDisplayInfo>? = null
        var size: Int = 0
        var hashSet: HashSet = HashSet()
        synchronized(this) {
            addDisplayObjects = addDisplayObjects(this.rootObjects.values(), objectFilterInfo, immutableVector, true, multipleChatterNameRetriever, hashSet, false)
            size = this.objectNamesQueue.size()
        }
        multipleChatterNameRetriever.retainChatters(hashSet)
        var objArr: Array<Any> = arrayOfNulls<Object>(2)
        objArr[0] = if (addDisplayObjects != null) Integer.toString(addDisplayObjects.size()) else "null"
        objArr[1] = size
        Debug.Printf("getDisplayObjects: objectList is %s, load queue %d", objArr)
        if (addDisplayObjects == null) {
            return ObjectsManager.ObjectDisplayList(ImmutableList.of(), size != 0)
        }
        Collections.sort(addDisplayObjects, this.objectDisplayInfoComparator)
        return ObjectsManager.ObjectDisplayList(ImmutableList.copyOf(addDisplayObjects as Collection), size != 0)
    }

    fun getObjectInfo(i: Int): SLObjectInfo {
        var uuid: UUID = this.uuidsNearby.get(i)
        if (uuid == null) {
        return null
        }
        return this.allObjectsNearby.get(uuid)
    }

    fun getObjectLocalID(uuid: UUID): Int {
        var localID: Int = 0
        synchronized(this) {
            if (uuid != null) {
                var objectInfo: SLObjectInfo = this.allObjectsNearby.get(uuid)
                if (objectInfo != null) {
                    localID = objectInfo.localID
                }
            }
            localID = -1
        }
        return localID
    }

    fun getObjectUUID(i: Int): UUID {
        var uuid: UUID? = null
        synchronized(this) {
            uuid = this.uuidsNearby.get(i)
        }
        return uuid
    }

    /** The simulator's sun hour (0..1), without consuming the legacy renderer's change flag. */
    fun peekSunHour(): Float {
        synchronized(this.simSunHourLock) {
            return this.simSunHour
        }
    }

    fun getSunHour(floats: FloatArray, z: Boolean): Boolean {
        synchronized(this.simSunHourLock) {
            if (!this.simSunHourDirty && !z) {
        return false
            }
            floats[0] = this.simSunHour
            this.simSunHourDirty = false
        return true
        }
    }

    fun getUserTouchableObjects(agentCircuit: SLAgentCircuit, uuid: UUID): ImmutableList<SLObjectInfo> {
        var builder: ImmutableList.Builder = ImmutableList.builder()
        synchronized(this) {
            var objectInfo: SLObjectInfo = this.allObjectsNearby.get(uuid)
            if (objectInfo != null) {
                try {
                    for (objectInfo2 in objectInfo.treeNode) {
                        if (objectInfo2.isTouchable()) {
                            if (!objectInfo2.nameKnown) {
                                agentCircuit.RequestObjectName(objectInfo2)
                            }
                            builder.add(objectInfo2)
                        }
                    }
                } catch (e: NoSuchElementException) {
                    Debug.Warning(e)
                }
            }
        }
        return builder.build()
    }

    fun initSpatialIndex() {
        try {
            var it: Iterator<SLObjectInfo> = this.rootObjects.values().iterator()
            while (it.hasNext()) {
                (it as SLObjectInfo.next()).updateSpatialIndex(true)
            }
        } catch (e: ConcurrentModificationException) {
            Debug.Warning(e)
        }
    }

    fun isParentOrSame(uuid: UUID, uuid2: UUID): Boolean {
        if (uuid2.equals(uuid)) {
        return true
        }
        var objectInfo: SLObjectInfo = this.allObjectsNearby.get(uuid2)
        if (objectInfo != null) {
            for (SLObjectInfo parentObject = objectInfo.getParentObject(); parentObject != null; parentObject = parentObject.getParentObject()) {
                if (parentObject.getId().equals(uuid)) {
        return true
                }
            }
        }
        return false
    }

    /* JADX WARN: Removed duplicated region for block: B:46:0x00f1  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00f7  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    fun killObject(agentCircuit: SLAgentCircuit, i: Int): Boolean {
        var z: Boolean = false
        var z2: Boolean = false
        var z3: Boolean = false
        var z4: Boolean = false
        var linkedList: LinkedList? = null
        var objectInfos: LinkedList<SLObjectInfo>? = null
        synchronized(this) {
            var uuidRemove: UUID = this.uuidsNearby.remove(i)
            if (uuidRemove != null) {
                this.objectNamesQueue.remove(uuidRemove)
                var removed: SLObjectInfo = this.allObjectsNearby.remove(uuidRemove)
                if (removed != null) {
                    removed.isDead = true
                    if (removed.parentID == 0) {
                        this.rootObjects.remove(i)
                    } else {
                        var uuid: UUID = this.uuidsNearby.get(removed.parentID)
                        var objectInfo: SLObjectInfo = if (uuid != null) this.allObjectsNearby.get(uuid) else null
                        if (objectInfo != null) {
                            objectInfo.removeChild(removed)
                            if (objectInfo is SLObjectAvatarInfo) {
                                var objectAvatarInfo: SLObjectAvatarInfo = objectInfo as SLObjectAvatarInfo
                                if (objectAvatarInfo.isMyAvatar()) {
                                    agentCircuit.processMyAttachmentUpdate(objectAvatarInfo)
                                }
                            }
                        } else {
                            var objectInfos2: LinkedList<SLObjectInfo> = this.orphanObjects.get(removed.parentID)
                            if (objectInfos2 != null) {
                                objectInfos2.remove(removed)
                                if (objectInfos2.isEmpty()) {
                                    this.orphanObjects.remove(removed.parentID)
                                }
                            }
                        }
                    }
                    try {
                        for (objectInfo2 in removed.treeNode) {
                            if (objectInfo2.isAvatar()) {
                                if (objectInfos == null) {
                                    objectInfos = LinkedList()
                                }
                                objectInfos.add(objectInfo2)
                                linkedList = objectInfos
                            } else {
                                killObject(agentCircuit, objectInfo2.localID)
                                linkedList = objectInfos
                            }
                            objectInfos = linkedList
                        }
                        if (objectInfos != null) {
                            z3 = false
                            for (objectInfo3 in objectInfos) {
                                try {
                                    removed.removeChildobjectInfo3 as objectInfo3.parentID = 0
                                    if ((objectInfo3 is SLObjectAvatarInfo) && (objectInfo3 as SLObjectAvatarInfo).isMyAvatar()) {
                                        z3 = true
                                    }
                                    this.rootObjects.put(objectInfo3.localID, objectInfo3)
                                } catch (exception: NoSuchElementException) {
                                    Debug.Warning(exception)
                                    z4 = z3
                                }
                            }
                            z4 = z3
                        } else {
                            z4 = false
                        }
                    } catch (exception: NoSuchElementException) {
                        Debug.Warning(exception)
                        z3 = false
                        z4 = false
                    }
                    removed.removeFromSpatialIndex()
                    z = z4
                } else {
                    z = false
                }
            }
            z2 = uuidRemove != null
        }
        if (this.userManager != null) {
            this.userManager.getObjectsManager().requestObjectProfileUpdate(i)
            if (z) {
                this.userManager.getObjectsManager().myAvatarState().requestUpdate(SubscriptionSingleKey.Value)
            }
        }
        return z2
    }

    fun reset(userManager: UserManager) {
        if (userManager != this.userManager) {
            if (this.userManager != null) {
                this.userManager.getObjectsManager().clearParcelInfo(this)
            }
            this.userManager = userManager
            if (this.userManager != null) {
                this.userManager.getObjectsManager().setParcelInfo(this)
            }
        }
        this.uuidsNearby.clear()
        for (objectInfo in this.allObjectsNearby.values()) {
            var existingDrawListEntry: DrawListObjectEntry = objectInfo.getExistingDrawListEntry()
            if (existingDrawListEntry != null) {
                existingDrawListEntry.requestEntryRemoval()
            }
            objectInfo.clearDrawListEntry()
        }
        this.allObjectsNearby.clear()
        this.rootObjects.clear()
        this.orphanObjects.clear()
        this.objectNamesQueue.clear()
        this.terrainData.reset()
        this.simSunHour = 0.5f
        this.simSunHourDirty = false
    }

    fun setAgentAvatar(objectAvatarInfo: SLObjectAvatarInfo) {
        synchronized(this.agentAvatarLock) {
            this.agentAvatar = objectAvatarInfo
        }
    }

    fun setDrawDistance(drawDistance: Float) {
        synchronized(this) {
            if (this.drawDistance != drawDistance) {
                this.drawDistance = drawDistance
            }
        }
    }

    fun setSunHour(simSunHour: Float) {
        Debug.Printf("Windlight: Simulator sun hour set to %f", simSunHour)
        synchronized(this.simSunHourLock) {
            this.simSunHour = simSunHour
            this.simSunHourDirty = true
        }
    }

    fun updateObjectParent(i: Int, objectInfo3: SLObjectInfo): Boolean {
        synchronized(this) {
            if (i == objectInfo3.parentID) {
        return false
            }
            if (i != 0) {
                var uuid: UUID = this.uuidsNearby.get(i)
                var objectInfo: SLObjectInfo = if (uuid != null) this.allObjectsNearby.get(uuid) else null
                if (objectInfo != null) {
                    objectInfo.removeChildobjectInfo as objectInfo3.updateSpatialIndex(false)
                }
                var linkedList: LinkedList<SLObjectInfo> = this.orphanObjects.get(i)
                if (linkedList != null) {
                    linkedList.remove(objectInfo3)
                }
            } else {
                this.rootObjects.remove(objectInfo3.localID)
            }
            if (objectInfo3.parentID != 0) {
                var uuid2: UUID = this.uuidsNearby.get(objectInfo3.parentID)
                var objectInfo2: SLObjectInfo = if (uuid2 != null) this.allObjectsNearby.get(uuid2) else null
                if (objectInfo2 != null) {
                    objectInfo3.hierLevel = objectInfo2.hierLevel + 1
                    if (objectInfo3.setIsAttachmentAll(!objectInfo2.isAvatar()) objectInfo2.isAttachment else true)
                    objectInfo2.addChild(objectInfo3)
                } else {
                    var objectInfos: LinkedList<SLObjectInfo> = this.orphanObjects.get(objectInfo3.parentID)
                    if (objectInfos == null) {
                        objectInfos = LinkedList<>()
                        this.orphanObjects.put(objectInfo3.parentID, objectInfos)
                    }
                    objectInfos.add(objectInfo3)
                }
            } else {
                objectInfo3.hierLevel = 0
                objectInfo3.setIsAttachmentAllthis as false.rootObjects.put(objectInfo3.localID, objectInfo3)
            }
            objectInfo3.updateSpatialIndex(false)
        return true
        }
    }
}
