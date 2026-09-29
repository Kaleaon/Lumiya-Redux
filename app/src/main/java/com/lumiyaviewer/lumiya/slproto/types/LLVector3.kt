package com.lumiyaviewer.lumiya.slproto.types

import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDDouble
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDMap
import java.nio.ByteBuffer
import kotlin.math.cos
import kotlin.math.max
import kotlin.math.sin
import kotlin.math.sqrt

open class LLVector3 {
    var x: Float = 0.0f
    var y: Float = 0.0f
    var z: Float = 0.0f

    constructor() {
        this.x = 0.0f
        this.y = 0.0f
        this.z = 0.0f
    }

    constructor(x: Float, y: Float, z: Float) {
        this.x = 0.0f
        this.y = 0.0f
        this.z = 0.0f
        this.x = x
        this.y = y
        this.z = z
    }

    constructor(vector3: LLVector3) {
        this.x = 0.0f
        this.y = 0.0f
        this.z = 0.0f
        this.x = vector3.x
        this.y = vector3.y
        this.z = vector3.z
    }

    fun add(vector3: LLVector3) {
        this.x += vector3.x
        this.y += vector3.y
        this.z += vector3.z
    }

    fun addMul(immutableVector: ImmutableVector, f: Float) {
        this.x += immutableVector.x * f
        this.y += immutableVector.y * f
        this.z += immutableVector.z * f
    }

    fun addMul(vector3: LLVector3, f: Float) {
        this.x += vector3.x * f
        this.y += vector3.y * f
        this.z += vector3.z * f
    }

    fun dot(vector3: LLVector3): Float {
        return (this.x * vector3.x) + (this.y * vector3.y) + (this.z * vector3.z)
    }

    override fun equals(other: Any?): Boolean {
        if (other === this) {
            return true
        }
        if (other !is LLVector3) {
            return false
        }
        return this.x == other.x && this.y == other.y && this.z == other.z
    }

    fun getDistanceTo(vector3: LLVector3): Float {
        val f = this.x - vector3.x
        val f2 = this.y - vector3.y
        val f3 = this.z - vector3.z
        return sqrt(((f * f) + (f2 * f2) + (f3 * f3)).toDouble()).toFloat()
    }

    fun getMax(): Float {
        return max(max(this.x, this.y), this.z)
    }

    fun getRotatedOffset(f: Float, f2: Float): LLVector3 {
        val f3 = (3.1415927f * f2) / 180.0f
        return LLVector3((cos(f3.toDouble()).toFloat() * f) + this.x, (sin(f3.toDouble()).toFloat() * f) + this.y, this.z)
    }

    override fun hashCode(): Int {
        return java.lang.Float.floatToIntBits(this.x) + java.lang.Float.floatToIntBits(this.y) + java.lang.Float.floatToIntBits(this.z)
    }

    fun isZero(): Boolean {
        return this.x == 0.0f && this.y == 0.0f && this.z == 0.0f
    }

    fun magVec(): Float {
        return sqrt(((this.x * this.x) + (this.y * this.y) + (this.z * this.z)).toDouble()).toFloat()
    }

    fun magVecSquared(): Float {
        return (this.x * this.x) + (this.y * this.y) + (this.z * this.z)
    }

    fun mul(f: Float) {
        this.x *= f
        this.y *= f
        this.z *= f
    }

    fun mul(quaternion: LLQuaternion) {
        val f = (((-quaternion.x) * this.x) - (quaternion.y * this.y)) - (quaternion.z * this.z)
        val f2 = ((quaternion.w * this.x) + (quaternion.y * this.z)) - (quaternion.z * this.y)
        val f3 = ((quaternion.w * this.y) + (quaternion.z * this.x)) - (quaternion.x * this.z)
        val f4 = ((quaternion.w * this.z) + (quaternion.x * this.y)) - (quaternion.y * this.x)
        this.x = ((((-f) * quaternion.x) + (quaternion.w * f2)) - (quaternion.z * f3)) + (quaternion.y * f4)
        this.y = ((((-f) * quaternion.y) + (quaternion.w * f3)) - (quaternion.x * f4)) + (quaternion.z * f2)
        this.z = ((((-f) * quaternion.z) + (f4 * quaternion.w)) - (f2 * quaternion.y)) + (quaternion.x * f3)
    }

    fun mul(vector3: LLVector3) {
        this.x *= vector3.x
        this.y *= vector3.y
        this.z *= vector3.z
    }

    fun mulWeighted(immutableVector: ImmutableVector, f: Float) {
        this.x *= (immutableVector.x * f) + 1.0f
        this.y *= (immutableVector.y * f) + 1.0f
        this.z *= (immutableVector.z * f) + 1.0f
    }

    fun mulWeighted(vector3: LLVector3, f: Float) {
        this.x *= (vector3.x * f) + 1.0f
        this.y *= (vector3.y * f) + 1.0f
        this.z *= (vector3.z * f) + 1.0f
    }

    fun normVec(): Float {
        val sqrtVal = sqrt(((this.x * this.x) + (this.y * this.y) + (this.z * this.z)).toDouble()).toFloat()
        if (sqrtVal > 1.0E-7f) {
            val f = 1.0f / sqrtVal
            this.x *= f
            this.y *= f
            this.z = f * this.z
        } else {
            this.x = 0.0f
            this.y = 0.0f
            this.z = 0.0f
        }
        return sqrtVal
    }

    fun set(x: Float, y: Float, z: Float) {
        this.x = x
        this.y = y
        this.z = z
    }

    fun set(vector3: LLVector3?) {
        if (vector3 != null) {
            this.x = vector3.x
            this.y = vector3.y
            this.z = vector3.z
        }
    }

    fun setAdd(vector3: LLVector3, vector33: LLVector3) {
        this.x = vector3.x + vector33.x
        this.y = vector3.y + vector33.y
        this.z = vector3.z + vector33.z
    }

    fun setCross(cross: LLVector3) {
        val f = (this.y * cross.z) - (cross.y * this.z)
        val f2 = (this.z * cross.x) - (cross.z * this.x)
        val f3 = (this.x * cross.y) - (cross.x * this.y)
        this.x = f
        this.y = f2
        this.z = f3
    }

    fun setLerp(vector3: LLVector3, f: Float, vector33: LLVector3, f2: Float) {
        this.x = (vector3.x * f) + (vector33.x * f2)
        this.y = (vector3.y * f) + (vector33.y * f2)
        this.z = (vector3.z * f) + (vector33.z * f2)
    }

    fun setLerp(vector3: LLVector3, vector33: LLVector3, f: Float) {
        this.x = vector3.x + ((vector33.x - vector3.x) * f)
        this.y = vector3.y + ((vector33.y - vector3.y) * f)
        this.z = vector3.z + ((vector33.z - vector3.z) * f)
    }

    fun setMul(vector3: LLVector3, f: Float) {
        this.x = vector3.x * f
        this.y = vector3.y * f
        this.z = vector3.z * f
    }

    fun setMul(vector3: LLVector3, vector33: LLVector3) {
        this.x = vector3.x * vector33.x
        this.y = vector3.y * vector33.y
        this.z = vector3.z * vector33.z
    }

    fun setSub(vector3: LLVector3, vector33: LLVector3) {
        this.x = vector3.x - vector33.x
        this.y = vector3.y - vector33.y
        this.z = vector3.z - vector33.z
    }

    fun sub(vector3: LLVector3) {
        this.x -= vector3.x
        this.y -= vector3.y
        this.z -= vector3.z
    }

    fun toLLSD(): LLSDNode {
        return LLSDMap(
            LLSDMap.LLSDMapEntry("X", LLSDDouble(this.x.toDouble())),
            LLSDMap.LLSDMapEntry("Y", LLSDDouble(this.y.toDouble())),
            LLSDMap.LLSDMapEntry("Z", LLSDDouble(this.z.toDouble()))
        )
    }

    override fun toString(): String {
        return String.format("(%f, %f, %f)", this.x, this.y, this.z)
    }

    companion object {
        @JvmField
        val FP_MAG_THRESHOLD: Float = 1.0E-7f
        @JvmField
        val z_axis: LLVector3 = LLVector3(0.0f, 0.0f, 1.0f)
        @JvmField
        val Zero: LLVector3 = LLVector3(0.0f, 0.0f, 0.0f)

        @JvmStatic
        fun cross(vector3: LLVector3, vector33: LLVector3): LLVector3 {
            return LLVector3((vector3.y * vector33.z) - (vector33.y * vector3.z), (vector3.z * vector33.x) - (vector33.z * vector3.x), (vector3.x * vector33.y) - (vector33.x * vector3.y))
        }

        @JvmStatic
        fun lerp(vector3: LLVector3, vector33: LLVector3, f: Float): LLVector3 {
            return LLVector3(vector3.x + ((vector33.x - vector3.x) * f), vector3.y + ((vector33.y - vector3.y) * f), vector3.z + ((vector33.z - vector3.z) * f))
        }

        @JvmStatic
        fun parseFloatVec(byteBuffer: ByteBuffer): LLVector3 {
            return LLVector3(byteBuffer.getFloat(), byteBuffer.getFloat(), byteBuffer.getFloat())
        }

        @JvmStatic
        fun parseU16Vec(byteBuffer: ByteBuffer, f: Float, f2: Float, f3: Float, f4: Float): LLVector3 {
            return LLVector3(
                LLTersePacking.U16_to_float(byteBuffer.getShort().toInt() and 65535, f, f2),
                LLTersePacking.U16_to_float(byteBuffer.getShort().toInt() and 65535, f, f2),
                LLTersePacking.U16_to_float(byteBuffer.getShort().toInt() and 65535, f3, f4)
            )
        }

        @JvmStatic
        fun parseU8Vec(byteBuffer: ByteBuffer, f: Float, f2: Float, f3: Float, f4: Float): LLVector3 {
            return LLVector3(
                LLTersePacking.U8_to_float(byteBuffer.get().toInt() and 0xFF, f, f2),
                LLTersePacking.U8_to_float(byteBuffer.get().toInt() and 0xFF, f, f2),
                LLTersePacking.U8_to_float(byteBuffer.get().toInt() and 0xFF, f3, f4)
            )
        }

        @JvmStatic
        fun scaleFromMatrix(floats: FloatArray): LLVector3 {
            return LLVector3(
                sqrt(((floats[0] * floats[0]) + (floats[1] * floats[1]) + (floats[2] * floats[2])).toDouble()).toFloat(),
                sqrt(((floats[4] * floats[4]) + (floats[5] * floats[5]) + (floats[6] * floats[6])).toDouble()).toFloat(),
                sqrt(((floats[8] * floats[8]) + (floats[9] * floats[9]) + (floats[10] * floats[10])).toDouble()).toFloat()
            )
        }

        @JvmStatic
        fun sub(vector3: LLVector3, vector33: LLVector3): LLVector3 {
            return LLVector3(vector3.x - vector33.x, vector3.y - vector33.y, vector3.z - vector33.z)
        }
    }
}
