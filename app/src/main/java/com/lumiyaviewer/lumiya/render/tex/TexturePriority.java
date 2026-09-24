package com.lumiyaviewer.lumiya.render.tex;

public enum TexturePriority {
    Asset,
    Sculpt,
    PrimVisibleClose,
    PrimVisibleMedium,
    Terrain,
    PrimVisibleFar,
    PrimInvisible,
    Lowest;

    /* renamed from: values, reason: to resolve conflict with enum method */
    public static TexturePriority[] valuesCustom() {
        return values();
    }
}
