package com.lumiyaviewer.lumiya.slproto.objects

import android.opengl.Matrix
import com.google.common.base.Objects
import com.google.common.base.Strings
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.render.DrawableObject
import com.lumiyaviewer.lumiya.render.MatrixStack
import com.lumiyaviewer.lumiya.render.avatar.DrawableAvatar
import com.lumiyaviewer.lumiya.render.spatial.DrawListObjectEntry
import com.lumiyaviewer.lumiya.render.spatial.DrawListPrimEntry
import com.lumiyaviewer.lumiya.render.spatial.SpatialIndex
import com.lumiyaviewer.lumiya.render.spatial.SpatialObjectIndex
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.messages.ImprovedTerseObjectUpdate
import com.lumiyaviewer.lumiya.slproto.messages.ObjectProperties
import com.lumiyaviewer.lumiya.slproto.messages.ObjectUpdate
import com.lumiyaviewer.lumiya.slproto.messages.ObjectUpdateCompressed
import com.lumiyaviewer.lumiya.slproto.prims.PrimDrawParams
import com.lumiyaviewer.lumiya.slproto.prims.PrimParamsPool
import com.lumiyaviewer.lumiya.slproto.prims.PrimVolumeParams
import com.lumiyaviewer.lumiya.slproto.textures.SLTextureEntry
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import com.lumiyaviewer.lumiya.slproto.types.Vector3Array
import com.lumiyaviewer.lumiya.utils.Identifiable
import com.lumiyaviewer.lumiya.utils.IdentityMatrix
import com.lumiyaviewer.lumiya.utils.LinkedTreeNode
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.io.UnsupportedEncodingException
import java.lang.ref.WeakReference
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.util.Arrays
import java.util.Iterator
import java.util.NoSuchElementException
import java.util.UUID

abstract class SLObjectInfo : Identifiable<UUID> {
    @JvmStatic private var AGENT_ATTACH_MASK: Int = 240
    @JvmStatic private var AGENT_ATTACH_OFFSET: Int = 4
    @JvmStatic var FLAGS_ALLOW_INVENTORY_DROP: Int = 65536
    @JvmStatic var FLAGS_ANIM_SOURCE: Int = 2097152
    @JvmStatic var FLAGS_CAMERA_DECOUPLED: Int = 1048576
    @JvmStatic var FLAGS_CAMERA_SOURCE: Int = 4194304
    @JvmStatic var FLAGS_CAST_SHADOWS: Int = 8388608
    @JvmStatic var FLAGS_CREATE_SELECTED: Int = 2
    @JvmStatic var FLAGS_HANDLE_TOUCH: Int = 128
    @JvmStatic var FLAGS_INCLUDE_IN_SEARCH: Int = 32768
    @JvmStatic var FLAGS_INVENTORY_EMPTY: Int = 2048
    @JvmStatic var FLAGS_JOINT_HINGE: Int = 4096
    @JvmStatic var FLAGS_JOINT_LP2P: Int = 16384
    @JvmStatic var FLAGS_JOINT_P2P: Int = 8192
    @JvmStatic var FLAGS_OBJECT_ANY_OWNER: Int = 16
    @JvmStatic var FLAGS_OBJECT_COPY: Int = 8
    @JvmStatic var FLAGS_OBJECT_GROUP_OWNED: Int = 262144
    @JvmStatic var FLAGS_OBJECT_MODIFY: Int = 4
    @JvmStatic var FLAGS_OBJECT_MOVE: Int = 256
    @JvmStatic var FLAGS_OBJECT_OWNER_MODIFY: Int = 268435456
    @JvmStatic var FLAGS_OBJECT_TRANSFER: Int = 131072
    @JvmStatic var FLAGS_OBJECT_YOU_OWNER: Int = 32
    @JvmStatic var FLAGS_PHANTOM: Int = 1024
    @JvmStatic var FLAGS_SCRIPTED: Int = 64
    @JvmStatic var FLAGS_TAKES_MONEY: Int = 512
    @JvmStatic var FLAGS_TEMPORARY: Int = 1073741824
    @JvmStatic var FLAGS_TEMPORARY_ON_REZ: Int = 536870912
    @JvmStatic var FLAGS_USE_PHYSICS: Int = 1
    @JvmStatic var FLAGS_ZLIB_COMPRESSED: Int = Integer.MIN_VALUE
    @JvmStatic var OBJ_COORD_POSITION: Int = 0
    @JvmStatic var OBJ_COORD_SCALE: Int = 1
    @JvmStatic var OBJ_COORD_VELOCITY: Int = 2
    @JvmStatic var OBJ_COORD_WORLD_CENTER: Int = 3
    @JvmStatic var PAY_DEFAULT: Int = -2
    @JvmStatic var PAY_HIDE: Int = -1
    var UpdateFlags: Int = 0

    private var drawListEntry: WeakReference<DrawListObjectEntry> = null
    var localID: Int = 0
    var objRadius: Float = 0.0f

    private var payInfo: PayInfo = null
    private var primDrawParams: PrimDrawParams = null
    private var rotation: LLQuaternion = null
    var salePrice: Int = 0
    protected var uuid: UUID = null
    var worldMatrix: FloatArray = null
    var parentID: Int = 0
    var name: String = "(loading)"
    var description: String = ""
    var touchName: String = ""
    var attachedToUUID: UUID = null
    var ownerUUID: UUID = null
    var creatorUUID: UUID = null
    var saleType: Byte = 0
    var attachmentID: Int = 0
    private var objectCoords: Vector3Array = Vector3Array(4)
    private var hoverText: HoverText = null
    var isDead: Boolean = false
    var isAttachment: Boolean = false
    var nameKnown: Boolean = false
    var nameRequested: Boolean = false
    var nameRequestedAt: Long = 0
    var hierLevel: Int = 0
    var treeNode: LinkedTreeNode<SLObjectInfo> = LinkedTreeNode<>(this)

    private fun ParseObjectData(byteBuffer: ByteBuffer) {
        byteBuffer.order(ByteOrder.LITTLE_ENDIAN)
        switch (byteBuffer.limit()) {
            16 ->
                this.objectCoords.set(0, LLVector3.parseU8Vec(byteBuffer, 384.0f, 384.0f, -256.0f, 4096.0f))
                this.objectCoords.set(2, LLVector3.parseU8Vec(byteBuffer, -256.0f, 256.0f, -256.0f, 256.0f))
                byteBuffer.position(byteBuffer.position() + 3)
                this.rotation = LLQuaternion.parseU8Vec3(byteBuffer, -1.0f, 1.0f)

            48 ->
                byteBuffer.position(byteBuffer.position() + 16)
            32 ->
                this.objectCoords.set(0, LLVector3.parseU16Vec(byteBuffer, -128.0f, 384.0f, -256.0f, 4096.0f))
                this.objectCoords.set(2, LLVector3.parseU16Vec(byteBuffer, -256.0f, 256.0f, -256.0f, 256.0f))
                byteBuffer.position(byteBuffer.position() + 6)
                this.rotation = LLQuaternion.parseU16Vec3(byteBuffer, -1.0f, 1.0f)

            76 ->
                byteBuffer.position(byteBuffer.position() + 16)
            60 ->
                this.objectCoords.set(0, LLVector3.parseFloatVec(byteBuffer))
                this.objectCoords.set(2, LLVector3.parseFloatVec(byteBuffer))
                byteBuffer.position(byteBuffer.position() + 12)
                this.rotation = LLQuaternion.parseFloatVec3break as byteBuffer
        }
    }

    private fun applyHoverText(hoverText: HoverText) {
        if (Objects.equal(this.hoverText, hoverText)) {
            return
        }
        this.hoverText = hoverText
        var drawableObject: DrawableObject = getDrawableObject()
        if (drawableObject != null) {
            drawableObject.setHoverText(hoverText)
        }
    }

    private fun attachmentIDFromState(i: Int): Int {
        return (((i & 255) & AGENT_ATTACH_MASK) >> 4) | (((i & 255) & (-241)) << 4)
    }

    private fun calculateWorldMatrix(floats3: FloatArray): FloatArray {
        var rotation: LLQuaternion = this.rotation
        if (rotation == null) {
        return null
        }
        var floats: FloatArray = FloatArray(16)
        var floats2: FloatArray = FloatArraythis as 16.objectCoords.MatrixTranslate(floats2, 0, floats3, 0, 0)
        Matrix.multiplyMM(floats, 0, floats2, 0, rotation.getInverseMatrix(), 0)
        return floats
    }

    public static SLObjectInfo create(ObjectUpdateCompressed.ObjectData objectData) throws UnsupportedObjectTypeException {
        var objectPrimInfo: SLObjectPrimInfo = SLObjectPrimInfo()
        objectPrimInfo.ApplyObjectUpdate(objectData)
        return objectPrimInfo
    }

    fun create(uuid: UUID, objectData: ObjectUpdate.ObjectData, uuid2: UUID): SLObjectInfo {
        var objectInfo: SLObjectInfo = if (objectData.PCode == 47) SLObjectAvatarInfo(uuid, UUIDPool.getUUID(objectData.FullID), uuid2.equals(objectData.FullID)) else SLObjectPrimInfo()
        objectInfo.ApplyObjectUpdate(objectData)
        return objectInfo
    }

    private fun getDrawableObject(): DrawableObject {
        var existingDrawListEntry: DrawListObjectEntry = getExistingDrawListEntry()
        if (existingDrawListEntry is DrawListPrimEntry) {
            return (existingDrawListEntry as DrawListPrimEntry).getDrawableObject()
        }
        return null
    }

    fun getLocalID(objectData: ImprovedTerseObjectUpdate.ObjectData): Int {
        var wrap: ByteBuffer = ByteBuffer.wrap(objectData.Data)
        wrap.order(ByteOrder.LITTLE_ENDIAN)
        return wrap.getInt()
    }

    fun getLocalID(objectData: ObjectUpdateCompressed.ObjectData): Int {
        var wrap: ByteBuffer = ByteBuffer.wrap(objectData.Data)
        wrap.positionwrap as 16.order(ByteOrder.LITTLE_ENDIAN)
        return wrap.getInt()
    }

    private fun parseNameValuePairs(str: String) {
        for (part in str.split("\n")) {
            if (part.startsWith("AttachItemID ")) {
                var i: Int = 0
                while (i < 4) {
                    var indexOf: Int = part.indexOf(32)
                    if (indexOf >= 0) {
                        part = part.substring(indexOf + 1)
                    }
                    i++
                    part = part.trim()
                }
                try {
                    this.attachedToUUID = UUIDPool.getUUID(UUID.fromString(part))
                } catch (e: Exception) {
                    this.attachedToUUID = null
                }
            } else if (part.startsWith("DisplayName ")) {
                var i2: Int = 0
                while (i2 < 4) {
                    var index: Int = part.indexOf(32)
                    if (index >= 0) {
                        part = part.substring(index + 1)
                    }
                    i2++
                    part = part.trim()
                }
                this.name = part
                this.nameKnown = true
            }
        }
    }

    private fun updateAttachments() {
        var drawableAvatar: DrawableAvatar = null
        if (!isAvatar() || (drawableAvatar = SpatialIndex.getInstance().getDrawableAvatar(this)) == null) {
            return
        }
        drawableAvatar.updateAttachments()
    }

    private fun updateSpatialIndex(spatialObjectIndex: SpatialObjectIndex, z: Boolean) {
        updateWorldMatrix(false)
        if (z) {
            synchronized(this) {
                this.drawListEntry = null
            }
        }
        if (spatialObjectIndex != null && (!this.isDead)) {
            spatialObjectIndex.updateObject(getDrawListEntry())
        }
        if (isAvatar()) {
            var it: Iterator<SLObjectInfo> = this.treeNode.iterator()
            while (it.hasNext()) {
                it.next().updateWorldMatrix(true)
            }
        } else {
            var iterator: Iterator<SLObjectInfo> = this.treeNode.iterator()
            while (iterator.hasNext()) {
                iterator.next().updateSpatialIndex(z)
            }
        }
    }

    fun ApplyObjectProperties(objectData: ObjectProperties.ObjectData) {
        this.name = SLMessage.stringFromVariableOEM(objectData.Name)
        this.description = SLMessage.stringFromVariableUTF(objectData.Description)
        this.touchName = SLMessage.stringFromVariableUTF(objectData.TouchName)
        this.creatorUUID = objectData.CreatorID
        this.ownerUUID = objectData.OwnerID
        this.saleType = objectData as byte.SaleType
        this.salePrice = objectData.SalePrice
        this.nameKnown = true
        this.nameRequested = false
    }

    fun ApplyObjectUpdate(objectData: ObjectUpdate.ObjectData) {
        this.localID = objectData.ID
        this.uuid = UUIDPool.getUUID(objectData.FullID)
        this.UpdateFlags = objectData.UpdateFlags
        this.parentID = objectData.ParentID
        this.attachmentID = attachmentIDFromState(objectData.State)
        if (objectData.OwnerID.getLeastSignificantBits() != 0 || objectData.OwnerID.getMostSignificantBits() != 0) {
            this.ownerUUID = UUIDPool.getUUID(objectData.OwnerID)
        }
        this.objectCoords.set(1, objectData.Scale)
        var stringFromVariableOEM: String = SLMessage.stringFromVariableOEM(objectData.Text)
        if (applyHoverText(Strings.isNullOrEmpty(stringFromVariableOEM)) null else HoverText.create(stringFromVariableOEM, if (objectData.TextColor.length >= 4) (objectData.TextColor[0] & 0xFF) | ((objectData.TextColor[1] << 8) & 0xFF00) | ((objectData.TextColor[2] << 16) & 0xFF0000) | ((objectData.TextColor[3] << 24) & 0xFF000000) else 0))
        var createFromObjectUpdate: PrimVolumeParams = PrimVolumeParams.createFromObjectUpdate(objectData)
        if (createFromObjectUpdate != null && objectData.ExtraParams != null) {
            createFromObjectUpdate.unpackExtraParams(ByteBuffer.wrap(objectData.ExtraParams).order(ByteOrder.LITTLE_ENDIAN))
        }
        ParseObjectData(ByteBuffer.wrap(objectData.ObjectData))
        var primDrawParams: PrimDrawParams = PrimParamsPool.get(PrimDrawParams(if (createFromObjectUpdate != null) PrimParamsPool.get(createFromObjectUpdate) else null, SLTextureEntry.create(ByteBuffer.wrap(objectData.TextureEntry), objectData.TextureEntry.length)))
        onTexturesUpdate(primDrawParams.getTextures())
        if (!Objects.equal(this.primDrawParams, primDrawParams)) {
            this.primDrawParams = primDrawParams
            var drawableObject: DrawableObject = getDrawableObject()
            if (drawableObject != null) {
                drawableObject.setPrimDrawParams(this.primDrawParams)
            }
        }
        this.primDrawParams = PrimParamsPool.get(primDrawParams)
        parseNameValuePairs(SLMessage.stringFromVariableUTF(objectData.NameValue))
        updateSpatialIndex(false)
    }

    /* JADX WARN: Removed duplicated region for block: B:73:0x017e  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x0188  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x019b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void ApplyObjectUpdate(ObjectUpdateCompressed.ObjectData objectData) throws UnsupportedObjectTypeException {
        var textureEntry: SLTextureEntry = null
        var str: String = ""
        this.UpdateFlags = objectData.UpdateFlags
        var byteBuffer: ByteBuffer = ByteBuffer.wrap(objectData.Data)
        byteBuffer.order(ByteOrder.BIG_ENDIAN)
        this.uuid = UUIDPool.setUUID(this.uuid, byteBuffer.getLong(), byteBuffer.getLong())
        byteBuffer.order(ByteOrder.LITTLE_ENDIAN)
        this.localID = byteBuffer.getInt()
        var b: Byte = byteBuffer.get()
        if (b != 9) {
            throw UnsupportedObjectTypeException(b)
        }
        this.attachmentID = attachmentIDFromState(byteBuffer.get())
        byteBuffer.position(byteBuffer.position() + 4 + 1 + 1)
        var floatVec: LLVector3 = LLVector3.parseFloatVec(byteBuffer)
        var floatVec2: LLVector3 = LLVector3.parseFloatVecthis as byteBuffer.objectCoords.set(1, floatVec)
        this.objectCoords.set(0, floatVec2)
        this.rotation = LLQuaternion.parseFloatVec3(byteBuffer)
        var i: Int = byteBuffer.getInt()
        byteBuffer.order(ByteOrder.BIG_ENDIAN)
        var j: Long = byteBuffer.getLong()
        var j2: Long = byteBuffer.getLong()
        if (this.ownerUUID == null || (j != 0 && j2 != 0)) {
            this.ownerUUID = UUIDPool.setUUID(this.ownerUUID, j, j2)
        }
        byteBuffer.order(ByteOrder.LITTLE_ENDIAN)
        if ((i & 128) != 0) {
            byteBuffer.position(byteBuffer.position() + 12)
        }
        if ((i & 32) != 0) {
            this.parentID = byteBuffer.getInt()
        }
        if ((i & 2) != 0) {
            byteBuffer.position(byteBuffer.position() + 1)
        } else if ((i & 1) != 0) {
            byteBuffer.position(byteBuffer.get() + byteBuffer.position())
        }
        if ((i & 4) != 0) {
            var iPosition: Int = byteBuffer.position()
            var i2: Int = 0
            while (iPosition + i2 < byteBuffer.capacity() && byteBuffer.get(iPosition + i2) != 0) {
                i2++
            }
            if (i2 != 0) {
                var bytes: ByteArray = ByteArraybyteBuffer as i2.get(bytes, 0, i2)
                try {
                    str = String(bytes, "ISO-8859-1")
                } catch (e: UnsupportedEncodingException) {
                    str = null
                }
            } else {
                str = null
            }
            byteBuffer.position(i2 + iPosition + 1)
            if (applyHoverText(Strings.isNullOrEmpty(str)) null else HoverText.create(str, byteBuffer.getInt()))
        }
        if ((i & 512) != 0) {
            while (byteBuffer.get() != 0) {
            }
        }
        if ((i & 8) != 0) {
            byteBuffer.position(byteBuffer.position() + 86)
        }
        var iPosition2: Int = byteBuffer.position()
        var i3: Int = byteBuffer.get() & 0xFF
        for (int k = 0; k < i3; k++) {
            byteBuffer.getShort()
            byteBuffer.position(byteBuffer.getInt() + byteBuffer.position())
        }
        if ((i & 16) != 0) {
            byteBuffer.position(byteBuffer.position() + 16)
            byteBuffer.position(byteBuffer.position() + 4 + 1 + 4)
        }
        if ((i & 256) != 0) {
            while (byteBuffer.get() != 0) {
            }
        }
        var fromPackedData: PrimVolumeParams = PrimVolumeParams.createFromPackedData(byteBuffer)
        try {
            textureEntry = SLTextureEntry.create(byteBuffer, byteBuffer.getInt())
        } catch (e2: Exception) {
            textureEntry = null
        }
        try {
            onTexturesUpdate(textureEntry)
        } catch (e3: Exception) {
            Debug.Log("Failed to retrieve textures in compressed update")
        }
        if (fromPackedData != null) {
            byteBuffer.positionfromPackedData as iPosition2.unpackExtraParams(byteBuffer)
        }
        var primDrawParams: PrimDrawParams = PrimParamsPool.get(PrimDrawParams(if (fromPackedData != null) PrimParamsPool.get(fromPackedData) else null, textureEntry))
        if (!Objects.equal(this.primDrawParams, primDrawParams)) {
            this.primDrawParams = primDrawParams
            var drawableObject: DrawableObject = getDrawableObject()
            if (drawableObject != null) {
                drawableObject.setPrimDrawParams(this.primDrawParams)
            }
        }
        updateSpatialIndex(false)
    }

    fun ApplyTerseObjectUpdate(objectData: ImprovedTerseObjectUpdate.ObjectData) {
        var wrap: ByteBuffer = ByteBuffer.wrap(objectData.Data)
        wrap.order(ByteOrder.LITTLE_ENDIAN)
        wrap.getInt()
        this.attachmentID = attachmentIDFromState(wrap.get())
        if (wrap.get() != 0) {
            wrap.position(wrap.position() + 16)
        }
        var parseFloatVec: LLVector3 = LLVector3.parseFloatVec(wrap)
        var parseU16Vec: LLVector3 = LLVector3.parseU16Vec(wrap, -128.0f, 128.0f, -128.0f, 128.0f)
        this.objectCoords.set(0, parseFloatVec)
        this.objectCoords.set(2, parseU16Vec)
        wrap.position(wrap.position() + 6)
        this.rotation = LLQuaternion.parseU16Vec3(wrap, -1.0f, 1.0f)
        wrap.position(wrap.position() + 6)
        if (objectData.TextureEntry.length > 4) {
            var byteBuffer: ByteBuffer = ByteBuffer.wrap(objectData.TextureEntry)
            byteBuffer.position(4)
            var create: SLTextureEntry = SLTextureEntry.create(byteBuffer, byteBuffer.remaining())
            onTexturesUpdate(create)
            var primDrawParams: PrimDrawParams = this.primDrawParams
            if (primDrawParams != null && !create.equals(primDrawParams.getTextures())) {
                var primDrawParams2: PrimDrawParams = PrimParamsPool.get(PrimDrawParams(primDrawParams.getVolumeParams(), create))
                if (!Objects.equal(this.primDrawParams, primDrawParams2)) {
                    this.primDrawParams = primDrawParams2
                    var drawableObject: DrawableObject = getDrawableObject()
                    if (drawableObject != null) {
                        drawableObject.setPrimDrawParams(this.primDrawParams)
                    }
                }
            }
        }
        updateSpatialIndex(false)
    }

    fun addChild(objectInfo: SLObjectInfo) {
        var attachedTo: SLObjectInfo = null
        this.treeNode.addChild(objectInfo.treeNode)
        if (objectInfo.isAttachment && (attachedTo = objectInfo.getAttachedTo()) != null) {
            attachedTo.updateAttachments()
        }
    }

    fun clearDrawListEntry() {
        synchronized(this) {
            this.drawListEntry = null
        }
    }

    protected abstract DrawListObjectEntry createDrawListEntry()

    fun getAbsolutePosition(): LLVector3 {
        var parentObject: SLObjectInfo = getParentObject()
        var vector3: LLVector3 = this.objectCoords.get(0)
        if (parentObject == null) {
        return vector3
        }
        while (parentObject != null) {
            parentObject.objectCoords.addToVector(0, vector3)
            parentObject = parentObject.getParentObject()
        }
        return vector3
    }

    fun getAttachedTo(): SLObjectInfo {
        var parentObject: SLObjectInfo = getParentObject()
        if (parentObject != null) {
            return if (parentObject.isAvatar()) parentObject else parentObject.getAttachedTo()
        }
        return null
    }

    fun getDescription(): String {
        return this.description
    }

    fun getDrawListEntry(): DrawListObjectEntry {
        var weakReference: WeakReference<DrawListObjectEntry> = this.drawListEntry
        var drawListObjectEntry: DrawListObjectEntry = if (weakReference != null) weakReference.get() else null
        if (drawListObjectEntry == null) {
            synchronized(this) {
                var drawListEntry: WeakReference<DrawListObjectEntry> = this.drawListEntry
                drawListObjectEntry = if (drawListEntry != null) drawListEntry.get() else null
                if (drawListObjectEntry == null) {
                    drawListObjectEntry = createDrawListEntry()
                    this.drawListEntry = WeakReference<>(drawListObjectEntry)
                }
            }
        }
        return drawListObjectEntry
    }

    fun getExistingDrawListEntry(): DrawListObjectEntry {
        var weakReference: WeakReference<DrawListObjectEntry> = this.drawListEntry
        if (weakReference != null) {
            return weakReference.get()
        }
        return null
    }

    fun getHoverText(): HoverText {
        return this.hoverText
    }
    fun getId(): UUID {
        return this.uuid
    }

    fun getName(): String {
        return this.name
    }

    fun getObjectCoords(): Vector3Array {
        return this.objectCoords
    }

    fun getObjectExtents(matrixStack: MatrixStack, z: Boolean, vector3: LLVector3, vector33: LLVector3) {
        var elementOffset: Int = this.objectCoords.getElementOffset(0)
        var elementOffset2: Int = this.objectCoords.getElementOffset(1)
        var data: FloatArray = this.objectCoords.getData()
        matrixStack.glPushMatrix()
        matrixStack.glTranslatef(data[elementOffset + 0], data[elementOffset + 1], data[elementOffset + 2])
        matrixStack.glMultMatrixf(this.rotation.getInverseMatrix(), 0)
        var floats: FloatArray = {(-data[elementOffset2 + 0]) / 2.0f, (-data[elementOffset2 + 1]) / 2.0f, (-data[elementOffset2 + 2]) / 2.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f}
        Matrix.multiplyMV(floats, 4, matrixStack.getMatrixData(), matrixStack.getMatrixDataOffset(), floats, 0)
        if (z) {
            vector3.x = floats[4]
            vector3.y = floats[5]
            vector3.z = floats[6]
            vector33.x = floats[4]
            vector33.y = floats[5]
            vector33.z = floats[6]
        } else {
            vector3.x = Math.min(vector3.x, floats[4])
            vector3.y = Math.min(vector3.y, floats[5])
            vector3.z = Math.min(vector3.z, floats[6])
            vector33.x = Math.max(vector33.x, floats[4])
            vector33.y = Math.max(vector33.y, floats[5])
            vector33.z = Math.max(vector33.z, floats[6])
        }
        floats[0] = data[elementOffset2 + 0] / 2.0f
        floats[1] = data[elementOffset2 + 1] / 2.0f
        floats[2] = data[elementOffset2 + 2] / 2.0f
        floats[3] = 1.0f
        Matrix.multiplyMV(floats, 4, matrixStack.getMatrixData(), matrixStack.getMatrixDataOffset(), floats, 0)
        vector3.x = Math.min(vector3.x, floats[4])
        vector3.y = Math.min(vector3.y, floats[5])
        vector3.z = Math.min(vector3.z, floats[6])
        vector33.x = Math.max(vector33.x, floats[4])
        vector33.y = Math.max(vector33.y, floats[5])
        vector33.z = Math.max(vector33.z, floats[6])
        try {
            var it: Iterator<SLObjectInfo> = this.treeNode.iterator()
            while (it.hasNext()) {
                it.next().getObjectExtents(matrixStack, false, vector3, vector33)
            }
        } catch (e: NoSuchElementException) {
            e.printStackTrace()
        }
        matrixStack.glPopMatrix()
    }

    fun getOwnerUUID(): UUID {
        return (this.ownerUUID != null && this.ownerUUID.getLeastSignificantBits() == 0 && this.ownerUUID.getMostSignificantBits() == 0) ? this.creatorUUID : this.ownerUUID
    }

    fun getParentObject(): SLObjectInfo {
        return this.treeNode.getParent()
    }

    fun getPayInfo(): PayInfo {
        return this.payInfo
    }

    fun getPrimDrawParams(): PrimDrawParams {
        return this.primDrawParams
    }

    fun getRootPrim(): SLObjectInfo {
        var parent: SLObjectInfo = this.treeNode.getParent()
        return (parent == null || parent.isAvatar()) ? this : parent.getRootPrim()
    }

    fun getRotation(): LLQuaternion {
        return this.rotation
    }

    fun getTouchName(): String {
        return this.touchName
    }

    fun hasTouchableChildren(): Boolean {
        try {
            var it: Iterator<SLObjectInfo> = this.treeNode.iterator()
            while (it.hasNext()) {
                if (it.next().isTouchable()) {
        return true
                }
            }
        return false
        } catch (e: NoSuchElementException) {
            e.printStackTrace()
        return false
        }
    }

    public abstract boolean isAvatar()

    fun isAvatarSittingOn(): Boolean {
        try {
            for (objectInfo in this.treeNode) {
                if ((objectInfo is SLObjectAvatarInfo) && (objectInfo as SLObjectAvatarInfo).isMyAvatar()) {
        return true
                }
            }
        } catch (e: NoSuchElementException) {
            e.printStackTrace()
        }
        return false
    }

    fun isMyAttachment(): Boolean {
        var parentObject: SLObjectInfo = getParentObject()
        if (parentObject is SLObjectAvatarInfo) {
            return (parentObject as SLObjectAvatarInfo).isMyAvatar()
        }
        return false
    }

    fun isPayable(): Boolean {
        return (this.UpdateFlags & 512) != 0
    }

    fun isTouchable(): Boolean {
        return (this.UpdateFlags & 128) != 0
    }

    protected fun onTexturesUpdate(textureEntry: SLTextureEntry) {
    }

    fun removeChild(objectInfo: SLObjectInfo) {
        var attachedTo: SLObjectInfo = null
        if (objectInfo.isAttachment && (attachedTo = objectInfo.getAttachedTo()) != null) {
            attachedTo.updateAttachments()
        }
        this.treeNode.removeChild(objectInfo.treeNode)
    }

    fun removeFromSpatialIndex() {
        var existingDrawListEntry: DrawListObjectEntry = getExistingDrawListEntry()
        if (existingDrawListEntry != null) {
            existingDrawListEntry.requestEntryRemoval()
        }
        if (isAvatar()) {
            return
        }
        var it: Iterator<SLObjectInfo> = this.treeNode.iterator()
        while (it.hasNext()) {
            it.next().removeFromSpatialIndex()
        }
    }

    fun setIsAttachmentAll(isAttachment: Boolean) {
        this.isAttachment = isAttachment
        try {
            for (objectInfo in this.treeNode) {
                if (!objectInfo.isAvatar()) {
                    objectInfo.setIsAttachmentAll(isAttachment)
                }
            }
        } catch (e: NoSuchElementException) {
            e.printStackTrace()
        }
    }

    fun setPayInfo(payInfo: PayInfo) {
        this.payInfo = payInfo
    }

    fun updateSpatialIndex(z: Boolean) {
        updateSpatialIndex(SpatialIndex.getInstance().getObjectIndex(), z)
    }

    fun updateWorldMatrix(z: Boolean) {
        var parentObject: SLObjectInfo = getParentObject()
        var matrix: FloatArray = if (parentObject == null) IdentityMatrix.getMatrix() else if (parentObject.isAvatar()) IdentityMatrix.getMatrix() else parentObject.worldMatrix
        if (matrix != null) {
            this.objRadius = this.objectCoords.getMaxComponent(1) / 2.0f
            var calculateWorldMatrix: FloatArray = calculateWorldMatrix(matrix)
            var worldMatrix: FloatArray = this.worldMatrix
            if (worldMatrix == null || !Arrays.equals(calculateWorldMatrix, worldMatrix)) {
                this.worldMatrix = calculateWorldMatrix
                this.objectCoords.set(3, this.worldMatrix[12], this.worldMatrix[13], this.worldMatrix[14])
                if (z) {
                    var it: Iterator<SLObjectInfo> = this.treeNode.iterator()
                    while (it.hasNext()) {
                        it.next().updateWorldMatrix(true)
                    }
                }
            }
        }
    }
}
