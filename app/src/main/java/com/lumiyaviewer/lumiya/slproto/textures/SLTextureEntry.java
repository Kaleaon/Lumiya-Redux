package com.lumiyaviewer.lumiya.slproto.textures;

import androidx.core.internal.view.SupportMenu;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.utils.InternPool;
import com.lumiyaviewer.lumiya.utils.UUIDPool;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.UUID;

public class SLTextureEntry {
    /**
     * Faces a texture entry can describe: 8 for prims, 45 for avatars
     * (llprimitive.h MAX_TES). 3.4.2 stopped at 32 and read the face
     * bitfields into an int, so the Bakes on Mesh slots (faces 40-44) were
     * dropped. Bitfields are 64-bit now.
     */
    public static final int MAX_FACES = 45;
    private static final SLTextureEntryFace[] emptyFaces = new SLTextureEntryFace[0];
    private static final InternPool<SLTextureEntry> pool = new InternPool<>();
    private final SLTextureEntryFace DefaultTexture;
    private final SLTextureEntryFace[] FaceTextures;
    private final long faceMask;
    private final int hashValue;

    private SLTextureEntry(SLTextureEntryFace textureEntryFace, SLTextureEntryFace[] textureEntryFaces) {
        this.DefaultTexture = textureEntryFace;
        this.FaceTextures = textureEntryFaces;
        long i = 0;
        for (int j = 0; j < textureEntryFaces.length && j < MAX_FACES; j++) {
            if (textureEntryFaces[j] != null) {
                i |= 1L << j;
            }
        }
        this.faceMask = i;
        this.hashValue = getHashValue();
    }

    private SLTextureEntry(ByteBuffer byteBuffer, int i) {
        MutableSLTextureEntryFace mutableSLTextureEntryFace = new MutableSLTextureEntryFace(-1);
        if (byteBuffer.limit() - byteBuffer.position() < 16) {
            this.DefaultTexture = SLTextureEntryFace.create(mutableSLTextureEntryFace);
            this.FaceTextures = emptyFaces;
            this.faceMask = 0;
            this.hashValue = getHashValue();
            return;
        }
        MutableSLTextureEntryFace[] mutableSLTextureEntryFaceArr = new MutableSLTextureEntryFace[MAX_FACES];
        long[] ints = new long[1];
        int[] ints2 = new int[1];
        mutableSLTextureEntryFace.setTextureID(UUIDPool.getUUID(getUUID(byteBuffer)));
        while (true) {
            long ReadFaceBitfield = ReadFaceBitfield(byteBuffer, ints2);
            if (ReadFaceBitfield == 0) {
                break;
            }
            UUID uuid = UUIDPool.getUUID(getUUID(byteBuffer));
            long i2 = 1L;
            int i3 = 0;
            while (i3 < ints2[0] && i3 < MAX_FACES) {
                if ((ReadFaceBitfield & i2) != 0) {
                    CreateFace(mutableSLTextureEntryFaceArr, i3, ints).setTextureID(uuid);
                }
                i3++;
                i2 <<= 1;
            }
        }
        mutableSLTextureEntryFace.setRGBA(byteBuffer.getInt());
        while (true) {
            long ReadFaceBitfield2 = ReadFaceBitfield(byteBuffer, ints2);
            if (ReadFaceBitfield2 == 0) {
                break;
            }
            int i4 = byteBuffer.getInt();
            long i5 = 1L;
            int i6 = 0;
            while (i6 < ints2[0] && i6 < MAX_FACES) {
                if ((ReadFaceBitfield2 & i5) != 0) {
                    CreateFace(mutableSLTextureEntryFaceArr, i6, ints).setRGBA(i4);
                }
                i6++;
                i5 <<= 1;
            }
        }
        mutableSLTextureEntryFace.setRepeatU(byteBuffer.getFloat());
        while (true) {
            long ReadFaceBitfield3 = ReadFaceBitfield(byteBuffer, ints2);
            if (ReadFaceBitfield3 == 0) {
                break;
            }
            float f = byteBuffer.getFloat();
            long i7 = 1L;
            int i8 = 0;
            while (i8 < ints2[0] && i8 < MAX_FACES) {
                if ((ReadFaceBitfield3 & i7) != 0) {
                    CreateFace(mutableSLTextureEntryFaceArr, i8, ints).setRepeatU(f);
                }
                i8++;
                i7 <<= 1;
            }
        }
        mutableSLTextureEntryFace.setRepeatV(byteBuffer.getFloat());
        while (true) {
            long ReadFaceBitfield4 = ReadFaceBitfield(byteBuffer, ints2);
            if (ReadFaceBitfield4 == 0) {
                break;
            }
            float f2 = byteBuffer.getFloat();
            long i9 = 1L;
            int i10 = 0;
            while (i10 < ints2[0] && i10 < MAX_FACES) {
                if ((ReadFaceBitfield4 & i9) != 0) {
                    CreateFace(mutableSLTextureEntryFaceArr, i10, ints).setRepeatV(f2);
                }
                i10++;
                i9 <<= 1;
            }
        }
        mutableSLTextureEntryFace.setOffsetU(getOffset(byteBuffer));
        while (true) {
            long ReadFaceBitfield5 = ReadFaceBitfield(byteBuffer, ints2);
            if (ReadFaceBitfield5 == 0) {
                break;
            }
            float offset = getOffset(byteBuffer);
            long i11 = 1L;
            int i12 = 0;
            while (i12 < ints2[0] && i12 < MAX_FACES) {
                if ((ReadFaceBitfield5 & i11) != 0) {
                    CreateFace(mutableSLTextureEntryFaceArr, i12, ints).setOffsetU(offset);
                }
                i12++;
                i11 <<= 1;
            }
        }
        mutableSLTextureEntryFace.setOffsetV(getOffset(byteBuffer));
        while (true) {
            long ReadFaceBitfield6 = ReadFaceBitfield(byteBuffer, ints2);
            if (ReadFaceBitfield6 == 0) {
                break;
            }
            float offset2 = getOffset(byteBuffer);
            long i13 = 1L;
            int i14 = 0;
            while (i14 < ints2[0] && i14 < MAX_FACES) {
                if ((ReadFaceBitfield6 & i13) != 0) {
                    CreateFace(mutableSLTextureEntryFaceArr, i14, ints).setOffsetV(offset2);
                }
                i14++;
                i13 <<= 1;
            }
        }
        mutableSLTextureEntryFace.setRotation(getRotation(byteBuffer));
        while (true) {
            long ReadFaceBitfield7 = ReadFaceBitfield(byteBuffer, ints2);
            if (ReadFaceBitfield7 == 0) {
                break;
            }
            float rotation = getRotation(byteBuffer);
            long i15 = 1L;
            int i16 = 0;
            while (i16 < ints2[0] && i16 < MAX_FACES) {
                if ((ReadFaceBitfield7 & i15) != 0) {
                    CreateFace(mutableSLTextureEntryFaceArr, i16, ints).setRotation(rotation);
                }
                i16++;
                i15 <<= 1;
            }
        }
        mutableSLTextureEntryFace.setMaterial(byteBuffer.get());
        while (true) {
            long ReadFaceBitfield8 = ReadFaceBitfield(byteBuffer, ints2);
            if (ReadFaceBitfield8 == 0) {
                break;
            }
            byte b = byteBuffer.get();
            long i17 = 1L;
            int i18 = 0;
            while (i18 < ints2[0] && i18 < MAX_FACES) {
                if ((ReadFaceBitfield8 & i17) != 0) {
                    CreateFace(mutableSLTextureEntryFaceArr, i18, ints).setMaterial(b);
                }
                i18++;
                i17 <<= 1;
            }
        }
        mutableSLTextureEntryFace.setMedia(byteBuffer.get());
        while (true) {
            long ReadFaceBitfield9 = ReadFaceBitfield(byteBuffer, ints2);
            if (ReadFaceBitfield9 == 0) {
                break;
            }
            byte b2 = byteBuffer.get();
            long i19 = 1L;
            int i20 = 0;
            while (i20 < ints2[0] && i20 < MAX_FACES) {
                if ((ReadFaceBitfield9 & i19) != 0) {
                    CreateFace(mutableSLTextureEntryFaceArr, i20, ints).setMedia(b2);
                }
                i20++;
                i19 <<= 1;
            }
        }
        mutableSLTextureEntryFace.setGlow(getGlow(byteBuffer));
        while (true) {
            long ReadFaceBitfield10 = ReadFaceBitfield(byteBuffer, ints2);
            if (ReadFaceBitfield10 == 0) {
                break;
            }
            float glow = getGlow(byteBuffer);
            long i21 = 1L;
            int i22 = 0;
            while (i22 < ints2[0] && i22 < MAX_FACES) {
                if ((ReadFaceBitfield10 & i21) != 0) {
                    CreateFace(mutableSLTextureEntryFaceArr, i22, ints).setGlow(glow);
                }
                i22++;
                i21 <<= 1;
            }
        }
        this.faceMask = ints[0];
        // Faces up to and including the highest one present.
        int i23 = 64 - Long.numberOfLeadingZeros(this.faceMask);
        this.DefaultTexture = SLTextureEntryFace.create(mutableSLTextureEntryFace);
        if (i23 == 0) {
            this.FaceTextures = emptyFaces;
        } else {
            this.FaceTextures = new SLTextureEntryFace[i23];
            for (int j = 0; j < i23; j++) {
                this.FaceTextures[j] = SLTextureEntryFace.create(mutableSLTextureEntryFaceArr[j]);
            }
        }
        this.hashValue = getHashValue();
    }

    private static MutableSLTextureEntryFace CreateFace(MutableSLTextureEntryFace[] mutableSLTextureEntryFaceArr, int i, long[] ints) {
        if (i >= MAX_FACES) {
            return null;
        }
        if (mutableSLTextureEntryFaceArr[i] != null) {
            return mutableSLTextureEntryFaceArr[i];
        }
        ints[0] = ints[0] | (1L << i);
        mutableSLTextureEntryFaceArr[i] = new MutableSLTextureEntryFace(0);
        return mutableSLTextureEntryFaceArr[i];
    }

    private long ReadFaceBitfield(ByteBuffer byteBuffer, int[] ints) {
        byte b;
        ints[0] = 0;
        if (byteBuffer.position() >= byteBuffer.limit()) {
            return 0;
        }
        long i = 0;
        do {
            b = byteBuffer.get();
            i = (i << 7) | (b & 0x7F);
            ints[0] = ints[0] + 7;
        } while ((b & 128) != 0);
        return i;
    }

    /** Big-endian groups of 7 bits, high bit set on every byte but the last (LLPrimitive::packTEField). */
    private void WriteFaceBitfield(ByteBuffer byteBuffer, long i) {
        int count = 1;
        for (long rest = i >>> 7; rest != 0; rest >>>= 7) {
            count++;
        }
        for (int j = count - 1; j >= 0; j--) {
            byte b = (byte) ((i >>> (j * 7)) & 0x7F);
            if (j != 0) {
                b = (byte) (b | 128);
            }
            byteBuffer.put(b);
        }
    }

    public static SLTextureEntry create(SLTextureEntryFace textureEntryFace, SLTextureEntryFace[] textureEntryFaces) {
        return pool.intern(new SLTextureEntry(textureEntryFace, textureEntryFaces));
    }

    public static SLTextureEntry create(ByteBuffer byteBuffer, int i) {
        return pool.intern(new SLTextureEntry(byteBuffer, i));
    }

    private static float getGlow(ByteBuffer byteBuffer) {
        return byteBuffer.get() / 255.0f;
    }

    private int getHashValue() {
        int length = this.FaceTextures.length + ((int) (this.faceMask ^ (this.faceMask >>> 32))) + this.DefaultTexture.hashCode();
        long i = 1;
        for (int j = 0; j < this.FaceTextures.length; j++) {
            if ((this.faceMask & i) != 0) {
                length += this.FaceTextures[j].hashCode();
            }
            i <<= 1;
        }
        return length;
    }

    private static float getOffset(ByteBuffer byteBuffer) {
        return byteBuffer.getShort() / 32767.0f;
    }

    private static float getRotation(ByteBuffer byteBuffer) {
        return (byteBuffer.getShort() / 32767.0f) * 3.1415927f * 2.0f;
    }

    private static UUID getUUID(ByteBuffer byteBuffer) {
        byteBuffer.order(ByteOrder.BIG_ENDIAN);
        UUID uuid = new UUID(byteBuffer.getLong(), byteBuffer.getLong());
        byteBuffer.order(ByteOrder.LITTLE_ENDIAN);
        return uuid;
    }

    private static void putGlow(ByteBuffer byteBuffer, float f) {
        byteBuffer.put((byte) (255.0f * f));
    }

    private static void putOffset(ByteBuffer byteBuffer, float f) {
        byteBuffer.putShort((short) (32767.0f * f));
    }

    private static void putRotation(ByteBuffer byteBuffer, float f) {
        byteBuffer.putShort((short) ((f / 6.2831855f) * 32767.0f));
    }

    private static void putUUID(ByteBuffer byteBuffer, UUID uuid) {
        long mostSignificantBits;
        long j2 = 0;
        byteBuffer.order(ByteOrder.BIG_ENDIAN);
        if (uuid != null) {
            mostSignificantBits = uuid.getMostSignificantBits();
            j2 = uuid.getLeastSignificantBits();
        } else {
            mostSignificantBits = 0;
        }
        byteBuffer.putLong(mostSignificantBits);
        byteBuffer.putLong(j2);
        byteBuffer.order(ByteOrder.LITTLE_ENDIAN);
    }

    public final SLTextureEntryFace GetDefaultTexture() {
        return this.DefaultTexture;
    }

    public final SLTextureEntryFace GetFace(int i) {
        if (i >= MAX_FACES) {
            return null;
        }
        if (i < this.FaceTextures.length && this.FaceTextures[i] != null) {
            return this.FaceTextures[i];
        }
        return this.DefaultTexture;
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj == null || !(obj instanceof SLTextureEntry)) {
            return false;
        }
        SLTextureEntry textureEntry = (SLTextureEntry) obj;
        if (this.faceMask != textureEntry.faceMask || this.FaceTextures.length != textureEntry.FaceTextures.length || !this.DefaultTexture.equals(textureEntry.DefaultTexture)) {
            return false;
        }
        long i = 1;
        for (int j = 0; j < this.FaceTextures.length; j++) {
            if ((this.faceMask & i) != 0 && !this.FaceTextures[j].equals(textureEntry.FaceTextures[j])) {
                return false;
            }
            i <<= 1;
        }
        return true;
    }

    public long getFaceMask() {
        return this.faceMask;
    }

    public final int hashCode() {
        return this.hashValue;
    }

    public boolean isSingleFace() {
        return this.faceMask == 0;
    }

    public byte[] packByteArray() {
        ByteBuffer allocate = ByteBuffer.allocate(SupportMenu.USER_MASK);
        putUUID(allocate, this.DefaultTexture.textureID());
        for (int i = 0; i < this.FaceTextures.length; i++) {
            if (this.FaceTextures[i] != null) {
                if (this.DefaultTexture.textureID() == null ? true : !this.FaceTextures[i].getTextureID(this.DefaultTexture).equals(this.DefaultTexture.textureID())) {
                    WriteFaceBitfield(allocate, 1L << i);
                    putUUID(allocate, this.FaceTextures[i].getTextureID(this.DefaultTexture));
                }
            }
        }
        WriteFaceBitfield(allocate, 0);
        allocate.putInt(this.DefaultTexture.rgba());
        for (int j = 0; j < this.FaceTextures.length; j++) {
            if (this.FaceTextures[j] != null && this.FaceTextures[j].getRGBA(this.DefaultTexture) != this.DefaultTexture.rgba()) {
                WriteFaceBitfield(allocate, 1L << j);
                allocate.putInt(this.FaceTextures[j].getRGBA(this.DefaultTexture));
            }
        }
        WriteFaceBitfield(allocate, 0);
        allocate.putFloat(this.DefaultTexture.repeatU());
        for (int k = 0; k < this.FaceTextures.length; k++) {
            if (this.FaceTextures[k] != null && this.FaceTextures[k].getRepeatU(this.DefaultTexture) != this.DefaultTexture.repeatU()) {
                WriteFaceBitfield(allocate, 1L << k);
                allocate.putFloat(this.FaceTextures[k].getRepeatU(this.DefaultTexture));
            }
        }
        WriteFaceBitfield(allocate, 0);
        allocate.putFloat(this.DefaultTexture.repeatV());
        for (int m = 0; m < this.FaceTextures.length; m++) {
            if (this.FaceTextures[m] != null && this.FaceTextures[m].getRepeatV(this.DefaultTexture) != this.DefaultTexture.repeatV()) {
                WriteFaceBitfield(allocate, 1L << m);
                allocate.putFloat(this.FaceTextures[m].getRepeatV(this.DefaultTexture));
            }
        }
        WriteFaceBitfield(allocate, 0);
        putOffset(allocate, this.DefaultTexture.offsetU());
        for (int n = 0; n < this.FaceTextures.length; n++) {
            if (this.FaceTextures[n] != null && this.FaceTextures[n].getOffsetU(this.DefaultTexture) != this.DefaultTexture.offsetU()) {
                WriteFaceBitfield(allocate, 1L << n);
                putOffset(allocate, this.FaceTextures[n].getOffsetU(this.DefaultTexture));
            }
        }
        WriteFaceBitfield(allocate, 0);
        putOffset(allocate, this.DefaultTexture.offsetV());
        for (int i6 = 0; i6 < this.FaceTextures.length; i6++) {
            if (this.FaceTextures[i6] != null && this.FaceTextures[i6].getOffsetV(this.DefaultTexture) != this.DefaultTexture.offsetV()) {
                WriteFaceBitfield(allocate, 1L << i6);
                putOffset(allocate, this.FaceTextures[i6].getOffsetV(this.DefaultTexture));
            }
        }
        WriteFaceBitfield(allocate, 0);
        putRotation(allocate, this.DefaultTexture.rotation());
        for (int i7 = 0; i7 < this.FaceTextures.length; i7++) {
            if (this.FaceTextures[i7] != null && this.FaceTextures[i7].getRotation(this.DefaultTexture) != this.DefaultTexture.rotation()) {
                WriteFaceBitfield(allocate, 1L << i7);
                putRotation(allocate, this.FaceTextures[i7].getRotation(this.DefaultTexture));
            }
        }
        WriteFaceBitfield(allocate, 0);
        allocate.put(this.DefaultTexture.materialb());
        for (int i8 = 0; i8 < this.FaceTextures.length; i8++) {
            if (this.FaceTextures[i8] != null && this.FaceTextures[i8].getMaterial(this.DefaultTexture) != this.DefaultTexture.materialb()) {
                WriteFaceBitfield(allocate, 1L << i8);
                allocate.put(this.FaceTextures[i8].getMaterial(this.DefaultTexture));
            }
        }
        WriteFaceBitfield(allocate, 0);
        allocate.put(this.DefaultTexture.mediab());
        for (int i9 = 0; i9 < this.FaceTextures.length; i9++) {
            if (this.FaceTextures[i9] != null && this.FaceTextures[i9].getMedia(this.DefaultTexture) != this.DefaultTexture.mediab()) {
                WriteFaceBitfield(allocate, 1L << i9);
                allocate.put(this.FaceTextures[i9].getMedia(this.DefaultTexture));
            }
        }
        WriteFaceBitfield(allocate, 0);
        putGlow(allocate, this.DefaultTexture.glow());
        for (int i10 = 0; i10 < this.FaceTextures.length; i10++) {
            if (this.FaceTextures[i10] != null && this.FaceTextures[i10].getGlow(this.DefaultTexture) != this.DefaultTexture.glow()) {
                WriteFaceBitfield(allocate, 1L << i10);
                putGlow(allocate, this.FaceTextures[i10].getGlow(this.DefaultTexture));
            }
        }
        WriteFaceBitfield(allocate, 0);
        byte[] bytes = new byte[allocate.position()];
        allocate.position(0);
        allocate.get(bytes);
        Debug.DumpBuffer("Baking: TEpacked: ", bytes);
        return bytes;
    }
}
