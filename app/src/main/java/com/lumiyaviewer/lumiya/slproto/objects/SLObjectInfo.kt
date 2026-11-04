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
import java.util.NoSuchElementException
import java.util.UUID

abstract class SLObjectInfo : Identifiable<UUID> {
    companion object {
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

        private var isNativeLoaded: Boolean = false

        init {
            try {
                System.loadLibrary("rust_mirror")
                isNativeLoaded = true
            } catch (e: Throwable) {
                Debug.Log("SLObjectInfo: librust_mirror.so not loaded, using JVM fallback")
                isNativeLoaded = false
            }
        }
    }

    var UpdateFlags: Int = 0

    private var drawListEntry: WeakReference<DrawListObjectEntry>? = null
    var localID: Int = 0
    var objRadius: Float = 0.0f

    private var payInfo: PayInfo? = null
    private var primDrawParams: PrimDrawParams? = null
    private var rotation: LLQuaternion? = null
    var salePrice: Int = 0
    protected var uuid: UUID? = null
    var worldMatrix: FloatArray? = null
    var parentID: Int = 0
    var name: String = "(loading)"
    var description: String = ""
    var touchName: String = ""
    var attachedToUUID: UUID? = null
    var ownerUUID: UUID? = null
    var creatorUUID: UUID? = null
    var saleType: Byte = 0
    var attachmentID: Int = 0
    private var objectCoords: Vector3Array = Vector3Array(4)
    private var hoverText: HoverText? = null
    var isDead: Boolean = false
    var isAttachment: Boolean = false
    var nameKnown: Boolean = false
    var nameRequested: Boolean = false
    var nameRequestedAt: Long = 0
    var hierLevel: Int = 0
    var treeNode: LinkedTreeNode<SLObjectInfo> = LinkedTreeNode<>(this)

    private external fun nativeApplyObjectUpdate(dataBuffer: ByteBuffer, length: Int, outInts: IntArray, outFloats: FloatArray): Boolean

    private fun ParseObjectData(byteBuffer: ByteBuffer) {
        byteBuffer.order(ByteOrder.LITTLE_ENDIAN)
        when (byteBuffer.limit()) {
            16 -> {
                this.objectCoords.set(0, LLVector3.parseU8Vec(byteBuffer, 384.0f, 384.0f, -256.0f, 4096.0f))
                this.objectCoords.set(2, LLVector3.parseU8Vec(byteBuffer, -256.0f, 256.0f, -256.0f, 256.0f))
                byteBuffer.position(byteBuffer.position() + 3)
                this.rotation = LLQuaternion.parseU8Vec3(byteBuffer, -1.0f, 1.0f)
            }
            32, 48 -> {
                if (byteBuffer.limit() == 48) {
                    byteBuffer.position(byteBuffer.position() + 16)
                }
                this.objectCoords.set(0, LLVector3.parseU16Vec(byteBuffer, -128.0f, 384.0f, -256.0f, 4096.0f))
                this.objectCoords.set(2, LLVector3.parseU16Vec(byteBuffer, -256.0f, 256.0f, -256.0f, 256.0f))
                byteBuffer.position(byteBuffer.position() + 6)
                this.rotation = LLQuaternion.parseU16Vec3(byteBuffer, -1.0f, 1.0f)
            }
            60, 76 -> {
                if (byteBuffer.limit() == 76) {
                    byteBuffer.position(byteBuffer.position() + 16)
                }
                this.objectCoords.set(0, LLVector3.parseFloatVec(byteBuffer))
                this.objectCoords.set(2, LLVector3.parseFloatVec(byteBuffer))
                byteBuffer.position(byteBuffer.position() + 12)
                this.rotation = LLQuaternion.parseFloatVec3(byteBuffer)
            }
        }
    }

    private fun applyHoverText(hoverText: HoverText?) {
        if (Objects.equal(this.hoverText, hoverText)) {
            return
        }
        this.hoverText = hoverText
        val drawableObject: DrawableObject? = getDrawableObject()
        if (drawableObject != null && hoverText != null) {
            drawableObject.setHoverText(hoverText)
        }
    }

    private fun attachmentIDFromState(i: Int): Int {
        return (((i and 255) and AGENT_ATTACH_MASK) shr 4) or (((i and 255) and (-241)) shl 4)
    }

    private fun calculateWorldMatrix(floats3: FloatArray): FloatArray? {
        val rot: LLQuaternion = this.rotation ?: return null
        val floats = FloatArray(16)
        val floats2 = FloatArray(16)
        this.objectCoords.MatrixTranslate(floats2, 0, floats3, 0, 0)
        Matrix.multiplyMM(floats, 0, floats2, 0, rot.getInverseMatrix(), 0)
        return floats
    }

    @Throws(UnsupportedObjectTypeException::class)
    fun create(objectData: ObjectUpdateCompressed.ObjectData): SLObjectInfo {
        val objectPrimInfo = SLObjectPrimInfo()
        objectPrimInfo.ApplyObjectUpdate(objectData)
        return objectPrimInfo
    }

    fun create(uuid: UUID, objectData: ObjectUpdate.ObjectData, uuid2: UUID): SLObjectInfo {
        val objectInfo: SLObjectInfo = if (objectData.PCode == 47) SLObjectAvatarInfo(uuid, UUIDPool.getUUID(objectData.FullID), uuid2.equals(objectData.FullID)) else SLObjectPrimInfo()
        objectInfo.ApplyObjectUpdate(objectData)
        return objectInfo
    }

    private fun getDrawableObject(): DrawableObject? {
        val existingDrawListEntry = getExistingDrawListEntry()
        if (existingDrawListEntry is DrawListPrimEntry) {
            return existingDrawListEntry.getDrawableObject()
        }
        return null
    }

    fun getLocalID(objectData: ImprovedTerseObjectUpdate.ObjectData): Int {
        val wrap = ByteBuffer.wrap(objectData.Data)
        wrap.order(ByteOrder.LITTLE_ENDIAN)
        return wrap.getInt()
    }

    fun getLocalID(objectData: ObjectUpdateCompressed.ObjectData): Int {
        val wrap = ByteBuffer.wrap(objectData.Data)
        wrap.position(16)
        wrap.order(ByteOrder.LITTLE_ENDIAN)
        return wrap.getInt()
    }

    private fun parseNameValuePairs(str: String) {
        for (line in str.split("\n")) {
            var part = line
            if (part.startsWith("AttachItemID ")) {
                var i = 0
                while (i < 4) {
                    val indexOf = part.indexOf(' ')
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
                var i2 = 0
                while (i2 < 4) {
                    val index = part.indexOf(' ')
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
        var drawableAvatar: DrawableAvatar? = null
        if (!isAvatar() || (SpatialIndex.getInstance().getDrawableAvatar(this).also { drawableAvatar = it }) == null) {
            return
        }
        drawableAvatar?.updateAttachments()
    }

    private fun updateSpatialIndex(spatialObjectIndex: SpatialObjectIndex?, z: Boolean) {
        updateWorldMatrix(false)
        if (z) {
            synchronized(this) {
                this.drawListEntry = null
            }
        }
        if (spatialObjectIndex != null && !this.isDead) {
            spatialObjectIndex.updateObject(getDrawListEntry())
        }
        if (isAvatar()) {
            val it = this.treeNode.iterator()
            while (it.hasNext()) {
                it.next().updateWorldMatrix(true)
            }
        } else {
            val iterator = this.treeNode.iterator()
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
        this.saleType = objectData.SaleType
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
        if (objectData.OwnerID != null && (objectData.OwnerID.leastSignificantBits != 0L || objectData.OwnerID.mostSignificantBits != 0L)) {
            this.ownerUUID = UUIDPool.getUUID(objectData.OwnerID)
        }
        this.objectCoords.set(1, objectData.Scale)
        val stringFromVariableOEM = SLMessage.stringFromVariableOEM(objectData.Text)
        val hover = if (Strings.isNullOrEmpty(stringFromVariableOEM)) null else HoverText.create(stringFromVariableOEM, if (objectData.TextColor != null && objectData.TextColor.size >= 4) (objectData.TextColor[0].toInt() and 0xFF) or ((objectData.TextColor[1].toInt() shl 8) and 0xFF00) or ((objectData.TextColor[2].toInt() shl 16) and 0xFF0000) or ((objectData.TextColor[3].toInt() shl 24) and 0xFF000000) else 0)
        applyHoverText(hover)
        val createFromObjectUpdate = PrimVolumeParams.createFromObjectUpdate(objectData)
        if (createFromObjectUpdate != null && objectData.ExtraParams != null) {
            createFromObjectUpdate.unpackExtraParams(ByteBuffer.wrap(objectData.ExtraParams).order(ByteOrder.LITTLE_ENDIAN))
        }
        ParseObjectData(ByteBuffer.wrap(objectData.ObjectData))
        val primDrawParams = PrimParamsPool.get(PrimDrawParams(if (createFromObjectUpdate != null) PrimParamsPool.get(createFromObjectUpdate) else null, SLTextureEntry.create(ByteBuffer.wrap(objectData.TextureEntry), objectData.TextureEntry.size)))
        onTexturesUpdate(primDrawParams.getTextures())
        if (!Objects.equal(this.primDrawParams, primDrawParams)) {
            this.primDrawParams = primDrawParams
            val drawableObject = getDrawableObject()
            if (drawableObject != null) {
                drawableObject.setPrimDrawParams(this.primDrawParams)
            }
        }
        this.primDrawParams = PrimParamsPool.get(primDrawParams)
        parseNameValuePairs(SLMessage.stringFromVariableUTF(objectData.NameValue))
        updateSpatialIndex(false)
    }

    @Throws(UnsupportedObjectTypeException::class)
    fun ApplyObjectUpdate(objectData: ObjectUpdateCompressed.ObjectData) {
        if (isNativeLoaded && objectData.Data != null) {
            try {
                val buf = ByteBuffer.allocateDirect(objectData.Data.size)
                buf.put(objectData.Data)
                buf.flip()
                val outInts = IntArray(5)
                val outFloats = FloatArray(10)
                if (nativeApplyObjectUpdate(buf, objectData.Data.size, outInts, outFloats)) {
                    this.localID = outInts[0]
                    this.attachmentID = outInts[2]
                    this.parentID = outInts[3]
                    this.UpdateFlags = outInts[4]
                    this.objectCoords.set(0, LLVector3(outFloats[0], outFloats[1], outFloats[2]))
                    this.objectCoords.set(1, LLVector3(outFloats[3], outFloats[4], outFloats[5]))
                    this.rotation = LLQuaternion(outFloats[6], outFloats[7], outFloats[8], outFloats[9])
                }
            } catch (e: Throwable) {
                Debug.Log("SLObjectInfo: nativeApplyObjectUpdate failed, using JVM fallback: ${e.message}")
            }
        }

        var textureEntry: SLTextureEntry? = null
        var str: String? = ""
        this.UpdateFlags = objectData.UpdateFlags
        val byteBuffer = ByteBuffer.wrap(objectData.Data)
        byteBuffer.order(ByteOrder.BIG_ENDIAN)
        this.uuid = UUIDPool.setUUID(this.uuid, byteBuffer.getLong(), byteBuffer.getLong())
        byteBuffer.order(ByteOrder.LITTLE_ENDIAN)
        this.localID = byteBuffer.getInt()
        val b = byteBuffer.get()
        if (b != 9.toByte()) {
            throw UnsupportedObjectTypeException(b)
        }
        this.attachmentID = attachmentIDFromState(byteBuffer.get().toInt())
        byteBuffer.position(byteBuffer.position() + 4 + 1 + 1)
        val floatVec = LLVector3.parseFloatVec(byteBuffer)
        val floatVec2 = LLVector3.parseFloatVec(byteBuffer)
        this.objectCoords.set(1, floatVec)
        this.objectCoords.set(0, floatVec2)
        this.rotation = LLQuaternion.parseFloatVec3(byteBuffer)
        val i = byteBuffer.getInt()
        byteBuffer.order(ByteOrder.BIG_ENDIAN)
        val j = byteBuffer.getLong()
        val j2 = byteBuffer.getLong()
        if (this.ownerUUID == null || (j != 0L && j2 != 0L)) {
            this.ownerUUID = UUIDPool.setUUID(this.ownerUUID, j, j2)
        }
        byteBuffer.order(ByteOrder.LITTLE_ENDIAN)
        if ((i and 128) != 0) {
            byteBuffer.position(byteBuffer.position() + 12)
        }
        if ((i and 32) != 0) {
            this.parentID = byteBuffer.getInt()
        }
        if ((i and 2) != 0) {
            byteBuffer.position(byteBuffer.position() + 1)
        } else if ((i and 1) != 0) {
            byteBuffer.position((byteBuffer.get().toInt() and 0xFF) + byteBuffer.position())
        }
        if ((i and 4) != 0) {
            val iPosition = byteBuffer.position()
            var i2 = 0
            while (iPosition + i2 < byteBuffer.capacity() && byteBuffer.get(iPosition + i2) != 0.toByte()) {
                i2++
            }
            if (i2 != 0) {
                val bytes = ByteArray(i2)
                byteBuffer.get(bytes, 0, i2)
                try {
                    str = String(bytes, charset("ISO-8859-1"))
                } catch (e: UnsupportedEncodingException) {
                    str = null
                }
            } else {
                str = null
            }
            byteBuffer.position(i2 + iPosition + 1)
            applyHoverText(if (Strings.isNullOrEmpty(str)) null else HoverText.create(str, byteBuffer.getInt()))
        }
        if ((i and 512) != 0) {
            while (byteBuffer.get() != 0.toByte()) {
            }
        }
        if ((i and 8) != 0) {
            byteBuffer.position(byteBuffer.position() + 86)
        }
        val iPosition2 = byteBuffer.position()
        val i3 = byteBuffer.get().toInt() and 0xFF
        for (k in 0 until i3) {
            byteBuffer.getShort()
            byteBuffer.position(byteBuffer.getInt() + byteBuffer.position())
        }
        if ((i and 16) != 0) {
            byteBuffer.position(byteBuffer.position() + 16)
            byteBuffer.position(byteBuffer.position() + 4 + 1 + 4)
        }
        if ((i and 256) != 0) {
            while (byteBuffer.get() != 0.toByte()) {
            }
        }
        val fromPackedData = PrimVolumeParams.createFromPackedData(byteBuffer)
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
            byteBuffer.position(iPosition2)
            fromPackedData.unpackExtraParams(byteBuffer)
        }
        val primDrawParams = PrimParamsPool.get(PrimDrawParams(if (fromPackedData != null) PrimParamsPool.get(fromPackedData) else null, textureEntry))
        if (!Objects.equal(this.primDrawParams, primDrawParams)) {
            this.primDrawParams = primDrawParams
            val drawableObject = getDrawableObject()
            if (drawableObject != null) {
                drawableObject.setPrimDrawParams(this.primDrawParams)
            }
        }
        updateSpatialIndex(false)
    }

    fun ApplyTerseObjectUpdate(objectData: ImprovedTerseObjectUpdate.ObjectData) {
        val wrap = ByteBuffer.wrap(objectData.Data)
        wrap.order(ByteOrder.LITTLE_ENDIAN)
        wrap.getInt()
        this.attachmentID = attachmentIDFromState(wrap.get().toInt())
        if (wrap.get() != 0.toByte()) {
            wrap.position(wrap.position() + 16)
        }
        val parseFloatVec = LLVector3.parseFloatVec(wrap)
        val parseU16Vec = LLVector3.parseU16Vec(wrap, -128.0f, 128.0f, -128.0f, 128.0f)
        this.objectCoords.set(0, parseFloatVec)
        this.objectCoords.set(2, parseU16Vec)
        wrap.position(wrap.position() + 6)
        this.rotation = LLQuaternion.parseU16Vec3(wrap, -1.0f, 1.0f)
        wrap.position(wrap.position() + 6)
        if (objectData.TextureEntry.size > 4) {
            val byteBuffer = ByteBuffer.wrap(objectData.TextureEntry)
            byteBuffer.position(4)
            val create = SLTextureEntry.create(byteBuffer, byteBuffer.remaining())
            onTexturesUpdate(create)
            val currentPrimDrawParams = this.primDrawParams
            if (currentPrimDrawParams != null && !create.equals(currentPrimDrawParams.getTextures())) {
                val primDrawParams2 = PrimParamsPool.get(PrimDrawParams(currentPrimDrawParams.getVolumeParams(), create))
                if (!Objects.equal(this.primDrawParams, primDrawParams2)) {
                    this.primDrawParams = primDrawParams2
                    val drawableObject = getDrawableObject()
                    if (drawableObject != null) {
                        drawableObject.setPrimDrawParams(this.primDrawParams)
                    }
                }
            }
        }
        updateSpatialIndex(false)
    }

    fun addChild(objectInfo: SLObjectInfo) {
        this.treeNode.addChild(objectInfo.treeNode)
        if (objectInfo.isAttachment) {
            val attachedTo = objectInfo.getAttachedTo()
            if (attachedTo != null) {
                attachedTo.updateAttachments()
            }
        }
    }

    fun clearDrawListEntry() {
        synchronized(this) {
            this.drawListEntry = null
        }
    }

    protected abstract fun createDrawListEntry(): DrawListObjectEntry?

    fun getAbsolutePosition(): LLVector3 {
        var parentObject: SLObjectInfo? = getParentObject()
        val vector3 = this.objectCoords.get(0)
        if (parentObject == null) {
            return vector3
        }
        while (parentObject != null) {
            parentObject.objectCoords.addToVector(0, vector3)
            parentObject = parentObject.getParentObject()
        }
        return vector3
    }

    fun getAttachedTo(): SLObjectInfo? {
        val parentObject = getParentObject()
        if (parentObject != null) {
            return if (parentObject.isAvatar()) parentObject else parentObject.getAttachedTo()
        }
        return null
    }

    fun getDescription(): String {
        return this.description
    }

    fun getDrawListEntry(): DrawListObjectEntry? {
        var weakReference = this.drawListEntry
        var drawListObjectEntry = weakReference?.get()
        if (drawListObjectEntry == null) {
            synchronized(this) {
                weakReference = this.drawListEntry
                drawListObjectEntry = weakReference?.get()
                if (drawListObjectEntry == null) {
                    drawListObjectEntry = createDrawListEntry()
                    this.drawListEntry = WeakReference(drawListObjectEntry)
                }
            }
        }
        return drawListObjectEntry
    }

    fun getExistingDrawListEntry(): DrawListObjectEntry? {
        return this.drawListEntry?.get()
    }

    fun getHoverText(): HoverText? {
        return this.hoverText
    }

    override fun getId(): UUID? {
        return this.uuid
    }

    fun getName(): String {
        return this.name
    }

    fun getObjectCoords(): Vector3Array {
        return this.objectCoords
    }

    fun getObjectExtents(matrixStack: MatrixStack, z: Boolean, vector3: LLVector3, vector33: LLVector3) {
        val elementOffset = this.objectCoords.getElementOffset(0)
        val elementOffset2 = this.objectCoords.getElementOffset(1)
        val data = this.objectCoords.getData()
        matrixStack.glPushMatrix()
        matrixStack.glTranslatef(data[elementOffset + 0], data[elementOffset + 1], data[elementOffset + 2])
        val rot = this.rotation
        if (rot != null) {
            matrixStack.glMultMatrixf(rot.getInverseMatrix(), 0)
        }
        val floats = floatArrayOf((-data[elementOffset2 + 0]) / 2.0f, (-data[elementOffset2 + 1]) / 2.0f, (-data[elementOffset2 + 2]) / 2.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f)
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
            val it = this.treeNode.iterator()
            while (it.hasNext()) {
                it.next().getObjectExtents(matrixStack, false, vector3, vector33)
            }
        } catch (e: NoSuchElementException) {
            e.printStackTrace()
        }
        matrixStack.glPopMatrix()
    }

    fun getOwnerUUID(): UUID? {
        val owner = this.ownerUUID
        return if (owner != null && owner.leastSignificantBits == 0L && owner.mostSignificantBits == 0L) this.creatorUUID else owner
    }

    fun getParentObject(): SLObjectInfo? {
        return this.treeNode.getParent()
    }

    fun getPayInfo(): PayInfo? {
        return this.payInfo
    }

    fun getPrimDrawParams(): PrimDrawParams? {
        return this.primDrawParams
    }

    fun getRootPrim(): SLObjectInfo {
        val parent = this.treeNode.getParent()
        return if (parent == null || parent.isAvatar()) this else parent.getRootPrim()
    }

    fun getRotation(): LLQuaternion? {
        return this.rotation
    }

    fun getTouchName(): String {
        return this.touchName
    }

    fun hasTouchableChildren(): Boolean {
        try {
            val it = this.treeNode.iterator()
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

    abstract fun isAvatar(): Boolean

    fun isAvatarSittingOn(): Boolean {
        try {
            for (objectInfo in this.treeNode) {
                if ((objectInfo is SLObjectAvatarInfo) && objectInfo.isMyAvatar()) {
                    return true
                }
            }
        } catch (e: NoSuchElementException) {
            e.printStackTrace()
        }
        return false
    }

    fun isMyAttachment(): Boolean {
        val parentObject = getParentObject()
        if (parentObject is SLObjectAvatarInfo) {
            return parentObject.isMyAvatar()
        }
        return false
    }

    fun isPayable(): Boolean {
        return (this.UpdateFlags and 512) != 0
    }

    fun isTouchable(): Boolean {
        return (this.UpdateFlags and 128) != 0
    }

    protected open fun onTexturesUpdate(textureEntry: SLTextureEntry?) {
    }

    fun removeChild(objectInfo: SLObjectInfo) {
        if (objectInfo.isAttachment) {
            val attachedTo = objectInfo.getAttachedTo()
            if (attachedTo != null) {
                attachedTo.updateAttachments()
            }
        }
        this.treeNode.removeChild(objectInfo.treeNode)
    }

    fun removeFromSpatialIndex() {
        val existingDrawListEntry = getExistingDrawListEntry()
        if (existingDrawListEntry != null) {
            existingDrawListEntry.requestEntryRemoval()
        }
        if (isAvatar()) {
            return
        }
        val it = this.treeNode.iterator()
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
        val parentObject = getParentObject()
        val matrix = if (parentObject == null || parentObject.isAvatar()) IdentityMatrix.getMatrix() else parentObject.worldMatrix
        if (matrix != null) {
            this.objRadius = this.objectCoords.getMaxComponent(1) / 2.0f
            val calculateWorldMatrix = calculateWorldMatrix(matrix)
            val currentWorldMatrix = this.worldMatrix
            if (calculateWorldMatrix != null && (currentWorldMatrix == null || !Arrays.equals(calculateWorldMatrix, currentWorldMatrix))) {
                this.worldMatrix = calculateWorldMatrix
                this.objectCoords.set(3, calculateWorldMatrix[12], calculateWorldMatrix[13], calculateWorldMatrix[14])
                if (z) {
                    val it = this.treeNode.iterator()
                    while (it.hasNext()) {
                        it.next().updateWorldMatrix(true)
                    }
                }
            }
        }
    }
}
