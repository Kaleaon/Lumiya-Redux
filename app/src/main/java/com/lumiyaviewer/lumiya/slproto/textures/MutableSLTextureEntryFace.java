package com.lumiyaviewer.lumiya.slproto.textures;

import java.util.UUID;

public class MutableSLTextureEntryFace {
    public static final byte BUMP_MASK = 31;
    public static final byte FULLBRIGHT_MASK = 32;
    public static final byte MEDIA_MASK = 1;
    public static final byte SHINY_MASK = -64;
    public static final byte TEX_MAP_MASK = 6;
    int hasAttribute;
    UUID textureID;
    int rgba = -1;
    float repeatU = 1.0f;
    float repeatV = 1.0f;
    float offsetU = 1.0f;
    float offsetV = 1.0f;
    float rotation = 0.0f;
    float glow = 0.0f;
    byte materialb = 0;
    byte mediab = 0;

    public MutableSLTextureEntryFace(int hasAttribute) {
        this.hasAttribute = hasAttribute;
    }

    public void setGlow(float glow) {
        this.glow = glow;
        this.hasAttribute |= 512;
    }

    public void setMaterial(byte materialb) {
        this.materialb = materialb;
        this.hasAttribute |= 128;
    }

    public void setMedia(byte mediab) {
        this.mediab = mediab;
        this.hasAttribute |= 256;
    }

    public void setOffsetU(float offsetU) {
        this.offsetU = offsetU;
        this.hasAttribute |= 16;
    }

    public void setOffsetV(float offsetV) {
        this.offsetV = offsetV;
        this.hasAttribute |= 32;
    }

    public void setRGBA(int rgba) {
        this.rgba = rgba;
        this.hasAttribute |= 2;
    }

    public void setRepeatU(float repeatU) {
        this.repeatU = repeatU;
        this.hasAttribute |= 4;
    }

    public void setRepeatV(float repeatV) {
        this.repeatV = repeatV;
        this.hasAttribute |= 8;
    }

    public void setRotation(float rotation) {
        this.rotation = rotation;
        this.hasAttribute |= 64;
    }

    public void setTextureID(UUID uuid) {
        this.textureID = uuid;
        this.hasAttribute |= 1;
    }
}
