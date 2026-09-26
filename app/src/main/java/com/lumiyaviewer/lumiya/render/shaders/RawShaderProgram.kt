package com.lumiyaviewer.lumiya.render.shaders

import android.opengl.GLES20

class RawShaderProgram(extTexture: Boolean) : ShaderProgram(
    if (extTexture) Shader.ExtTextureVertexShader else Shader.RawVertexShader,
    if (extTexture) Shader.ExtTextureFragmentShader else Shader.RawFragmentShader
) {
    @JvmField var textureSampler = 0
    @JvmField var uMVPMatrix = 0
    @JvmField var vPosition = 0
    @JvmField var vTexCoord = 0
    @JvmField var vTextureTransformMatrix = 0

    override fun bindVariables() {
        vPosition = GLES20.glGetAttribLocation(handle, "vPosition")
        vTexCoord = GLES20.glGetAttribLocation(handle, "vTexCoord")
        uMVPMatrix = GLES20.glGetUniformLocation(handle, "uMVPMatrix")
        textureSampler = GLES20.glGetUniformLocation(handle, "vTexture")
        vTextureTransformMatrix = GLES20.glGetUniformLocation(handle, "vTextureTransformMatrix")
    }
}
