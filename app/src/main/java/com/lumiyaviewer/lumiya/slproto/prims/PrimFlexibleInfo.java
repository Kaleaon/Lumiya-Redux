package com.lumiyaviewer.lumiya.slproto.prims;

import android.opengl.Matrix;
import com.lumiyaviewer.lumiya.openjpeg.OpenJPEG;
import com.lumiyaviewer.lumiya.render.RenderContext;
import com.lumiyaviewer.lumiya.render.glres.buffers.GLLoadableBuffer;
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import com.lumiyaviewer.rawbuffers.DirectByteBuffer;

public class PrimFlexibleInfo {
    private static final float FLEXIBLE_OBJECT_MAX_INTERNAL_TENSION_FORCE = 0.99f;
    private static final long MIN_UPDATE_INTERVAL = 200;
    private long lastUpdateMillis;
    private float[] sectionData;
    private float[] sectionMatrices;
    private FlexibleSection[] sections;
    private int NumSections = 0;
    private volatile boolean needVertexBufferUpdate = false;
    private GLLoadableBuffer vertexBuffer = null;

    private static class FlexibleSection {
        LLVector3 Direction;
        LLVector3 Position;
        LLQuaternion Rotation;
        LLVector3 Velocity;

        private FlexibleSection() {
        }

        /* synthetic */ FlexibleSection(FlexibleSection flexibleSection) {
            this();
        }
    }

    public boolean doFlexibleUpdate(PrimFlexibleParams primFlexibleParams, float[] floats, int i, float f, float f2, float f3) {
        long currentTimeMillis = System.currentTimeMillis();
        if (currentTimeMillis < this.lastUpdateMillis + MIN_UPDATE_INTERVAL) {
            return false;
        }
        if (primFlexibleParams.NumFlexiSections != this.NumSections) {
            this.sections = null;
            this.sectionMatrices = null;
            this.sectionData = null;
            this.NumSections = primFlexibleParams.NumFlexiSections;
        }
        if (this.NumSections == 0) {
            return false;
        }
        this.lastUpdateMillis = currentTimeMillis;
        float f4 = ((currentTimeMillis - this.lastUpdateMillis) / 1000.0f) * 5.0f;
        boolean z = false;
        if (this.sectionData == null) {
            this.sectionData = new float[OpenJPEG.getFlexiDataSize(this.NumSections)];
            this.sectionMatrices = new float[this.NumSections * 16];
            z = true;
        }
        OpenJPEG.calcFlexiSections(this.sectionData, this.NumSections, this.sectionMatrices, floats, i, f, f2, f3, f4, primFlexibleParams.Tension, primFlexibleParams.AirFriction, primFlexibleParams.Gravity, primFlexibleParams.UserForce.x, primFlexibleParams.UserForce.y, primFlexibleParams.UserForce.z, z);
        this.needVertexBufferUpdate = true;
        return true;
    }

    public boolean doFlexibleUpdateSlow(PrimFlexibleParams primFlexibleParams, float[] floats5, int i, float f, float f2, float f3) {
        long currentTimeMillis = System.currentTimeMillis();
        if (currentTimeMillis < this.lastUpdateMillis + MIN_UPDATE_INTERVAL) {
            return false;
        }
        LLVector3 vector3 = new LLVector3(floats5[i + 12], floats5[i + 13], floats5[i + 14]);
        LLVector3 vector32 = new LLVector3(f, f2, f3);
        float[] floats = new float[32];
        Matrix.invertM(floats, 0, floats5, i);
        LLQuaternion quaternion = new LLQuaternion(floats);
        if (primFlexibleParams.NumFlexiSections != this.NumSections) {
            this.sections = null;
            this.sectionMatrices = null;
            this.NumSections = primFlexibleParams.NumFlexiSections;
        }
        if (this.NumSections == 0) {
            return false;
        }
        this.lastUpdateMillis = currentTimeMillis;
        float f4 = ((currentTimeMillis - this.lastUpdateMillis) / 1000.0f) * 5.0f;
        LLQuaternion quaternion2 = new LLQuaternion(quaternion);
        LLVector3 vector33 = new LLVector3(LLVector3.z_axis);
        vector33.mul(quaternion2);
        float f5 = vector32.z / this.NumSections;
        LLVector3 vector34 = new LLVector3(vector33);
        vector34.mul(vector32.z / 2.0f);
        LLVector3 sub = LLVector3.sub(vector3, vector34);
        if (this.sections == null) {
            this.sections = new FlexibleSection[this.NumSections];
            for (int j = 0; j < this.NumSections; j++) {
                this.sections[j] = new FlexibleSection(null);
                this.sections[j].Position = new LLVector3(sub);
                this.sections[j].Position.addMul(vector33, j * f5);
                this.sections[j].Direction = new LLVector3(vector33);
                this.sections[j].Rotation = new LLQuaternion(quaternion);
                this.sections[j].Velocity = new LLVector3();
            }
        }
        this.sections[0].Position.set(sub);
        this.sections[0].Direction.set(vector33);
        this.sections[0].Rotation.set(quaternion);
        float pow = primFlexibleParams.Tension * 0.1f * (1.0f - ((float) Math.pow(0.85d, f4 * 30.0d)));
        if (pow > FLEXIBLE_OBJECT_MAX_INTERNAL_TENSION_FORCE) {
            pow = FLEXIBLE_OBJECT_MAX_INTERNAL_TENSION_FORCE;
        }
        float pow2 = (float) Math.pow(10.0d, ((primFlexibleParams.AirFriction * 2.0f) + 1.0f) * f4);
        if (pow2 <= 1.0f) {
            pow2 = 1.0f;
        }
        float f6 = 1.0f / pow2;
        float atan = (float) Math.atan(2.0f * f5);
        float f7 = f5 * f4;
        LLVector3 vector35 = new LLVector3();
        LLVector3 vector36 = new LLVector3();
        LLQuaternion quaternion3 = new LLQuaternion();
        LLQuaternion quaternion4 = new LLQuaternion();
        LLQuaternion quaternion5 = new LLQuaternion();
        int i3 = 1;
        while (i3 < this.NumSections) {
            vector35.set(this.sections[i3].Position);
            this.sections[i3].Position.z -= primFlexibleParams.Gravity * f7;
            this.sections[i3].Position.addMul(primFlexibleParams.UserForce, f7);
            LLVector3 lLVector37 = this.sections[i3 - 1].Position;
            LLVector3 lLVector38 = this.sections[i3 - 1].Direction;
            LLVector3 vector37 = i3 == 1 ? this.sections[0].Direction : this.sections[i3 - 2].Direction;
            LLVector3 vector38 = LLVector3.sub(this.sections[i3].Position, lLVector37);
            LLVector3 vector39 = new LLVector3(vector37);
            vector39.mul(f5);
            vector39.sub(vector38);
            this.sections[i3].Position.addMul(vector39, pow);
            this.sections[i3].Position.addMul(this.sections[i3].Velocity, f6);
            this.sections[i3].Direction.setSub(this.sections[i3].Position, lLVector37);
            this.sections[i3].Direction.normVec();
            LLQuaternion shortestArc = LLQuaternion.shortestArc(lLVector38, this.sections[i3].Direction);
            float angleAxis = shortestArc.getAngleAxis(vector36);
            if (angleAxis > 3.1415927f) {
                angleAxis -= 6.2831855f;
            }
            if (angleAxis < -3.1415927f) {
                angleAxis += 6.2831855f;
            }
            if (angleAxis > atan) {
                shortestArc.setQuat(atan, vector36);
            } else if (angleAxis < (-atan)) {
                shortestArc.setQuat(-atan, vector36);
            }
            quaternion3.setMul(quaternion2, shortestArc);
            quaternion2.set(quaternion3);
            this.sections[i3].Direction.set(lLVector38);
            this.sections[i3].Direction.mul(shortestArc);
            this.sections[i3].Position.set(lLVector37);
            this.sections[i3].Position.addMul(this.sections[i3].Direction, f5);
            this.sections[i3].Rotation.set(quaternion3);
            if (i3 > 1) {
                quaternion4.setQuat(angleAxis / 2.0f, vector36);
                quaternion5.setMul(this.sections[i3 - 1].Rotation, quaternion4);
                this.sections[i3 - 1].Rotation.set(quaternion5);
            }
            this.sections[i3].Velocity.setSub(this.sections[i3].Position, vector35);
            if (this.sections[i3].Velocity.magVecSquared() > 1.0f) {
                this.sections[i3].Velocity.normVec();
            }
            i3++;
        }
        float[] floats2 = new float[32];
        Matrix.setIdentityM(floats2, 16);
        Matrix.scaleM(floats2, 16, 1.0f / vector32.x, 1.0f / vector32.y, 1.0f / vector32.z);
        Matrix.multiplyMM(floats2, 0, floats2, 16, quaternion.getMatrix(), 0);
        Matrix.translateM(floats2, 0, -vector3.x, -vector3.y, -vector3.z);
        if (this.sectionMatrices == null) {
            this.sectionMatrices = new float[this.NumSections * 16];
        }
        float[] floats3 = new float[8];
        int i4 = 0;
        while (true) {
            int i5 = i4;
            if (i5 >= this.NumSections) {
                this.needVertexBufferUpdate = true;
                return true;
            }
            floats3[0] = this.sections[i5].Position.x;
            floats3[1] = this.sections[i5].Position.y;
            floats3[2] = this.sections[i5].Position.z;
            floats3[3] = 1.0f;
            Matrix.multiplyMV(floats3, 4, floats2, 0, floats3, 0);
            float f8 = (i5 / this.NumSections) - 0.5f;
            float[] floats4 = new float[32];
            Matrix.setIdentityM(floats4, 16);
            Matrix.translateM(floats4, 16, floats3[4], floats3[5], floats3[6] - f8);
            Matrix.translateM(floats4, 16, 0.0f, 0.0f, f8);
            Matrix.scaleM(floats4, 16, 1.0f / vector32.x, 1.0f / vector32.y, 1.0f / vector32.z);
            Matrix.multiplyMM(floats4, 0, floats4, 16, quaternion.getMatrix(), 0);
            Matrix.multiplyMM(floats4, 16, floats4, 0, this.sections[i5].Rotation.getInverseMatrix(), 0);
            Matrix.scaleM(floats4, 16, vector32.x, vector32.y, vector32.z);
            Matrix.translateM(floats4, 16, 0.0f, 0.0f, -f8);
            System.arraycopy(floats4, 16, this.sectionMatrices, i5 * 16, 16);
            i4 = i5 + 1;
        }
    }

    public GLLoadableBuffer getFlexedVertexBuffer(RenderContext renderContext, GLLoadableBuffer glLoadableBuffer, int i) {
        if (this.sectionMatrices != null) {
            if (this.needVertexBufferUpdate) {
                DirectByteBuffer rawBuffer = glLoadableBuffer.getRawBuffer();
                if (this.vertexBuffer == null) {
                    this.vertexBuffer = new GLLoadableBuffer(new DirectByteBuffer(rawBuffer));
                }
                OpenJPEG.applyFlexibleMorph(this.vertexBuffer.getRawBuffer().asByteBuffer(), rawBuffer.asByteBuffer(), i, this.sectionMatrices);
                this.vertexBuffer.Reload(renderContext);
                this.needVertexBufferUpdate = false;
            }
            if (this.vertexBuffer != null) {
                return this.vertexBuffer;
            }
        }
        return glLoadableBuffer;
    }

    public float[] getMatrices() {
        return this.sectionMatrices;
    }
}
