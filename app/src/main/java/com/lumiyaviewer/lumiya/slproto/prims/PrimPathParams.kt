package com.lumiyaviewer.lumiya.slproto.prims

import androidx.core.internal.view.SupportMenu
import com.lumiyaviewer.lumiya.slproto.messages.ObjectUpdate
import com.lumiyaviewer.lumiya.slproto.types.LLTersePacking
import com.lumiyaviewer.lumiya.slproto.types.LLVector2
import java.nio.ByteBuffer

open class PrimPathParams {
    @JvmStatic var CUT_QUANTA: Float = 2.0E-5f
    @JvmStatic var LL_PCODE_PATH_CIRCLE: Byte = 32
    @JvmStatic var LL_PCODE_PATH_CIRCLE2: Byte = 48
    @JvmStatic var LL_PCODE_PATH_FLEXIBLE: Byte = Byte.MIN_VALUE
    @JvmStatic var LL_PCODE_PATH_LINE: Byte = 16
    @JvmStatic var LL_PCODE_PATH_TEST: Byte = 64
    @JvmStatic var REV_QUANTA: Float = 0.015f
    @JvmStatic var SCALE_QUANTA: Float = 0.01f
    @JvmStatic var SHEAR_QUANTA: Float = 0.01f
    @JvmStatic var TAPER_QUANTA: Float = 0.01f
    var Begin: Float = 0.0f
    var CurveType: Byte = 0
    var End: Float = 0.0f
    var RadiusOffset: Float = 0.0f
    var Revolutions: Float = 0.0f
    var ScaleX: Float = 0.0f
    var ScaleY: Float = 0.0f
    var ShearX: Float = 0.0f
    var ShearY: Float = 0.0f
    var Skew: Float = 0.0f
    var TaperX: Float = 0.0f
    var TaperY: Float = 0.0f
    var TwistBegin: Float = 0.0f
    var TwistEnd: Float = 0.0f
    private var hashValue: Int = getHashValue()

    constructor(b: Byte, f: Float, f2: Float, f3: Float, f4: Float, f5: Float, f6: Float, f7: Float, f8: Float, f9: Float, f10: Float, f11: Float, f12: Float, f13: Float) {
        this.CurveType = b
        this.Begin = f
        this.End = f2
        this.ScaleX = f3
        this.ScaleY = f4
        this.ShearX = f5
        this.ShearY = f6
        this.TwistBegin = f7
        this.TwistEnd = f8
        this.RadiusOffset = f9
        this.TaperX = f10
        this.TaperY = f11
        this.Revolutions = f12
        this.Skew = f13
    }

    constructor(objectData: ObjectUpdate.ObjectData) {
        this.CurveType = objectData as byte.PathCurve
        this.Begin = (objectData.PathBegin & SupportMenu.USER_MASK) * 2.0E-5f
        this.End = (50000 - (objectData.PathEnd & SupportMenu.USER_MASK)) * 2.0E-5f
        this.ScaleX = (200 - (objectData.PathScaleX & 255)) * 0.01f
        this.ScaleY = (200 - (objectData.PathScaleY & 255)) * 0.01f
        this.ShearX = LLTersePacking.getSignedByte(objectData.PathShearX) * 0.01f
        this.ShearY = LLTersePacking.getSignedByte(objectData.PathShearY) * 0.01f
        this.TwistEnd = LLTersePacking.getSignedByte(objectData.PathTwist) * 0.01f
        this.TwistBegin = LLTersePacking.getSignedByte(objectData.PathTwistBegin) * 0.01f
        this.RadiusOffset = LLTersePacking.getSignedByte(objectData.PathRadiusOffset) * 0.01f
        this.TaperX = LLTersePacking.getSignedByte(objectData.PathTaperX) * 0.01f
        this.TaperY = LLTersePacking.getSignedByte(objectData.PathTaperY) * 0.01f
        this.Revolutions = ((objectData.PathRevolutions & 255) * 0.015f) + 1.0f
        this.Skew = LLTersePacking.getSignedByte(objectData.PathSkew) * 0.01f
    }

    constructor(byteBuffer: ByteBuffer) {
        this.CurveType = byteBuffer.get()
        this.Begin = (byteBuffer.getShort() & 65535) * 2.0E-5f
        this.End = (50000 - (byteBuffer.getShort() & 65535)) * 2.0E-5f
        this.ScaleX = (200 - (byteBuffer.get() & 0xFF)) * 0.01f
        this.ScaleY = (200 - (byteBuffer.get() & 0xFF)) * 0.01f
        this.ShearX = LLTersePacking.getSignedByte(byteBuffer.get()) * 0.01f
        this.ShearY = LLTersePacking.getSignedByte(byteBuffer.get()) * 0.01f
        this.TwistEnd = LLTersePacking.getSignedByte(byteBuffer.get()) * 0.01f
        this.TwistBegin = LLTersePacking.getSignedByte(byteBuffer.get()) * 0.01f
        this.RadiusOffset = LLTersePacking.getSignedByte(byteBuffer.get()) * 0.01f
        this.TaperX = LLTersePacking.getSignedByte(byteBuffer.get()) * 0.01f
        this.TaperY = LLTersePacking.getSignedByte(byteBuffer.get()) * 0.01f
        this.Revolutions = ((byteBuffer.get() & 0xFF) * 0.015f) + 1.0f
        this.Skew = LLTersePacking.getSignedByte(byteBuffer.get()) * 0.01f
    }

    private fun getHashValue(): Int {
        return (this.CurveType * 17) + 0 + Float.floatToIntBits(this.Begin) + Float.floatToIntBits(this.End) + Float.floatToIntBits(this.ScaleX) + Float.floatToIntBits(this.ScaleY) + Float.floatToIntBits(this.ShearX) + Float.floatToIntBits(this.ShearY) + Float.floatToIntBits(this.TwistBegin) + Float.floatToIntBits(this.TwistEnd) + Float.floatToIntBits(this.RadiusOffset) + Float.floatToIntBits(this.TaperX) + Float.floatToIntBits(this.TaperY) + Float.floatToIntBits(this.Revolutions) + Float.floatToIntBits(this.Skew)
    }

    fun equals(obj: Any): Boolean {
        if (obj == this) {
        return true
        }
        if (!(obj is PrimPathParams)) {
        return false
        }
        var primPathParams: PrimPathParams = obj as PrimPathParams
        if (this.CurveType == primPathParams.CurveType && this.Begin == primPathParams.Begin && this.End == primPathParams.End && this.ScaleX == primPathParams.ScaleX && this.ScaleY == primPathParams.ScaleY && this.ShearX == primPathParams.ShearX && this.ShearY == primPathParams.ShearY && this.TwistBegin == primPathParams.TwistBegin && this.TwistEnd == primPathParams.TwistEnd && this.RadiusOffset == primPathParams.RadiusOffset && this.TaperX == primPathParams.TaperX && this.TaperY == primPathParams.TaperY && this.Revolutions == primPathParams.Revolutions) {
            return this.Skew == primPathParams.Skew
        }
        return false
    }

    fun getBeginScale(): LLVector2 {
        var vector2: LLVector2 = LLVector2(1.0f, 1.0f)
        if (this.ScaleX > 1.0f) {
            vector2.x = 2.0f - this.ScaleX
        }
        if (this.ScaleY > 1.0f) {
            vector2.y = 2.0f - this.ScaleY
        }
        return vector2
    }

    fun getEndScale(): LLVector2 {
        var vector2: LLVector2 = LLVector2(1.0f, 1.0f)
        if (this.ScaleX < 1.0f) {
            vector2.x = this.ScaleX
        }
        if (this.ScaleY < 1.0f) {
            vector2.y = this.ScaleY
        }
        return vector2
    }

    fun hashCode(): Int {
        return this.hashValue
    }

    fun toString(): String {
        return String.format("CurveType: 0x%02x, Begin: %f, End: %f, Scale: (%f, %f), Shear: (%f, %f), TwistBegin: %f, TwistEnd: %f, RadiusOffset: %f, Taper: (%f, %f), Revolutions: %f, Skew: %f", Byte.valueOf(this.CurveType), this.Begin, this.End, this.ScaleX, this.ScaleY, this.ShearX, this.ShearY, this.TwistBegin, this.TwistEnd, this.RadiusOffset, this.TaperX, this.TaperY, this.Revolutions, this.Skew)
    }
}
