package com.lumiyaviewer.lumiya.slproto.baker

enum class SLAvatarGlobalColor {
    skin_color(arrayOf(111, 110, 108)),
    hair_color(arrayOf(114, 113, 115, 112)),
    eye_color(arrayOf(99, 98))

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
