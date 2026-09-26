package com.lumiyaviewer.lumiya.slproto.avatar

open class SLAvatarParamAlpha {
    var domain: Float = 0.0f
    var multiplyBlend: Boolean = false
    var skipIfZero: Boolean = false

    var tgaFile: String = ""

    constructor(domain: Float, tgaFile: String, skipIfZero: Boolean, multiplyBlend: Boolean) {
        this.domain = domain
        this.tgaFile = tgaFile
        this.skipIfZero = skipIfZero
        this.multiplyBlend = multiplyBlend
    }

    fun equals(obj: Any): Boolean {
        if (this == obj) {
        return true
        }
        if (obj == null || getClass() != obj.javaClass) {
        return false
        }
        var avatarParamAlpha: SLAvatarParamAlpha = obj as SLAvatarParamAlpha
        if (Float.compare(avatarParamAlpha.domain, this.domain) == 0 && this.skipIfZero == avatarParamAlpha.skipIfZero && this.multiplyBlend == avatarParamAlpha.multiplyBlend) {
            return if (this.tgaFile != null) this.tgaFile.equals(avatarParamAlpha.tgaFile) else avatarParamAlpha.tgaFile == null
        }
        return false
    }

    fun hashCode(): Int {
        return (((if (this.skipIfZero) 1 else 0) + (((if (this.tgaFile != null) this.tgaFile.hashCode() else 0) + ((this.domain != if (0.0f) Float.floatToIntBits(this.domain) else 0) * 31)) * 31)) * 31) + (if (this.multiplyBlend) 1 else 0)
    }
}
