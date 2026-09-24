package com.lumiyaviewer.lumiya.slproto.avatar;

import com.google.common.collect.ImmutableMap;
import java.util.UUID;
import javax.annotation.Nullable;

/**
 * Bakes on Mesh (2019). A mesh body, head or other attachment face whose
 * texture is one of these placeholder UUIDs shows the wearer's server-side
 * bake for that region instead, so skin, tattoos and system clothing reach
 * mesh bodies.
 *
 * UUIDs from indra/llcommon/indra_constants.cpp (IMG_USE_BAKED_*), mapping
 * from LLAvatarAppearanceDictionary::assetIdToBakedTextureIndex.
 */
public final class BakesOnMesh {
    private static final ImmutableMap<UUID, AvatarTextureFaceIndex> BAKED_FACES = ImmutableMap.<UUID, AvatarTextureFaceIndex>builder()
            .put(UUID.fromString("5a9f4a74-30f2-821c-b88d-70499d3e7183"), AvatarTextureFaceIndex.TEX_HEAD_BAKED)
            .put(UUID.fromString("ae2de45c-d252-50b8-5c6e-19f39ce79317"), AvatarTextureFaceIndex.TEX_UPPER_BAKED)
            .put(UUID.fromString("24daea5f-0539-cfcf-047f-fbc40b2786ba"), AvatarTextureFaceIndex.TEX_LOWER_BAKED)
            .put(UUID.fromString("52cc6bb6-2ee5-e632-d3ad-50197b1dcb8a"), AvatarTextureFaceIndex.TEX_EYES_BAKED)
            .put(UUID.fromString("43529ce8-7faa-ad92-165a-bc4078371687"), AvatarTextureFaceIndex.TEX_SKIRT_BAKED)
            .put(UUID.fromString("09aac1fb-6bce-0bee-7d44-caac6dbb6c63"), AvatarTextureFaceIndex.TEX_HAIR_BAKED)
            .put(UUID.fromString("ff62763f-d60a-9855-890b-0c96f8f8cd98"), AvatarTextureFaceIndex.TEX_LEFT_ARM_BAKED)
            .put(UUID.fromString("8e915e25-31d1-cc95-ae08-d58a47488251"), AvatarTextureFaceIndex.TEX_LEFT_LEG_BAKED)
            .put(UUID.fromString("9742065b-19b5-297c-858a-29711d539043"), AvatarTextureFaceIndex.TEX_AUX1_BAKED)
            .put(UUID.fromString("03642e83-2bd1-4eb9-34b4-4c47ed586d2d"), AvatarTextureFaceIndex.TEX_AUX2_BAKED)
            .put(UUID.fromString("edd51b77-fc10-ce7a-4b3d-011dfc349e4f"), AvatarTextureFaceIndex.TEX_AUX3_BAKED)
            .build();

    private BakesOnMesh() {
    }

    public static boolean isBakedImageId(@Nullable UUID textureID) {
        return textureID != null && BAKED_FACES.containsKey(textureID);
    }

    /** The avatar bake slot a placeholder UUID stands for, or null for an ordinary texture. */
    @Nullable
    public static AvatarTextureFaceIndex getBakedFace(@Nullable UUID textureID) {
        return textureID != null ? BAKED_FACES.get(textureID) : null;
    }

    /** The 11 bake slots, in bake order. */
    public static Iterable<AvatarTextureFaceIndex> bakedFaces() {
        return BAKED_FACES.values();
    }
}
