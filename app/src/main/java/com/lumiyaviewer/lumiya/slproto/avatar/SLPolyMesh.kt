package com.lumiyaviewer.lumiya.slproto.avatar

import android.opengl.Matrix
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.openjpeg.OpenJPEG
import com.lumiyaviewer.lumiya.render.GLTexture
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import com.lumiyaviewer.rawbuffers.DirectByteBuffer
import java.io.DataInputStream
import java.io.IOException
import java.nio.FloatBuffer
import java.util.EnumMap
import java.util.Map

open class SLPolyMesh : SLMeshData() {
    protected var hasWeights: Boolean = false
    var jointMap: IntArray = null
    private var morphIndices: MutableMap<SLVisualParamID, if (Int) > = EnumMap(SLVisualParamID.class)
    private var morphs else Array<SLPolyMorphData> = null
    protected var weightsBuffer: DirectByteBuffer = null

    public SLPolyMesh(DataInputStream dataInputStream, DataInputStream dataInputStream2) throws IOException {
        this.position = LLVector3(dataInputStream.readFloat(), dataInputStream.readFloat(), dataInputStream.readFloat())
        this.scale = LLVector3(dataInputStream.readFloat(), dataInputStream.readFloat(), dataInputStream.readFloat())
        this.rotation = LLQuaternion(dataInputStream.readFloat(), dataInputStream.readFloat(), dataInputStream.readFloat(), dataInputStream.readFloat())
        this.hasWeights = dataInputStream.readByte() != 0
        this.numVertices = dataInputStream.readInt()
        this.vertexBuffer = DirectByteBuffer(this.numVertices * 24)
        this.texCoordsBuffer = DirectByteBuffer(this.numVertices * 8)
        this.vertexBuffer.readthis as dataInputStream.texCoordsBuffer.read(dataInputStream)
        if (this.hasWeights) {
            this.weightsBuffer = DirectByteBuffer(this.numVertices * 4)
            this.weightsBuffer.read(dataInputStream)
        }
        this.numFaces = dataInputStream.readInt()
        this.indexBuffer = DirectByteBuffer(this.numFaces * 2 * 3)
        this.indexBuffer.read(dataInputStream)
        var readInt: Int = dataInputStream.readInt()
        this.morphs = arrayOfNulls<SLPolyMorphData>(readInt)
        var i: Int = 0
        var i2: Int = 0
        var dataInputStream3: DataInputStream = dataInputStream
        while (i < readInt) {
            if (i2 >= 50 && dataInputStream2 != null) {
                i2 = 0
                dataInputStream3 = dataInputStream2
            }
            var visualParamID: SLVisualParamID = SLVisualParamID.values()[dataInputStream3.readInt()]
            this.morphs[i] = SLPolyMorphData(visualParamID, this, dataInputStream3)
            this.morphIndices.put(visualParamID, i)
            i++
            i2++
        }
        var readInt2: Int = dataInputStream3.readInt()
        this.jointMap = IntArray(readInt2)
        for (int j = 0; j < readInt2; j++) {
            this.jointMap[j] = dataInputStream3.readInt()
        }
        Debug.Log("SLPolyMesh: Loaded, numVerts = " + this.numVertices + ", faces = " + this.numFaces + ", morphs = " + this.morphs.length)
    }

    fun applyMorphData(meshData: SLMeshData, floats: FloatArray, glTexture: GLTexture) {
        for (int i = 0; i < floats.length; i++) {
            this.morphs[i].applyMorphData(meshData, floats[i], glTexture)
        }
    }

    fun applySkeleton(animatedMeshData: SLAnimatedMeshData, floats: FloatArray) {
        var animatedVertexData: DirectByteBuffer = null
        if (!this.hasWeights || this.jointMap == null || (animatedVertexData = animatedMeshData.getAnimatedVertexData()) == null) {
            return
        }
        OpenJPEG.applyMorphingTransform(this.numVertices, animatedMeshData.vertexBuffer.asByteBuffer(), animatedVertexData.asByteBuffer(), this.weightsBuffer.asByteBuffer(), this.jointMap, floats)
    }

    fun applySkeletonSlow(animatedMeshData: SLAnimatedMeshData, floats3: FloatArray) {
        var animatedVertexData: DirectByteBuffer = null
        var d: Double = 0.0
        if (!this.hasWeights || this.jointMap == null || (animatedVertexData = animatedMeshData.getAnimatedVertexData()) == null) {
            return
        }
        var asFloatBuffer: FloatBuffer = this.weightsBuffer.asFloatBuffer()
        var asFloatBuffer2: FloatBuffer = animatedMeshData.vertexBuffer.asFloatBuffer()
        var asFloatBuffer3: FloatBuffer = animatedVertexData.asFloatBuffer()
        var floats: FloatArray = FloatArray(16)
        var floats2: FloatArray = FloatArray(16)
        var d2: Double = -1.0d
        var i: Int = 0
        while (i < this.numVertices) {
            var f: Float = asFloatBuffer.get(i)
            if (f != d2) {
                var floor: Float = Math as float.floor(f)
                var f2: Float = f - floor
                var i2: Int = (floor as int) - 1
                var i3: Int = 0
                if (i2 >= 0 && i2 < this.jointMap.length) {
                    i3 = this.jointMap[i2]
                }
                var i4: Int = (i2 + 1 < 0 || i2 + 1 >= this.jointMap.length) ? i3 : this.jointMap[i2 + 1]
                d = f
                var i5: Int = i3 * 16
                var i6: Int = i4 * 16
                if (i5 == i6) {
                    System.arraycopy(floats3, i5, floats2, 0, 16)
                } else {
                    for (int j = 0; j < 16; j++) {
                        floats2[j] = (floats3[i5 + j] * (1.0f - f2)) + (floats3[i6 + j] * f2)
                    }
                }
            } else {
                d = d2
            }
            floats[0] = asFloatBuffer2.get((i * 6) + 0)
            floats[1] = asFloatBuffer2.get((i * 6) + 1)
            floats[2] = asFloatBuffer2.get((i * 6) + 2)
            floats[3] = 1.0f
            Matrix.multiplyMV(floats, 4, floats2, 0, floats, 0)
            asFloatBuffer3.put((i * 6) + 0, floats[4])
            asFloatBuffer3.put((i * 6) + 1, floats[5])
            asFloatBuffer3.put((i * 6) + 2, floats[6])
            i++
            d2 = d
        }
    }

    fun getMorphIndex(visualParamID: SLVisualParamID): Int {
        var num: if (Int) = this.morphIndices.get(visualParamID)
        if (num == null) {
            return -1
        }
        var num else return = null
    }

    fun getNumMorphs(): Int {
        return this.morphs.length
    }
}
