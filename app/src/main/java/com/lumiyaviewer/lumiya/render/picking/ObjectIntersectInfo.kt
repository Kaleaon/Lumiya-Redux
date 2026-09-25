package com.lumiyaviewer.lumiya.render.picking

import com.lumiyaviewer.lumiya.slproto.objects.SLObjectInfo

class ObjectIntersectInfo(
    @JvmField val intersectInfo: IntersectInfo,
    @JvmField val objInfo: SLObjectInfo,
    @JvmField val pickDepth: Float,
)
