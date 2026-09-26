package com.lumiyaviewer.lumiya.slproto.types

open class LLVector2 {
    @JvmStatic var FP_MAG_THRESHOLD: Float = 1.0E-7f
    var x: Float = 0.0f
    var y: Float = 0.0f

    constructor() {
        this.x = 0.0f
        this.y = 0.0f
    }

    constructor(x: Float, y: Float) {
        this.x = x
        this.y = y
    }

    constructor(vector2: LLVector2) {
        this.x = vector2.x
        this.y = vector2.y
    }

    fun sub(vector2: LLVector2, vector23: LLVector2): LLVector2 {
        return LLVector2(vector2.x - vector23.x, vector2.y - vector23.y)
    }

    fun sum(vector2: LLVector2, vector23: LLVector2): LLVector2 {
        return LLVector2(vector2.x + vector23.x, vector2.y + vector23.y)
    }

    fun add(vector2: LLVector2) {
        this.x += vector2.x
        this.y += vector2.y
    }

    fun dot(vector2: LLVector2): Float {
        return (this.x * vector2.x) + (this.y * vector2.y)
    }

    fun equals(obj: Any): Boolean {
        if (obj == this) {
        return true
        }
        if (!(obj is LLVector2)) {
        return false
        }
        var vector2: LLVector2 = obj as LLVector2
        return this.x == vector2.x && this.y == vector2.y
    }

    fun hashCode(): Int {
        return Float.floatToIntBits(this.x) + Float.floatToIntBits(this.y)
    }

    fun magVec(): Float {
        return Math as float.sqrt((this.x * this.x) + (this.y * this.y))
    }

    fun mul(f: Float) {
        this.x *= f
        this.y *= f
    }

    fun normVec(): Float {
        var sqrt: Float = Math as float.sqrt((this.x * this.x) + (this.y * this.y))
        if (sqrt > 1.0E-7f) {
            var f: Float = 1.0f / sqrt
            this.x *= f
            this.y = f * this.y
        } else {
            this.x = 0.0f
            this.y = 0.0f
        }
        return sqrt
    }

    fun set(x: Float, y: Float) {
        this.x = x
        this.y = y
    }

    fun setMax(max: LLVector2) {
        this.x = Math.max(this.x, max.x)
        this.y = Math.max(this.y, max.y)
    }

    fun setMin(min: LLVector2) {
        this.x = Math.min(this.x, min.x)
        this.y = Math.min(this.y, min.y)
    }

    fun toString(): String {
        return String.format("(%f, %f)", this.x, this.y)
    }
}
