package com.lumiyaviewer.lumiya.render.shaders

import android.opengl.GLES20

class BoundingBoxProgram : ShaderProgram(Shader.BoundingBoxVertexShader, Shader.BoundingBoxFragmentShader) {
    @JvmField var uMVPMatrix = 0
    @JvmField var uObjCoordScale = 0
    @JvmField var uObjWorldMatrix = 0
    @JvmField var vPosition = 0

    override fun bindVariables() {
        vPosition = GLES20.glGetAttribLocation(handle, "vPosition")
        uMVPMatrix = GLES20.glGetUniformLocation(handle, "uMVPMatrix")
        uObjWorldMatrix = GLES20.glGetUniformLocation(handle, "uObjWorldMatrix")
        uObjCoordScale = GLES20.glGetUniformLocation(handle, "uObjCoordScale")
    }
}
