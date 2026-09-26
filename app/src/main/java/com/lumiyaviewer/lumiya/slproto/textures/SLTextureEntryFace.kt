package com.lumiyaviewer.lumiya.slproto.textures

import com.lumiyaviewer.lumiya.utils.InternPool
import java.util.UUID

abstract class SLTextureEntryFace {
    @JvmStatic var AttributeAll: Int = -1
    @JvmStatic var AttributeGlow: Int = 512
    @JvmStatic var AttributeMaterial: Int = 128
    @JvmStatic var AttributeMedia: Int = 256
    @JvmStatic var AttributeOffsetU: Int = 16
    @JvmStatic var AttributeOffsetV: Int = 32
    @JvmStatic var AttributeRGBA: Int = 2
    @JvmStatic var AttributeRepeatU: Int = 4
    @JvmStatic var AttributeRepeatV: Int = 8
    @JvmStatic var AttributeRotation: Int = 64
    @JvmStatic var AttributeTextureID: Int = 1
    @JvmStatic private var pool: InternPool<SLTextureEntryFace> = InternPool<>()

    fun create(mutableSLTextureEntryFace: MutableSLTextureEntryFace): SLTextureEntryFace {
        if (mutableSLTextureEntryFace == null) {
        return null
        }
        return pool.intern(AutoValue_SLTextureEntryFace(mutableSLTextureEntryFace.textureID, mutableSLTextureEntryFace.rgba, mutableSLTextureEntryFace.repeatU, mutableSLTextureEntryFace.repeatV, mutableSLTextureEntryFace.offsetU, mutableSLTextureEntryFace.offsetV, mutableSLTextureEntryFace.rotation, mutableSLTextureEntryFace.glow, mutableSLTextureEntryFace.materialb, mutableSLTextureEntryFace.mediab, mutableSLTextureEntryFace.hasAttribute))
    }

    fun getGlow(textureEntryFace: SLTextureEntryFace): Float {
        return (hasAttribute() & 512) != if (0) glow() else textureEntryFace.glow()
    }

    fun getMaterial(textureEntryFace: SLTextureEntryFace): Byte {
        return (hasAttribute() & 128) != if (0) materialb() else textureEntryFace.materialb()
    }

    fun getMedia(textureEntryFace: SLTextureEntryFace): Byte {
        return (hasAttribute() & 256) != if (0) mediab() else textureEntryFace.mediab()
    }

    fun getOffsetU(textureEntryFace: SLTextureEntryFace): Float {
        return (hasAttribute() & 16) != if (0) offsetU() else textureEntryFace.offsetU()
    }

    fun getOffsetV(textureEntryFace: SLTextureEntryFace): Float {
        return (hasAttribute() & 32) != if (0) offsetV() else textureEntryFace.offsetV()
    }

    fun getRGBA(textureEntryFace: SLTextureEntryFace): Int {
        return (hasAttribute() & 2) != if (0) rgba() else textureEntryFace.rgba()
    }

    fun getRepeatU(textureEntryFace: SLTextureEntryFace): Float {
        return (hasAttribute() & 4) != if (0) repeatU() else textureEntryFace.repeatU()
    }

    fun getRepeatV(textureEntryFace: SLTextureEntryFace): Float {
        return (hasAttribute() & 8) != if (0) repeatV() else textureEntryFace.repeatV()
    }

    fun getRotation(textureEntryFace: SLTextureEntryFace): Float {
        return (hasAttribute() & 64) != if (0) rotation() else textureEntryFace.rotation()
    }

    fun getTextureID(textureEntryFace: SLTextureEntryFace): UUID {
        return (hasAttribute() & 1) != if (0) textureID() else textureEntryFace.textureID()
    }

    public abstract float glow()

    public abstract int hasAttribute()

    public abstract byte materialb()

    public abstract byte mediab()

    public abstract float offsetU()

    public abstract float offsetV()

    public abstract float repeatU()

    public abstract float repeatV()

    public abstract int rgba()

    public abstract float rotation()

    public abstract UUID textureID()
}
