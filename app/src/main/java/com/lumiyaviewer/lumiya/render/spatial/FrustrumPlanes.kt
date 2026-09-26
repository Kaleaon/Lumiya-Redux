package com.lumiyaviewer.lumiya.render.spatial

import kotlin.math.sqrt

class FrustrumPlanes(matrix: FloatArray) {
    private val params = FloatArray(24)
    private val pnIndex = IntArray(36)

    init {
        for (i in 0 until NUM_PLANES) {
            initPlane(i, matrix, 2 - (i / 2), if ((i and 1) != 0) -1.0f else 1.0f)
        }
    }

    private fun initPlane(i: Int, matrix: FloatArray, axis: Int, sign: Float) {
        val base = i * 4
        for (j in 0 until 4) {
            params[base + j] = matrix[j * 4 + 3] + matrix[j * 4 + axis] * sign
        }
        var lengthSquared = 0.0f
        for (k in 0 until 3) {
            val value = params[base + k]
            lengthSquared += value * value
        }
        val length = sqrt(lengthSquared.toDouble()).toFloat()
        for (m in 0 until 4) {
            params[base + m] = params[base + m] / length
        }
        for (n in 0 until 3) {
            pnIndex[i * 6 + n] = if (params[base + n] >= 0.0f) n + 3 else n
            pnIndex[i * 6 + n + 3] = if (params[base + n] >= 0.0f) n else n + 3
        }
    }

    private fun planeDistance(paramsIndex: Int, pnIndexBase: Int, vector: FloatArray): Float {
        var sum = 0.0f
        for (j in 0 until 3) {
            sum += params[paramsIndex + j] * vector[pnIndex[pnIndexBase + j]]
        }
        return params[paramsIndex + 3] + sum
    }

    fun testBoundingBox(boxMin: FloatArray, nearDistanceOut: FloatArray): Int {
        var pnIndexBase = 0
        var paramsIndex = 0
        for (j in 0 until NUM_PLANES) {
            if (planeDistance(paramsIndex, pnIndexBase, boxMin) < 0.0f) {
                return OUTSIDE
            }
            val farDistance = planeDistance(paramsIndex, pnIndexBase + 3, boxMin)
            if (j == 0) {
                nearDistanceOut[0] = farDistance
            }
            if (farDistance < 0.0f) {
                return INTERSECT
            }
            paramsIndex += 4
            pnIndexBase += 6
        }
        return INSIDE
    }

    companion object {
        const val INSIDE = 1
        const val INTERSECT = 0
        const val OUTSIDE = -1
        private const val NUM_PLANES = 6
    }
}
