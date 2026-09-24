package com.lumiyaviewer.lumiya.slproto.avatar;

import com.lumiyaviewer.lumiya.render.avatar.AnimationSkeletonData;
import com.lumiyaviewer.lumiya.slproto.mesh.MeshJointTranslations;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.util.EnumMap;
import java.util.Iterator;
import java.util.Map;

public class SLSkeleton {
    public SLSkeletonBone rootBone;
    public final Map<SLSkeletonBoneID, SLSkeletonBone> bones = new EnumMap(SLSkeletonBoneID.class);
    public final float[] jointMatrix = new float[SLSkeletonBoneID.VALUES.length * 16];
    public final float[] jointWorldMatrix = new float[(SLSkeletonBoneID.VALUES.length + 47) * 16];
    private final SLSkeletonBone[] updateBones = new SLSkeletonBone[SLSkeletonBoneID.VALUES.length];

    public void UpdateGlobalPositions(AnimationSkeletonData animationSkeletonData) {
        for (SLSkeletonBone skeletonBone : this.updateBones) {
            skeletonBone.updateGlobalPos(animationSkeletonData, this.jointMatrix, this.jointWorldMatrix);
        }
    }

    protected void applyJointTranslations(MeshJointTranslations meshJointTranslations) {
        Iterator<Map.Entry<SLSkeletonBoneID, SLSkeletonBone>> it = this.bones.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            float[] floats = meshJointTranslations.jointTranslations.get(entry.getKey());
            if (floats != null) {
                ((SLSkeletonBone) entry.getValue()).setPositionOverride(new LLVector3(floats[0], floats[1], floats[2]));
            }
        }
    }

    public float getBodySize() {
        SLSkeletonBone skeletonBone = this.bones.get(SLSkeletonBoneID.mPelvis);
        SLSkeletonBone skeletonBone2 = this.bones.get(SLSkeletonBoneID.mSkull);
        SLSkeletonBone skeletonBone3 = this.bones.get(SLSkeletonBoneID.mHead);
        SLSkeletonBone skeletonBone4 = this.bones.get(SLSkeletonBoneID.mNeck);
        SLSkeletonBone skeletonBone5 = this.bones.get(SLSkeletonBoneID.mChest);
        SLSkeletonBone skeletonBone6 = this.bones.get(SLSkeletonBoneID.mTorso);
        if (skeletonBone == null || skeletonBone2 == null || skeletonBone3 == null || skeletonBone4 == null || skeletonBone5 == null || skeletonBone6 == null) {
            return 0.0f;
        }
        return (float) ((skeletonBone.getScaleZ() * skeletonBone6.getPositionZ()) + (skeletonBone4.getPositionZ() * skeletonBone5.getScaleZ()) + getPelvisToFoot() + (Math.sqrt(2.0d) * skeletonBone2.getPositionZ() * skeletonBone3.getScaleZ()) + (skeletonBone3.getPositionZ() * skeletonBone4.getScaleZ()) + (skeletonBone5.getPositionZ() * skeletonBone6.getScaleZ()));
    }

    public float getPelvisToFoot() {
        SLSkeletonBone skeletonBone = this.bones.get(SLSkeletonBoneID.mPelvis);
        SLSkeletonBone skeletonBone2 = this.bones.get(SLSkeletonBoneID.mHipLeft);
        SLSkeletonBone skeletonBone3 = this.bones.get(SLSkeletonBoneID.mKneeLeft);
        SLSkeletonBone skeletonBone4 = this.bones.get(SLSkeletonBoneID.mAnkleLeft);
        SLSkeletonBone skeletonBone5 = this.bones.get(SLSkeletonBoneID.mFootLeft);
        if (skeletonBone == null || skeletonBone2 == null || skeletonBone3 == null || skeletonBone4 == null || skeletonBone5 == null) {
            return 0.0f;
        }
        return (((skeletonBone.getScaleZ() * skeletonBone2.getPositionZ()) - (skeletonBone2.getScaleZ() * skeletonBone3.getPositionZ())) - (skeletonBone4.getPositionZ() * skeletonBone3.getScaleZ())) - (skeletonBone5.getPositionZ() * skeletonBone4.getScaleZ());
    }

    protected void prepareSkeleton() {
        this.rootBone.prepareSkeleton(this.updateBones, 0);
    }
}
