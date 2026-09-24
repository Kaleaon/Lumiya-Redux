package com.lumiyaviewer.lumiya.render.avatar;

import android.opengl.Matrix;
import com.lumiyaviewer.lumiya.slproto.avatar.MeshIndex;
import com.lumiyaviewer.lumiya.slproto.avatar.SLAttachmentPoint;
import com.lumiyaviewer.lumiya.slproto.avatar.SLAvatarParams;
import com.lumiyaviewer.lumiya.slproto.avatar.SLBaseAvatar;
import com.lumiyaviewer.lumiya.slproto.avatar.SLDefaultSkeleton;
import com.lumiyaviewer.lumiya.slproto.avatar.SLSkeletonBone;
import com.lumiyaviewer.lumiya.slproto.avatar.SLSkeletonBoneID;
import com.lumiyaviewer.lumiya.slproto.avatar.SLVisualParamID;
import com.lumiyaviewer.lumiya.slproto.mesh.MeshJointTranslations;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.util.Arrays;
import java.util.EnumMap;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import javax.annotation.Nonnull;

public class AvatarSkeleton extends SLDefaultSkeleton {
    private final float bodySize;
    private final boolean hasExtendedBones;
    private final float pelvisOffset;
    private final float pelvisToFoot;
    private final Map<MeshIndex, float[]> partMorphParams = new EnumMap(MeshIndex.class);
    private final AttachmentPoint[] attachmentPoints = new AttachmentPoint[56];
    private final AtomicBoolean forceAnimate = new AtomicBoolean(true);
    private final SLSkeletonBone[] animatedBones = new SLSkeletonBone[133];

    private static class AttachmentPoint {
        final SLSkeletonBone bone;
        public final float[] matrix;
        public final SLAttachmentPoint point;

        private AttachmentPoint(SLSkeletonBone skeletonBone, SLAttachmentPoint attachmentPoint) {
            this.matrix = new float[16];
            this.bone = skeletonBone;
            this.point = attachmentPoint;
        }

        /* synthetic */ AttachmentPoint(SLSkeletonBone skeletonBone, SLAttachmentPoint attachmentPoint2, AttachmentPoint attachmentPoint) {
            this(skeletonBone, attachmentPoint2);
        }
    }

    AvatarSkeleton(@Nonnull AvatarShapeParams avatarShapeParams, @Nonnull MeshJointTranslations meshJointTranslations, boolean hasExtendedBones) {
        this.hasExtendedBones = hasExtendedBones;
        prepareSkeleton();
        Iterator<Map.Entry<SLSkeletonBoneID, SLSkeletonBone>> it = this.bones.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            int animatedIndex = ((SLSkeletonBoneID) entry.getKey()).animatedIndex;
            if (animatedIndex >= 0 && animatedIndex < 133) {
                this.animatedBones[animatedIndex] = (SLSkeletonBone) entry.getValue();
            }
        }
        EnumMap<SLSkeletonBoneID, SLAvatarParams.SkeletonParamValue> enumMap = new EnumMap<>(SLSkeletonBoneID.class);
        SLBaseAvatar baseAvatar = SLBaseAvatar.getInstance();
        applyJointTranslations(meshJointTranslations);
        this.pelvisOffset = meshJointTranslations.pelvisOffset;
        for (MeshIndex meshIndex : MeshIndex.VALUES) {
            float[] floats = new float[baseAvatar.getMeshEntry(meshIndex).polyMesh.getNumMorphs()];
            Arrays.fill(floats, 0.0f);
            this.partMorphParams.put(meshIndex, floats);
        }
        for (SLSkeletonBoneID skeletonBoneID : SLSkeletonBoneID.VALUES) {
            enumMap.put(skeletonBoneID, new SLAvatarParams.SkeletonParamValue(new LLVector3(), new LLVector3()));
            enumMap.get(skeletonBoneID).scale.set(1.0f, 1.0f, 1.0f);
            enumMap.get(skeletonBoneID).offset.set(0.0f, 0.0f, 0.0f);
        }
        int paramCount = avatarShapeParams.getParamCount();
        for (int j = 0; j < paramCount; j++) {
            SLAvatarParams.ParamSet paramSet = SLAvatarParams.paramDefs[j];
            for (SLAvatarParams.AvatarParam avatarParam : paramSet.params) {
                float paramValue = ((avatarShapeParams.getParamValue(j) * (avatarParam.maxValue - avatarParam.minValue)) / 255.0f) + avatarParam.minValue;
                ApplyMorphParam(baseAvatar, enumMap, avatarParam, paramSet.name, paramValue);
                if (avatarParam.drivenParams != null) {
                    for (SLAvatarParams.DrivenParam drivenParam : avatarParam.drivenParams) {
                        SLAvatarParams.ParamSet paramSet2 = SLAvatarParams.paramByIDs.get(Integer.valueOf(drivenParam.drivenID));
                        if (paramSet2 != null) {
                            for (SLAvatarParams.AvatarParam avatarParam2 : paramSet2.params) {
                                ApplyMorphParam(baseAvatar, enumMap, avatarParam2, paramSet2.name, getDrivenWeight(paramValue, avatarParam, drivenParam, avatarParam2));
                            }
                        }
                    }
                }
            }
        }
        for (SLSkeletonBoneID skeletonBoneID2 : SLSkeletonBoneID.VALUES) {
            this.bones.get(skeletonBoneID2).deformHierarchy(enumMap.get(skeletonBoneID2).offset, enumMap.get(skeletonBoneID2).scale);
        }
        this.pelvisToFoot = super.getPelvisToFoot();
        this.bodySize = super.getBodySize();
        int i3 = 0;
        while (true) {
            int i4 = i3;
            if (i4 >= 56) {
                updateAttachmentMatrix();
                return;
            }
            SLAttachmentPoint attachmentPoint = SLAttachmentPoint.attachmentPoints[i4];
            if (attachmentPoint != null && !attachmentPoint.isHUD) {
                SLSkeletonBoneID bone = attachmentPoint.bone;
                if (bone != null) {
                    SLSkeletonBone skeletonBone = this.bones.get(bone);
                    if (skeletonBone != null) {
                        this.attachmentPoints[i4] = new AttachmentPoint(skeletonBone, attachmentPoint, null);
                    }
                } else {
                    this.attachmentPoints[i4] = new AttachmentPoint(null, attachmentPoint, null);
                }
            }
            i3 = i4 + 1;
        }
    }

    private void ApplyMorphParam(SLBaseAvatar baseAvatar, Map<SLSkeletonBoneID, SLAvatarParams.SkeletonParamValue> map, SLAvatarParams.AvatarParam avatarParam, SLVisualParamID visualParamID, float f) {
        float[] floats;
        int morphIndex;
        if (avatarParam.morph && avatarParam.meshIndex != null && (floats = this.partMorphParams.get(avatarParam.meshIndex)) != null && (morphIndex = baseAvatar.getMeshEntry(avatarParam.meshIndex).polyMesh.getMorphIndex(visualParamID)) != -1) {
            floats[morphIndex] = floats[morphIndex] + f;
        }
        if (avatarParam.skeletonParams != null) {
            for (Map.Entry<SLSkeletonBoneID, SLAvatarParams.SkeletonParamDefinition> entry : avatarParam.skeletonParams.entrySet()) {
                SLAvatarParams.SkeletonParamValue skeletonParamValue = map.get(entry.getKey());
                SLAvatarParams.SkeletonParamDefinition value = entry.getValue();
                if (value.scale != null) {
                    skeletonParamValue.scale.mulWeighted(value.scale, f);
                }
                if (value.offset != null) {
                    skeletonParamValue.offset.addMul(value.offset, f);
                }
            }
        }
    }

    public static float getDrivenWeight(float f, SLAvatarParams.AvatarParam avatarParam, SLAvatarParams.DrivenParam drivenParam, SLAvatarParams.AvatarParam avatarParam2) {
        float minValue = avatarParam.minValue;
        float maxValue = avatarParam.maxValue;
        float minValue2 = avatarParam2.minValue;
        float maxValue2 = avatarParam2.maxValue;
        if (f <= drivenParam.min1) {
            return (drivenParam.min1 != drivenParam.max1 || drivenParam.min1 > minValue) ? minValue2 : maxValue2;
        }
        if (f <= drivenParam.max1) {
            return ((maxValue2 - minValue2) * ((f - drivenParam.min1) / (drivenParam.max1 - drivenParam.min1))) + minValue2;
        }
        if (f <= drivenParam.max2) {
            return maxValue2;
        }
        if (f <= drivenParam.min2) {
            return maxValue2 + ((minValue2 - maxValue2) * ((f - drivenParam.max2) / (drivenParam.min2 - drivenParam.max2)));
        }
        return drivenParam.max2 < maxValue ? minValue2 : maxValue2;
    }

    private void updateAttachmentMatrix() {
        float[] floats = new float[16];
        for (int i = 0; i < 56; i++) {
            AttachmentPoint attachmentPoint = this.attachmentPoints[i];
            if (attachmentPoint != null) {
                SLSkeletonBone bone = attachmentPoint.bone;
                if (bone != null) {
                    Matrix.translateM(floats, 0, bone.getGlobalMatrix(), 0, attachmentPoint.point.position.x * bone.getScaleX(), attachmentPoint.point.position.y * bone.getScaleY(), attachmentPoint.point.position.z * bone.getScaleZ());
                    Matrix.multiplyMM(attachmentPoint.matrix, 0, floats, 0, attachmentPoint.point.rotation.getInverseMatrix(), 0);
                } else {
                    Matrix.setIdentityM(floats, 0);
                    Matrix.translateM(floats, 0, this.rootBone.getPositionX(), this.rootBone.getPositionY(), this.rootBone.getPositionZ());
                    Matrix.translateM(floats, 0, attachmentPoint.point.position.x, attachmentPoint.point.position.y, attachmentPoint.point.position.z);
                    Matrix.multiplyMM(attachmentPoint.matrix, 0, floats, 0, attachmentPoint.point.rotation.getInverseMatrix(), 0);
                }
                int nonHUDindex = SLAttachmentPoint.attachmentPoints[i].nonHUDindex;
                if (nonHUDindex >= 0) {
                    System.arraycopy(attachmentPoint.matrix, 0, this.jointWorldMatrix, (nonHUDindex + SLSkeletonBoneID.VALUES.length) * 16, 16);
                }
            }
        }
    }

    @Override
    public void UpdateGlobalPositions(AnimationSkeletonData animationSkeletonData) {
        super.UpdateGlobalPositions(animationSkeletonData);
        updateAttachmentMatrix();
    }

    public SLSkeletonBone getAnimatedBone(int i) {
        return this.animatedBones[i];
    }

    final float[] getAttachmentMatrix(int i) {
        AttachmentPoint attachmentPoint;
        if (i < 0 || i >= this.attachmentPoints.length || (attachmentPoint = this.attachmentPoints[i]) == null) {
            return null;
        }
        return attachmentPoint.matrix;
    }

    @Override
    public final float getBodySize() {
        return this.bodySize;
    }

    final float[] getMorphParams(MeshIndex meshIndex) {
        return this.partMorphParams.get(meshIndex);
    }

    final float getPelvisOffset() {
        return this.pelvisOffset;
    }

    @Override
    public final float getPelvisToFoot() {
        return this.pelvisToFoot;
    }

    public boolean hasExtendedBones() {
        return this.hasExtendedBones;
    }

    public boolean needForceAnimate() {
        return this.forceAnimate.getAndSet(false);
    }

    public void setForceAnimate() {
        this.forceAnimate.set(true);
    }
}
