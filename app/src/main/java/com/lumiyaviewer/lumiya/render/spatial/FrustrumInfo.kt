package com.lumiyaviewer.lumiya.render.spatial

import android.opengl.Matrix
import java.util.Arrays

class FrustrumInfo {
    @JvmField val mvpMatrix: FloatArray
    @JvmField val viewDistance: Float
    @JvmField val viewX: Float
    @JvmField val viewY: Float
    @JvmField val viewZ: Float

    constructor(viewX: Float, viewY: Float, viewZ: Float, viewDistance: Float, floats: FloatArray, offset: Int) {
        this.viewX = viewX
        this.viewY = viewY
        this.viewZ = viewZ
        this.viewDistance = viewDistance
        this.mvpMatrix = FloatArray(16)
        System.arraycopy(floats, offset, this.mvpMatrix, 0, 16)
    }

    constructor(
        viewX: Float,
        viewY: Float,
        viewZ: Float,
        viewDistance: Float,
        floats: FloatArray,
        offset: Int,
        floats2: FloatArray,
        offset2: Int
    ) {
        this.viewX = viewX
        this.viewY = viewY
        this.viewZ = viewZ
        this.viewDistance = viewDistance
        this.mvpMatrix = FloatArray(16)
        Matrix.multiplyMM(this.mvpMatrix, 0, floats2, offset2, floats, offset)
    }

    override fun equals(other: Any?): Boolean {
        if (other !is FrustrumInfo) {
            return false
        }
        return other.viewX == viewX && other.viewY == viewY && other.viewZ == viewZ &&
            other.viewDistance == viewDistance && Arrays.equals(mvpMatrix, other.mvpMatrix)
    }

    override fun hashCode(): Int {
        return java.lang.Float.floatToIntBits(viewX) + 0 + java.lang.Float.floatToIntBits(viewY) +
            java.lang.Float.floatToIntBits(viewZ) + java.lang.Float.floatToIntBits(viewDistance) +
            Arrays.hashCode(mvpMatrix)
    }
}
