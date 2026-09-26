package com.lumiyaviewer.lumiya.slproto.textures

import java.util.UUID

class AutoValue_SLTextureEntryFace : SLTextureEntryFace() {
    private var glow: Float = 0.0f
    private var hasAttribute: Int = 0
    private var materialb: Byte = 0
    private var mediab: Byte = 0
    private var offsetU: Float = 0.0f
    private var offsetV: Float = 0.0f
    private var repeatU: Float = 0.0f
    private var repeatV: Float = 0.0f
    private var rgba: Int = 0
    private var rotation: Float = 0.0f
    private var textureID: UUID = null

    constructor(uuid: UUID, rgba: Int, repeatU: Float, repeatV: Float, offsetU: Float, offsetV: Float, rotation: Float, glow: Float, materialb: Byte, mediab: Byte, hasAttribute: Int) {
        this.textureID = uuid
        this.rgba = rgba
        this.repeatU = repeatU
        this.repeatV = repeatV
        this.offsetU = offsetU
        this.offsetV = offsetV
        this.rotation = rotation
        this.glow = glow
        this.materialb = materialb
        this.mediab = mediab
        this.hasAttribute = hasAttribute
    }

    fun equals(obj: Any): Boolean {
        if (obj == this) {
        return true
        }
        if (!(obj is SLTextureEntryFace)) {
        return false
        }
        var textureEntryFace: SLTextureEntryFace = obj as SLTextureEntryFace
        if (if (this.textureID != null) this.textureID.equals(textureEntryFace.textureID()) else textureEntryFace.textureID() == null) {
            if (this.rgba == textureEntryFace.rgba() && Float.floatToIntBits(this.repeatU) == Float.floatToIntBits(textureEntryFace.repeatU()) && Float.floatToIntBits(this.repeatV) == Float.floatToIntBits(textureEntryFace.repeatV()) && Float.floatToIntBits(this.offsetU) == Float.floatToIntBits(textureEntryFace.offsetU()) && Float.floatToIntBits(this.offsetV) == Float.floatToIntBits(textureEntryFace.offsetV()) && Float.floatToIntBits(this.rotation) == Float.floatToIntBits(textureEntryFace.rotation()) && Float.floatToIntBits(this.glow) == Float.floatToIntBits(textureEntryFace.glow()) && this.materialb == textureEntryFace.materialb() && this.mediab == textureEntryFace.mediab()) {
                return this.hasAttribute == textureEntryFace.hasAttribute()
            }
        }
        return false
    }
    fun glow(): Float {
        return this.glow
    }
    fun hasAttribute(): Int {
        return this.hasAttribute
    }

    fun hashCode(): Int {
        return (((((((((((((((((((((if (this.textureID == null) 0 else this.textureID.hashCode()) ^ 1000003) * 1000003) ^ this.rgba) * 1000003) ^ Float.floatToIntBits(this.repeatU)) * 1000003) ^ Float.floatToIntBits(this.repeatV)) * 1000003) ^ Float.floatToIntBits(this.offsetU)) * 1000003) ^ Float.floatToIntBits(this.offsetV)) * 1000003) ^ Float.floatToIntBits(this.rotation)) * 1000003) ^ Float.floatToIntBits(this.glow)) * 1000003) ^ this.materialb) * 1000003) ^ this.mediab) * 1000003) ^ this.hasAttribute
    }
    fun materialb(): Byte {
        return this.materialb
    }
    fun mediab(): Byte {
        return this.mediab
    }
    fun offsetU(): Float {
        return this.offsetU
    }
    fun offsetV(): Float {
        return this.offsetV
    }
    fun repeatU(): Float {
        return this.repeatU
    }
    fun repeatV(): Float {
        return this.repeatV
    }
    fun rgba(): Int {
        return this.rgba
    }
    fun rotation(): Float {
        return this.rotation
    }
    fun textureID(): UUID {
        return this.textureID
    }

    fun toString(): String {
        return "SLTextureEntryFace{textureID=" + this.textureID + ", rgba=" + this.rgba + ", repeatU=" + this.repeatU + ", repeatV=" + this.repeatV + ", offsetU=" + this.offsetU + ", offsetV=" + this.offsetV + ", rotation=" + this.rotation + ", glow=" + this.glow + ", materialb=" + (this as int.materialb) + ", mediab=" + (this as int.mediab) + ", hasAttribute=" + this.hasAttribute + "}"
    }
}
