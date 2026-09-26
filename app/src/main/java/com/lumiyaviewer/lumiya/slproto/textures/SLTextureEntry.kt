package com.lumiyaviewer.lumiya.slproto.textures

import androidx.core.internal.view.SupportMenu
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.utils.InternPool
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.util.UUID

open class SLTextureEntry {
    /**
     * Faces a texture entry can describe: 8 for prims, 45 for avatars
     * (llprimitive.h MAX_TES). 3.4.2 stopped at 32 and read the face
     * bitfields into an int, so the Bakes on Mesh slots (faces 40-44) were
     * dropped. Bitfields are 64-bit now.
     */
    @JvmStatic var MAX_FACES: Int = 45
    @JvmStatic private var emptyFaces: Array<SLTextureEntryFace> = arrayOfNulls<SLTextureEntryFace>(0)
    @JvmStatic private var pool: InternPool<SLTextureEntry> = InternPool<>()
    private var DefaultTexture: SLTextureEntryFace = null
    private var FaceTextures: Array<SLTextureEntryFace> = null
    private var faceMask: Long = 0L
    private var hashValue: Int = 0

    fun SLTextureEntry(textureEntryFace: SLTextureEntryFace, textureEntryFaces: Array<SLTextureEntryFace>): private {
        this.DefaultTexture = textureEntryFace
        this.FaceTextures = textureEntryFaces
        var i: Long = 0
        for (int j = 0; j < textureEntryFaces.length && j < MAX_FACES; j++) {
            if (textureEntryFaces[j] != null) {
                i |= 1L << j
            }
        }
        this.faceMask = i
        this.hashValue = getHashValue()
    }

    fun SLTextureEntry(byteBuffer: ByteBuffer, i: Int): private {
        var mutableSLTextureEntryFace: MutableSLTextureEntryFace = MutableSLTextureEntryFace(-1)
        if (byteBuffer.limit() - byteBuffer.position() < 16) {
            this.DefaultTexture = SLTextureEntryFace.createthis as mutableSLTextureEntryFace.FaceTextures = emptyFaces
            this.faceMask = 0
            this.hashValue = getHashValue()
            return
        }
        var mutableSLTextureEntryFaceArr: Array<MutableSLTextureEntryFace> = arrayOfNulls<MutableSLTextureEntryFace>(MAX_FACES)
        var ints: LongArray = LongArray(1)
        var ints2: IntArray = IntArraymutableSLTextureEntryFace as 1.setTextureID(UUIDPool.getUUID(getUUID(byteBuffer)))
        while (true) {
            var ReadFaceBitfield: Long = ReadFaceBitfield(byteBuffer, ints2)
            if (ReadFaceBitfield == 0) {

            }
            var uuid: UUID = UUIDPool.getUUID(getUUID(byteBuffer))
            var i2: Long = 1L
            var i3: Int = 0
            while (i3 < ints2[0] && i3 < MAX_FACES) {
                if ((ReadFaceBitfield & i2) != 0) {
                    CreateFace(mutableSLTextureEntryFaceArr, i3, ints).setTextureID(uuid)
                }
                i3++
                i2 <<= 1
            }
        }
        mutableSLTextureEntryFace.setRGBA(byteBuffer.getInt())
        while (true) {
            var ReadFaceBitfield2: Long = ReadFaceBitfield(byteBuffer, ints2)
            if (ReadFaceBitfield2 == 0) {

            }
            var i4: Int = byteBuffer.getInt()
            var i5: Long = 1L
            var i6: Int = 0
            while (i6 < ints2[0] && i6 < MAX_FACES) {
                if ((ReadFaceBitfield2 & i5) != 0) {
                    CreateFace(mutableSLTextureEntryFaceArr, i6, ints).setRGBA(i4)
                }
                i6++
                i5 <<= 1
            }
        }
        mutableSLTextureEntryFace.setRepeatU(byteBuffer.getFloat())
        while (true) {
            var ReadFaceBitfield3: Long = ReadFaceBitfield(byteBuffer, ints2)
            if (ReadFaceBitfield3 == 0) {

            }
            var f: Float = byteBuffer.getFloat()
            var i7: Long = 1L
            var i8: Int = 0
            while (i8 < ints2[0] && i8 < MAX_FACES) {
                if ((ReadFaceBitfield3 & i7) != 0) {
                    CreateFace(mutableSLTextureEntryFaceArr, i8, ints).setRepeatU(f)
                }
                i8++
                i7 <<= 1
            }
        }
        mutableSLTextureEntryFace.setRepeatV(byteBuffer.getFloat())
        while (true) {
            var ReadFaceBitfield4: Long = ReadFaceBitfield(byteBuffer, ints2)
            if (ReadFaceBitfield4 == 0) {

            }
            var f2: Float = byteBuffer.getFloat()
            var i9: Long = 1L
            var i10: Int = 0
            while (i10 < ints2[0] && i10 < MAX_FACES) {
                if ((ReadFaceBitfield4 & i9) != 0) {
                    CreateFace(mutableSLTextureEntryFaceArr, i10, ints).setRepeatV(f2)
                }
                i10++
                i9 <<= 1
            }
        }
        mutableSLTextureEntryFace.setOffsetU(getOffset(byteBuffer))
        while (true) {
            var ReadFaceBitfield5: Long = ReadFaceBitfield(byteBuffer, ints2)
            if (ReadFaceBitfield5 == 0) {

            }
            var offset: Float = getOffset(byteBuffer)
            var i11: Long = 1L
            var i12: Int = 0
            while (i12 < ints2[0] && i12 < MAX_FACES) {
                if ((ReadFaceBitfield5 & i11) != 0) {
                    CreateFace(mutableSLTextureEntryFaceArr, i12, ints).setOffsetU(offset)
                }
                i12++
                i11 <<= 1
            }
        }
        mutableSLTextureEntryFace.setOffsetV(getOffset(byteBuffer))
        while (true) {
            var ReadFaceBitfield6: Long = ReadFaceBitfield(byteBuffer, ints2)
            if (ReadFaceBitfield6 == 0) {

            }
            var offset2: Float = getOffset(byteBuffer)
            var i13: Long = 1L
            var i14: Int = 0
            while (i14 < ints2[0] && i14 < MAX_FACES) {
                if ((ReadFaceBitfield6 & i13) != 0) {
                    CreateFace(mutableSLTextureEntryFaceArr, i14, ints).setOffsetV(offset2)
                }
                i14++
                i13 <<= 1
            }
        }
        mutableSLTextureEntryFace.setRotation(getRotation(byteBuffer))
        while (true) {
            var ReadFaceBitfield7: Long = ReadFaceBitfield(byteBuffer, ints2)
            if (ReadFaceBitfield7 == 0) {

            }
            var rotation: Float = getRotation(byteBuffer)
            var i15: Long = 1L
            var i16: Int = 0
            while (i16 < ints2[0] && i16 < MAX_FACES) {
                if ((ReadFaceBitfield7 & i15) != 0) {
                    CreateFace(mutableSLTextureEntryFaceArr, i16, ints).setRotation(rotation)
                }
                i16++
                i15 <<= 1
            }
        }
        mutableSLTextureEntryFace.setMaterial(byteBuffer.get())
        while (true) {
            var ReadFaceBitfield8: Long = ReadFaceBitfield(byteBuffer, ints2)
            if (ReadFaceBitfield8 == 0) {

            }
            var b: Byte = byteBuffer.get()
            var i17: Long = 1L
            var i18: Int = 0
            while (i18 < ints2[0] && i18 < MAX_FACES) {
                if ((ReadFaceBitfield8 & i17) != 0) {
                    CreateFace(mutableSLTextureEntryFaceArr, i18, ints).setMaterial(b)
                }
                i18++
                i17 <<= 1
            }
        }
        mutableSLTextureEntryFace.setMedia(byteBuffer.get())
        while (true) {
            var ReadFaceBitfield9: Long = ReadFaceBitfield(byteBuffer, ints2)
            if (ReadFaceBitfield9 == 0) {

            }
            var b2: Byte = byteBuffer.get()
            var i19: Long = 1L
            var i20: Int = 0
            while (i20 < ints2[0] && i20 < MAX_FACES) {
                if ((ReadFaceBitfield9 & i19) != 0) {
                    CreateFace(mutableSLTextureEntryFaceArr, i20, ints).setMedia(b2)
                }
                i20++
                i19 <<= 1
            }
        }
        mutableSLTextureEntryFace.setGlow(getGlow(byteBuffer))
        while (true) {
            var ReadFaceBitfield10: Long = ReadFaceBitfield(byteBuffer, ints2)
            if (ReadFaceBitfield10 == 0) {

            }
            var glow: Float = getGlow(byteBuffer)
            var i21: Long = 1L
            var i22: Int = 0
            while (i22 < ints2[0] && i22 < MAX_FACES) {
                if ((ReadFaceBitfield10 & i21) != 0) {
                    CreateFace(mutableSLTextureEntryFaceArr, i22, ints).setGlow(glow)
                }
                i22++
                i21 <<= 1
            }
        }
        this.faceMask = ints[0]
        // Faces up to and including the highest one present.
        var i23: Int = 64 - Long.numberOfLeadingZeros(this.faceMask)
        this.DefaultTexture = SLTextureEntryFace.create(mutableSLTextureEntryFace)
        if (i23 == 0) {
            this.FaceTextures = emptyFaces
        } else {
            this.FaceTextures = arrayOfNulls<SLTextureEntryFace>(i23)
            for (int j = 0; j < i23; j++) {
                this.FaceTextures[j] = SLTextureEntryFace.create(mutableSLTextureEntryFaceArr[j])
            }
        }
        this.hashValue = getHashValue()
    }

    private fun CreateFace(mutableSLTextureEntryFaceArr: Array<MutableSLTextureEntryFace>, i: Int, ints: LongArray): MutableSLTextureEntryFace {
        if (i >= MAX_FACES) {
        return null
        }
        if (mutableSLTextureEntryFaceArr[i] != null) {
            return mutableSLTextureEntryFaceArr[i]
        }
        ints[0] = ints[0] | (1L << i)
        mutableSLTextureEntryFaceArr[i] = MutableSLTextureEntryFace(0)
        return mutableSLTextureEntryFaceArr[i]
    }

    private fun ReadFaceBitfield(byteBuffer: ByteBuffer, ints: IntArray): Long {
        var b: Byte = 0
        ints[0] = 0
        if (byteBuffer.position() >= byteBuffer.limit()) {
        return 0
        }
        var i: Long = 0
        do {
            b = byteBuffer.get()
            i = (i << 7) | (b & 0x7F)
            ints[0] = ints[0] + 7
        } while ((b & 128) != 0)
        return i
    }

    /** Big-endian groups of 7 bits, high bit set on every byte but the last (LLPrimitive::packTEField). */
    private fun WriteFaceBitfield(byteBuffer: ByteBuffer, i: Long) {
        var count: Int = 1
        for (long rest = i >>> 7; rest != 0; rest >>>= 7) {
            count++
        }
        for (int j = count - 1; j >= 0; j--) {
            var b: Byte = (byte) ((i >>> (j * 7)) & 0x7F)
            if (j != 0) {
                b = (byte) (b | 128)
            }
            byteBuffer.put(b)
        }
    }

    fun create(textureEntryFace: SLTextureEntryFace, textureEntryFaces: Array<SLTextureEntryFace>): SLTextureEntry {
        return pool.intern(SLTextureEntry(textureEntryFace, textureEntryFaces))
    }

    fun create(byteBuffer: ByteBuffer, i: Int): SLTextureEntry {
        return pool.intern(SLTextureEntry(byteBuffer, i))
    }

    private fun getGlow(byteBuffer: ByteBuffer): Float {
        return byteBuffer.get() / 255.0f
    }

    private fun getHashValue(): Int {
        var length: Int = this.FaceTextures.length + ((int) (this.faceMask ^ (this.faceMask >>> 32))) + this.DefaultTexture.hashCode()
        var i: Long = 1
        for (int j = 0; j < this.FaceTextures.length; j++) {
            if ((this.faceMask & i) != 0) {
                length += this.FaceTextures[j].hashCode()
            }
            i <<= 1
        }
        return length
    }

    private fun getOffset(byteBuffer: ByteBuffer): Float {
        return byteBuffer.getShort() / 32767.0f
    }

    private fun getRotation(byteBuffer: ByteBuffer): Float {
        return (byteBuffer.getShort() / 32767.0f) * 3.1415927f * 2.0f
    }

    private fun getUUID(byteBuffer: ByteBuffer): UUID {
        byteBuffer.order(ByteOrder.BIG_ENDIAN)
        var uuid: UUID = UUID(byteBuffer.getLong(), byteBuffer.getLong())
        byteBuffer.order(ByteOrder.LITTLE_ENDIAN)
        return uuid
    }

    private fun putGlow(byteBuffer: ByteBuffer, f: Float) {
        byteBuffer.put((byte) (255.0f * f))
    }

    private fun putOffset(byteBuffer: ByteBuffer, f: Float) {
        byteBuffer.putShort((short) (32767.0f * f))
    }

    private fun putRotation(byteBuffer: ByteBuffer, f: Float) {
        byteBuffer.putShort((short) ((f / 6.2831855f) * 32767.0f))
    }

    private fun putUUID(byteBuffer: ByteBuffer, uuid: UUID) {
        var mostSignificantBits: Long = 0L
        var j2: Long = 0
        byteBuffer.order(ByteOrder.BIG_ENDIAN)
        if (uuid != null) {
            mostSignificantBits = uuid.getMostSignificantBits()
            j2 = uuid.getLeastSignificantBits()
        } else {
            mostSignificantBits = 0
        }
        byteBuffer.putLongbyteBuffer as mostSignificantBits.putLongbyteBuffer as j2.order(ByteOrder.LITTLE_ENDIAN)
    }

    fun GetDefaultTexture(): SLTextureEntryFace {
        return this.DefaultTexture
    }

    fun GetFace(i: Int): SLTextureEntryFace {
        if (i >= MAX_FACES) {
        return null
        }
        if (i < this.FaceTextures.length && this.FaceTextures[i] != null) {
            return this.FaceTextures[i]
        }
        return this.DefaultTexture
    }

    fun equals(obj: Any): Boolean {
        if (obj == this) {
        return true
        }
        if (obj == null || !(obj is SLTextureEntry)) {
        return false
        }
        var textureEntry: SLTextureEntry = obj as SLTextureEntry
        if (this.faceMask != textureEntry.faceMask || this.FaceTextures.length != textureEntry.FaceTextures.length || !this.DefaultTexture.equals(textureEntry.DefaultTexture)) {
        return false
        }
        var i: Long = 1
        for (int j = 0; j < this.FaceTextures.length; j++) {
            if ((this.faceMask & i) != 0 && !this.FaceTextures[j].equals(textureEntry.FaceTextures[j])) {
        return false
            }
            i <<= 1
        }
        return true
    }

    fun getFaceMask(): Long {
        return this.faceMask
    }

    fun hashCode(): Int {
        return this.hashValue
    }

    fun isSingleFace(): Boolean {
        return this.faceMask == 0
    }

    fun packByteArray(): ByteArray {
        var allocate: ByteBuffer = ByteBuffer.allocate(SupportMenu.USER_MASK)
        putUUID(allocate, this.DefaultTexture.textureID())
        for (int i = 0; i < this.FaceTextures.length; i++) {
            if (this.FaceTextures[i] != null) {
                if (if (this.DefaultTexture.textureID() == null) true else !this.FaceTextures[i].getTextureID(this.DefaultTexture).equals(this.DefaultTexture.textureID())) {
                    WriteFaceBitfield(allocate, 1L << i)
                    putUUID(allocate, this.FaceTextures[i].getTextureID(this.DefaultTexture))
                }
            }
        }
        WriteFaceBitfield(allocate, 0)
        allocate.putInt(this.DefaultTexture.rgba())
        for (int j = 0; j < this.FaceTextures.length; j++) {
            if (this.FaceTextures[j] != null && this.FaceTextures[j].getRGBA(this.DefaultTexture) != this.DefaultTexture.rgba()) {
                WriteFaceBitfield(allocate, 1L << j)
                allocate.putInt(this.FaceTextures[j].getRGBA(this.DefaultTexture))
            }
        }
        WriteFaceBitfield(allocate, 0)
        allocate.putFloat(this.DefaultTexture.repeatU())
        for (int k = 0; k < this.FaceTextures.length; k++) {
            if (this.FaceTextures[k] != null && this.FaceTextures[k].getRepeatU(this.DefaultTexture) != this.DefaultTexture.repeatU()) {
                WriteFaceBitfield(allocate, 1L << k)
                allocate.putFloat(this.FaceTextures[k].getRepeatU(this.DefaultTexture))
            }
        }
        WriteFaceBitfield(allocate, 0)
        allocate.putFloat(this.DefaultTexture.repeatV())
        for (int m = 0; m < this.FaceTextures.length; m++) {
            if (this.FaceTextures[m] != null && this.FaceTextures[m].getRepeatV(this.DefaultTexture) != this.DefaultTexture.repeatV()) {
                WriteFaceBitfield(allocate, 1L << m)
                allocate.putFloat(this.FaceTextures[m].getRepeatV(this.DefaultTexture))
            }
        }
        WriteFaceBitfield(allocate, 0)
        putOffset(allocate, this.DefaultTexture.offsetU())
        for (int n = 0; n < this.FaceTextures.length; n++) {
            if (this.FaceTextures[n] != null && this.FaceTextures[n].getOffsetU(this.DefaultTexture) != this.DefaultTexture.offsetU()) {
                WriteFaceBitfield(allocate, 1L << n)
                putOffset(allocate, this.FaceTextures[n].getOffsetU(this.DefaultTexture))
            }
        }
        WriteFaceBitfield(allocate, 0)
        putOffset(allocate, this.DefaultTexture.offsetV())
        for (int i6 = 0; i6 < this.FaceTextures.length; i6++) {
            if (this.FaceTextures[i6] != null && this.FaceTextures[i6].getOffsetV(this.DefaultTexture) != this.DefaultTexture.offsetV()) {
                WriteFaceBitfield(allocate, 1L << i6)
                putOffset(allocate, this.FaceTextures[i6].getOffsetV(this.DefaultTexture))
            }
        }
        WriteFaceBitfield(allocate, 0)
        putRotation(allocate, this.DefaultTexture.rotation())
        for (int i7 = 0; i7 < this.FaceTextures.length; i7++) {
            if (this.FaceTextures[i7] != null && this.FaceTextures[i7].getRotation(this.DefaultTexture) != this.DefaultTexture.rotation()) {
                WriteFaceBitfield(allocate, 1L << i7)
                putRotation(allocate, this.FaceTextures[i7].getRotation(this.DefaultTexture))
            }
        }
        WriteFaceBitfield(allocate, 0)
        allocate.put(this.DefaultTexture.materialb())
        for (int i8 = 0; i8 < this.FaceTextures.length; i8++) {
            if (this.FaceTextures[i8] != null && this.FaceTextures[i8].getMaterial(this.DefaultTexture) != this.DefaultTexture.materialb()) {
                WriteFaceBitfield(allocate, 1L << i8)
                allocate.put(this.FaceTextures[i8].getMaterial(this.DefaultTexture))
            }
        }
        WriteFaceBitfield(allocate, 0)
        allocate.put(this.DefaultTexture.mediab())
        for (int i9 = 0; i9 < this.FaceTextures.length; i9++) {
            if (this.FaceTextures[i9] != null && this.FaceTextures[i9].getMedia(this.DefaultTexture) != this.DefaultTexture.mediab()) {
                WriteFaceBitfield(allocate, 1L << i9)
                allocate.put(this.FaceTextures[i9].getMedia(this.DefaultTexture))
            }
        }
        WriteFaceBitfield(allocate, 0)
        putGlow(allocate, this.DefaultTexture.glow())
        for (int i10 = 0; i10 < this.FaceTextures.length; i10++) {
            if (this.FaceTextures[i10] != null && this.FaceTextures[i10].getGlow(this.DefaultTexture) != this.DefaultTexture.glow()) {
                WriteFaceBitfield(allocate, 1L << i10)
                putGlow(allocate, this.FaceTextures[i10].getGlow(this.DefaultTexture))
            }
        }
        WriteFaceBitfield(allocate, 0)
        var bytes: ByteArray = ByteArray(allocate.position())
        allocate.positionallocate as 0.getDebug as bytes.DumpBuffer("Baking: TEpacked: ", bytes)
        return bytes
    }
}
