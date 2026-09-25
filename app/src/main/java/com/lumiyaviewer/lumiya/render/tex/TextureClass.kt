package com.lumiyaviewer.lumiya.render.tex

enum class TextureClass(val storePath: String) {
    Prim("textures"),
    Sculpt("sculpt"),
    Baked("baked"),
    Asset("asset"),
    Terrain("terrain");

    companion object {
        @JvmStatic
        fun valuesCustom(): Array<TextureClass> = entries.toTypedArray()
    }
}
