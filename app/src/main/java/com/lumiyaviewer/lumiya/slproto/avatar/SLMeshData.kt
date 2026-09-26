package com.lumiyaviewer.lumiya.slproto.avatar

import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import com.lumiyaviewer.rawbuffers.DirectByteBuffer

open class SLMeshData {
    protected var indexBuffer: DirectByteBuffer = null
    protected var numFaces: Int = 0
    protected var numVertices: Int = 0
    protected var position: LLVector3 = null
    protected var referenceData: SLPolyMesh = null
    protected var rotation: LLQuaternion = null
    protected var scale: LLVector3 = null
    protected var texCoordsBuffer: DirectByteBuffer = null
    protected var vertexBuffer: DirectByteBuffer = null

    constructor() {
    }

    constructor(polyMesh: SLPolyMesh) {
        this.referenceData = polyMesh
        this.position = LLVector3(polyMesh.position)
        this.scale = LLVector3(polyMesh.scale)
        this.rotation = LLQuaternion(polyMesh.rotation)
        this.numVertices = polyMesh.numVertices
        this.vertexBuffer = DirectByteBuffer(polyMesh.vertexBuffer)
        this.texCoordsBuffer = DirectByteBuffer(polyMesh.texCoordsBuffer)
        this.numFaces = polyMesh.numFaces
        this.indexBuffer = DirectByteBuffer(polyMesh.indexBuffer)
    }

    fun initFromReference() {
        this.vertexBuffer.copyFrom(0, this.referenceData.vertexBuffer, 0, this.referenceData.vertexBuffer.asByteBuffer().capacity())
        this.texCoordsBuffer.copyFrom(0, this.referenceData.texCoordsBuffer, 0, this.referenceData.texCoordsBuffer.asByteBuffer().capacity())
        this.indexBuffer.copyFrom(0, this.referenceData.indexBuffer, 0, this.referenceData.indexBuffer.asByteBuffer().capacity())
    }
}
