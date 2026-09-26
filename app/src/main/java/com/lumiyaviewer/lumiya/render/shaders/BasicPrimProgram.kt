package com.lumiyaviewer.lumiya.render.shaders

import android.opengl.GLES20
import com.lumiyaviewer.lumiya.render.RenderContext
import com.lumiyaviewer.lumiya.slproto.windlight.WindlightPreset
import kotlin.math.abs

open class BasicPrimProgram(vertexShader: Shader, fragmentShader: Shader) : ShaderProgram(vertexShader, fragmentShader) {
    @JvmField var LightAmbientColor = 0
    @JvmField var LightDiffuseColor = 0
    @JvmField var LightDiffuseDir = 0
    @JvmField var sTexture = 0
    @JvmField var uMVPMatrix = 0
    @JvmField var uObjCoordScale = 0
    @JvmField var uObjWorldMatrix = 0
    @JvmField var useTexture = 0
    @JvmField var vColor = 0
    @JvmField var vNormal = 0
    @JvmField var vPosition = 0
    @JvmField var vTexCoord = 0

    fun SetupLighting(renderContext: RenderContext, windlightPreset: WindlightPreset?) {
        if (windlightPreset == null) {
            GLES20.glUniform3f(LightDiffuseDir, 0.0f, 1.0f, 0.0f)
            GLES20.glUniform3f(LightDiffuseColor, 0.0f, 0.0f, 0.0f)
            GLES20.glUniform3f(LightAmbientColor, 1.0f, 1.0f, 1.0f)
        } else {
            GLES20.glUniform3f(
                LightDiffuseDir,
                windlightPreset.lightnorm[0],
                windlightPreset.lightnorm[2],
                -windlightPreset.lightnorm[1]
            )
            if (abs(windlightPreset.lightnorm[1]) > 0.1f) {
                GLES20.glUniform3fv(
                    LightDiffuseColor,
                    1,
                    if (renderContext.underWater) windlightPreset.sunlightBelowWater else windlightPreset.sunlight_color,
                    0
                )
            } else {
                GLES20.glUniform3f(LightDiffuseColor, 0.0f, 0.0f, 0.0f)
            }
            GLES20.glUniform3fv(
                LightAmbientColor,
                1,
                if (renderContext.underWater) windlightPreset.ambientBelowWater else windlightPreset.ambient,
                0
            )
        }
    }

    override fun bindVariables() {
        vPosition = GLES20.glGetAttribLocation(handle, "vPosition")
        vTexCoord = GLES20.glGetAttribLocation(handle, "vTexCoord")
        vNormal = GLES20.glGetAttribLocation(handle, "vNormal")
        vColor = GLES20.glGetUniformLocation(handle, "vColor")
        sTexture = GLES20.glGetUniformLocation(handle, "sTexture")
        useTexture = GLES20.glGetUniformLocation(handle, "useTexture")
        uMVPMatrix = GLES20.glGetUniformLocation(handle, "uMVPMatrix")
        uObjWorldMatrix = GLES20.glGetUniformLocation(handle, "uObjWorldMatrix")
        uObjCoordScale = GLES20.glGetUniformLocation(handle, "uObjCoordScale")
        LightDiffuseDir = GLES20.glGetUniformLocation(handle, "LightDiffuseDir")
        LightDiffuseColor = GLES20.glGetUniformLocation(handle, "LightDiffuseColor")
        LightAmbientColor = GLES20.glGetUniformLocation(handle, "LightAmbientColor")
    }

    fun setTextureEnabled(textureEnabled: Boolean) {
        GLES20.glUniform1i(useTexture, if (textureEnabled) 1 else 0)
    }
}
