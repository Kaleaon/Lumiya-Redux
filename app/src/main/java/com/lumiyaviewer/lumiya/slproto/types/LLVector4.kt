package com.lumiyaviewer.lumiya.slproto.types

open class LLVector4 {
    @JvmStatic var FP_MAG_THRESHOLD: Float = 1.0E-7f
    var w: Float = 0.0f
    var x: Float = 0.0f
    var y: Float = 0.0f
    var z: Float = 0.0f

    constructor() {
        this.x = 0.0f
        this.y = 0.0f
        this.z = 0.0f
        this.w = 0.0f
    }

    constructor(x: Float, y: Float, z: Float) {
        this.x = x
        this.y = y
        this.z = z
        this.w = 0.0f
    }

    constructor(x: Float, y: Float, z: Float, w: Float) {
        this.x = x
        this.y = y
        this.z = z
        this.w = w
    }

    constructor(vector3: LLVector3) {
        this.x = vector3.x
        this.y = vector3.y
        this.z = vector3.z
        this.w = 0.0f
    }

    constructor(vector4: LLVector4) {
        this.x = vector4.x
        this.y = vector4.y
        this.z = vector4.z
        this.w = vector4.w
    }

    fun add(vector4: LLVector4, vector43: LLVector4): LLVector4 {
        return LLVector4(vector4.x + vector43.x, vector4.y + vector43.y, vector4.z + vector43.z, vector4.w + vector43.w)
    }

    fun cross3(vector4: LLVector4, vector43: LLVector4): LLVector4 {
        return LLVector4((vector4.y * vector43.z) - (vector4.z * vector43.y), (vector4.z * vector43.x) - (vector4.x * vector43.z), (vector4.x * vector43.y) - (vector4.y * vector43.x), 0.0f)
    }

    fun sub(vector4: LLVector4, vector43: LLVector4): LLVector4 {
        return LLVector4(vector4.x - vector43.x, vector4.y - vector43.y, vector4.z - vector43.z, vector4.w - vector43.w)
    }

    fun add(vector4: LLVector4) {
        this.x += vector4.x
        this.y += vector4.y
        this.z += vector4.z
        this.w += vector4.w
    }

    fun clear() {
        this.x = 0.0f
        this.y = 0.0f
        this.z = 0.0f
        this.w = 0.0f
    }

    fun dot3(vector4: LLVector4): Float {
        return (this.x * vector4.x) + (this.y * vector4.y) + (this.z * vector4.z)
    }

    fun mul(f: Float) {
        this.x *= f
        this.y *= f
        this.z *= f
        this.w *= f
    }

    fun normalize3(): Float {
        var sqrt: Float = Math as float.sqrt((this.x * this.x) + (this.y * this.y) + (this.z * this.z))
        if (sqrt > 1.0E-7f) {
            var f: Float = 1.0f / sqrt
            this.x *= f
            this.y *= f
            this.z = f * this.z
        } else {
            this.x = 0.0f
            this.y = 0.0f
            this.z = 0.0f
        }
        return sqrt
    }

    fun set(x: Float, y: Float, z: Float) {
        this.x = x
        this.y = y
        this.z = z
        this.w = 0.0f
    }

    fun set(vector4: LLVector4) {
        this.x = vector4.x
        this.y = vector4.y
        this.z = vector4.z
        this.w = vector4.w
    }

    fun setMax(max: LLVector4) {
        this.x = Math.max(this.x, max.x)
        this.y = Math.max(this.y, max.y)
        this.z = Math.max(this.z, max.z)
        this.w = Math.max(this.w, max.w)
    }

    fun setMin(min: LLVector4) {
        this.x = Math.min(this.x, min.x)
        this.y = Math.min(this.y, min.y)
        this.z = Math.min(this.z, min.z)
        this.w = Math.min(this.w, min.w)
    }

    fun toString(): String {
        return String.format("(%f, %f, %f)", this.x, this.y, this.z)
    }
}
