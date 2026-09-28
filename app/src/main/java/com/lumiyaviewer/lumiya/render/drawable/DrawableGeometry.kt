package com.lumiyaviewer.lumiya.render.drawable

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.openjpeg.OpenJPEG
import com.lumiyaviewer.lumiya.render.RenderContext
import com.lumiyaviewer.lumiya.render.avatar.AvatarSkeleton
import com.lumiyaviewer.lumiya.render.glres.GLCleanable
import com.lumiyaviewer.lumiya.render.glres.buffers.GLLoadableBuffer
import com.lumiyaviewer.lumiya.render.glres.buffers.GLVertexArrayObject
import com.lumiyaviewer.lumiya.render.picking.GLRayTrace
import com.lumiyaviewer.lumiya.render.picking.IntersectInfo
import com.lumiyaviewer.lumiya.slproto.mesh.MeshData
import com.lumiyaviewer.lumiya.slproto.mesh.MeshJointTranslations
import com.lumiyaviewer.lumiya.slproto.prims.PrimFlexibleInfo
import com.lumiyaviewer.lumiya.slproto.prims.PrimVolume
import com.lumiyaviewer.lumiya.slproto.prims.PrimVolumeParams
import com.lumiyaviewer.lumiya.slproto.types.LLVector2
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import com.lumiyaviewer.lumiya.utils.CreateFailureException
import com.lumiyaviewer.rawbuffers.DirectByteBuffer

class DrawableGeometry : GLCleanable {
    private val FaceCount: Int
    private val FaceIndexStartsCounts: IntArray
    private val FaceVertexStartsCounts: IntArray
    private val IndexBuffer: GLLoadableBuffer
    private val IndexCount: Int
    private val IndexSizeBytes: Int
    private val TexCoordsBuffer: GLLoadableBuffer
    val VertexBuffer: GLLoadableBuffer
    private val VertexCount: Int
    private val VertexSizeBytes: Int
    val facesCombined: Boolean
    val isRiggedMesh: Boolean
    private val meshData: MeshData?
    private var vertexArrayObject: GLVertexArrayObject? = null

    @Throws(CreateFailureException::class)
    constructor(meshData: MeshData) {
        this.isRiggedMesh = meshData.isRiggedMesh()
        this.FaceCount = meshData.getFaceCount()
        var i = 0
        var i2 = 0
        for (j in 0 until FaceCount) {
            val face = meshData.getFace(j)
            if (face.getVertices() != null) {
                i += face.getNumVertices()
                i2 += face.getNumIndices()
            }
        }
        this.IndexCount = i2
        this.VertexCount = i
        if (i2 == 0 || i == 0) {
            throw CreateFailureException("Mesh data has zero indices or vertices")
        }
        this.FaceIndexStartsCounts = IntArray(FaceCount * 3)
        this.FaceVertexStartsCounts = IntArray(FaceCount * 2)
        this.VertexSizeBytes = i * 4 * 6
        this.IndexSizeBytes = i2 * 2
        val directByteBuffer = DirectByteBuffer(VertexSizeBytes)
        val directByteBuffer2 = DirectByteBuffer(IndexSizeBytes)
        val directByteBuffer3 = DirectByteBuffer(i * 4 * 2)
        var i4 = 0
        var i5 = 0
        var i6 = 0
        var i7 = 0
        this.facesCombined = false
        for (k in 0 until FaceCount) {
            val face2 = meshData.getFace(k)
            val vertices = face2.getVertices()
            val texCoords = face2.getTexCoords()
            val numVertices = face2.getNumVertices()
            if (face2.getNumVertices() == 0 || face2.getNumIndices() == 0) {
                throw CreateFailureException("Empty mesh")
            }
            if (vertices != null) {
                directByteBuffer.copyFromFloat(i5 * 6, vertices, 0, numVertices * 6)
                if (texCoords != null) {
                    directByteBuffer3.copyFromFloat(i5 * 2, texCoords, 0, numVertices * 2)
                }
                val indices = face2.getIndices()
                val numIndices = face2.getNumIndices()
                for (m in 0 until numIndices) {
                    if ((indices.getShort(m) and 65535) >= numVertices) {
                        throw CreateFailureException("Too many vertices")
                    }
                }
                directByteBuffer2.copyFromShort(i4, face2.getIndices(), 0, face2.getNumIndices())
            }
            val i10 = i6 + 1
            FaceIndexStartsCounts[i6] = k
            val i11 = i10 + 1
            FaceIndexStartsCounts[i10] = i4
            i6 = i11 + 1
            FaceIndexStartsCounts[i11] = face2.getNumIndices()
            val i12 = i7 + 1
            FaceVertexStartsCounts[i7] = i5
            i7 = i12 + 1
            FaceVertexStartsCounts[i12] = numVertices
            i5 += numVertices
            i4 += face2.getNumIndices()
        }
        directByteBuffer.position(0)
        directByteBuffer2.position(0)
        directByteBuffer3.position(0)
        this.VertexBuffer = GLLoadableBuffer(directByteBuffer)
        this.IndexBuffer = GLLoadableBuffer(directByteBuffer2)
        this.TexCoordsBuffer = GLLoadableBuffer(directByteBuffer3)
        Debug.Printf("Mesh drawable created,  index count %d, vertex count %d", IndexCount, VertexCount)
        this.meshData = if (isRiggedMesh) meshData else null
    }

    @Throws(CreateFailureException::class)
    constructor(primVolumeParams: PrimVolumeParams, openJPEG: OpenJPEG) {
        val create = PrimVolume.create(primVolumeParams, 4.0f, false, false, openJPEG)
            ?: throw CreateFailureException("Failed to create volume")
        this.isRiggedMesh = false
        this.meshData = null
        var i = 0
        var i2 = 0
        for (primVolumeFace in create.VolumeFaces) {
            i2 += primVolumeFace.NumVertices
            i += primVolumeFace.NumIndices + i
        }
        this.IndexCount = i
        this.VertexCount = i2
        if (i == 0 || i2 == 0) {
            throw CreateFailureException("Prim data has zero indices or vertices")
        }
        this.FaceCount = create.VolumeFaces.size
        this.FaceIndexStartsCounts = IntArray(FaceCount * 3)
        this.FaceVertexStartsCounts = IntArray(FaceCount * 2)
        this.VertexSizeBytes = i2 * 4 * 6
        this.IndexSizeBytes = i * 2
        val directByteBuffer = DirectByteBuffer(VertexSizeBytes)
        val directByteBuffer2 = DirectByteBuffer(IndexSizeBytes)
        val directByteBuffer3 = DirectByteBuffer(i2 * 4 * 2)
        this.facesCombined = i2 < 32767 && i < 32767
        if (facesCombined) {
            var s: Short = 0
            var i3 = 0
            var i4 = 0
            var i5 = 0
            for (primVolumeFace2 in create.VolumeFaces) {
                directByteBuffer.loadFromFloatArray(s * 6, primVolumeFace2.vertexArray.data, 0, primVolumeFace2.NumVertices * 6)
                directByteBuffer3.loadFromFloatArray(s * 2, primVolumeFace2.vertexArray.texCoordsData, 0, primVolumeFace2.NumVertices * 2)
                directByteBuffer2.loadFromShortArrayOffset(i5, primVolumeFace2.Indices, 0, primVolumeFace2.NumIndices, s)
                val i6 = i4 + 1
                FaceIndexStartsCounts[i4] = primVolumeFace2.ID
                val i7 = i6 + 1
                FaceIndexStartsCounts[i6] = i5
                val i8 = i7 + 1
                FaceIndexStartsCounts[i7] = primVolumeFace2.NumIndices
                val i9 = i3 + 1
                FaceVertexStartsCounts[i3] = s.toInt()
                FaceVertexStartsCounts[i9] = primVolumeFace2.NumVertices
                s = (s + primVolumeFace2.NumVertices).toShort()
                i5 += primVolumeFace2.NumIndices
                i3 = i9 + 1
                i4 = i8
            }
        } else {
            var i10 = 0
            var i11 = 0
            var i12 = 0
            var i13 = 0
            for (primVolumeFace3 in create.VolumeFaces) {
                directByteBuffer.loadFromFloatArray(i10 * 6, primVolumeFace3.vertexArray.data, 0, primVolumeFace3.NumVertices * 6)
                directByteBuffer3.loadFromFloatArray(i10 * 2, primVolumeFace3.vertexArray.texCoordsData, 0, primVolumeFace3.NumVertices * 2)
                directByteBuffer2.loadFromShortArray(i13, primVolumeFace3.Indices, 0, primVolumeFace3.NumIndices)
                val i14 = i12 + 1
                FaceIndexStartsCounts[i12] = primVolumeFace3.ID
                val i15 = i14 + 1
                FaceIndexStartsCounts[i14] = i13
                i12 = i15 + 1
                FaceIndexStartsCounts[i15] = primVolumeFace3.NumIndices
                val i16 = i11 + 1
                FaceVertexStartsCounts[i11] = i10
                i11 = i16 + 1
                FaceVertexStartsCounts[i16] = primVolumeFace3.NumVertices
                i10 += primVolumeFace3.NumVertices
                i13 = primVolumeFace3.NumIndices + i13
            }
        }
        directByteBuffer.position(0)
        directByteBuffer2.position(0)
        directByteBuffer3.position(0)
        this.VertexBuffer = GLLoadableBuffer(directByteBuffer)
        this.IndexBuffer = GLLoadableBuffer(directByteBuffer2)
        this.TexCoordsBuffer = GLLoadableBuffer(directByteBuffer3)
    }

    fun ApplyJointTranslations(meshJointTranslations: MeshJointTranslations) {
        if (isRiggedMesh && meshData != null && meshData.isRiggedMesh()) {
            meshData.ApplyJointTranslations(meshJointTranslations)
        }
    }

    fun GLBindBuffers10(renderContext: RenderContext, primFlexibleInfo: PrimFlexibleInfo?): GLLoadableBuffer {
        val flexedVertexBuffer = primFlexibleInfo?.getFlexedVertexBuffer(renderContext, VertexBuffer, VertexCount) ?: VertexBuffer
        if (facesCombined) {
            flexedVertexBuffer.Bind(renderContext, 32884, 3, 5126, 24, 0)
            flexedVertexBuffer.Bind(renderContext, 32885, 3, 5126, 24, 12)
            TexCoordsBuffer.Bind(renderContext, 32888, 2, 5126, 8, 0)
        }
        IndexBuffer.BindElements(renderContext)
        return flexedVertexBuffer
    }

    fun GLBindBuffers20(renderContext: RenderContext): GLLoadableBuffer {
        if (!renderContext.hasGL30) {
            if (facesCombined) {
                VertexBuffer.Bind20(renderContext, renderContext.curPrimProgram!!.vPosition, 3, 5126, 24, 0)
                VertexBuffer.Bind20(renderContext, renderContext.curPrimProgram!!.vNormal, 3, 5126, 24, 12)
                TexCoordsBuffer.Bind20(renderContext, renderContext.curPrimProgram!!.vTexCoord, 2, 5126, 8, 0)
            }
            IndexBuffer.BindElements20(renderContext)
            return VertexBuffer
        }
        if (vertexArrayObject == null) {
            if (facesCombined) {
                vertexArrayObject = GLVertexArrayObject(renderContext.glResourceManager, 1)
                renderContext.glResourceManager.addCleanable(this)
                vertexArrayObject!!.Bind(0)
                VertexBuffer.Bind20(renderContext, renderContext.curPrimProgram!!.vPosition, 3, 5126, 24, 0)
                VertexBuffer.Bind20(renderContext, renderContext.curPrimProgram!!.vNormal, 3, 5126, 24, 12)
                TexCoordsBuffer.Bind20(renderContext, renderContext.curPrimProgram!!.vTexCoord, 2, 5126, 8, 0)
                IndexBuffer.BindElements20(renderContext)
                vertexArrayObject!!.Unbind()
            } else {
                vertexArrayObject = GLVertexArrayObject(renderContext.glResourceManager, FaceCount)
                renderContext.glResourceManager.addCleanable(this)
                var i2 = 0
                while (i2 < FaceCount) {
                    vertexArrayObject!!.Bind(i2)
                    VertexBuffer.Bind20(renderContext, renderContext.curPrimProgram!!.vPosition, 3, 5126, 24, FaceVertexStartsCounts[i2 * 2] * 24)
                    VertexBuffer.Bind20(renderContext, renderContext.curPrimProgram!!.vNormal, 3, 5126, 24, FaceVertexStartsCounts[i2 * 2] * 24 + 12)
                    TexCoordsBuffer.Bind20(renderContext, renderContext.curPrimProgram!!.vTexCoord, 2, 5126, 8, FaceVertexStartsCounts[i2 * 2] * 4 * 2)
                    if (isRiggedMesh && meshData != null) {
                        meshData.PrepareInfluencesForFace(renderContext, FaceVertexStartsCounts[i2 * 2])
                    }
                    IndexBuffer.BindElements20(renderContext)
                    i2++
                }
                vertexArrayObject!!.Unbind()
            }
        }
        return VertexBuffer
    }

    fun GLBindBuffersRigged30(renderContext: RenderContext) {
        if (!isRiggedMesh || meshData == null) {
            return
        }
        meshData.SetupBuffers30(renderContext)
        if (vertexArrayObject != null) {
            return
        }
        vertexArrayObject = GLVertexArrayObject(renderContext.glResourceManager, FaceCount)
        renderContext.glResourceManager.addCleanable(this)
        var i2 = 0
        while (i2 < FaceCount) {
            vertexArrayObject!!.Bind(i2)
            VertexBuffer.Bind20(renderContext, renderContext.curPrimProgram!!.vPosition, 3, 5126, 24, FaceVertexStartsCounts[i2 * 2] * 24)
            VertexBuffer.Bind20(renderContext, renderContext.curPrimProgram!!.vNormal, 3, 5126, 24, FaceVertexStartsCounts[i2 * 2] * 24 + 12)
            TexCoordsBuffer.Bind20(renderContext, renderContext.curPrimProgram!!.vTexCoord, 2, 5126, 8, FaceVertexStartsCounts[i2 * 2] * 4 * 2)
            meshData.SetupFace30(renderContext, FaceVertexStartsCounts[i2 * 2])
            IndexBuffer.BindElements20(renderContext)
            vertexArrayObject!!.Unbind()
            i2++
        }
    }

    override fun GLCleanup() {
        vertexArrayObject = null
    }

    fun GLDrawAll10(renderContext: RenderContext) {
        IndexBuffer.DrawElements(renderContext, 4, IndexCount, 5123, 0)
    }

    fun GLDrawAll20(renderContext: RenderContext) {
        if (!renderContext.hasGL30) {
            IndexBuffer.DrawElements20(4, IndexCount, 5123, 0)
        } else if (vertexArrayObject != null) {
            vertexArrayObject!!.Bind(0)
            IndexBuffer.DrawElements20(4, IndexCount, 5123, 0)
            vertexArrayObject!!.Unbind()
        }
    }

    fun GLDrawFace10(renderContext: RenderContext, i: Int, glLoadableBuffer: GLLoadableBuffer) {
        val i2 = i * 3
        if (!facesCombined) {
            glLoadableBuffer.Bind(renderContext, 32884, 3, 5126, 24, FaceVertexStartsCounts[i * 2] * 24)
            glLoadableBuffer.Bind(renderContext, 32885, 3, 5126, 24, FaceVertexStartsCounts[i * 2] * 24 + 12)
            TexCoordsBuffer.Bind(renderContext, 32888, 2, 5126, 8, FaceVertexStartsCounts[i * 2] * 4 * 2)
        }
        IndexBuffer.DrawElements(renderContext, 4, FaceIndexStartsCounts[i2 + 2], 5123, FaceIndexStartsCounts[i2 + 1] * 2)
    }

    fun GLDrawFace20(renderContext: RenderContext, i: Int) {
        val i2 = i * 3
        if (renderContext.hasGL30) {
            if (vertexArrayObject != null) {
                val vao = vertexArrayObject!!
                val bindIdx = if (facesCombined) 0 else i
                vao.Bind(bindIdx)
                IndexBuffer.DrawElements20(4, FaceIndexStartsCounts[i2 + 2], 5123, FaceIndexStartsCounts[i2 + 1] * 2)
                vao.Unbind()
            }
            return
        }
        if (!facesCombined) {
            VertexBuffer.Bind20(renderContext, renderContext.curPrimProgram!!.vPosition, 3, 5126, 24, FaceVertexStartsCounts[i * 2] * 24)
            VertexBuffer.Bind20(renderContext, renderContext.curPrimProgram!!.vNormal, 3, 5126, 24, FaceVertexStartsCounts[i * 2] * 24 + 12)
            TexCoordsBuffer.Bind20(renderContext, renderContext.curPrimProgram!!.vTexCoord, 2, 5126, 8, FaceVertexStartsCounts[i * 2] * 4 * 2)
            if (isRiggedMesh && meshData != null) {
                meshData.PrepareInfluencesForFace(renderContext, FaceVertexStartsCounts[i * 2])
            }
        }
        IndexBuffer.DrawElements20(4, FaceIndexStartsCounts[i2 + 2], 5123, FaceIndexStartsCounts[i2 + 1] * 2)
    }

    fun GLDrawRiggedFace30(renderContext: RenderContext, i: Int) {
        if (vertexArrayObject != null) {
            val i2 = i * 3
            vertexArrayObject!!.Bind(i)
            IndexBuffer.DrawElements20(4, FaceIndexStartsCounts[i2 + 2], 5123, FaceIndexStartsCounts[i2 + 1] * 2)
        }
    }

    fun IntersectRay(vector3: LLVector3, vector33: LLVector3): IntersectInfo? {
        var rayIntersectInfo: GLRayTrace.RayIntersectInfo? = null
        var hitFace = -1
        var hitTri = 0
        var f = 0.0f
        val vector3s = Array(3) { LLVector3() }
        for (k in 0 until FaceCount) {
            val i5 = k * 3
            val i6 = FaceIndexStartsCounts[i5 + 1]
            val i7 = FaceIndexStartsCounts[i5 + 2]
            var m = 0
            while (m < i7) {
                for (i10 in 0 until 3) {
                    val i11 = (if (facesCombined) IndexBuffer.getShort(i6 + m + i10) else IndexBuffer.getShort(i6 + m + i10) + FaceVertexStartsCounts[k * 2]) * 6
                    vector3s[i10].set(VertexBuffer.getFloat(i11), VertexBuffer.getFloat(i11 + 1), VertexBuffer.getFloat(i11 + 2))
                }
                val intersect_RayTriangle = GLRayTrace.intersect_RayTriangle(vector3, vector33, vector3s, 0)
                if (intersect_RayTriangle != null) {
                    val w = intersect_RayTriangle.intersectPoint.w
                    if (rayIntersectInfo == null || w < f) {
                        f = w
                        hitFace = k
                        hitTri = m
                        rayIntersectInfo = intersect_RayTriangle
                    }
                }
                m += 3
            }
        }
        if (rayIntersectInfo == null) {
            return null
        }
        val i12 = FaceIndexStartsCounts[hitFace * 3 + 1]
        val vector2s = arrayOfNulls<LLVector2>(3)
        for (i14 in 0 until 3) {
            val i15 = (if (facesCombined) IndexBuffer.getShort(i12 + hitTri + i14) else IndexBuffer.getShort(i12 + hitTri + i14) + FaceVertexStartsCounts[hitFace * 2]) * 2
            vector2s[i14] = LLVector2(TexCoordsBuffer.getFloat(i15), TexCoordsBuffer.getFloat(i15 + 1))
        }
        return IntersectInfo(
            rayIntersectInfo.intersectPoint, hitFace,
            (vector2s[1]!!.x - vector2s[0]!!.x) * rayIntersectInfo.s + (vector2s[2]!!.x - vector2s[0]!!.x) * rayIntersectInfo.t + vector2s[0]!!.x,
            (vector2s[1]!!.y - vector2s[0]!!.y) * rayIntersectInfo.s + (vector2s[2]!!.y - vector2s[0]!!.y) * rayIntersectInfo.t + vector2s[0]!!.y
        )
    }

    fun UpdateRigged(renderContext: RenderContext, avatarSkeleton: AvatarSkeleton): Boolean {
        if (!isRiggedMesh || meshData == null || !meshData.isRiggedMesh()) {
            return false
        }
        meshData.UpdateRiggedMatrices(avatarSkeleton)
        if (renderContext.hasGL20 && meshData.riggingFitsGL20()) {
            meshData.PrepareInfluenceBuffers(renderContext)
            return true
        }
        val rawBuffer = VertexBuffer.rawBuffer
        for (i in 0 until FaceCount) {
            meshData.UpdateRigged(i, rawBuffer, FaceVertexStartsCounts[i * 2])
        }
        VertexBuffer.Reload(renderContext)
        return false
    }

    fun getFaceCount(): Int = FaceCount

    fun getFaceFirstVertex(i: Int): Int = FaceVertexStartsCounts[i * 2]

    fun getFaceID(i: Int): Int = FaceIndexStartsCounts[i * 3]

    fun getFaceVertexCount(i: Int): Int = FaceVertexStartsCounts[i * 2 + 1]

    fun getVertexCount(): Int = VertexCount

    fun hasExtendedBones(): Boolean = meshData?.hasExtendedBones() ?: false

    fun riggingFitsGL20(): Boolean {
        if (!isRiggedMesh || meshData == null) return false
        return meshData.riggingFitsGL20()
    }
}
