package com.lumiyaviewer.lumiya.render.shaders

import android.opengl.GLES20

class RiggedMeshProgram(opaque: Boolean) : PrimProgram(
    Shader.RiggedMeshVertexShader,
    if (opaque) Shader.PrimOpaqueFragmentShader else Shader.PrimFragmentShader
) {
    @JvmField var uBindShapeMatrix = 0
    @JvmField var uJointVectors = 0
    @JvmField var vJoint = 0
    @JvmField var vWeight = 0

    override fun bindVariables() {
        super.bindVariables()
        uBindShapeMatrix = GLES20.glGetUniformLocation(handle, "uBindShapeMatrix")
        uJointVectors = GLES20.glGetUniformLocation(handle, "uJointVectors")
        vWeight = GLES20.glGetAttribLocation(handle, "vWeight")
        vJoint = GLES20.glGetAttribLocation(handle, "vJoint")
    }
}
