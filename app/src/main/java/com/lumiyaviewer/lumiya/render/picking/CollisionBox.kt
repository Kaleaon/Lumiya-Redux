package com.lumiyaviewer.lumiya.render.picking

import com.lumiyaviewer.lumiya.slproto.types.LLVector3

class CollisionBox private constructor() {
    @JvmField
    val vertices: Array<LLVector3> = Array(36) { LLVector3() }

    init {
        addCollisionFace(0, -0.5f, -0.5f, 0.5f, 0.5f, -0.5f, 0)
        addCollisionFace(1, -0.5f, -0.5f, 0.5f, 0.5f, 0.5f, 0)
        addCollisionFace(2, -0.5f, -0.5f, 0.5f, 0.5f, -0.5f, 1)
        addCollisionFace(3, -0.5f, -0.5f, 0.5f, 0.5f, 0.5f, 1)
        addCollisionFace(4, -0.5f, -0.5f, 0.5f, 0.5f, -0.5f, 2)
        addCollisionFace(5, -0.5f, -0.5f, 0.5f, 0.5f, 0.5f, 2)
    }

    private fun addCollisionFace(
        face: Int,
        lowX: Float,
        lowY: Float,
        highX: Float,
        highY: Float,
        plane: Float,
        axis: Int,
    ) {
        val start = face * 6
        val corners = arrayOf(
            collisionVertex(lowX, lowY, plane, axis),
            collisionVertex(highX, lowY, plane, axis),
            collisionVertex(highX, highY, plane, axis),
            collisionVertex(lowX, highY, plane, axis),
        )
        vertices[start] = corners[0]
        vertices[start + 1] = corners[1]
        vertices[start + 2] = corners[3]
        vertices[start + 3] = corners[1]
        vertices[start + 4] = corners[2]
        vertices[start + 5] = corners[3]
    }

    private fun collisionVertex(x: Float, y: Float, plane: Float, axis: Int): LLVector3 = when (axis) {
        0 -> LLVector3(plane, x, y)
        1 -> LLVector3(x, plane, y)
        2 -> LLVector3(x, y, plane)
        else -> error("Unsupported collision-box axis: $axis")
    }

    companion object {
        private val instance = CollisionBox()

        @JvmStatic
        fun getInstance(): CollisionBox = instance
    }
}
