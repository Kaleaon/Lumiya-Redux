package com.lumiyaviewer.lumiya.slproto.textures;

import com.lumiyaviewer.lumiya.utils.InternPool;
import java.util.UUID;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public abstract class SLTextureEntryFace {
    public static final int AttributeAll = -1;
    static final int AttributeGlow = 512;
    static final int AttributeMaterial = 128;
    static final int AttributeMedia = 256;
    static final int AttributeOffsetU = 16;
    static final int AttributeOffsetV = 32;
    static final int AttributeRGBA = 2;
    static final int AttributeRepeatU = 4;
    static final int AttributeRepeatV = 8;
    static final int AttributeRotation = 64;
    static final int AttributeTextureID = 1;
    private static final InternPool<SLTextureEntryFace> pool = new InternPool<>();

    public static SLTextureEntryFace create(MutableSLTextureEntryFace mutableSLTextureEntryFace) {
        if (mutableSLTextureEntryFace == null) {
            return null;
        }
        return pool.intern(new AutoValue_SLTextureEntryFace(mutableSLTextureEntryFace.textureID, mutableSLTextureEntryFace.rgba, mutableSLTextureEntryFace.repeatU, mutableSLTextureEntryFace.repeatV, mutableSLTextureEntryFace.offsetU, mutableSLTextureEntryFace.offsetV, mutableSLTextureEntryFace.rotation, mutableSLTextureEntryFace.glow, mutableSLTextureEntryFace.materialb, mutableSLTextureEntryFace.mediab, mutableSLTextureEntryFace.hasAttribute));
    }

    public final float getGlow(@Nonnull SLTextureEntryFace textureEntryFace) {
        return (hasAttribute() & 512) != 0 ? glow() : textureEntryFace.glow();
    }

    public final byte getMaterial(@Nonnull SLTextureEntryFace textureEntryFace) {
        return (hasAttribute() & 128) != 0 ? materialb() : textureEntryFace.materialb();
    }

    public final byte getMedia(@Nonnull SLTextureEntryFace textureEntryFace) {
        return (hasAttribute() & 256) != 0 ? mediab() : textureEntryFace.mediab();
    }

    public final float getOffsetU(@Nonnull SLTextureEntryFace textureEntryFace) {
        return (hasAttribute() & 16) != 0 ? offsetU() : textureEntryFace.offsetU();
    }

    public final float getOffsetV(@Nonnull SLTextureEntryFace textureEntryFace) {
        return (hasAttribute() & 32) != 0 ? offsetV() : textureEntryFace.offsetV();
    }

    public final int getRGBA(@Nonnull SLTextureEntryFace textureEntryFace) {
        return (hasAttribute() & 2) != 0 ? rgba() : textureEntryFace.rgba();
    }

    public final float getRepeatU(@Nonnull SLTextureEntryFace textureEntryFace) {
        return (hasAttribute() & 4) != 0 ? repeatU() : textureEntryFace.repeatU();
    }

    public final float getRepeatV(@Nonnull SLTextureEntryFace textureEntryFace) {
        return (hasAttribute() & 8) != 0 ? repeatV() : textureEntryFace.repeatV();
    }

    public final float getRotation(@Nonnull SLTextureEntryFace textureEntryFace) {
        return (hasAttribute() & 64) != 0 ? rotation() : textureEntryFace.rotation();
    }

    @Nullable
    public final UUID getTextureID(@Nonnull SLTextureEntryFace textureEntryFace) {
        return (hasAttribute() & 1) != 0 ? textureID() : textureEntryFace.textureID();
    }

    public abstract float glow();

    public abstract int hasAttribute();

    public abstract byte materialb();

    public abstract byte mediab();

    public abstract float offsetU();

    public abstract float offsetV();

    public abstract float repeatU();

    public abstract float repeatV();

    public abstract int rgba();

    public abstract float rotation();

    @Nullable
    public abstract UUID textureID();
}
