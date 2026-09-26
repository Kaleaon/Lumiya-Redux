package com.lumiyaviewer.lumiya.slproto.types

open class Vector2Array : VectorArray() {
    constructor(i: Int) : super(2, i) {
    }

    constructor(vectorArray: VectorArray, i: Int) : super(vectorArray, i) {
    }

    fun add(i: Int, vector2: LLVector2) {
        var i2: Int = this.offset + (this.numComponents * i)
        var data: FloatArray = this.data
        var i3: Int = i2 + 0
        data[i3] = data[i3] + vector2.x
        var data2: FloatArray = this.data
        var i4: Int = i2 + 1
        data2[i4] = data2[i4] + vector2.y
    }

    fun addToVector(i: Int, vector2: LLVector2) {
        var i2: Int = this.offset + (this.numComponents * i)
        vector2.x += this.data[i2 + 0]
        vector2.y = this.data[i2 + 1] + vector2.y
    }

    fun get(i: Int, vector2: LLVector2) {
        var i2: Int = this.offset + (this.numComponents * i)
        vector2.x = this.data[i2 + 0]
        vector2.y = this.data[i2 + 1]
    }

    fun getSub(i: Int, vector2Array: Vector2Array, i2: Int, vector2: LLVector2) {
        var i3: Int = this.offset + (this.numComponents * i)
        var i4: Int = vector2Array.offset + (vector2Array.numComponents * i2)
        vector2.x = this.data[i3 + 0] - vector2Array.data[i4 + 0]
        vector2.y = this.data[i3 + 1] - vector2Array.data[i4 + 1]
    }

    fun minMaxVector(i: Int, vector2: LLVector2, vector23: LLVector2) {
        var i2: Int = this.offset + (this.numComponents * i)
        var f: Float = this.data[i2 + 0]
        var f2: Float = this.data[i2 + 1]
        if (vector2.x > f) {
            vector2.x = f
        }
        if (vector23.x < f) {
            vector23.x = f
        }
        if (vector2.y > f2) {
            vector2.y = f2
        }
        if (vector23.y < f2) {
            vector23.y = f2
        }
    }

    fun minMaxVector(vector2: LLVector2, vector23: LLVector2) {
        var offset: Int = this.offset
        for (int j = 0; j < this.length; j++) {
            var f: Float = this.data[offset + 0]
            var f2: Float = this.data[offset + 1]
            if (vector2.x > f) {
                vector2.x = f
            }
            if (vector23.x < f) {
                vector23.x = f
            }
            if (vector2.y > f2) {
                vector2.y = f2
            }
            if (vector23.y < f2) {
                vector23.y = f2
            }
            offset += this.numComponents
        }
    }

    fun set(i: Int, f: Float, f2: Float) {
        var i2: Int = this.offset + (this.numComponents * i)
        this.data[i2 + 0] = f
        this.data[i2 + 1] = f2
    }

    fun swap(i: Int, i2: Int) {
        var i3: Int = (this.numComponents * i) + this.offset
        var i4: Int = (this.numComponents * i2) + this.offset
        for (int j = 0; j < 2; j++) {
            var f: Float = this.data[i3 + j]
            this.data[i3 + j] = this.data[i4 + j]
            this.data[i4 + j] = f
        }
    }
}
