package com.lumiyaviewer.lumiya.render.spatial

import com.lumiyaviewer.lumiya.slproto.objects.SLObjectInfo

abstract class DrawListObjectEntry(@JvmField protected val objectInfo: SLObjectInfo) : DrawListEntry() {

    fun getObjectInfo(): SLObjectInfo = objectInfo

    fun updateBoundingBox() {
        val worldMatrix = objectInfo.worldMatrix ?: return
        val objectCoords = objectInfo.objectCoords
        val data = objectCoords.data
        val elementOffset = objectCoords.getElementOffset(1)
        for (i in 0 until 3) {
            val f = worldMatrix[i + 12]
            boundingBox[i + 3] = f
            boundingBox[i] = f
        }
        for (j in 0 until 3) {
            for (k in 0 until 3) {
                val f2 = worldMatrix[j * 4 + k] * (-data[elementOffset + k] / 2.0f)
                val f3 = worldMatrix[j * 4 + k] * (data[elementOffset + k] / 2.0f)
                if (f2 < f3) {
                    boundingBox[j] += f2
                    boundingBox[j + 3] += f3
                } else {
                    boundingBox[j] += f3
                    boundingBox[j + 3] += f2
                }
            }
        }
        for (i6 in 0 until 3) {
            val f4 = if (i6 == 2) 4096.0f else 256.0f
            boundingBox[i6] = minOf(f4, maxOf(0.0f, boundingBox[i6]))
            boundingBox[i6 + 3] = minOf(f4, maxOf(0.0f, boundingBox[i6 + 3]))
        }
    }
}
