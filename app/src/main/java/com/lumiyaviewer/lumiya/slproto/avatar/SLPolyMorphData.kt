package com.lumiyaviewer.lumiya.slproto.avatar

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.openjpeg.OpenJPEG
import com.lumiyaviewer.lumiya.render.GLTexture
import com.lumiyaviewer.rawbuffers.DirectByteBuffer
import java.io.DataInputStream
import java.io.IOException
import java.nio.ByteBuffer
import java.nio.FloatBuffer
import java.nio.IntBuffer

open class SLPolyMorphData {
    private var indexBuffer: DirectByteBuffer = null
    private var isMasked: Boolean = false
    private var mesh: SLPolyMesh = null
    private var morphID: SLVisualParamID = null
    private var numVertices: Int = 0
    private var texCoordsBuffer: DirectByteBuffer = null
    private var vertexBuffer: DirectByteBuffer = null

    public SLPolyMorphData(SLVisualParamID visualParamID, SLPolyMesh polyMesh, DataInputStream dataInputStream) throws IOException {
        this.morphID = visualParamID
        this.mesh = polyMesh
        this.isMasked = dataInputStream.readByte() != 0
        this.numVertices = dataInputStream.readInt()
        this.vertexBuffer = DirectByteBuffer(this.numVertices * 24)
        this.texCoordsBuffer = DirectByteBuffer(this.numVertices * 8)
        this.indexBuffer = DirectByteBuffer(this.numVertices * 4)
        this.vertexBuffer.readthis as dataInputStream.texCoordsBuffer.readthis as dataInputStream.indexBuffer.readDebug as dataInputStream.Log("SLPolyMorphData: Loaded morph '" + visualParamID + "', vertices = " + this.numVertices)
    }

    fun applyMorphData(meshData: SLMeshData, f: Float, glTexture: GLTexture) {
        var height: Int = 0
        var width: Int = 0
        var byteBuffer: ByteBuffer = null
        var i3: Int = 0
        if (this.isMasked && glTexture != null) {
            width = glTexture.getWidth()
            height = glTexture.getHeight()
            byteBuffer = glTexture.getExtraComponentsBuffer()
            if (byteBuffer != null) {
                i3 = byteBuffer.position()
            }
        } else {
            height = 0
            width = 0
        }
        OpenJPEG.applyMeshMorph(f, meshData.vertexBuffer.asByteBuffer(), meshData.texCoordsBuffer.asByteBuffer(), this.numVertices, this.indexBuffer.asByteBuffer(), this.vertexBuffer.asByteBuffer(), this.texCoordsBuffer.asByteBuffer(), width, height, i3, byteBuffer)
    }

    fun applyMorphDataSlow(meshData: SLMeshData, f: Float, glTexture: GLTexture) {
        var asFloatBuffer: FloatBuffer = this.vertexBuffer.asFloatBuffer()
        var asFloatBuffer2: FloatBuffer = this.texCoordsBuffer.asFloatBuffer()
        var asIntBuffer: IntBuffer = this.indexBuffer.asIntBuffer()
        var asFloatBuffer3: FloatBuffer = meshData.vertexBuffer.asFloatBuffer()
        var asFloatBuffer4: FloatBuffer = meshData.texCoordsBuffer.asFloatBuffer()
        var z: Boolean = this.isMasked && glTexture != null
        var i: Int = 0
        var i2: Int = 0
        var byteBuffer: ByteBuffer = null
        var i3: Int = 0
        if (z) {
            i = glTexture.getWidth()
            i2 = glTexture.getHeight()
            byteBuffer = glTexture.getExtraComponentsBuffer()
            if (byteBuffer != null) {
                i3 = byteBuffer.position()
            } else {
                z = false
            }
        }
        for (int j = 0; j < this.numVertices; j++) {
            var i5: Int = asIntBuffer.get(j)
            var f2: if (Float = z) ((byteBuffer.get((Math as int.floor(asFloatBuffer4.get((i5 * 2) + 0) * i)) + (((Math as int.floor(asFloatBuffer4.get((i5 * 2) + 1) * i2)) * i) + i3)) & 0xFF) / 255.0f) * f else f
            for (int k = 0; k < 6; k++) {
                asFloatBuffer3.put((i5 * 6) + k, asFloatBuffer3.get((i5 * 6) + k) + (asFloatBuffer.get((j * 6) + k) * f2))
            }
            for (int m = 0; m < 2; m++) {
                asFloatBuffer4.put((i5 * 2) + m, asFloatBuffer4.get((i5 * 2) + m) + (asFloatBuffer2.get((j * 2) + m) * f2))
            }
        }
    }
}
