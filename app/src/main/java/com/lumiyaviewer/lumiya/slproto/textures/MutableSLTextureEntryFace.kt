package com.lumiyaviewer.lumiya.slproto.textures

import java.util.UUID

open class MutableSLTextureEntryFace {
    @JvmStatic var BUMP_MASK: Byte = 31
    @JvmStatic var FULLBRIGHT_MASK: Byte = 32
    @JvmStatic var MEDIA_MASK: Byte = 1
    @JvmStatic var SHINY_MASK: Byte = -64
    @JvmStatic var TEX_MAP_MASK: Byte = 6
    var hasAttribute: Int = 0
    var textureID: UUID = null
    var rgba: Int = -1
    var repeatU: Float = 1.0f
    var repeatV: Float = 1.0f
    var offsetU: Float = 1.0f
    var offsetV: Float = 1.0f
    var rotation: Float = 0.0f
    var glow: Float = 0.0f
    var materialb: Byte = 0
    var mediab: Byte = 0

    constructor(hasAttribute: Int) {
        this.hasAttribute = hasAttribute
    }

    fun setGlow(glow: Float) {
        this.glow = glow
        this.hasAttribute |= 512
    }

    fun setMaterial(materialb: Byte) {
        this.materialb = materialb
        this.hasAttribute |= 128
    }

    fun setMedia(mediab: Byte) {
        this.mediab = mediab
        this.hasAttribute |= 256
    }

    fun setOffsetU(offsetU: Float) {
        this.offsetU = offsetU
        this.hasAttribute |= 16
    }

    fun setOffsetV(offsetV: Float) {
        this.offsetV = offsetV
        this.hasAttribute |= 32
    }

    fun setRGBA(rgba: Int) {
        this.rgba = rgba
        this.hasAttribute |= 2
    }

    fun setRepeatU(repeatU: Float) {
        this.repeatU = repeatU
        this.hasAttribute |= 4
    }

    fun setRepeatV(repeatV: Float) {
        this.repeatV = repeatV
        this.hasAttribute |= 8
    }

    fun setRotation(rotation: Float) {
        this.rotation = rotation
        this.hasAttribute |= 64
    }

    fun setTextureID(uuid: UUID) {
        this.textureID = uuid
        this.hasAttribute |= 1
    }
}
