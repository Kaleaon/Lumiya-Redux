package com.lumiyaviewer.lumiya.slproto.baker;

import com.lumiyaviewer.lumiya.slproto.avatar.BakedTextureIndex;

public class BakeLayerSet {
    public BakedTextureIndex bakedTextureIndex;
    public boolean clear_alpha;
    public int height;
    public BakeLayer[] layers;
    public BakeLayer[] maskLayers;
    public int width;

    public BakeLayerSet(BakedTextureIndex bakedTextureIndex, int width, int height, boolean z, BakeLayer[] bakeLayerArr, BakeLayer[] bakeLayers) {
        this.bakedTextureIndex = bakedTextureIndex;
        this.width = width;
        this.height = height;
        this.clear_alpha = z;
        this.layers = bakeLayerArr;
        this.maskLayers = bakeLayers;
    }
}
