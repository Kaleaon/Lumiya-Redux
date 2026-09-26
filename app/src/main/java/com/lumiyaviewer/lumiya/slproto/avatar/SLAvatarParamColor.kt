package com.lumiyaviewer.lumiya.slproto.avatar

import java.util.Arrays

open class SLAvatarParamColor {

    var colorOperation: ColorOperation = null

    private var colorValues: IntArray = null

    enum class ColorOperation {
        Default,
        Blend,
        Multiply

        /* renamed from: values, reason: to resolve conflict with enum method */
        fun valuesCustom(): Array<ColorOperation> {
            return values()
        }
    }

    constructor(colorOperation: ColorOperation, ints: IntArray) {
        this.colorOperation = colorOperation
        this.colorValues = ints
    }

    fun colorAdd(i: Int, i2: Int): Int {
        var i3: Int = (i & 255) + (i2 & 255)
        var i4: Int = ((i >> 8) & 255) + ((i2 >> 8) & 255)
        var i5: Int = ((i2 >> 16) & 255) + ((i >> 16) & 255)
        var i6: Int = ((i >> 24) & 255) + ((i2 >> 24) & 255)
        if (i3 > 255) {
            i3 = 255
        }
        if (i4 > 255) {
            i4 = 255
        }
        if (i5 > 255) {
            i5 = 255
        }
        return ((if (i6 <= 255) i6 else 255) << 24) | (i5 << 16) | (i4 << 8) | i3
    }

    fun colorLerp(i: Int, i2: Int, f: Float): Int {
        var f2: Float = 1.0f - f
        var round: Int = Math.round(((i & 255) * f2) + ((i2 & 255) * f))
        var round2: Int = Math.round((f2 * ((i >> 8) & 255)) + (f * ((i2 >> 8) & 255)))
        var round3: Int = Math.round((f2 * ((i >> 16) & 255)) + (f * ((i2 >> 16) & 255)))
        var round4: Int = Math.round((f2 * ((i >> 24) & 255)) + (f * ((i2 >> 24) & 255)))
        if (round < 0) {
            round = 0
        } else if (round > 255) {
            round = 255
        }
        if (round2 < 0) {
            round2 = 0
        } else if (round2 > 255) {
            round2 = 255
        }
        if (round3 < 0) {
            round3 = 0
        } else if (round3 > 255) {
            round3 = 255
        }
        return ((round4 >= if (0) if (round4 > 255) 255 else round4 else 0) << 24) | (round3 << 16) | (round2 << 8) | round
    }

    fun colorMult(i: Int, i2: Int): Int {
        var i3: Int = ((i & 255) * (i2 & 255)) / 255
        var i4: Int = (((i >> 8) & 255) * ((i2 >> 8) & 255)) / 255
        var i5: Int = (((i >> 16) & 255) * ((i2 >> 16) & 255)) / 255
        var i6: Int = (((i >> 24) & 255) * ((i2 >> 24) & 255)) / 255
        if (i3 > 255) {
            i3 = 255
        }
        if (i4 > 255) {
            i4 = 255
        }
        if (i5 > 255) {
            i5 = 255
        }
        return ((if (i6 <= 255) i6 else 255) << 24) | (i5 << 16) | (i4 << 8) | i3
    }

    fun equals(obj: Any): Boolean {
        if (this == obj) {
        return true
        }
        if (obj == null || getClass() != obj.javaClass) {
        return false
        }
        var avatarParamColor: SLAvatarParamColor = obj as SLAvatarParamColor
        if (this.colorOperation == avatarParamColor.colorOperation) {
            return Arrays.equals(this.colorValues, avatarParamColor.colorValues)
        }
        return false
    }

    fun getColor(f: Float): Int {
        if (this.colorValues.length == 0) {
        return 0
        }
        if (this.colorValues.length == 1) {
            return this.colorValues[0]
        }
        var length: Int = this.colorValues.length - 1
        var f2: Float = length * f
        var i: Int = f2 as int
        var i2: Int = i + 1
        if (i >= length) {
            return this.colorValues[length]
        }
        return colorLerp(this.colorValues[i], this.colorValues[i2], f2 - i)
    }

    fun hashCode(): Int {
        return (this.colorOperation.hashCode() * 31) + Arrays.hashCode(this.colorValues)
    }
}
