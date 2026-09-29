package com.lumiyaviewer.lumiya.slproto.avatar

enum class BakedTextureIndex {
    BAKED_HEAD(AvatarTextureFaceIndex.TEX_HEAD_BAKED),
    BAKED_UPPER(AvatarTextureFaceIndex.TEX_UPPER_BAKED),
    BAKED_LOWER(AvatarTextureFaceIndex.TEX_LOWER_BAKED),
    BAKED_EYES(AvatarTextureFaceIndex.TEX_EYES_BAKED),
    BAKED_SKIRT(AvatarTextureFaceIndex.TEX_SKIRT_BAKED),
    BAKED_HAIR(AvatarTextureFaceIndex.TEX_HAIR_BAKED)

    private var faceIndex: AvatarTextureFaceIndex? = null

    constructor(avatarTextureFaceIndex: AvatarTextureFaceIndex) {
        this.faceIndex = avatarTextureFaceIndex
    }

    /* renamed from: values, reason: to resolve conflict with enum method */
    fun valuesCustom(): Array<BakedTextureIndex> {
        return values()
    }

    fun getFaceIndex(): AvatarTextureFaceIndex {
        return this.faceIndex
    }
}
