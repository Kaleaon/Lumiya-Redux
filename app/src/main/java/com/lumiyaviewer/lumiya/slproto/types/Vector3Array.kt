package com.lumiyaviewer.lumiya.slproto.types

import android.opengl.Matrix

open class Vector3Array : VectorArray() {
    constructor(i: Int) : super(3, i) {
    }

    constructor(vectorArray: VectorArray, i: Int) : super(vectorArray, i) {
    }

    fun MatrixScale(floats: FloatArray, i: Int, i2: Int) {
        var i3: Int = this.offset + (this.numComponents * i2)
        Matrix.scaleM(floats, i, this.data[i3 + 0], this.data[i3 + 1], this.data[i3 + 2])
    }

    fun MatrixTranslate(floats: FloatArray, i: Int, floats2: FloatArray, i2: Int, i3: Int) {
        var i4: Int = this.offset + (this.numComponents * i3)
        Matrix.translateM(floats, i, floats2, i2, this.data[i4 + 0], this.data[i4 + 1], this.data[i4 + 2])
    }

    fun add(i: Int, vector3: LLVector3) {
        var i2: Int = this.offset + (this.numComponents * i)
        var data: FloatArray = this.data
        var i3: Int = i2 + 0
        data[i3] = data[i3] + vector3.x
        var data2: FloatArray = this.data
        var i4: Int = i2 + 1
        data2[i4] = data2[i4] + vector3.y
        var data3: FloatArray = this.data
        var i5: Int = i2 + 2
        data3[i5] = data3[i5] + vector3.z
    }

    fun addToVector(i: Int, vector3: LLVector3) {
        var i2: Int = this.offset + (this.numComponents * i)
        vector3.x += this.data[i2 + 0]
        vector3.y += this.data[i2 + 1]
        vector3.z = this.data[i2 + 2] + vector3.z
    }

    fun clear() {
        var offset: Int = this.offset
        for (int j = 0; j < this.length; j++) {
            this.data[offset + 0] = 0.0f
            this.data[offset + 1] = 0.0f
            this.data[offset + 2] = 0.0f
            offset += this.numComponents
        }
    }

    fun distToPlane(i: Int, vector3: LLVector3, vector33: LLVector3): Float {
        var i2: Int = this.offset + (this.numComponents * i)
        var f: Float = this.data[i2 + 0] - vector3.x
        var f2: Float = this.data[i2 + 1] - vector3.y
        var f3: Float = this.data[i2 + 2] - vector3.z
        return (f3 * vector33.z) + (f * vector33.x) + (f2 * vector33.y)
    }

    fun fill(i: Int, i2: Int, vector3: LLVector3) {
        var i3: Int = (this.numComponents * i) + this.offset
        for (int j = 0; j < i2; j++) {
            this.data[i3 + 0] = vector3.x
            this.data[i3 + 1] = vector3.y
            this.data[i3 + 2] = vector3.z
            i3 += this.numComponents
        }
    }

    fun get(i: Int): LLVector3 {
        var i2: Int = this.offset + (this.numComponents * i)
        return LLVector3(this.data[i2 + 0], this.data[i2 + 1], this.data[i2 + 2])
    }

    fun get(i: Int, vector3: LLVector3) {
        var i2: Int = this.offset + (this.numComponents * i)
        vector3.x = this.data[i2 + 0]
        vector3.y = this.data[i2 + 1]
        vector3.z = this.data[i2 + 2]
    }

    fun getDistanceTo(i: Int, vector3: LLVector3): Float {
        var i2: Int = this.offset + (this.numComponents * i)
        var f: Float = this.data[i2 + 0] - vector3.x
        var f2: Float = this.data[i2 + 1] - vector3.y
        var f3: Float = this.data[i2 + 2] - vector3.z
        return Math as float.sqrt((f3 * f3) + (f * f) + (f2 * f2))
    }

    fun getMaxComponent(i: Int): Float {
        var i2: Int = (this.numComponents * i) + this.offset
        var f: Float = this.data[i2 + 0]
        if (this.data[i2 + 1] > f) {
            f = this.data[i2 + 1]
        }
        return this.data[i2 + 2] > if this as f.data[i2 + 2] else f
    }

    fun getSub(i: Int, i2: Int, vector3: LLVector3) {
        var i3: Int = this.offset + (this.numComponents * i)
        var i4: Int = this.offset + (this.numComponents * i2)
        vector3.x = this.data[i3 + 0] - this.data[i4 + 0]
        vector3.y = this.data[i3 + 1] - this.data[i4 + 1]
        vector3.z = this.data[i3 + 2] - this.data[i4 + 2]
    }

    fun getSub(i: Int, vector3Array: Vector3Array, i2: Int, vector3: LLVector3) {
        var i3: Int = this.offset + (this.numComponents * i)
        var i4: Int = vector3Array.offset + (vector3Array.numComponents * i2)
        vector3.x = this.data[i3 + 0] - vector3Array.data[i4 + 0]
        vector3.y = this.data[i3 + 1] - vector3Array.data[i4 + 1]
        vector3.z = this.data[i3 + 2] - vector3Array.data[i4 + 2]
    }

    fun minMaxVector(i: Int, vector3: LLVector3, vector33: LLVector3) {
        var i2: Int = this.offset + (this.numComponents * i)
        var f: Float = this.data[i2 + 0]
        var f2: Float = this.data[i2 + 1]
        var f3: Float = this.data[i2 + 2]
        if (vector3.x > f) {
            vector3.x = f
        }
        if (vector33.x < f) {
            vector33.x = f
        }
        if (vector3.y > f2) {
            vector3.y = f2
        }
        if (vector33.y < f2) {
            vector33.y = f2
        }
        if (vector3.z > f3) {
            vector3.z = f3
        }
        if (vector33.z < f3) {
            vector33.z = f3
        }
    }

    fun minMaxVector(vector3: LLVector3, vector33: LLVector3) {
        var offset: Int = this.offset
        for (int j = 0; j < this.length; j++) {
            var f: Float = this.data[offset + 0]
            var f2: Float = this.data[offset + 1]
            var f3: Float = this.data[offset + 2]
            if (vector3.x > f) {
                vector3.x = f
            }
            if (vector33.x < f) {
                vector33.x = f
            }
            if (vector3.y > f2) {
                vector3.y = f2
            }
            if (vector33.y < f2) {
                vector33.y = f2
            }
            if (vector3.z > f3) {
                vector3.z = f3
            }
            if (vector33.z < f3) {
                vector33.z = f3
            }
            offset += this.numComponents
        }
    }

    fun mul(i: Int, quaternion: LLQuaternion) {
        var i2: Int = this.offset + (this.numComponents * i)
        var f: Float = this.data[i2 + 0]
        var f2: Float = this.data[i2 + 1]
        var f3: Float = this.data[i2 + 2]
        var f4: Float = (((-quaternion.x) * f) - (quaternion.y * f2)) - (quaternion.z * f3)
        var f5: Float = ((quaternion.w * f) + (quaternion.y * f3)) - (quaternion.z * f2)
        var f6: Float = ((quaternion.w * f2) + (quaternion.z * f)) - (quaternion.x * f3)
        var f7: Float = ((f2 * quaternion.x) + (f3 * quaternion.w)) - (f * quaternion.y)
        this.data[i2 + 0] = ((((-f4) * quaternion.x) + (quaternion.w * f5)) - (quaternion.z * f6)) + (quaternion.y * f7)
        this.data[i2 + 1] = ((((-f4) * quaternion.y) + (quaternion.w * f6)) - (quaternion.x * f7)) + (quaternion.z * f5)
        this.data[i2 + 2] = (((f7 * quaternion.w) + ((-f4) * quaternion.z)) - (quaternion.y * f5)) + (quaternion.x * f6)
    }

    fun set(i: Int, f: Float, f2: Float, f3: Float) {
        var i2: Int = this.offset + (this.numComponents * i)
        this.data[i2 + 0] = f
        this.data[i2 + 1] = f2
        this.data[i2 + 2] = f3
    }

    fun set(i: Int, vector3: LLVector3) {
        var i2: Int = this.offset + (this.numComponents * i)
        this.data[i2 + 0] = vector3.x
        this.data[i2 + 1] = vector3.y
        this.data[i2 + 2] = vector3.z
    }

    fun set(i: Int, vector3Array: Vector3Array, i2: Int) {
        var i3: Int = this.offset + (this.numComponents * i)
        var i4: Int = vector3Array.offset + (vector3Array.numComponents * i2)
        this.data[i3 + 0] = vector3Array.data[i4 + 0]
        this.data[i3 + 1] = vector3Array.data[i4 + 1]
        this.data[i3 + 2] = vector3Array.data[i4 + 2]
    }

    fun setAdd(i: Int, i2: Int) {
        var i3: Int = (this.numComponents * i) + this.offset
        var i4: Int = (this.numComponents * i2) + this.offset
        for (int j = 0; j < 3; j++) {
            var data: FloatArray = this.data
            var i6: Int = i3 + j
            data[i6] = data[i6] + this.data[i4 + j]
            this.data[i4 + j] = this.data[i3 + j]
        }
    }

    fun subFromVector(vector3: LLVector3, i: Int) {
        var i2: Int = this.offset + (this.numComponents * i)
        vector3.x -= this.data[i2 + 0]
        vector3.y -= this.data[i2 + 1]
        vector3.z -= this.data[i2 + 2]
    }
}
