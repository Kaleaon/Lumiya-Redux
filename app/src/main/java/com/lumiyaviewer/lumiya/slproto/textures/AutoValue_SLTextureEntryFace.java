package com.lumiyaviewer.lumiya.slproto.textures;

import java.util.UUID;
import javax.annotation.Nullable;

final class AutoValue_SLTextureEntryFace extends SLTextureEntryFace {
    private final float glow;
    private final int hasAttribute;
    private final byte materialb;
    private final byte mediab;
    private final float offsetU;
    private final float offsetV;
    private final float repeatU;
    private final float repeatV;
    private final int rgba;
    private final float rotation;
    private final UUID textureID;

    AutoValue_SLTextureEntryFace(@Nullable UUID uuid, int rgba, float repeatU, float repeatV, float offsetU, float offsetV, float rotation, float glow, byte materialb, byte mediab, int hasAttribute) {
        this.textureID = uuid;
        this.rgba = rgba;
        this.repeatU = repeatU;
        this.repeatV = repeatV;
        this.offsetU = offsetU;
        this.offsetV = offsetV;
        this.rotation = rotation;
        this.glow = glow;
        this.materialb = materialb;
        this.mediab = mediab;
        this.hasAttribute = hasAttribute;
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof SLTextureEntryFace)) {
            return false;
        }
        SLTextureEntryFace textureEntryFace = (SLTextureEntryFace) obj;
        if (this.textureID != null ? this.textureID.equals(textureEntryFace.textureID()) : textureEntryFace.textureID() == null) {
            if (this.rgba == textureEntryFace.rgba() && Float.floatToIntBits(this.repeatU) == Float.floatToIntBits(textureEntryFace.repeatU()) && Float.floatToIntBits(this.repeatV) == Float.floatToIntBits(textureEntryFace.repeatV()) && Float.floatToIntBits(this.offsetU) == Float.floatToIntBits(textureEntryFace.offsetU()) && Float.floatToIntBits(this.offsetV) == Float.floatToIntBits(textureEntryFace.offsetV()) && Float.floatToIntBits(this.rotation) == Float.floatToIntBits(textureEntryFace.rotation()) && Float.floatToIntBits(this.glow) == Float.floatToIntBits(textureEntryFace.glow()) && this.materialb == textureEntryFace.materialb() && this.mediab == textureEntryFace.mediab()) {
                return this.hasAttribute == textureEntryFace.hasAttribute();
            }
        }
        return false;
    }

    @Override
    public float glow() {
        return this.glow;
    }

    @Override
    public int hasAttribute() {
        return this.hasAttribute;
    }

    public int hashCode() {
        return (((((((((((((((((((((this.textureID == null ? 0 : this.textureID.hashCode()) ^ 1000003) * 1000003) ^ this.rgba) * 1000003) ^ Float.floatToIntBits(this.repeatU)) * 1000003) ^ Float.floatToIntBits(this.repeatV)) * 1000003) ^ Float.floatToIntBits(this.offsetU)) * 1000003) ^ Float.floatToIntBits(this.offsetV)) * 1000003) ^ Float.floatToIntBits(this.rotation)) * 1000003) ^ Float.floatToIntBits(this.glow)) * 1000003) ^ this.materialb) * 1000003) ^ this.mediab) * 1000003) ^ this.hasAttribute;
    }

    @Override
    public byte materialb() {
        return this.materialb;
    }

    @Override
    public byte mediab() {
        return this.mediab;
    }

    @Override
    public float offsetU() {
        return this.offsetU;
    }

    @Override
    public float offsetV() {
        return this.offsetV;
    }

    @Override
    public float repeatU() {
        return this.repeatU;
    }

    @Override
    public float repeatV() {
        return this.repeatV;
    }

    @Override
    public int rgba() {
        return this.rgba;
    }

    @Override
    public float rotation() {
        return this.rotation;
    }

    @Override
    @Nullable
    public UUID textureID() {
        return this.textureID;
    }

    public String toString() {
        return "SLTextureEntryFace{textureID=" + this.textureID + ", rgba=" + this.rgba + ", repeatU=" + this.repeatU + ", repeatV=" + this.repeatV + ", offsetU=" + this.offsetU + ", offsetV=" + this.offsetV + ", rotation=" + this.rotation + ", glow=" + this.glow + ", materialb=" + ((int) this.materialb) + ", mediab=" + ((int) this.mediab) + ", hasAttribute=" + this.hasAttribute + "}";
    }
}
