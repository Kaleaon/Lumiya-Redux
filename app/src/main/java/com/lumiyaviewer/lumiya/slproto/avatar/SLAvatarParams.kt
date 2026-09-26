package com.lumiyaviewer.lumiya.slproto.avatar

import com.google.common.collect.ImmutableList
import com.google.common.collect.ImmutableMap
import com.lumiyaviewer.lumiya.slproto.types.ImmutableVector
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.util.HashMap
import java.util.Map

open class SLAvatarParams {
    int NUM_PARAMS = 218

    ImmutableMap<Integer, ParamSet> paramByIDs

    Array<ParamSet> paramDefs = arrayOfNulls<ParamSet>(218)

    open class AvatarParam {
        public var defValue: Float

        public ImmutableList<DrivenParam> drivenParams
        public var maxValue: Float

        public MeshIndex meshIndex
        public var minValue: Float
        public var morph: Boolean

        public SLAvatarParamAlpha paramAlpha

        public SLAvatarParamColor paramColor

        public ImmutableMap<SLSkeletonBoneID, SkeletonParamDefinition> skeletonParams

        AvatarParam(MeshIndex meshIndex, float minValue, float maxValue, float defValue, boolean morph, SLAvatarParamColor avatarParamColor, SLAvatarParamAlpha avatarParamAlpha, ImmutableList<DrivenParam> immutableList, ImmutableMap<SLSkeletonBoneID, SkeletonParamDefinition> immutableMap) {
            this.meshIndex = meshIndex
            this.minValue = minValue
            this.maxValue = maxValue
            this.defValue = defValue
            this.morph = morph
            this.paramColor = avatarParamColor
            this.paramAlpha = avatarParamAlpha
            this.drivenParams = immutableList
            this.skeletonParams = immutableMap
        }
    }

    open class DrivenParam {
        public var drivenID: Int
        public var max1: Float
        public var max2: Float
        public var min1: Float
        public var min2: Float

        DrivenParam(int drivenID, float min1, float max1, float min2, float max2) {
            this.drivenID = drivenID
            this.min1 = min1
            this.max1 = max1
            this.min2 = min2
            this.max2 = max2
        }
    }

    open class ParamSet {
        public var appearanceIndex: Int
        public var id: Int

        public SLVisualParamID name

        public ImmutableList<AvatarParam> params

        ParamSet(int id, int appearanceIndex, SLVisualParamID visualParamID, ImmutableList<AvatarParam> immutableList) {
            this.id = id
            this.appearanceIndex = appearanceIndex
            this.name = visualParamID
            this.params = immutableList
        }
    }

    open class SkeletonParamDefinition {

        public ImmutableVector offset

        public ImmutableVector scale

        SkeletonParamDefinition(ImmutableVector immutableVector, ImmutableVector offset) {
            this.scale = immutableVector
            this.offset = offset
        }
    }

    open class SkeletonParamValue {

        public LLVector3 offset

        public LLVector3 scale

        public SkeletonParamValue(LLVector3 scale, LLVector3 offset) {
            this.scale = scale
            this.offset = offset
        }
    }
    init {
        HashMap hashMap = HashMap()
        SLAvatarParamBuilder.buildParams(paramDefs, hashMap)
        paramByIDs = ImmutableMap.copyOf(hashMap as Map)
    }
}
