package com.lumiyaviewer.lumiya.render.shaders;

import android.opengl.GLES20;
import com.lumiyaviewer.lumiya.render.RenderContext;

public class StarsProgram extends ShaderProgram {
    public int uMVPMatrix;
    public int uStarColor;
    public int vPosition;

    public StarsProgram() {
        super(Shader.StarsVertexShader, Shader.StarsFragmentShader);
    }

    public void ApplyWindlight(RenderContext renderContext) {
        GLES20.glUniform4f(this.uStarColor, 1.0f, 1.0f, 1.0f, renderContext.windlightPreset.star_brightness);
    }

    @Override
    public /* bridge */ /* synthetic */ int Compile(ShaderPreprocessor shaderPreprocessor) throws ShaderCompileException {
        return super.Compile(shaderPreprocessor);
    }

    @Override
    protected void bindVariables() {
        this.vPosition = GLES20.glGetAttribLocation(this.handle, "vPosition");
        this.uMVPMatrix = GLES20.glGetUniformLocation(this.handle, "uMVPMatrix");
        this.uStarColor = GLES20.glGetUniformLocation(this.handle, "uStarColor");
    }

    @Override
    public /* bridge */ /* synthetic */ int getHandle() {
        return super.getHandle();
    }
}
