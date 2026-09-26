package com.lumiyaviewer.lumiya.render.shaders

import android.opengl.GLES20

open class PrimProgram : BasicPrimProgram {
    @JvmField var uTexMatrix = 0
    constructor(vertex: Shader, fragment: Shader) : super(vertex, fragment)
    constructor(opaque: Boolean) : super(Shader.PrimVertexShader, if (opaque) Shader.PrimOpaqueFragmentShader else Shader.PrimFragmentShader)
    override fun bindVariables() {
        super.bindVariables()
        uTexMatrix = GLES20.glGetUniformLocation(handle, "uTexMatrix")
    }
}
