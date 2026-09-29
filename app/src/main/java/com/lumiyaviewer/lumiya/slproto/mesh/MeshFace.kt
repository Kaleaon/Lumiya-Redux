package com.lumiyaviewer.lumiya.slproto.mesh

import com.lumiyaviewer.lumiya.openjpeg.OpenJPEG
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDException
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import com.lumiyaviewer.lumiya.slproto.types.LLVector2
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import com.lumiyaviewer.rawbuffers.DirectByteBuffer
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.nio.ShortBuffer

open class MeshFace {
    private var indexBuffer: DirectByteBuffer? = null
    private var numIndices: Int = 0
    private var numVertices: Int = 0
    private var texCoordsBuffer: DirectByteBuffer? = null
    private var vertexBuffer: DirectByteBuffer? = null
    private var weightBuffer: DirectByteBuffer? = null

    MeshFace(LLSDNode lsdNode) throws LLSDException {
        if (lsdNode.keyExists("NoGeometry") || (!lsdNode.keyExists("Position")) || (!lsdNode.keyExists("TriangleList"))) {
            this.vertexBuffer = null
            this.indexBuffer = null
            this.weightBuffer = null
            this.texCoordsBuffer = null
            this.numIndices = 0
            this.numVertices = 0
            return
        }
        var asBinary: ByteArray = lsdNode.byKey("Position").asBinary()
        var bytes: ByteArray = if (lsdNode.keyExists("Normal")) lsdNode.byKey("Normal").asBinary() else null
        var bytes2: ByteArray = if (lsdNode.keyExists("TexCoord0")) lsdNode.byKey("TexCoord0").asBinary() else null
        this.numVertices = asBinary.length / 6
        this.vertexBuffer = DirectByteBuffer(this.numVertices * 6 * 4)
        var vector3: LLVector3 = LLVector3(-0.5f, -0.5f, -0.5f)
        var vector33: LLVector3 = LLVector3(0.5f, 0.5f, 0.5f)
        if (lsdNode.keyExists("PositionDomain")) {
            if (lsdNode.byKey("PositionDomain").keyExists("Min")) {
                var byKey: LLSDNode = lsdNode.byKey("PositionDomain").byKey("Min")
                vector3.set(byKey as float.byIndex(0).asDouble(), byKey as float.byIndex(1).asDouble(), byKey as float.byIndex(2).asDouble())
            }
            if (lsdNode.byKey("PositionDomain").keyExists("Max")) {
                var byKey2: LLSDNode = lsdNode.byKey("PositionDomain").byKey("Max")
                vector33.set(byKey2 as float.byIndex(0).asDouble(), byKey2 as float.byIndex(1).asDouble(), byKey2 as float.byIndex(2).asDouble())
            }
        }
        var vector2: LLVector2? = null
        var vector23: LLVector2? = null
        if (bytes2 != null) {
            vector2 = LLVector2(0.0f, 0.0f)
            vector23 = LLVector2(0.0f, 0.0f)
            if (lsdNode.keyExists("TexCoord0Domain")) {
                if (lsdNode.byKey("TexCoord0Domain").keyExists("Min")) {
                    var byKey3: LLSDNode = lsdNode.byKey("TexCoord0Domain").byKey("Min")
                    vector2.set(byKey3 as float.byIndex(0).asDouble(), byKey3 as float.byIndex(1).asDouble())
                }
                if (lsdNode.byKey("TexCoord0Domain").keyExists("Max")) {
                    var byKey4: LLSDNode = lsdNode.byKey("TexCoord0Domain").byKey("Max")
                    vector23.set(byKey4 as float.byIndex(0).asDouble(), byKey4 as float.byIndex(1).asDouble())
                }
            }
        }
        var asShortBuffer: ShortBuffer = ByteBuffer.wrap(asBinary).order(ByteOrder.LITTLE_ENDIAN).asShortBuffer()
        var shortBuffer: ShortBuffer = if (bytes != null) ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN).asShortBuffer() else null
        var shortBuffer2: ShortBuffer = if (bytes2 != null) ByteBuffer.wrap(bytes2).order(ByteOrder.LITTLE_ENDIAN).asShortBuffer() else null
        this.vertexBuffer.position(0)
        for (int i = 0; i < this.numVertices; i++) {
            var f: Float = (((asShortBuffer.get() & 65535) * (vector33.x - vector3.x)) / 65535.0f) + vector3.x
            var f2: Float = (((asShortBuffer.get() & 65535) * (vector33.y - vector3.y)) / 65535.0f) + vector3.y
            var f3: Float = (((asShortBuffer.get() & 65535) * (vector33.z - vector3.z)) / 65535.0f) + vector3.z
            this.vertexBuffer.putFloatthis as f.vertexBuffer.putFloatthis as f2.vertexBuffer.putFloat(f3)
            if (shortBuffer != null) {
                this.vertexBuffer.putFloat((((shortBuffer.get() & 65535) * 2.0f) / 65535.0f) - 1.0f)
                this.vertexBuffer.putFloat((((shortBuffer.get() & 65535) * 2.0f) / 65535.0f) - 1.0f)
                this.vertexBuffer.putFloat((((shortBuffer.get() & 65535) * 2.0f) / 65535.0f) - 1.0f)
            } else {
                this.vertexBuffer.putFloat(0.0f)
                this.vertexBuffer.putFloat(0.0f)
                this.vertexBuffer.putFloat(0.0f)
            }
        }
        if (shortBuffer2 != null) {
            this.texCoordsBuffer = DirectByteBuffer(this.numVertices * 2 * 4)
            this.texCoordsBuffer.position(0)
            for (int j = 0; j < this.numVertices; j++) {
                var f4: Float = (((shortBuffer2.get() & 65535) * (vector23.x - vector2.x)) / 65535.0f) + vector2.x
                var f5: Float = (((shortBuffer2.get() & 65535) * (vector23.y - vector2.y)) / 65535.0f) + vector2.y
                this.texCoordsBuffer.putFloatthis as f4.texCoordsBuffer.putFloat(f5)
            }
        } else {
            this.texCoordsBuffer = null
        }
        var asBinary4: ByteArray = lsdNode.byKey("TriangleList").asBinary()
        this.numIndices = asBinary4.length / 2
        this.indexBuffer = DirectByteBuffer(this.numIndices * 2)
        this.indexBuffer.loadFromByteArray(0, asBinary4, 0, this.numIndices * 2)
        if (!lsdNode.keyExists("Weights")) {
            this.weightBuffer = null
            return
        }
        var asBinary5: ByteArray = lsdNode.byKey("Weights").asBinary()
        this.weightBuffer = DirectByteBuffer(asBinary5.length)
        this.weightBuffer.loadFromByteArray(0, asBinary5, 0, asBinary5.length)
    }

    fun PrepareInfluenceBuffer(meshWeightsBuffer: MeshWeightsBuffer, i: Int) {
        OpenJPEG.meshPrepareSeparateInfluenceBuffer(this.weightBuffer.asByteBuffer(), this.numVertices, meshWeightsBuffer.jointIndexBuffer.asByteBuffer(), meshWeightsBuffer.weightsBuffer.asByteBuffer(), i)
    }

    fun PrepareInfluenceBuffer(directByteBuffer: DirectByteBuffer, i: Int) {
        if (this.weightBuffer != null) {
            OpenJPEG.meshPrepareInfluenceBuffer(this.weightBuffer.asByteBuffer(), this.numVertices, directByteBuffer.asByteBuffer(), i)
        }
    }

    fun UpdateRigged(directByteBuffer: DirectByteBuffer, i: Int, floats: FloatArray, floats2: FloatArray) {
        if (this.weightBuffer == null || this.vertexBuffer == null || directByteBuffer == null) {
            return
        }
        OpenJPEG.applyRiggedMeshMorph(directByteBuffer.asByteBuffer(), i, floats, floats2, this.vertexBuffer.asByteBuffer(), this.weightBuffer.asByteBuffer(), this.numVertices)
    }

    fun getIndices(): DirectByteBuffer {
        return this.indexBuffer
    }

    fun getNumIndices(): Int {
        return this.numIndices
    }

    fun getNumVertices(): Int {
        return this.numVertices
    }

    fun getTexCoords(): DirectByteBuffer {
        return this.texCoordsBuffer
    }

    fun getVertices(): DirectByteBuffer {
        return this.vertexBuffer
    }
}
