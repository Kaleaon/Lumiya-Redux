package com.lumiyaviewer.lumiya.render.drawable;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Application;
import com.lumiyaviewer.lumiya.render.avatar.AvatarTextures;
import com.lumiyaviewer.lumiya.render.tex.DrawableTextureParams;
import com.lumiyaviewer.lumiya.render.tex.TextureClass;
import com.lumiyaviewer.lumiya.slproto.avatar.AvatarTextureFaceIndex;
import com.lumiyaviewer.lumiya.slproto.avatar.BakesOnMesh;
import com.lumiyaviewer.lumiya.slproto.prims.AvatarBakes;
import com.lumiyaviewer.lumiya.slproto.prims.PrimDrawParams;
import com.lumiyaviewer.lumiya.slproto.textures.MutableSLTextureEntryFace;
import com.lumiyaviewer.lumiya.slproto.textures.SLTextureEntry;
import com.lumiyaviewer.lumiya.slproto.textures.SLTextureEntryFace;
import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.util.EnumMap;
import java.util.Map;
import java.util.UUID;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/** Bakes on Mesh: the 45-face avatar texture entry and placeholder resolution on attachments. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 34, application = Application.class)
public class BakesOnMeshTest {
    private static final UUID IMG_USE_BAKED_UPPER = UUID.fromString("ae2de45c-d252-50b8-5c6e-19f39ce79317");
    private static final UUID IMG_USE_BAKED_LEFTARM = UUID.fromString("ff62763f-d60a-9855-890b-0c96f8f8cd98");
    private static final UUID AVATAR = UUID.fromString("11111111-2222-3333-4444-555555555555");
    private static final UUID UPPER_BAKE = UUID.fromString("aaaaaaaa-0000-0000-0000-000000000009");
    private static final UUID LEFT_ARM_BAKE = UUID.fromString("aaaaaaaa-0000-0000-0000-000000000040");
    private static final UUID PLYWOOD = UUID.fromString("89556747-24cb-43ed-920b-47caed15465f");

    private static void putUUID(ByteArrayOutputStream out, UUID uuid) {
        ByteBuffer b = ByteBuffer.allocate(16);
        b.putLong(uuid.getMostSignificantBits()).putLong(uuid.getLeastSignificantBits());
        out.write(b.array(), 0, 16);
    }

    /** Face bitfield as the simulator writes it: 7 bits per byte, most significant first. */
    private static void putFaceBits(ByteArrayOutputStream out, long bits) {
        int count = 1;
        for (long rest = bits >>> 7; rest != 0; rest >>>= 7) {
            count++;
        }
        for (int j = count - 1; j >= 0; j--) {
            int b = (int) ((bits >>> (j * 7)) & 0x7F);
            out.write(j != 0 ? b | 0x80 : b);
        }
    }

    /**
     * An AvatarAppearance texture entry with the upper-body bake on face 9
     * and the left-arm bake on face 40, built byte by byte from the wire
     * format (LLPrimitive::packTEMessage) rather than with the class under test.
     */
    private static byte[] avatarTextureEntry() {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        putUUID(out, AvatarTextures.DEFAULT_AVATAR_TEXTURE);
        putFaceBits(out, 1L << 9);
        putUUID(out, UPPER_BAKE);
        putFaceBits(out, 1L << 40);
        putUUID(out, LEFT_ARM_BAKE);
        out.write(0);
        out.write(new byte[]{-1, -1, -1, -1}, 0, 4); // colour
        out.write(0);
        out.write(new byte[4], 0, 4); // repeat U
        out.write(0);
        out.write(new byte[4], 0, 4); // repeat V
        out.write(0);
        out.write(new byte[2], 0, 2); // offset U
        out.write(0);
        out.write(new byte[2], 0, 2); // offset V
        out.write(0);
        out.write(new byte[2], 0, 2); // rotation
        out.write(0);
        out.write(0); // material
        out.write(0);
        out.write(0); // media
        out.write(0);
        out.write(0); // glow
        out.write(0);
        return out.toByteArray();
    }

    @Test
    public void faceIndexOrdinalsMatchTextureEntryFaces() {
        assertEquals(45, AvatarTextureFaceIndex.values().length);
        assertEquals(9, AvatarTextureFaceIndex.TEX_UPPER_BAKED.ordinal());
        assertEquals(29, AvatarTextureFaceIndex.TEX_HEAD_UNIVERSAL_TATTOO.ordinal());
        assertEquals(40, AvatarTextureFaceIndex.TEX_LEFT_ARM_BAKED.ordinal());
        assertEquals(44, AvatarTextureFaceIndex.TEX_AUX3_BAKED.ordinal());
        assertEquals("leftarm", AvatarTextureFaceIndex.TEX_LEFT_ARM_BAKED.getBakedTextureName());
    }

    @Test
    public void textureEntryReadsFacesBeyond32() {
        byte[] te = avatarTextureEntry();
        SLTextureEntry entry = SLTextureEntry.create(ByteBuffer.wrap(te), te.length);
        SLTextureEntryFace def = entry.GetDefaultTexture();
        assertEquals(UPPER_BAKE, entry.GetFace(9).getTextureID(def));
        assertEquals(LEFT_ARM_BAKE, entry.GetFace(40).getTextureID(def));
        assertEquals(AvatarTextures.DEFAULT_AVATAR_TEXTURE, entry.GetFace(41).getTextureID(def));
        assertTrue((entry.getFaceMask() & (1L << 40)) != 0);

        AvatarTextures textures = new AvatarTextures();
        assertTrue(textures.ApplyTextures(entry, false));
        assertEquals(UPPER_BAKE, textures.getTexture(AvatarTextureFaceIndex.TEX_UPPER_BAKED));
        assertEquals(LEFT_ARM_BAKE, textures.getTexture(AvatarTextureFaceIndex.TEX_LEFT_ARM_BAKED));
        AvatarBakes bakes = textures.getBakes(AVATAR);
        assertEquals(LEFT_ARM_BAKE, bakes.getBake(AvatarTextureFaceIndex.TEX_LEFT_ARM_BAKED));
    }

    @Test
    public void packedTextureEntryRoundTrips() {
        SLTextureEntryFace[] faces = new SLTextureEntryFace[SLTextureEntry.MAX_FACES];
        for (int face : new int[]{8, 9, 31, 40, 44}) {
            MutableSLTextureEntryFace mutable = new MutableSLTextureEntryFace(0);
            mutable.setTextureID(new UUID(0xabcdL, face));
            faces[face] = SLTextureEntryFace.create(mutable);
        }
        MutableSLTextureEntryFace defaultFace = new MutableSLTextureEntryFace(-1);
        defaultFace.setTextureID(AvatarTextures.DEFAULT_AVATAR_TEXTURE);
        SLTextureEntry entry = SLTextureEntry.create(SLTextureEntryFace.create(defaultFace), faces);
        byte[] packed = entry.packByteArray();
        SLTextureEntry parsed = SLTextureEntry.create(ByteBuffer.wrap(packed), packed.length);
        for (int face : new int[]{8, 9, 31, 40, 44}) {
            assertEquals(new UUID(0xabcdL, face), parsed.GetFace(face).getTextureID(parsed.GetDefaultTexture()));
        }
    }

    private static PrimDrawParams primWithTexture(UUID texture) {
        MutableSLTextureEntryFace defaultFace = new MutableSLTextureEntryFace(-1);
        defaultFace.setTextureID(texture);
        return new PrimDrawParams(null, SLTextureEntry.create(SLTextureEntryFace.create(defaultFace), new SLTextureEntryFace[0]));
    }

    private static AvatarBakes bakes(UUID avatar, UUID upper) {
        Map<AvatarTextureFaceIndex, UUID> map = new EnumMap<>(AvatarTextureFaceIndex.class);
        map.put(AvatarTextureFaceIndex.TEX_UPPER_BAKED, upper);
        return new AvatarBakes(avatar, map);
    }

    @Test
    public void ordinaryAttachmentsShareCachedPrims() {
        PrimDrawParams plain = primWithTexture(PLYWOOD);
        assertFalse(plain.usesBakesOnMesh());
        assertSame(plain, plain.withBakes(bakes(AVATAR, UPPER_BAKE)));
    }

    @Test
    public void bakesOnMeshAttachmentsKeyedByWearerBakes() {
        PrimDrawParams bom = primWithTexture(IMG_USE_BAKED_UPPER);
        assertTrue(bom.usesBakesOnMesh());
        PrimDrawParams worn = bom.withBakes(bakes(AVATAR, UPPER_BAKE));
        assertNotEquals(bom, worn);
        assertEquals(worn, bom.withBakes(bakes(AVATAR, UPPER_BAKE)));
        assertEquals(worn.hashCode(), bom.withBakes(bakes(AVATAR, UPPER_BAKE)).hashCode());
        assertNotEquals(worn, bom.withBakes(bakes(AVATAR, LEFT_ARM_BAKE)));
        assertNotEquals(worn, bom.withBakes(bakes(UUID.randomUUID(), UPPER_BAKE)));
        assertNull(bom.withBakes(null).getBakes());
    }

    @Test
    public void placeholderResolvesToWearerBake() {
        DrawableTextureParams params = DrawablePrim.faceTextureParams(IMG_USE_BAKED_UPPER, bakes(AVATAR, UPPER_BAKE));
        assertEquals(UPPER_BAKE, params.uuid());
        assertEquals(TextureClass.Baked, params.textureClass());
        assertEquals(AvatarTextureFaceIndex.TEX_UPPER_BAKED, params.avatarFaceIndex());
        assertEquals(AVATAR, params.avatarUUID());
    }

    @Test
    public void unresolvedPlaceholderKeepsPlaceholderTexture() {
        // Wearer has no left-arm bake: show the placeholder as 3.4.2 did.
        DrawableTextureParams params = DrawablePrim.faceTextureParams(IMG_USE_BAKED_LEFTARM, bakes(AVATAR, UPPER_BAKE));
        assertEquals(IMG_USE_BAKED_LEFTARM, params.uuid());
        assertEquals(TextureClass.Prim, params.textureClass());
        // Default avatar texture means "not baked yet".
        params = DrawablePrim.faceTextureParams(IMG_USE_BAKED_UPPER, bakes(AVATAR, AvatarTextures.DEFAULT_AVATAR_TEXTURE));
        assertEquals(TextureClass.Prim, params.textureClass());
        // Not an attachment.
        params = DrawablePrim.faceTextureParams(IMG_USE_BAKED_UPPER, null);
        assertEquals(TextureClass.Prim, params.textureClass());
    }

    @Test
    public void ordinaryTextureUnchanged() {
        DrawableTextureParams params = DrawablePrim.faceTextureParams(PLYWOOD, bakes(AVATAR, UPPER_BAKE));
        assertEquals(PLYWOOD, params.uuid());
        assertEquals(TextureClass.Prim, params.textureClass());
        assertFalse(BakesOnMesh.isBakedImageId(PLYWOOD));
    }
}
