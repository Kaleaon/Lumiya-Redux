package com.lumiyaviewer.lumiya.slproto.prims

import com.lumiyaviewer.lumiya.slproto.types.LLVector3

open class PrimMath {
    companion object {
        const val F_DEG_TO_RAD = 0.017453292f
        const val F_PI = 3.1415927f
        @JvmStatic fun lerp(first: Float, second: Float, factor: Float): Float = (second - first) * factor + first
        @JvmStatic fun lookAt(from: LLVector3, to: LLVector3, up: LLVector3): FloatArray {
            val forward = LLVector3.sub(to, from)
            forward.normVec()
            val side = LLVector3(forward)
            side.setCross(up)
            return floatArrayOf(side.x, up.x, -forward.x, 0f, side.y, up.y, -forward.y, 0f, side.z, up.z, -forward.z, 0f, 0f, 0f, 0f, 1f)
        }
    }
}
