package com.lumiyaviewer.lumiya.slproto.avatar;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.lumiyaviewer.lumiya.slproto.types.ImmutableVector;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public class SLAvatarParams {
    public static final int NUM_PARAMS = 218;

    @Nonnull
    public static final ImmutableMap<Integer, ParamSet> paramByIDs;

    @Nonnull
    public static final ParamSet[] paramDefs = new ParamSet[218];

    public static class AvatarParam {
        public final float defValue;

        @Nullable
        public final ImmutableList<DrivenParam> drivenParams;
        public final float maxValue;

        @Nullable
        public final MeshIndex meshIndex;
        public final float minValue;
        public final boolean morph;

        @Nullable
        public final SLAvatarParamAlpha paramAlpha;

        @Nullable
        public final SLAvatarParamColor paramColor;

        @Nullable
        public final ImmutableMap<SLSkeletonBoneID, SkeletonParamDefinition> skeletonParams;

        AvatarParam(@Nullable MeshIndex meshIndex, float minValue, float maxValue, float defValue, boolean morph, @Nullable SLAvatarParamColor avatarParamColor, @Nullable SLAvatarParamAlpha avatarParamAlpha, @Nullable ImmutableList<DrivenParam> immutableList, @Nullable ImmutableMap<SLSkeletonBoneID, SkeletonParamDefinition> immutableMap) {
            this.meshIndex = meshIndex;
            this.minValue = minValue;
            this.maxValue = maxValue;
            this.defValue = defValue;
            this.morph = morph;
            this.paramColor = avatarParamColor;
            this.paramAlpha = avatarParamAlpha;
            this.drivenParams = immutableList;
            this.skeletonParams = immutableMap;
        }
    }

    public static class DrivenParam {
        public final int drivenID;
        public final float max1;
        public final float max2;
        public final float min1;
        public final float min2;

        DrivenParam(int drivenID, float min1, float max1, float min2, float max2) {
            this.drivenID = drivenID;
            this.min1 = min1;
            this.max1 = max1;
            this.min2 = min2;
            this.max2 = max2;
        }
    }

    public static class ParamSet {
        public final int appearanceIndex;
        public final int id;

        @Nonnull
        public final SLVisualParamID name;

        @Nonnull
        public final ImmutableList<AvatarParam> params;

        ParamSet(int id, int appearanceIndex, @Nonnull SLVisualParamID visualParamID, @Nonnull ImmutableList<AvatarParam> immutableList) {
            this.id = id;
            this.appearanceIndex = appearanceIndex;
            this.name = visualParamID;
            this.params = immutableList;
        }
    }

    public static class SkeletonParamDefinition {

        @Nullable
        public final ImmutableVector offset;

        @Nullable
        public final ImmutableVector scale;

        SkeletonParamDefinition(@Nullable ImmutableVector immutableVector, @Nullable ImmutableVector offset) {
            this.scale = immutableVector;
            this.offset = offset;
        }
    }

    public static class SkeletonParamValue {

        @Nonnull
        public final LLVector3 offset;

        @Nonnull
        public final LLVector3 scale;

        public SkeletonParamValue(@Nonnull LLVector3 scale, @Nonnull LLVector3 offset) {
            this.scale = scale;
            this.offset = offset;
        }
    }

    static {
        HashMap hashMap = new HashMap();
        SLAvatarParamBuilder.buildParams(paramDefs, hashMap);
        paramByIDs = ImmutableMap.copyOf((Map) hashMap);
    }
}
