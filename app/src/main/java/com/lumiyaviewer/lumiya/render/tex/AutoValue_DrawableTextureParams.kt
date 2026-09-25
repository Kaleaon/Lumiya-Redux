package com.lumiyaviewer.lumiya.render.tex

import com.lumiyaviewer.lumiya.slproto.avatar.AvatarTextureFaceIndex
import java.util.UUID

/**
 * Concrete value implementation kept under its historical JVM name so cached
 * data, diagnostics, and any reflective callers retain the same type identity.
 */
internal class AutoValue_DrawableTextureParams(
    private val uuid: UUID,
    private val textureClass: TextureClass,
    private val avatarFaceIndex: AvatarTextureFaceIndex?,
    private val avatarUUID: UUID?,
) : DrawableTextureParams() {
    override fun avatarFaceIndex(): AvatarTextureFaceIndex? = avatarFaceIndex
    override fun avatarUUID(): UUID? = avatarUUID
    override fun textureClass(): TextureClass = textureClass
    override fun uuid(): UUID = uuid

    override fun equals(other: Any?): Boolean =
        other === this || other is DrawableTextureParams &&
            uuid == other.uuid() &&
            textureClass == other.textureClass() &&
            avatarFaceIndex == other.avatarFaceIndex() &&
            avatarUUID == other.avatarUUID()

    // Preserve AutoValue's historical hash algorithm for cache compatibility.
    override fun hashCode(): Int {
        var hash = (uuid.hashCode() xor HASH_SEED) * HASH_SEED
        hash = (hash xor textureClass.hashCode()) * HASH_SEED
        hash = (hash xor (avatarFaceIndex?.hashCode() ?: 0)) * HASH_SEED
        return hash xor (avatarUUID?.hashCode() ?: 0)
    }

    override fun toString(): String =
        "DrawableTextureParams{uuid=$uuid, textureClass=$textureClass, " +
            "avatarFaceIndex=$avatarFaceIndex, avatarUUID=$avatarUUID}"

    private companion object {
        const val HASH_SEED = 1_000_003
    }
}
