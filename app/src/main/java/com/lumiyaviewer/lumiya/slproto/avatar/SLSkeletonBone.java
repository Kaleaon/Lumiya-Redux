package com.lumiyaviewer.lumiya.slproto.avatar;

import android.opengl.Matrix;
import com.lumiyaviewer.lumiya.render.avatar.AnimationSkeletonData;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;

public class SLSkeletonBone {
    private final LLVector3 basePosition;
    public final SLSkeletonBoneID boneID;
    private final int boneIndex;
    private final SLSkeletonBone[] childBones;
    private final SLSkeletonBone[] collisionVolumes;
    private final LLVector3 defaultBasePosition;
    private float globalBaseX;
    private float globalBaseY;
    private float globalBaseZ;
    private final LLVector3 offset;
    private SLSkeletonBone parent;
    private final LLVector3 scale;
    private final LLVector3 usePosition;
    private final float[] globalMatrix = new float[16];
    private final float[] tempMatrix = new float[16];

    SLSkeletonBone(SLSkeletonBoneID skeletonBoneID, LLVector3 vector34, LLVector3 vector35, SLSkeletonBone[] skeletonBones, SLSkeletonBone[] collisionVolumes) {
        this.boneID = skeletonBoneID;
        this.boneIndex = skeletonBoneID.ordinal();
        this.basePosition = new LLVector3(vector35);
        LLVector3 vector3 = new LLVector3(vector34);
        this.defaultBasePosition = new LLVector3(this.basePosition);
        this.offset = new LLVector3();
        this.scale = new LLVector3(1.0f, 1.0f, 1.0f);
        this.childBones = skeletonBones;
        this.collisionVolumes = collisionVolumes;
        this.usePosition = skeletonBoneID.isJoint ? this.basePosition : vector3;
        this.parent = null;
        this.globalBaseX = 0.0f;
        this.globalBaseY = 0.0f;
        this.globalBaseZ = 0.0f;
        if (skeletonBones != null) {
            for (SLSkeletonBone skeletonBone : skeletonBones) {
                skeletonBone.parent = this;
            }
        }
        if (collisionVolumes != null) {
            for (SLSkeletonBone skeletonBone2 : collisionVolumes) {
                skeletonBone2.parent = this;
            }
        }
    }

    void deform(LLVector3 vector3, LLVector3 vector33) {
        this.offset.add(vector3);
        this.scale.mul(vector33);
    }

    public void deformHierarchy(LLVector3 vector3, LLVector3 vector33) {
        this.offset.add(vector3);
        this.scale.mul(vector33);
        if (this.collisionVolumes != null) {
            for (SLSkeletonBone skeletonBone : this.collisionVolumes) {
                skeletonBone.deform(vector3, vector33);
            }
        }
    }

    public LLVector3 getBasePosition() {
        return this.basePosition;
    }

    public float[] getGlobalMatrix() {
        return this.globalMatrix;
    }

    public float getPositionX() {
        return this.basePosition.x + this.offset.x;
    }

    public float getPositionY() {
        return this.basePosition.y + this.offset.y;
    }

    public float getPositionZ() {
        return this.basePosition.z + this.offset.z;
    }

    public float getScaleX() {
        return this.scale.x;
    }

    public float getScaleY() {
        return this.scale.y;
    }

    public float getScaleZ() {
        return this.scale.z;
    }

    int prepareSkeleton(SLSkeletonBone[] skeletonBones, int i) {
        int i2 = 0;
        int i3 = i + 1;
        skeletonBones[i] = this;
        if (this.parent == null) {
            this.globalBaseX = this.defaultBasePosition.x;
            this.globalBaseY = this.defaultBasePosition.y;
            this.globalBaseZ = this.defaultBasePosition.z;
        } else {
            this.globalBaseX = this.parent.globalBaseX + this.defaultBasePosition.x;
            this.globalBaseY = this.parent.globalBaseY + this.defaultBasePosition.y;
            this.globalBaseZ = this.parent.globalBaseZ + this.defaultBasePosition.z;
        }
        if (this.childBones != null) {
            SLSkeletonBone[] childBones = this.childBones;
            int length = childBones.length;
            int i4 = 0;
            while (i4 < length) {
                int prepareSkeleton = childBones[i4].prepareSkeleton(skeletonBones, i3);
                i4++;
                i3 = prepareSkeleton;
            }
        }
        if (this.collisionVolumes != null) {
            SLSkeletonBone[] collisionVolumes = this.collisionVolumes;
            int length2 = collisionVolumes.length;
            while (i2 < length2) {
                int prepareSkeleton2 = collisionVolumes[i2].prepareSkeleton(skeletonBones, i3);
                i2++;
                i3 = prepareSkeleton2;
            }
        }
        return i3;
    }

    void setPositionOverride(LLVector3 positionOverride) {
        this.basePosition.set(positionOverride);
    }

    final void updateGlobalPos(AnimationSkeletonData animationSkeletonData, float[] floats, float[] floats2) {
        float f;
        float f2;
        float f3;
        int animatedIndex = this.boneID.animatedIndex;
        int i2 = animatedIndex * 4;
        int i3 = animatedIndex * 16;
        if (animatedIndex >= 0) {
            float[] animOffsets = animationSkeletonData.getAnimOffsets();
            float f4 = animOffsets[i2 + 3];
            if (f4 > 0.0f) {
                float f5 = f4 * animOffsets[i2];
                float f6 = f4 * animOffsets[i2 + 1];
                float f7 = animOffsets[i2 + 2] * f4;
                f2 = f6;
                f3 = f5;
                f = f7;
            } else {
                f = 0.0f;
                f2 = 0.0f;
                f3 = 0.0f;
            }
        } else {
            f = 0.0f;
            f2 = 0.0f;
            f3 = 0.0f;
        }
        if (this.parent != null) {
            Matrix.translateM(this.tempMatrix, 0, this.parent.globalMatrix, 0, f3 + (this.usePosition.x * this.parent.scale.x) + this.offset.x, f2 + (this.usePosition.y * this.parent.scale.y) + this.offset.y, (this.usePosition.z * this.parent.scale.z) + this.offset.z + f);
        } else {
            Matrix.setIdentityM(this.tempMatrix, 0);
            Matrix.translateM(this.tempMatrix, 0, this.usePosition.x + this.offset.x + f3, this.usePosition.y + this.offset.y + f2, f + this.usePosition.z + this.offset.z);
        }
        if (animatedIndex >= 0) {
            Matrix.multiplyMM(this.globalMatrix, 0, this.tempMatrix, 0, animationSkeletonData.getAnimMatrix(), i3);
        } else {
            System.arraycopy(this.tempMatrix, 0, this.globalMatrix, 0, 16);
        }
        Matrix.scaleM(floats2, this.boneIndex * 16, this.globalMatrix, 0, this.scale.x, this.scale.y, this.scale.z);
        Matrix.translateM(floats, this.boneIndex * 16, floats2, this.boneIndex * 16, -this.globalBaseX, -this.globalBaseY, -this.globalBaseZ);
    }
}
