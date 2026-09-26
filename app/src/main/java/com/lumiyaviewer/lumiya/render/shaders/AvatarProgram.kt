package com.lumiyaviewer.lumiya.render.shaders

import android.opengl.GLES20

class AvatarProgram : BasicPrimProgram(Shader.AvatarVertexShader, Shader.PrimFragmentShader) {
    @JvmField var uJointMap = 0
    @JvmField var uJointMapLength = 0
    @JvmField var uJointMatrix = 0
    @JvmField var uUseWeight = 0
    @JvmField var vWeight = 0

    override fun bindVariables() {
        super.bindVariables()
        vWeight = GLES20.glGetAttribLocation(handle, "vWeight")
        uJointMatrix = GLES20.glGetUniformLocation(handle, "uJointMatrix")
        uJointMap = GLES20.glGetUniformLocation(handle, "uJointMap")
        uJointMapLength = GLES20.glGetUniformLocation(handle, "uJointMapLength")
        uUseWeight = GLES20.glGetUniformLocation(handle, "uUseWeight")
    }
}
