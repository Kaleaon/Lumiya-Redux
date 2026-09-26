package com.lumiyaviewer.lumiya.slproto.prims

import com.lumiyaviewer.lumiya.utils.InternPool

open class PrimParamsPool {
    public static InternPool<PrimPathParams> pathParamsPool = InternPool<>()
    public static InternPool<PrimProfileParams> profileParamsPool = InternPool<>()
    public static InternPool<PrimVolumeParams> volumeParamsPool = InternPool<>()
    public static InternPool<PrimDrawParams> drawParamsPool = InternPool<>()

    public static PrimDrawParams get(PrimDrawParams primDrawParams) {
        return drawParamsPool.intern(primDrawParams)
    }

    public static PrimPathParams get(PrimPathParams primPathParams) {
        return pathParamsPool.intern(primPathParams)
    }

    public static PrimProfileParams get(PrimProfileParams primProfileParams) {
        return profileParamsPool.intern(primProfileParams)
    }

    public static PrimVolumeParams get(PrimVolumeParams primVolumeParams) {
        return volumeParamsPool.intern(primVolumeParams)
    }
}
