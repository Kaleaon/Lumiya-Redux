package com.lumiyaviewer.lumiya.slproto.mesh;

import com.lumiyaviewer.lumiya.openjpeg.OpenJPEG;
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDException;
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode;
import com.lumiyaviewer.lumiya.slproto.types.LLVector2;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import com.lumiyaviewer.rawbuffers.DirectByteBuffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.ShortBuffer;
import javax.annotation.Nonnull;

public class MeshFace {
    private final DirectByteBuffer indexBuffer;
    private final int numIndices;
    private final int numVertices;
    private final DirectByteBuffer texCoordsBuffer;
    private final DirectByteBuffer vertexBuffer;
    private final DirectByteBuffer weightBuffer;

    MeshFace(LLSDNode lsdNode) throws LLSDException {
        if (lsdNode.keyExists("NoGeometry") || (!lsdNode.keyExists("Position")) || (!lsdNode.keyExists("TriangleList"))) {
            this.vertexBuffer = null;
            this.indexBuffer = null;
            this.weightBuffer = null;
            this.texCoordsBuffer = null;
            this.numIndices = 0;
            this.numVertices = 0;
            return;
        }
        byte[] asBinary = lsdNode.byKey("Position").asBinary();
        byte[] bytes = lsdNode.keyExists("Normal") ? lsdNode.byKey("Normal").asBinary() : null;
        byte[] bytes2 = lsdNode.keyExists("TexCoord0") ? lsdNode.byKey("TexCoord0").asBinary() : null;
        this.numVertices = asBinary.length / 6;
        this.vertexBuffer = new DirectByteBuffer(this.numVertices * 6 * 4);
        LLVector3 vector3 = new LLVector3(-0.5f, -0.5f, -0.5f);
        LLVector3 vector33 = new LLVector3(0.5f, 0.5f, 0.5f);
        if (lsdNode.keyExists("PositionDomain")) {
            if (lsdNode.byKey("PositionDomain").keyExists("Min")) {
                LLSDNode byKey = lsdNode.byKey("PositionDomain").byKey("Min");
                vector3.set((float) byKey.byIndex(0).asDouble(), (float) byKey.byIndex(1).asDouble(), (float) byKey.byIndex(2).asDouble());
            }
            if (lsdNode.byKey("PositionDomain").keyExists("Max")) {
                LLSDNode byKey2 = lsdNode.byKey("PositionDomain").byKey("Max");
                vector33.set((float) byKey2.byIndex(0).asDouble(), (float) byKey2.byIndex(1).asDouble(), (float) byKey2.byIndex(2).asDouble());
            }
        }
        LLVector2 vector2 = null;
        LLVector2 vector23 = null;
        if (bytes2 != null) {
            vector2 = new LLVector2(0.0f, 0.0f);
            vector23 = new LLVector2(0.0f, 0.0f);
            if (lsdNode.keyExists("TexCoord0Domain")) {
                if (lsdNode.byKey("TexCoord0Domain").keyExists("Min")) {
                    LLSDNode byKey3 = lsdNode.byKey("TexCoord0Domain").byKey("Min");
                    vector2.set((float) byKey3.byIndex(0).asDouble(), (float) byKey3.byIndex(1).asDouble());
                }
                if (lsdNode.byKey("TexCoord0Domain").keyExists("Max")) {
                    LLSDNode byKey4 = lsdNode.byKey("TexCoord0Domain").byKey("Max");
                    vector23.set((float) byKey4.byIndex(0).asDouble(), (float) byKey4.byIndex(1).asDouble());
                }
            }
        }
        ShortBuffer asShortBuffer = ByteBuffer.wrap(asBinary).order(ByteOrder.LITTLE_ENDIAN).asShortBuffer();
        ShortBuffer shortBuffer = bytes != null ? ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN).asShortBuffer() : null;
        ShortBuffer shortBuffer2 = bytes2 != null ? ByteBuffer.wrap(bytes2).order(ByteOrder.LITTLE_ENDIAN).asShortBuffer() : null;
        this.vertexBuffer.position(0);
        for (int i = 0; i < this.numVertices; i++) {
            float f = (((asShortBuffer.get() & 65535) * (vector33.x - vector3.x)) / 65535.0f) + vector3.x;
            float f2 = (((asShortBuffer.get() & 65535) * (vector33.y - vector3.y)) / 65535.0f) + vector3.y;
            float f3 = (((asShortBuffer.get() & 65535) * (vector33.z - vector3.z)) / 65535.0f) + vector3.z;
            this.vertexBuffer.putFloat(f);
            this.vertexBuffer.putFloat(f2);
            this.vertexBuffer.putFloat(f3);
            if (shortBuffer != null) {
                this.vertexBuffer.putFloat((((shortBuffer.get() & 65535) * 2.0f) / 65535.0f) - 1.0f);
                this.vertexBuffer.putFloat((((shortBuffer.get() & 65535) * 2.0f) / 65535.0f) - 1.0f);
                this.vertexBuffer.putFloat((((shortBuffer.get() & 65535) * 2.0f) / 65535.0f) - 1.0f);
            } else {
                this.vertexBuffer.putFloat(0.0f);
                this.vertexBuffer.putFloat(0.0f);
                this.vertexBuffer.putFloat(0.0f);
            }
        }
        if (shortBuffer2 != null) {
            this.texCoordsBuffer = new DirectByteBuffer(this.numVertices * 2 * 4);
            this.texCoordsBuffer.position(0);
            for (int j = 0; j < this.numVertices; j++) {
                float f4 = (((shortBuffer2.get() & 65535) * (vector23.x - vector2.x)) / 65535.0f) + vector2.x;
                float f5 = (((shortBuffer2.get() & 65535) * (vector23.y - vector2.y)) / 65535.0f) + vector2.y;
                this.texCoordsBuffer.putFloat(f4);
                this.texCoordsBuffer.putFloat(f5);
            }
        } else {
            this.texCoordsBuffer = null;
        }
        byte[] asBinary4 = lsdNode.byKey("TriangleList").asBinary();
        this.numIndices = asBinary4.length / 2;
        this.indexBuffer = new DirectByteBuffer(this.numIndices * 2);
        this.indexBuffer.loadFromByteArray(0, asBinary4, 0, this.numIndices * 2);
        if (!lsdNode.keyExists("Weights")) {
            this.weightBuffer = null;
            return;
        }
        byte[] asBinary5 = lsdNode.byKey("Weights").asBinary();
        this.weightBuffer = new DirectByteBuffer(asBinary5.length);
        this.weightBuffer.loadFromByteArray(0, asBinary5, 0, asBinary5.length);
    }

    void PrepareInfluenceBuffer(@Nonnull MeshWeightsBuffer meshWeightsBuffer, int i) {
        OpenJPEG.meshPrepareSeparateInfluenceBuffer(this.weightBuffer.asByteBuffer(), this.numVertices, meshWeightsBuffer.jointIndexBuffer.asByteBuffer(), meshWeightsBuffer.weightsBuffer.asByteBuffer(), i);
    }

    void PrepareInfluenceBuffer(DirectByteBuffer directByteBuffer, int i) {
        if (this.weightBuffer != null) {
            OpenJPEG.meshPrepareInfluenceBuffer(this.weightBuffer.asByteBuffer(), this.numVertices, directByteBuffer.asByteBuffer(), i);
        }
    }

    final void UpdateRigged(DirectByteBuffer directByteBuffer, int i, float[] floats, float[] floats2) {
        if (this.weightBuffer == null || this.vertexBuffer == null || directByteBuffer == null) {
            return;
        }
        OpenJPEG.applyRiggedMeshMorph(directByteBuffer.asByteBuffer(), i, floats, floats2, this.vertexBuffer.asByteBuffer(), this.weightBuffer.asByteBuffer(), this.numVertices);
    }

    public final DirectByteBuffer getIndices() {
        return this.indexBuffer;
    }

    public final int getNumIndices() {
        return this.numIndices;
    }

    public final int getNumVertices() {
        return this.numVertices;
    }

    public final DirectByteBuffer getTexCoords() {
        return this.texCoordsBuffer;
    }

    public final DirectByteBuffer getVertices() {
        return this.vertexBuffer;
    }
}
