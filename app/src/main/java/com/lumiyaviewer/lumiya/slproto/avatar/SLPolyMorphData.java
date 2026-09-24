package com.lumiyaviewer.lumiya.slproto.avatar;

import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.openjpeg.OpenJPEG;
import com.lumiyaviewer.lumiya.render.GLTexture;
import com.lumiyaviewer.rawbuffers.DirectByteBuffer;
import java.io.DataInputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.FloatBuffer;
import java.nio.IntBuffer;

public class SLPolyMorphData {
    private DirectByteBuffer indexBuffer;
    private boolean isMasked;
    private SLPolyMesh mesh;
    private SLVisualParamID morphID;
    private int numVertices;
    private DirectByteBuffer texCoordsBuffer;
    private DirectByteBuffer vertexBuffer;

    public SLPolyMorphData(SLVisualParamID visualParamID, SLPolyMesh polyMesh, DataInputStream dataInputStream) throws IOException {
        this.morphID = visualParamID;
        this.mesh = polyMesh;
        this.isMasked = dataInputStream.readByte() != 0;
        this.numVertices = dataInputStream.readInt();
        this.vertexBuffer = new DirectByteBuffer(this.numVertices * 24);
        this.texCoordsBuffer = new DirectByteBuffer(this.numVertices * 8);
        this.indexBuffer = new DirectByteBuffer(this.numVertices * 4);
        this.vertexBuffer.read(dataInputStream);
        this.texCoordsBuffer.read(dataInputStream);
        this.indexBuffer.read(dataInputStream);
        Debug.Log("SLPolyMorphData: Loaded morph '" + visualParamID + "', vertices = " + this.numVertices);
    }

    public void applyMorphData(SLMeshData meshData, float f, GLTexture glTexture) {
        int height;
        int width;
        ByteBuffer byteBuffer = null;
        int i3 = 0;
        if (this.isMasked && glTexture != null) {
            width = glTexture.getWidth();
            height = glTexture.getHeight();
            byteBuffer = glTexture.getExtraComponentsBuffer();
            if (byteBuffer != null) {
                i3 = byteBuffer.position();
            }
        } else {
            height = 0;
            width = 0;
        }
        OpenJPEG.applyMeshMorph(f, meshData.vertexBuffer.asByteBuffer(), meshData.texCoordsBuffer.asByteBuffer(), this.numVertices, this.indexBuffer.asByteBuffer(), this.vertexBuffer.asByteBuffer(), this.texCoordsBuffer.asByteBuffer(), width, height, i3, byteBuffer);
    }

    public void applyMorphDataSlow(SLMeshData meshData, float f, GLTexture glTexture) {
        FloatBuffer asFloatBuffer = this.vertexBuffer.asFloatBuffer();
        FloatBuffer asFloatBuffer2 = this.texCoordsBuffer.asFloatBuffer();
        IntBuffer asIntBuffer = this.indexBuffer.asIntBuffer();
        FloatBuffer asFloatBuffer3 = meshData.vertexBuffer.asFloatBuffer();
        FloatBuffer asFloatBuffer4 = meshData.texCoordsBuffer.asFloatBuffer();
        boolean z = this.isMasked && glTexture != null;
        int i = 0;
        int i2 = 0;
        ByteBuffer byteBuffer = null;
        int i3 = 0;
        if (z) {
            i = glTexture.getWidth();
            i2 = glTexture.getHeight();
            byteBuffer = glTexture.getExtraComponentsBuffer();
            if (byteBuffer != null) {
                i3 = byteBuffer.position();
            } else {
                z = false;
            }
        }
        for (int j = 0; j < this.numVertices; j++) {
            int i5 = asIntBuffer.get(j);
            float f2 = z ? ((byteBuffer.get(((int) Math.floor(asFloatBuffer4.get((i5 * 2) + 0) * i)) + ((((int) Math.floor(asFloatBuffer4.get((i5 * 2) + 1) * i2)) * i) + i3)) & 0xFF) / 255.0f) * f : f;
            for (int k = 0; k < 6; k++) {
                asFloatBuffer3.put((i5 * 6) + k, asFloatBuffer3.get((i5 * 6) + k) + (asFloatBuffer.get((j * 6) + k) * f2));
            }
            for (int m = 0; m < 2; m++) {
                asFloatBuffer4.put((i5 * 2) + m, asFloatBuffer4.get((i5 * 2) + m) + (asFloatBuffer2.get((j * 2) + m) * f2));
            }
        }
    }
}
