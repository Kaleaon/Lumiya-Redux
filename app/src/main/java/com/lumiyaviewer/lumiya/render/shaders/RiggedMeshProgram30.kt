package com.lumiyaviewer.lumiya.render.shaders

import android.opengl.GLES20
import android.opengl.GLES30

class RiggedMeshProgram30(opaque: Boolean) : PrimProgram(
    Shader.RiggedMeshVertexShader30,
    if (opaque) Shader.PrimOpaqueFragmentShader30 else Shader.PrimFragmentShader30
) {
    @JvmField var uAnimationDataBlockIndex = 0
    @JvmField var uAnimationDataBlockSize = 0
    @JvmField var uBindShapeMatrix = 0
    @JvmField var uJointMapArrayStride = 0
    @JvmField var uJointMapOffset = 0
    @JvmField var uJointMatricesArrayStride = 0
    @JvmField var uJointMatricesColumnStride = 0
    @JvmField var uJointMatricesOffset = 0
    @JvmField var uRiggingDataBlockIndex = 0
    @JvmField var uRiggingDataBlockSize = 0
    @JvmField var vJoint = 0
    @JvmField var vWeight = 0

    override fun bindVariables() {
        super.bindVariables()
        vWeight = GLES20.glGetAttribLocation(handle, "vWeight")
        vJoint = GLES20.glGetAttribLocation(handle, "vJoint")
        uBindShapeMatrix = GLES20.glGetUniformLocation(handle, "uBindShapeMatrix")
        val ints = IntArray(1)
        uAnimationDataBlockIndex = GLES30.glGetUniformBlockIndex(handle, "AnimationData")
        GLES30.glGetActiveUniformBlockiv(handle, uAnimationDataBlockIndex, GLES30.GL_UNIFORM_BLOCK_DATA_SIZE, ints, 0)
        uAnimationDataBlockSize = ints[0]
        GLES30.glUniformBlockBinding(handle, uAnimationDataBlockIndex, 1)
        uRiggingDataBlockIndex = GLES30.glGetUniformBlockIndex(handle, "RiggingData")
        GLES30.glGetActiveUniformBlockiv(handle, uRiggingDataBlockIndex, GLES30.GL_UNIFORM_BLOCK_DATA_SIZE, ints, 0)
        uRiggingDataBlockSize = ints[0]
        val indices = IntArray(2)
        val values = IntArray(2)
        GLES30.glGetUniformIndices(handle, arrayOf("jointMap", "jointMatrices"), indices, 0)
        GLES30.glGetActiveUniformsiv(handle, 2, indices, 0, GLES30.GL_UNIFORM_OFFSET, values, 0)
        uJointMapOffset = values[0]
        uJointMatricesOffset = values[1]
        GLES30.glGetActiveUniformsiv(handle, 2, indices, 0, GLES30.GL_UNIFORM_ARRAY_STRIDE, values, 0)
        uJointMapArrayStride = values[0]
        uJointMatricesArrayStride = values[1]
        GLES30.glGetActiveUniformsiv(handle, 2, indices, 0, GLES30.GL_UNIFORM_MATRIX_STRIDE, values, 0)
        uJointMatricesColumnStride = values[1]
        GLES30.glUniformBlockBinding(handle, uRiggingDataBlockIndex, 2)
    }
}
