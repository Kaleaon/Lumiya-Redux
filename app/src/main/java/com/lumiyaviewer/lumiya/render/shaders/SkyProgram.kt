package com.lumiyaviewer.lumiya.render.shaders

import android.opengl.GLES20
import com.lumiyaviewer.lumiya.render.RenderContext

open class SkyProgram : ShaderProgram {
    @JvmField var hazeColor = 0
    @JvmField var hazeHorizon = 0
    @JvmField var skyColor = 0
    @JvmField var uMVPMatrix = 0
    @JvmField var vPosition = 0

    constructor() : super(Shader.SkyVertexShader, Shader.SkyNoCloudsFragmentShader)

    constructor(fragmentShader: Shader) : super(Shader.SkyVertexShader, fragmentShader)

    open fun ApplyWindlight(renderContext: RenderContext) {
        val windlightPreset = renderContext.windlightPreset
        GLES20.glUniform3f(
            skyColor,
            (windlightPreset.blue_horizon[0] + windlightPreset.sunlight_color[0] + windlightPreset.ambient[0]) * windlightPreset.blue_density[0],
            (windlightPreset.blue_horizon[1] + windlightPreset.sunlight_color[1] + windlightPreset.ambient[1]) * windlightPreset.blue_density[1],
            (windlightPreset.blue_horizon[2] + windlightPreset.sunlight_color[2] + windlightPreset.ambient[2]) * windlightPreset.blue_density[2]
        )
        GLES20.glUniform1f(hazeHorizon, windlightPreset.haze_horizon[0])
        GLES20.glUniform3f(
            hazeColor,
            windlightPreset.haze_density[0] * windlightPreset.ambient[0],
            windlightPreset.haze_density[0] * windlightPreset.ambient[1],
            windlightPreset.ambient[2] * windlightPreset.haze_density[0]
        )
    }

    override fun bindVariables() {
        vPosition = GLES20.glGetAttribLocation(handle, "vPosition")
        uMVPMatrix = GLES20.glGetUniformLocation(handle, "uMVPMatrix")
        skyColor = GLES20.glGetUniformLocation(handle, "skyColor")
        hazeHorizon = GLES20.glGetUniformLocation(handle, "hazeHorizon")
        hazeColor = GLES20.glGetUniformLocation(handle, "hazeColor")
    }

    open fun hasCloudsTexture(): Boolean = false
}
