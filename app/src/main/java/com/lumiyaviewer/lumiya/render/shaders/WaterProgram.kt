package com.lumiyaviewer.lumiya.render.shaders

import android.opengl.GLES20

class WaterProgram : ShaderProgram(Shader.WaterVertexShader, Shader.WaterFragmentShader) {
    @JvmField var uAmplitude = 0
    @JvmField var uDirection = 0
    @JvmField var uFrequency = 0
    @JvmField var uMVPMatrix = 0
    @JvmField var uObjWorldMatrix = 0
    @JvmField var uPhase = 0
    @JvmField var uTime = 0
    @JvmField var vColor = 0
    @JvmField var vPosition = 0

    override fun bindVariables() {
        vPosition = GLES20.glGetAttribLocation(handle, "vPosition")
        vColor = GLES20.glGetUniformLocation(handle, "vColor")
        uMVPMatrix = GLES20.glGetUniformLocation(handle, "uMVPMatrix")
        uObjWorldMatrix = GLES20.glGetUniformLocation(handle, "uObjWorldMatrix")
        uTime = GLES20.glGetUniformLocation(handle, "time")
        uFrequency = GLES20.glGetUniformLocation(handle, "frequency")
        uPhase = GLES20.glGetUniformLocation(handle, "phase")
        uAmplitude = GLES20.glGetUniformLocation(handle, "amplitude")
        uDirection = GLES20.glGetUniformLocation(handle, "direction")
    }
}
