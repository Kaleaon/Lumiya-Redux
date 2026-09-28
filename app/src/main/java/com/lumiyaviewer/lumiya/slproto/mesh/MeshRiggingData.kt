package com.lumiyaviewer.lumiya.slproto.mesh

import android.opengl.GLES20
import android.opengl.Matrix
import com.lumiyaviewer.lumiya.render.RenderContext
import com.lumiyaviewer.lumiya.render.avatar.AvatarSkeleton
import com.lumiyaviewer.lumiya.render.glres.buffers.GLLoadableBuffer
import com.lumiyaviewer.lumiya.render.shaders.RiggedMeshProgram30
import com.lumiyaviewer.lumiya.utils.InternPool
import com.lumiyaviewer.rawbuffers.DirectByteBuffer
import java.util.Arrays

open class MeshRiggingData {
    @JvmStatic private var riggingDataPool: InternPool<MeshRiggingData> = InternPool<>()
    private var hasExtendedBones: Boolean = false

    private var jointMatrices: FloatArray? = null

    private var joints: IntArray? = null
    private var mappedJointMatrices: FloatArray? = null
    private var mappedJointVectors: FloatArray? = null
    private var glRiggingDataBuffer: GLLoadableBuffer? = null
    private var hashCode: Int = calcHashCode()

    fun MeshRiggingData(ints: IntArray, floats: FloatArray, hasExtendedBones: Boolean): private {
        this.joints = ints
        this.jointMatrices = floats
        this.hasExtendedBones = hasExtendedBones
    }

    private fun PrepareRiggingUniformBuffer(renderContext: RenderContext): DirectByteBuffer {
        var currentRiggedMeshProgram: RiggedMeshProgram30 = renderContext.currentRiggedMeshProgram
        var directByteBuffer: DirectByteBuffer = DirectByteBuffer(currentRiggedMeshProgram.uRiggingDataBlockSize)
        for (int i = 0; i < this.joints.length; i++) {
            directByteBuffer.putRawInt(currentRiggedMeshProgram.uJointMapOffset + (currentRiggedMeshProgram.uJointMapArrayStride * i), this.joints[i])
        }
        for (int j = 0; j < this.joints.length; j++) {
            var i3: Int = (currentRiggedMeshProgram.uJointMatricesOffset + (currentRiggedMeshProgram.uJointMatricesArrayStride * j)) / 4
            for (int k = 0; k < 4; k++) {
                directByteBuffer.loadFromFloatArray(((currentRiggedMeshProgram.uJointMatricesColumnStride * k) / 4) + i3, this.jointMatrices, (j * 16) + (k * 4), 4)
            }
        }
        return directByteBuffer
    }

    private fun calcHashCode(): Int {
        return (Arrays.hashCode(this.joints) * 31) + Arrays.hashCode(this.jointMatrices)
    }

    fun create(ints: IntArray, floats: FloatArray, z: Boolean): MeshRiggingData {
        return riggingDataPool.intern(MeshRiggingData(ints, floats, z))
    }

    fun PrepareInfluenceBuffers(renderContext: RenderContext, floats: FloatArray) {
        GLES20.glUseProgram(renderContext.riggedMeshProgram.getHandle())
        GLES20.glUniformMatrix4fv(renderContext.riggedMeshProgram.uBindShapeMatrix, 1, false, floats, 0)
        GLES20.glUniform4fv(renderContext.riggedMeshProgram.uJointVectors, this.mappedJointVectors.length / 4, this.mappedJointVectors, 0)
    }

    fun SetupBuffers30(renderContext: RenderContext) {
        if (this.glRiggingDataBuffer == null) {
            this.glRiggingDataBuffer = GLLoadableBuffer(PrepareRiggingUniformBuffer(renderContext))
        }
        this.glRiggingDataBuffer.BindUniform(renderContext, 2)
    }

    fun UpdateRigged(meshFace: MeshFace, floats: FloatArray, directByteBuffer: DirectByteBuffer, i: Int) {
        meshFace.UpdateRigged(directByteBuffer, i, floats, this.mappedJointMatrices)
    }

    fun UpdateRiggedMatrices(avatarSkeleton: AvatarSkeleton) {
        if (this.mappedJointMatrices == null) {
            this.mappedJointMatrices = FloatArray(this.joints.length * 16)
        }
        if (this.mappedJointVectors == null) {
            this.mappedJointVectors = FloatArray(this.joints.length * 3 * 4)
        }
        var jointWorldMatrix: FloatArray = avatarSkeleton.jointWorldMatrix
        for (int i = 0; i < this.joints.length; i++) {
            if (this.joints[i] >= 0) {
                Matrix.multiplyMM(this.mappedJointMatrices, i * 16, jointWorldMatrix, this.joints[i] * 16, this.jointMatrices, i * 16)
            } else {
                Matrix.setIdentityM(this.mappedJointMatrices, i * 16)
            }
            for (int j = 0; j < 3; j++) {
                this.mappedJointVectors[(i * 3 * 4) + (j * 4) + 0] = this.mappedJointMatrices[(i * 16) + j + 0]
                this.mappedJointVectors[(i * 3 * 4) + (j * 4) + 1] = this.mappedJointMatrices[(i * 16) + j + 4]
                this.mappedJointVectors[(i * 3 * 4) + (j * 4) + 2] = this.mappedJointMatrices[(i * 16) + j + 8]
                this.mappedJointVectors[(i * 3 * 4) + (j * 4) + 3] = this.mappedJointMatrices[(i * 16) + j + 12]
            }
        }
    }

    fun equals(obj: Any): Boolean {
        if (this == obj) {
        return true
        }
        if (obj == null || getClass() != obj.javaClass) {
        return false
        }
        var meshRiggingData: MeshRiggingData = obj as MeshRiggingData
        if (Arrays.equals(this.joints, meshRiggingData.joints)) {
            return Arrays.equals(this.jointMatrices, meshRiggingData.jointMatrices)
        }
        return false
    }

    fun fitsGL20(): Boolean {
        return this.joints.length <= 52
    }

    fun hasExtendedBones(): Boolean {
        return this.hasExtendedBones
    }

    fun hashCode(): Int {
        return this.hashCode
    }
}
