package com.lumiyaviewer.lumiya.render.avatar;

import android.opengl.Matrix;
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.util.Arrays;

public class AnimationSkeletonData {
    private static final int numAnimatedBones = 133;
    private final float[] animPriorityRotArray = new float[133];
    private final float[] animPriorityPosArray = new float[133];
    private final LLQuaternion[] animRotArray = new LLQuaternion[133];
    private final LLVector3[] animPosArray = new LLVector3[133];
    private float[] animMatrix = new float[2128];
    private float[] animMatrix_Swap = new float[2128];
    private float[] animOffsets = new float[532];
    private float[] animOffsets_Swap = new float[532];

    AnimationSkeletonData() {
        for (int i = 0; i < 133; i++) {
            Matrix.setIdentityM(this.animMatrix, i * 16);
            this.animPosArray[i] = new LLVector3();
            this.animRotArray[i] = new LLQuaternion();
        }
        Arrays.fill(this.animOffsets, 0.0f);
    }

    void animate(AvatarSkeleton avatarSkeleton, AvatarAnimationList avatarAnimationList) {
        Arrays.fill(this.animPriorityRotArray, 1.0f);
        Arrays.fill(this.animPriorityPosArray, 1.0f);
        for (int i = 0; i < 133; i++) {
            this.animRotArray[i].setZero();
            this.animPosArray[i].set(0.0f, 0.0f, 0.0f);
        }
        avatarAnimationList.animate(avatarSkeleton, this.animPriorityRotArray, this.animPriorityPosArray, this.animRotArray, this.animPosArray);
        for (int j = 0; j < 133; j++) {
            this.animRotArray[j].getInverseMatrix(this.animMatrix_Swap, j * 16);
            this.animOffsets_Swap[(j * 4) + 0] = this.animPosArray[j].x;
            this.animOffsets_Swap[(j * 4) + 1] = this.animPosArray[j].y;
            this.animOffsets_Swap[(j * 4) + 2] = this.animPosArray[j].z;
            this.animOffsets_Swap[(j * 4) + 3] = 1.0f - this.animPriorityPosArray[j];
        }
        float[] animMatrix = this.animMatrix;
        this.animMatrix = this.animMatrix_Swap;
        this.animMatrix_Swap = animMatrix;
        float[] animOffsets = this.animOffsets;
        this.animOffsets = this.animOffsets_Swap;
        this.animOffsets_Swap = animOffsets;
    }

    public final float[] getAnimMatrix() {
        return this.animMatrix;
    }

    public final float[] getAnimOffsets() {
        return this.animOffsets;
    }
}
