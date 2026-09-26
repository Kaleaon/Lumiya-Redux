package com.lumiyaviewer.lumiya.render.shaders

import android.opengl.GLES20

class QuadProgram : ShaderProgram(Shader.QuadVertexShader, Shader.QuadFragmentShader) {
    @JvmField var sTexture = 0
    @JvmField var uColor = 0
    @JvmField var uColorize = 0
    @JvmField var uPostTranslate = 0
    @JvmField var uPreTranslate = 0
    @JvmField var uScale = 0
    @JvmField var vPosition = 0
    @JvmField var vTexCoord = 0

    override fun bindVariables() {
        vPosition = GLES20.glGetAttribLocation(handle, "vPosition")
        vTexCoord = GLES20.glGetAttribLocation(handle, "vTexCoord")
        sTexture = GLES20.glGetUniformLocation(handle, "sTexture")
        uColor = GLES20.glGetUniformLocation(handle, "uColor")
        uColorize = GLES20.glGetUniformLocation(handle, "uColorize")
        uPreTranslate = GLES20.glGetUniformLocation(handle, "uPreTranslate")
        uScale = GLES20.glGetUniformLocation(handle, "uScale")
        uPostTranslate = GLES20.glGetUniformLocation(handle, "uPostTranslate")
    }
}
