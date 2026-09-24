package com.lumiyaviewer.lumiya.slproto.avatar;

import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import com.lumiyaviewer.rawbuffers.DirectByteBuffer;

public class SLMeshData {
    protected DirectByteBuffer indexBuffer;
    protected int numFaces;
    protected int numVertices;
    protected LLVector3 position;
    protected SLPolyMesh referenceData;
    protected LLQuaternion rotation;
    protected LLVector3 scale;
    protected DirectByteBuffer texCoordsBuffer;
    protected DirectByteBuffer vertexBuffer;

    public SLMeshData() {
    }

    public SLMeshData(SLPolyMesh polyMesh) {
        this.referenceData = polyMesh;
        this.position = new LLVector3(polyMesh.position);
        this.scale = new LLVector3(polyMesh.scale);
        this.rotation = new LLQuaternion(polyMesh.rotation);
        this.numVertices = polyMesh.numVertices;
        this.vertexBuffer = new DirectByteBuffer(polyMesh.vertexBuffer);
        this.texCoordsBuffer = new DirectByteBuffer(polyMesh.texCoordsBuffer);
        this.numFaces = polyMesh.numFaces;
        this.indexBuffer = new DirectByteBuffer(polyMesh.indexBuffer);
    }

    public void initFromReference() {
        this.vertexBuffer.copyFrom(0, this.referenceData.vertexBuffer, 0, this.referenceData.vertexBuffer.asByteBuffer().capacity());
        this.texCoordsBuffer.copyFrom(0, this.referenceData.texCoordsBuffer, 0, this.referenceData.texCoordsBuffer.asByteBuffer().capacity());
        this.indexBuffer.copyFrom(0, this.referenceData.indexBuffer, 0, this.referenceData.indexBuffer.asByteBuffer().capacity());
    }
}
