package com.lumiyaviewer.lumiya.render.shaders

import android.opengl.GLES20

open class FlexiPrimProgram(opaque: Boolean) : PrimProgram(Shader.FlexiVertexShader, if (opaque) Shader.PrimOpaqueFragmentShader else Shader.PrimFragmentShader) {
    @JvmField var uNumSectionMatrices = 0
    @JvmField var uSectionMatrices = 0
    override fun bindVariables() {
        super.bindVariables()
        uSectionMatrices = GLES20.glGetUniformLocation(handle, "uSectionMatrices")
        uNumSectionMatrices = GLES20.glGetUniformLocation(handle, "uNumSectionMatrices")
    }
}
