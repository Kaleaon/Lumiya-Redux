package com.lumiyaviewer.lumiya.render.picking

import android.opengl.Matrix
import com.lumiyaviewer.lumiya.slproto.types.LLVector4

class IntersectInfo {
    @JvmField val faceID: Int
    @JvmField val faceKnown: Boolean
    @JvmField val intersectPoint: LLVector4
    @JvmField val s: Float
    @JvmField val t: Float
    @JvmField val u: Float
    @JvmField val v: Float

    constructor(source: IntersectInfo, textureMatrix: FloatArray, offset: Int) {
        intersectPoint = source.intersectPoint
        faceID = source.faceID
        s = source.s
        t = source.t
        faceKnown = source.faceKnown
        if (faceKnown) {
            val coordinates = floatArrayOf(s, t, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f)
            Matrix.multiplyMV(coordinates, 4, textureMatrix, offset, coordinates, 0)
            u = coordinates[4]
            v = coordinates[5]
        } else {
            u = source.u
            v = source.v
        }
    }

    constructor(intersectPoint: LLVector4) {
        this.intersectPoint = intersectPoint
        faceID = 0
        u = 0.0f
        v = 0.0f
        s = 0.0f
        t = 0.0f
        faceKnown = false
    }

    constructor(intersectPoint: LLVector4, faceID: Int, u: Float, v: Float) {
        this.intersectPoint = intersectPoint
        this.faceID = faceID
        this.u = u
        this.v = v
        s = u
        t = v
        faceKnown = true
    }
}
