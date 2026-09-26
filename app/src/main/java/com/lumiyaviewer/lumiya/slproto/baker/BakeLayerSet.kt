package com.lumiyaviewer.lumiya.slproto.baker

import com.lumiyaviewer.lumiya.slproto.avatar.BakedTextureIndex

open class BakeLayerSet(
    @JvmField var bakedTextureIndex: BakedTextureIndex,
    @JvmField var width: Int,
    @JvmField var height: Int,
    @JvmField var clear_alpha: Boolean,
    @JvmField var layers: Array<BakeLayer>,
    @JvmField var maskLayers: Array<BakeLayer>,
)
