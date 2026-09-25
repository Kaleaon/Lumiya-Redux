package com.lumiyaviewer.lumiya.render.shaders;

import android.opengl.GLES20;

public class FXAAProgram extends ShaderProgram {
    public int noAAtextureSampler;
    public int exposure;
    public int gamma;
    public int sharpenStrength;
    public int texcoordOffset;
    public int textureSampler;
    public int uMVPMatrix;
    public int vPosition;
    public int vTexCoord;
    public int vignetteStrength;

    public FXAAProgram() {
        super(Shader.FXAAVertexShader, Shader.FXAAFragmentShader);
    }

    @Override
    public /* bridge */ /* synthetic */ int Compile(ShaderPreprocessor shaderPreprocessor) throws ShaderCompileException {
        return super.Compile(shaderPreprocessor);
    }

    @Override
    protected void bindVariables() {
        this.vPosition = GLES20.glGetAttribLocation(this.handle, "vPosition");
        this.vTexCoord = GLES20.glGetAttribLocation(this.handle, "vTexCoord");
        this.textureSampler = GLES20.glGetUniformLocation(this.handle, "textureSampler");
        this.noAAtextureSampler = GLES20.glGetUniformLocation(this.handle, "noAAtextureSampler");
        this.uMVPMatrix = GLES20.glGetUniformLocation(this.handle, "uMVPMatrix");
        this.texcoordOffset = GLES20.glGetUniformLocation(this.handle, "texcoordOffset");
        this.exposure = GLES20.glGetUniformLocation(this.handle, "exposure");
        this.gamma = GLES20.glGetUniformLocation(this.handle, "gamma");
        this.sharpenStrength = GLES20.glGetUniformLocation(this.handle, "sharpenStrength");
        this.vignetteStrength = GLES20.glGetUniformLocation(this.handle, "vignetteStrength");
    }

    @Override
    public /* bridge */ /* synthetic */ int getHandle() {
        return super.getHandle();
    }
}
