package com.lumiyaviewer.lumiya.render.tex

enum class TexturePriority {
    Asset,
    Sculpt,
    PrimVisibleClose,
    PrimVisibleMedium,
    Terrain,
    PrimVisibleFar,
    PrimInvisible,
    Lowest;

    companion object {
        @JvmStatic
        fun valuesCustom(): Array<TexturePriority> = entries.toTypedArray()
    }
}
