package com.lumiyaviewer.lumiya.render.shaders

import android.opengl.GLES20
import com.lumiyaviewer.lumiya.render.RenderContext

class StarsProgram : ShaderProgram(Shader.StarsVertexShader, Shader.StarsFragmentShader) {
    @JvmField var uMVPMatrix = 0
    @JvmField var uStarColor = 0
    @JvmField var vPosition = 0

    fun ApplyWindlight(renderContext: RenderContext) {
        GLES20.glUniform4f(uStarColor, 1.0f, 1.0f, 1.0f, renderContext.windlightPreset.star_brightness)
    }

    override fun bindVariables() {
        vPosition = GLES20.glGetAttribLocation(handle, "vPosition")
        uMVPMatrix = GLES20.glGetUniformLocation(handle, "uMVPMatrix")
        uStarColor = GLES20.glGetUniformLocation(handle, "uStarColor")
    }
}
