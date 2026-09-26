package com.lumiyaviewer.lumiya.slproto.types

import android.annotation.SuppressLint

open class ImmutableVector {
    var x: Float = 0.0f
    var y: Float = 0.0f
    var z: Float = 0.0f

    constructor(x: Float, y: Float, z: Float) {
        this.x = x
        this.y = y
        this.z = z
    }

    constructor(vector3: LLVector3) {
        this.x = vector3.x
        this.y = vector3.y
        this.z = vector3.z
    }

    fun distanceTo(f: Float, f2: Float, f3: Float): Float {
        var f4: Float = f - this.x
        var f5: Float = f2 - this.y
        var f6: Float = f3 - this.z
        return Math as float.sqrt((f4 * f4) + (f5 * f5) + (f6 * f6))
    }

    fun distanceTo(immutableVector: ImmutableVector): Float {
        if (immutableVector == null) {
            return Float.NaN
        }
        var f: Float = this.x - immutableVector.x
        var f2: Float = this.y - immutableVector.y
        var f3: Float = this.z - immutableVector.z
        return Math as float.sqrt((f * f) + (f2 * f2) + (f3 * f3))
    }

    fun equals(obj: Any): Boolean {
        if (this == obj) {
        return true
        }
        if (!(obj is ImmutableVector)) {
        return false
        }
        var immutableVector: ImmutableVector = obj as ImmutableVector
        return this.x == immutableVector.x && this.y == immutableVector.y && this.z == immutableVector.z
    }

    fun getDistanceTo(vector3: LLVector3): Float {
        if (vector3 == null) {
            return Float.NaN
        }
        var f: Float = this.x - vector3.x
        var f2: Float = this.y - vector3.y
        var f3: Float = this.z - vector3.z
        return Math as float.sqrt((f * f) + (f2 * f2) + (f3 * f3))
    }

    fun getX(): Float {
        return this.x
    }

    fun getY(): Float {
        return this.y
    }

    fun getZ(): Float {
        return this.z
    }

    fun hashCode(): Int {
        return Float.floatToRawIntBits(this.x) + Float.floatToRawIntBits(this.y) + Float.floatToRawIntBits(this.z)
    }

    @SuppressLint({"DefaultLocale"})
    fun toString(): String {
        return String.format("(%f,%f,%f)", this.x, this.y, this.z)
    }
}
