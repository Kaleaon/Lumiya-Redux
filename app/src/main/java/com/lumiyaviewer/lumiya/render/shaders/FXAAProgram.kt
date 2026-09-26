package com.lumiyaviewer.lumiya.render.shaders

import android.opengl.GLES20

class FXAAProgram : ShaderProgram(Shader.FXAAVertexShader, Shader.FXAAFragmentShader) {
    @JvmField var noAAtextureSampler = 0
    @JvmField var exposure = 0
    @JvmField var gamma = 0
    @JvmField var sharpenStrength = 0
    @JvmField var texcoordOffset = 0
    @JvmField var textureSampler = 0
    @JvmField var uMVPMatrix = 0
    @JvmField var vPosition = 0
    @JvmField var vTexCoord = 0
    @JvmField var vignetteStrength = 0

    override fun bindVariables() {
        vPosition = GLES20.glGetAttribLocation(handle, "vPosition")
        vTexCoord = GLES20.glGetAttribLocation(handle, "vTexCoord")
        textureSampler = GLES20.glGetUniformLocation(handle, "textureSampler")
        noAAtextureSampler = GLES20.glGetUniformLocation(handle, "noAAtextureSampler")
        uMVPMatrix = GLES20.glGetUniformLocation(handle, "uMVPMatrix")
        texcoordOffset = GLES20.glGetUniformLocation(handle, "texcoordOffset")
        exposure = GLES20.glGetUniformLocation(handle, "exposure")
        gamma = GLES20.glGetUniformLocation(handle, "gamma")
        sharpenStrength = GLES20.glGetUniformLocation(handle, "sharpenStrength")
        vignetteStrength = GLES20.glGetUniformLocation(handle, "vignetteStrength")
    }
}
