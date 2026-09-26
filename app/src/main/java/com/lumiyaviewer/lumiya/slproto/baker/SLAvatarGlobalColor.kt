package com.lumiyaviewer.lumiya.slproto.baker

enum class SLAvatarGlobalColor {
    skin_color(new Array<int>{111, 110, 108}),
    hair_color(new Array<int>{114, 113, 115, 112}),
    eye_color(new Array<int>{99, 98})

    private Array<int> paramIDs

    SLAvatarGlobalColor(Array<int> ints) {
        this.paramIDs = ints
    }

    /* renamed from: values, reason: to resolve conflict with enum method */
    Array<SLAvatarGlobalColor> valuesCustom() {
        return values()
    }

    public Array<int> getParamIDs() {
        return this.paramIDs
    }
}
