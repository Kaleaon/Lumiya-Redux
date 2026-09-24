package com.lumiyaviewer.lumiya.slproto.mesh;

import android.opengl.GLES20;
import android.opengl.Matrix;
import com.lumiyaviewer.lumiya.render.RenderContext;
import com.lumiyaviewer.lumiya.render.avatar.AvatarSkeleton;
import com.lumiyaviewer.lumiya.render.glres.buffers.GLLoadableBuffer;
import com.lumiyaviewer.lumiya.render.shaders.RiggedMeshProgram30;
import com.lumiyaviewer.lumiya.utils.InternPool;
import com.lumiyaviewer.rawbuffers.DirectByteBuffer;
import java.util.Arrays;
import javax.annotation.Nonnull;

public class MeshRiggingData {
    private static final InternPool<MeshRiggingData> riggingDataPool = new InternPool<>();
    private final boolean hasExtendedBones;

    @Nonnull
    private final float[] jointMatrices;

    @Nonnull
    private final int[] joints;
    private float[] mappedJointMatrices;
    private float[] mappedJointVectors;
    private GLLoadableBuffer glRiggingDataBuffer = null;
    private final int hashCode = calcHashCode();

    private MeshRiggingData(@Nonnull int[] ints, @Nonnull float[] floats, boolean hasExtendedBones) {
        this.joints = ints;
        this.jointMatrices = floats;
        this.hasExtendedBones = hasExtendedBones;
    }

    private DirectByteBuffer PrepareRiggingUniformBuffer(RenderContext renderContext) {
        RiggedMeshProgram30 currentRiggedMeshProgram = renderContext.currentRiggedMeshProgram;
        DirectByteBuffer directByteBuffer = new DirectByteBuffer(currentRiggedMeshProgram.uRiggingDataBlockSize);
        for (int i = 0; i < this.joints.length; i++) {
            directByteBuffer.putRawInt(currentRiggedMeshProgram.uJointMapOffset + (currentRiggedMeshProgram.uJointMapArrayStride * i), this.joints[i]);
        }
        for (int j = 0; j < this.joints.length; j++) {
            int i3 = (currentRiggedMeshProgram.uJointMatricesOffset + (currentRiggedMeshProgram.uJointMatricesArrayStride * j)) / 4;
            for (int k = 0; k < 4; k++) {
                directByteBuffer.loadFromFloatArray(((currentRiggedMeshProgram.uJointMatricesColumnStride * k) / 4) + i3, this.jointMatrices, (j * 16) + (k * 4), 4);
            }
        }
        return directByteBuffer;
    }

    private int calcHashCode() {
        return (Arrays.hashCode(this.joints) * 31) + Arrays.hashCode(this.jointMatrices);
    }

    public static MeshRiggingData create(@Nonnull int[] ints, @Nonnull float[] floats, boolean z) {
        return riggingDataPool.intern(new MeshRiggingData(ints, floats, z));
    }

    void PrepareInfluenceBuffers(RenderContext renderContext, float[] floats) {
        GLES20.glUseProgram(renderContext.riggedMeshProgram.getHandle());
        GLES20.glUniformMatrix4fv(renderContext.riggedMeshProgram.uBindShapeMatrix, 1, false, floats, 0);
        GLES20.glUniform4fv(renderContext.riggedMeshProgram.uJointVectors, this.mappedJointVectors.length / 4, this.mappedJointVectors, 0);
    }

    public void SetupBuffers30(RenderContext renderContext) {
        if (this.glRiggingDataBuffer == null) {
            this.glRiggingDataBuffer = new GLLoadableBuffer(PrepareRiggingUniformBuffer(renderContext));
        }
        this.glRiggingDataBuffer.BindUniform(renderContext, 2);
    }

    void UpdateRigged(MeshFace meshFace, float[] floats, DirectByteBuffer directByteBuffer, int i) {
        meshFace.UpdateRigged(directByteBuffer, i, floats, this.mappedJointMatrices);
    }

    void UpdateRiggedMatrices(AvatarSkeleton avatarSkeleton) {
        if (this.mappedJointMatrices == null) {
            this.mappedJointMatrices = new float[this.joints.length * 16];
        }
        if (this.mappedJointVectors == null) {
            this.mappedJointVectors = new float[this.joints.length * 3 * 4];
        }
        float[] jointWorldMatrix = avatarSkeleton.jointWorldMatrix;
        for (int i = 0; i < this.joints.length; i++) {
            if (this.joints[i] >= 0) {
                Matrix.multiplyMM(this.mappedJointMatrices, i * 16, jointWorldMatrix, this.joints[i] * 16, this.jointMatrices, i * 16);
            } else {
                Matrix.setIdentityM(this.mappedJointMatrices, i * 16);
            }
            for (int j = 0; j < 3; j++) {
                this.mappedJointVectors[(i * 3 * 4) + (j * 4) + 0] = this.mappedJointMatrices[(i * 16) + j + 0];
                this.mappedJointVectors[(i * 3 * 4) + (j * 4) + 1] = this.mappedJointMatrices[(i * 16) + j + 4];
                this.mappedJointVectors[(i * 3 * 4) + (j * 4) + 2] = this.mappedJointMatrices[(i * 16) + j + 8];
                this.mappedJointVectors[(i * 3 * 4) + (j * 4) + 3] = this.mappedJointMatrices[(i * 16) + j + 12];
            }
        }
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        MeshRiggingData meshRiggingData = (MeshRiggingData) obj;
        if (Arrays.equals(this.joints, meshRiggingData.joints)) {
            return Arrays.equals(this.jointMatrices, meshRiggingData.jointMatrices);
        }
        return false;
    }

    final boolean fitsGL20() {
        return this.joints.length <= 52;
    }

    final boolean hasExtendedBones() {
        return this.hasExtendedBones;
    }

    public int hashCode() {
        return this.hashCode;
    }
}
