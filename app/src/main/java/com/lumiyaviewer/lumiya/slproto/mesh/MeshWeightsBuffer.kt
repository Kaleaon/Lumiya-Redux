package com.lumiyaviewer.lumiya.slproto.mesh

import com.lumiyaviewer.rawbuffers.DirectByteBuffer

open class MeshWeightsBuffer(size: Int) {
    @JvmField val jointIndexBuffer = DirectByteBuffer(size * 4)
    @JvmField val weightsBuffer = DirectByteBuffer(size * 4 * 4)
}
