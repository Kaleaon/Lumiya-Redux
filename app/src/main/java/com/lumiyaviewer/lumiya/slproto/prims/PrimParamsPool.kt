package com.lumiyaviewer.lumiya.slproto.prims

import com.lumiyaviewer.lumiya.utils.InternPool

open class PrimParamsPool {
    InternPool<PrimPathParams> pathParamsPool = InternPool<>()
    InternPool<PrimProfileParams> profileParamsPool = InternPool<>()
    InternPool<PrimVolumeParams> volumeParamsPool = InternPool<>()
    InternPool<PrimDrawParams> drawParamsPool = InternPool<>()

    PrimDrawParams get(PrimDrawParams primDrawParams) {
        return drawParamsPool.intern(primDrawParams)
    }

    PrimPathParams get(PrimPathParams primPathParams) {
        return pathParamsPool.intern(primPathParams)
    }

    PrimProfileParams get(PrimProfileParams primProfileParams) {
        return profileParamsPool.intern(primProfileParams)
    }

    PrimVolumeParams get(PrimVolumeParams primVolumeParams) {
        return volumeParamsPool.intern(primVolumeParams)
    }
}
