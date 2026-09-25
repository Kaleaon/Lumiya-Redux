package com.lumiyaviewer.lumiya.render.picking

import android.opengl.Matrix
import com.lumiyaviewer.lumiya.render.RenderContext
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import com.lumiyaviewer.lumiya.slproto.types.LLVector4
import kotlin.math.abs

class GLRayTrace {
    class RayIntersectInfo internal constructor(
        @JvmField val intersectPoint: LLVector4,
        @JvmField val s: Float,
        @JvmField val t: Float,
    ) {
        override fun toString(): String = "RayIntersectInfo{intersectPoint=$intersectPoint, s=$s, t=$t}"
    }

    companion object {
        private const val EPSILON = 1.0e-7f

        @JvmStatic
        fun getIntersectionDepth(renderContext: RenderContext, point: LLVector4, transform: FloatArray): Float {
            val transformed = FloatArray(8)
            Matrix.multiplyMV(transformed, 0, transform, 0, floatArrayOf(point.x, point.y, point.z, 1.0f), 0)
            val matrix = if (renderContext.hasGL20) renderContext.modelViewMatrix else renderContext.projectionMatrix
            Matrix.multiplyMV(transformed, 4, matrix.matrixData, matrix.matrixDataOffset, transformed, 0)
            return transformed[6]
        }

        @JvmStatic
        fun intersect_RayTriangle(
            rayOrigin: LLVector3,
            rayPoint: LLVector3,
            vertices: Array<LLVector3>,
            offset: Int,
        ): RayIntersectInfo? {
            val edgeS = LLVector3.sub(vertices[offset + 1], vertices[offset])
            val edgeT = LLVector3.sub(vertices[offset + 2], vertices[offset])
            val normal = LLVector3.cross(edgeS, edgeT)
            if (normal.isZero) return null

            val ray = LLVector3.sub(rayPoint, rayOrigin)
            val numerator = -normal.dot(LLVector3.sub(rayOrigin, vertices[offset]))
            val denominator = normal.dot(ray)
            if (abs(denominator) < EPSILON) return null
            val depth = numerator / denominator
            if (depth < 0.0f) return null

            val intersection = LLVector3(ray).apply {
                mul(depth)
                add(rayOrigin)
            }
            val ss = edgeS.dot(edgeS)
            val st = edgeS.dot(edgeT)
            val tt = edgeT.dot(edgeT)
            val relative = LLVector3.sub(intersection, vertices[offset])
            val rs = relative.dot(edgeS)
            val rt = relative.dot(edgeT)
            val determinant = st * st - ss * tt
            if (abs(determinant) < EPSILON) return null
            val s = (st * rt - tt * rs) / determinant
            if (s < 0.0f || s > 1.0f) return null
            val t = (rs * st - rt * ss) / determinant
            if (t < 0.0f || s + t > 1.0f) return null
            return RayIntersectInfo(LLVector4(intersection.x, intersection.y, intersection.z, depth), s, t)
        }
    }
}
