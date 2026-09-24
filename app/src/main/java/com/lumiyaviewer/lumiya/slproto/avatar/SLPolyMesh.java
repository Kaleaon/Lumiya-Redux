package com.lumiyaviewer.lumiya.slproto.avatar;

import android.opengl.Matrix;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.openjpeg.OpenJPEG;
import com.lumiyaviewer.lumiya.render.GLTexture;
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import com.lumiyaviewer.rawbuffers.DirectByteBuffer;
import java.io.DataInputStream;
import java.io.IOException;
import java.nio.FloatBuffer;
import java.util.EnumMap;
import java.util.Map;

public class SLPolyMesh extends SLMeshData {
    protected boolean hasWeights;
    public int[] jointMap;
    private Map<SLVisualParamID, Integer> morphIndices = new EnumMap(SLVisualParamID.class);
    private SLPolyMorphData[] morphs;
    protected DirectByteBuffer weightsBuffer;

    public SLPolyMesh(DataInputStream dataInputStream, DataInputStream dataInputStream2) throws IOException {
        this.position = new LLVector3(dataInputStream.readFloat(), dataInputStream.readFloat(), dataInputStream.readFloat());
        this.scale = new LLVector3(dataInputStream.readFloat(), dataInputStream.readFloat(), dataInputStream.readFloat());
        this.rotation = new LLQuaternion(dataInputStream.readFloat(), dataInputStream.readFloat(), dataInputStream.readFloat(), dataInputStream.readFloat());
        this.hasWeights = dataInputStream.readByte() != 0;
        this.numVertices = dataInputStream.readInt();
        this.vertexBuffer = new DirectByteBuffer(this.numVertices * 24);
        this.texCoordsBuffer = new DirectByteBuffer(this.numVertices * 8);
        this.vertexBuffer.read(dataInputStream);
        this.texCoordsBuffer.read(dataInputStream);
        if (this.hasWeights) {
            this.weightsBuffer = new DirectByteBuffer(this.numVertices * 4);
            this.weightsBuffer.read(dataInputStream);
        }
        this.numFaces = dataInputStream.readInt();
        this.indexBuffer = new DirectByteBuffer(this.numFaces * 2 * 3);
        this.indexBuffer.read(dataInputStream);
        int readInt = dataInputStream.readInt();
        this.morphs = new SLPolyMorphData[readInt];
        int i = 0;
        int i2 = 0;
        DataInputStream dataInputStream3 = dataInputStream;
        while (i < readInt) {
            if (i2 >= 50 && dataInputStream2 != null) {
                i2 = 0;
                dataInputStream3 = dataInputStream2;
            }
            SLVisualParamID visualParamID = SLVisualParamID.values()[dataInputStream3.readInt()];
            this.morphs[i] = new SLPolyMorphData(visualParamID, this, dataInputStream3);
            this.morphIndices.put(visualParamID, Integer.valueOf(i));
            i++;
            i2++;
        }
        int readInt2 = dataInputStream3.readInt();
        this.jointMap = new int[readInt2];
        for (int j = 0; j < readInt2; j++) {
            this.jointMap[j] = dataInputStream3.readInt();
        }
        Debug.Log("SLPolyMesh: Loaded, numVerts = " + this.numVertices + ", faces = " + this.numFaces + ", morphs = " + this.morphs.length);
    }

    public void applyMorphData(SLMeshData meshData, float[] floats, GLTexture glTexture) {
        for (int i = 0; i < floats.length; i++) {
            this.morphs[i].applyMorphData(meshData, floats[i], glTexture);
        }
    }

    public void applySkeleton(SLAnimatedMeshData animatedMeshData, float[] floats) {
        DirectByteBuffer animatedVertexData;
        if (!this.hasWeights || this.jointMap == null || (animatedVertexData = animatedMeshData.getAnimatedVertexData()) == null) {
            return;
        }
        OpenJPEG.applyMorphingTransform(this.numVertices, animatedMeshData.vertexBuffer.asByteBuffer(), animatedVertexData.asByteBuffer(), this.weightsBuffer.asByteBuffer(), this.jointMap, floats);
    }

    public void applySkeletonSlow(SLAnimatedMeshData animatedMeshData, float[] floats3) {
        DirectByteBuffer animatedVertexData;
        double d;
        if (!this.hasWeights || this.jointMap == null || (animatedVertexData = animatedMeshData.getAnimatedVertexData()) == null) {
            return;
        }
        FloatBuffer asFloatBuffer = this.weightsBuffer.asFloatBuffer();
        FloatBuffer asFloatBuffer2 = animatedMeshData.vertexBuffer.asFloatBuffer();
        FloatBuffer asFloatBuffer3 = animatedVertexData.asFloatBuffer();
        float[] floats = new float[16];
        float[] floats2 = new float[16];
        double d2 = -1.0d;
        int i = 0;
        while (i < this.numVertices) {
            float f = asFloatBuffer.get(i);
            if (f != d2) {
                float floor = (float) Math.floor(f);
                float f2 = f - floor;
                int i2 = ((int) floor) - 1;
                int i3 = 0;
                if (i2 >= 0 && i2 < this.jointMap.length) {
                    i3 = this.jointMap[i2];
                }
                int i4 = (i2 + 1 < 0 || i2 + 1 >= this.jointMap.length) ? i3 : this.jointMap[i2 + 1];
                d = f;
                int i5 = i3 * 16;
                int i6 = i4 * 16;
                if (i5 == i6) {
                    System.arraycopy(floats3, i5, floats2, 0, 16);
                } else {
                    for (int j = 0; j < 16; j++) {
                        floats2[j] = (floats3[i5 + j] * (1.0f - f2)) + (floats3[i6 + j] * f2);
                    }
                }
            } else {
                d = d2;
            }
            floats[0] = asFloatBuffer2.get((i * 6) + 0);
            floats[1] = asFloatBuffer2.get((i * 6) + 1);
            floats[2] = asFloatBuffer2.get((i * 6) + 2);
            floats[3] = 1.0f;
            Matrix.multiplyMV(floats, 4, floats2, 0, floats, 0);
            asFloatBuffer3.put((i * 6) + 0, floats[4]);
            asFloatBuffer3.put((i * 6) + 1, floats[5]);
            asFloatBuffer3.put((i * 6) + 2, floats[6]);
            i++;
            d2 = d;
        }
    }

    public int getMorphIndex(SLVisualParamID visualParamID) {
        Integer num = this.morphIndices.get(visualParamID);
        if (num == null) {
            return -1;
        }
        return num.intValue();
    }

    public int getNumMorphs() {
        return this.morphs.length;
    }
}
