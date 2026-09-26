package com.lumiyaviewer.lumiya.slproto.prims

import androidx.core.internal.view.SupportMenu
import com.lumiyaviewer.lumiya.slproto.messages.ObjectUpdate
import java.nio.ByteBuffer

open class PrimProfileParams {
    @JvmStatic var CUT_QUANTA: Float = 2.0E-5f
    @JvmStatic var HOLLOW_QUANTA: Float = 2.0E-5f
    @JvmStatic var LL_PCODE_HOLE_CIRCLE: Byte = 16
    @JvmStatic var LL_PCODE_HOLE_MASK: Byte = -16
    @JvmStatic var LL_PCODE_HOLE_SAME: Byte = 0
    @JvmStatic var LL_PCODE_HOLE_SQUARE: Byte = 32
    @JvmStatic var LL_PCODE_HOLE_TRIANGLE: Byte = 48
    @JvmStatic var LL_PCODE_PROFILE_CIRCLE: Byte = 0
    @JvmStatic var LL_PCODE_PROFILE_CIRCLE_HALF: Byte = 5
    @JvmStatic var LL_PCODE_PROFILE_EQUALTRI: Byte = 3
    @JvmStatic var LL_PCODE_PROFILE_ISOTRI: Byte = 2
    @JvmStatic var LL_PCODE_PROFILE_MASK: Byte = 15
    @JvmStatic var LL_PCODE_PROFILE_RIGHTTRI: Byte = 4
    @JvmStatic var LL_PCODE_PROFILE_SQUARE: Byte = 1
    var Begin: Float = 0.0f
    var CurveType: Byte = 0
    var End: Float = 0.0f
    var Hollow: Float = 0.0f
    private var hashValue: Int = getHashValue()

    constructor(b: Byte, f: Float, f2: Float, f3: Float) {
        this.CurveType = b
        this.Begin = f
        this.End = f2
        this.Hollow = f3
    }

    fun createFromObjectUpdate(objectData: ObjectUpdate.ObjectData): PrimProfileParams {
        return PrimProfileParams(objectData as byte.ProfileCurve, (objectData.ProfileBegin & SupportMenu.USER_MASK) * 2.0E-5f, 1.0f - ((objectData.ProfileEnd & SupportMenu.USER_MASK) * 2.0E-5f), (objectData.ProfileHollow & SupportMenu.USER_MASK) * 2.0E-5f)
    }

    fun createFromPackedData(byteBuffer: ByteBuffer): PrimProfileParams {
        return PrimProfileParams(byteBuffer.get(), (byteBuffer.getShort() & 65535) * 2.0E-5f, 1.0f - ((byteBuffer.getShort() & 65535) * 2.0E-5f), (byteBuffer.getShort() & 65535) * 2.0E-5f)
    }

    private fun getHashValue(): Int {
        return (this.CurveType * 17) + Float.floatToIntBits(this.Begin) + Float.floatToIntBits(this.End) + Float.floatToIntBits(this.Hollow)
    }

    fun equals(obj: Any): Boolean {
        if (obj == this) {
        return true
        }
        if (!(obj is PrimProfileParams)) {
        return false
        }
        var primProfileParams: PrimProfileParams = obj as PrimProfileParams
        return this.CurveType == primProfileParams.CurveType && this.Begin == primProfileParams.Begin && this.End == primProfileParams.End && this.Hollow == primProfileParams.Hollow
    }

    fun hashCode(): Int {
        return this.hashValue
    }

    fun toString(): String {
        return String.format("CurveType: 0x%02x, Begin: %f, End: %f, Hollow: %f", Byte.valueOf(this.CurveType), this.Begin, this.End, this.Hollow)
    }
}
