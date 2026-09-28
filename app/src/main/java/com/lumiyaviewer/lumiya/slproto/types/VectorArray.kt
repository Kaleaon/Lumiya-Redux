package com.lumiyaviewer.lumiya.slproto.types

open class VectorArray {
    protected var data: FloatArray? = null
    protected var length: Int = 0
    protected var numComponents: Int = 0
    protected var offset: Int = 0

    constructor(numComponents: Int, length: Int) {
        this.data = FloatArray(numComponents * length)
        this.numComponents = numComponents
        this.length = length
        this.offset = 0
    }

    constructor(vectorArray: VectorArray, offset: Int) {
        this.data = vectorArray.data
        this.numComponents = vectorArray.numComponents
        this.length = vectorArray.length
        this.offset = offset
    }

    fun getData(): FloatArray {
        return this.data
    }

    fun getElementOffset(i: Int): Int {
        return this.offset + (this.numComponents * i)
    }

    fun getLength(): Int {
        return this.length
    }

    fun getNumComponents(): Int {
        return this.numComponents
    }
}
