package com.lumiyaviewer.lumiya.render.shaders;

import android.annotation.TargetApi;
import android.opengl.GLES20;
import android.opengl.GLES30;

public class RiggedMeshProgram30 extends PrimProgram {
    public int uAnimationDataBlockIndex;
    public int uAnimationDataBlockSize;
    public int uBindShapeMatrix;
    public int uJointMapArrayStride;
    public int uJointMapOffset;
    public int uJointMatricesArrayStride;
    public int uJointMatricesColumnStride;
    public int uJointMatricesOffset;
    public int uRiggingDataBlockIndex;
    public int uRiggingDataBlockSize;
    public int vJoint;
    public int vWeight;

    public RiggedMeshProgram30(boolean z) {
        super(Shader.RiggedMeshVertexShader30, z ? Shader.PrimOpaqueFragmentShader30 : Shader.PrimFragmentShader30);
    }

    @Override
    @TargetApi(18)
    protected void bindVariables() {
        super.bindVariables();
        this.vWeight = GLES20.glGetAttribLocation(this.handle, "vWeight");
        this.vJoint = GLES20.glGetAttribLocation(this.handle, "vJoint");
        this.uBindShapeMatrix = GLES20.glGetUniformLocation(this.handle, "uBindShapeMatrix");
        int[] ints = new int[1];
        this.uAnimationDataBlockIndex = GLES30.glGetUniformBlockIndex(this.handle, "AnimationData");
        GLES30.glGetActiveUniformBlockiv(this.handle, this.uAnimationDataBlockIndex, 35392, ints, 0);
        this.uAnimationDataBlockSize = ints[0];
        GLES30.glUniformBlockBinding(this.handle, this.uAnimationDataBlockIndex, 1);
        this.uRiggingDataBlockIndex = GLES30.glGetUniformBlockIndex(this.handle, "RiggingData");
        GLES30.glGetActiveUniformBlockiv(this.handle, this.uRiggingDataBlockIndex, 35392, ints, 0);
        this.uRiggingDataBlockSize = ints[0];
        int[] ints2 = new int[2];
        int[] ints3 = new int[2];
        GLES30.glGetUniformIndices(this.handle, new String[]{"jointMap", "jointMatrices"}, ints2, 0);
        GLES30.glGetActiveUniformsiv(this.handle, 2, ints2, 0, 35387, ints3, 0);
        this.uJointMapOffset = ints3[0];
        this.uJointMatricesOffset = ints3[1];
        GLES30.glGetActiveUniformsiv(this.handle, 2, ints2, 0, 35388, ints3, 0);
        this.uJointMapArrayStride = ints3[0];
        this.uJointMatricesArrayStride = ints3[1];
        GLES30.glGetActiveUniformsiv(this.handle, 2, ints2, 0, 35389, ints3, 0);
        this.uJointMatricesColumnStride = ints3[1];
        GLES30.glUniformBlockBinding(this.handle, this.uRiggingDataBlockIndex, 2);
    }
}
