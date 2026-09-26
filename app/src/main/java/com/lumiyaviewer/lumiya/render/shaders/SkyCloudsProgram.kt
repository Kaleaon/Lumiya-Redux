package com.lumiyaviewer.lumiya.render.shaders

import android.opengl.GLES20
import com.lumiyaviewer.lumiya.render.RenderContext

class SkyCloudsProgram : SkyProgram(Shader.SkyFragmentShader) {
    @JvmField var cloudAdd = 0
    @JvmField var cloudColor = 0
    @JvmField var cloudGamma = 0
    @JvmField var textureSampler = 0

    override fun ApplyWindlight(renderContext: RenderContext) {
        super.ApplyWindlight(renderContext)
        val windlightPreset = renderContext.windlightPreset
        GLES20.glUniform3f(
            cloudColor,
            windlightPreset.cloud_color[0],
            windlightPreset.cloud_color[1],
            windlightPreset.cloud_color[2]
        )
        GLES20.glUniform1f(cloudGamma, windlightPreset.cloud_pos_density1[2])
        GLES20.glUniform1f(cloudAdd, windlightPreset.cloud_shadow[0] - 0.5f)
        GLES20.glUniform1i(textureSampler, 0)
    }

    override fun bindVariables() {
        super.bindVariables()
        textureSampler = GLES20.glGetUniformLocation(handle, "textureSampler")
        cloudColor = GLES20.glGetUniformLocation(handle, "cloudColor")
        cloudGamma = GLES20.glGetUniformLocation(handle, "cloudGamma")
        cloudAdd = GLES20.glGetUniformLocation(handle, "cloudAdd")
    }

    override fun hasCloudsTexture(): Boolean = true
}
