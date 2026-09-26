package com.lumiyaviewer.lumiya.slproto.mesh

import com.lumiyaviewer.lumiya.slproto.avatar.SLSkeletonBoneID
import java.util.EnumMap

open class MeshJointTranslations {
    @JvmField var pelvisOffset: Float = 0.0f
    @JvmField val jointTranslations = EnumMap<SLSkeletonBoneID, FloatArray>(SLSkeletonBoneID::class.java)
}
