package com.lumiyaviewer.lumiya.slproto.prims

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.messages.ObjectUpdate
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.nio.BufferUnderflowException
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.util.UUID

open class PrimVolumeParams {
    @JvmStatic var LL_SCULPT_FLAG_INVERT: Byte = 64
    @JvmStatic var LL_SCULPT_FLAG_MIRROR: Byte = 0x80 as byte
    @JvmStatic var LL_SCULPT_TYPE_CYLINDER: Byte = 4
    @JvmStatic var LL_SCULPT_TYPE_MASK: Byte = 7
    @JvmStatic var LL_SCULPT_TYPE_MESH: Byte = 5
    @JvmStatic var LL_SCULPT_TYPE_NONE: Byte = 0
    @JvmStatic var LL_SCULPT_TYPE_PLANE: Byte = 3
    @JvmStatic var LL_SCULPT_TYPE_SPHERE: Byte = 1
    @JvmStatic var LL_SCULPT_TYPE_TORUS: Byte = 2
    @JvmStatic var PARAMS_FLEXIBLE: Short = 16
    @JvmStatic var PARAMS_LIGHT: Short = 32
    @JvmStatic var PARAMS_LIGHT_IMAGE: Short = 64
    @JvmStatic var PARAMS_MESH: Short = 96
    /** Extended-mesh flags, including the simulator's Animesh opt-in. */
    @JvmStatic var PARAMS_EXTENDED_MESH: Short = 112
    @JvmStatic var EXTENDED_MESH_ANIMATED: Int = 1
    @JvmStatic var PARAMS_RESERVED: Short = 80
    @JvmStatic var PARAMS_SCULPT: Short = 48
    var FlexiParams: PrimFlexibleParams? = null
    var PathParams: PrimPathParams? = null
    var ProfileParams: PrimProfileParams? = null
    var SculptID: UUID? = null
    var SculptType: Byte = 0
    /** Raw flags from the 0x70 extended-mesh extra parameter. */
    var ExtendedMeshFlags: Int = 0

    fun createFromObjectUpdate(objectData: ObjectUpdate.ObjectData): PrimVolumeParams {
        var primVolumeParams: PrimVolumeParams = PrimVolumeParams()
        primVolumeParams.PathParams = PrimParamsPool.get(PrimPathParams(objectData))
        primVolumeParams.ProfileParams = PrimParamsPool.get(PrimProfileParams.createFromObjectUpdate(objectData))
        return primVolumeParams
    }

    fun createFromPackedData(byteBuffer: ByteBuffer): PrimVolumeParams {
        var primVolumeParams: PrimVolumeParams = PrimVolumeParams()
        primVolumeParams.PathParams = PrimParamsPool.get(PrimPathParams(byteBuffer))
        primVolumeParams.ProfileParams = PrimParamsPool.get(PrimProfileParams.createFromPackedData(byteBuffer))
        return primVolumeParams
    }

    fun equals(obj: Any): Boolean {
        if (obj == this) {
        return true
        }
        if (!(obj is PrimVolumeParams)) {
        return false
        }
        var primVolumeParams: PrimVolumeParams = obj as PrimVolumeParams
        if (this.SculptType != primVolumeParams.SculptType) {
        return false
        }
        if (this.ExtendedMeshFlags != primVolumeParams.ExtendedMeshFlags) {
        return false
        }
        if ((this.SculptID == null) != (primVolumeParams.SculptID == null)) {
        return false
        }
        if (this.SculptID != null && !this.SculptID.equals(primVolumeParams.SculptID)) {
        return false
        }
        if ((this.ProfileParams == null) != (primVolumeParams.ProfileParams == null)) {
        return false
        }
        if (this.ProfileParams != null && !this.ProfileParams.equals(primVolumeParams.ProfileParams)) {
        return false
        }
        if ((this.PathParams == null) != (primVolumeParams.PathParams == null)) {
        return false
        }
        if (this.PathParams != null && !this.PathParams.equals(primVolumeParams.PathParams)) {
        return false
        }
        if ((this.FlexiParams == null) != (primVolumeParams.FlexiParams == null)) {
        return false
        }
        return this.FlexiParams == null || this.FlexiParams.equals(primVolumeParams.FlexiParams)
    }

    fun hashCode(): Int {
        var i: Int = (this.SculptType * 17) + (this.ExtendedMeshFlags * 31)
        if (this.SculptID != null) {
            i += this.SculptID.hashCode() * 3
        }
        var hashCode: Int = i + (this.PathParams.hashCode() * 37) + this.ProfileParams.hashCode()
        return if (this.FlexiParams != null) hashCode + this.FlexiParams.hashCode() else hashCode
    }

    fun isFlexible(): Boolean {
        return this.FlexiParams != null
    }

    fun isMesh(): Boolean {
        return this.SculptID != null && (this.SculptType & 7) == 5
    }

    /** True when this mesh object owns an Animesh skeleton and animations. */
    fun isAnimatedMesh(): Boolean {
        return isMesh() && (this.ExtendedMeshFlags & EXTENDED_MESH_ANIMATED) != 0
    }

    fun isSculpt(): Boolean {
        return this.SculptID != null
    }

    fun toString(): String {
        return "{Volume: SculptType 0x" + Integer.toHexString(this.SculptType) + ", SculptID " + (if (this.SculptID != null) this.SculptID.toString() else "null") + ", Path = (" + this.PathParams.toString() + "), Profile = (" + this.ProfileParams.toString() + ")}"
    }

    fun unpackExtraParams(byteBuffer: ByteBuffer) {
        try {
            var count: Int = Byte.toUnsignedInt(byteBuffer.get())
            for (int i = 0; i < count; i++) {
                var s: Short = byteBuffer.getShort()
                var length: Int = byteBuffer.getInt()
                if (length < 0 || length > byteBuffer.remaining()) {
                    throw BufferUnderflowException()
                }
                var i2: Int = byteBuffer.position() + length
                when (s) {
                    16 ->
                        this.FlexiParams = PrimFlexibleParams(byteBuffer, i2)

                    48 ->
                    96 ->
                        byteBuffer.order(ByteOrder.BIG_ENDIAN)
                        this.SculptID = UUIDPool.getUUID(UUID(byteBuffer.getLong(), byteBuffer.getLong()))
                        byteBuffer.order(ByteOrder.LITTLE_ENDIAN)
                        this.SculptType = byteBuffer.get()

                    PARAMS_EXTENDED_MESH ->
                        // LLExtendedMeshParams is currently a single U32 bitfield.
                        // Keep unknown bits so a later renderer can make its own
                        // compatibility decision as the protocol evolves.
                        if (length >= Integer.BYTES) {
                            this.ExtendedMeshFlags = byteBuffer.getInt()
                        }

                }
                byteBuffer.position(i2)
            }
        } catch (e: BufferUnderflowException) {
            Debug.Warning(e)
        }
    }
}
