package com.lumiyaviewer.lumiya.render.picking

import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertSame
import org.junit.Test

class GLRayTraceTest {
    private val triangle = arrayOf(
        LLVector3(0.0f, 0.0f, 0.0f),
        LLVector3(1.0f, 0.0f, 0.0f),
        LLVector3(0.0f, 1.0f, 0.0f),
    )

    @Test
    fun rayIntersectionReturnsDepthAndBarycentricCoordinates() {
        val hit = GLRayTrace.intersect_RayTriangle(
            LLVector3(0.25f, 0.25f, 1.0f),
            LLVector3(0.25f, 0.25f, 0.0f),
            triangle,
            0,
        )!!

        assertEquals(1.0f, hit.intersectPoint.w, 0.0f)
        assertEquals(0.25f, hit.s, 0.0f)
        assertEquals(0.25f, hit.t, 0.0f)
    }

    @Test
    fun parallelAndOutsideRaysMiss() {
        assertNull(GLRayTrace.intersect_RayTriangle(LLVector3(), LLVector3(1.0f, 0.0f, 0.0f), triangle, 0))
        assertNull(
            GLRayTrace.intersect_RayTriangle(
                LLVector3(2.0f, 2.0f, 1.0f),
                LLVector3(2.0f, 2.0f, 0.0f),
                triangle,
                0,
            ),
        )
    }

    @Test
    fun collisionBoxIsSingletonWithTwoTrianglesPerFace() {
        assertSame(CollisionBox.getInstance(), CollisionBox.getInstance())
        assertEquals(36, CollisionBox.getInstance().vertices.size)
    }
}
