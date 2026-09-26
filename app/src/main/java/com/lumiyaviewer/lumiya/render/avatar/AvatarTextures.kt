package com.lumiyaviewer.lumiya.render.avatar

import com.lumiyaviewer.lumiya.slproto.avatar.AvatarTextureFaceIndex
import com.lumiyaviewer.lumiya.slproto.avatar.BakesOnMesh
import com.lumiyaviewer.lumiya.slproto.messages.AvatarAppearance
import com.lumiyaviewer.lumiya.slproto.prims.AvatarBakes
import com.lumiyaviewer.lumiya.slproto.textures.SLTextureEntry
import java.nio.ByteBuffer
import java.util.EnumMap
import java.util.UUID

class AvatarTextures {
    private val avatarTextures = EnumMap<AvatarTextureFaceIndex, UUID>(AvatarTextureFaceIndex::class.java)

    @Synchronized
    fun ApplyAvatarAppearance(avatarAppearance: AvatarAppearance): Boolean {
        val textureEntry = avatarAppearance.ObjectData_Field.TextureEntry!!
        return ApplyTextures(SLTextureEntry.create(ByteBuffer.wrap(textureEntry), textureEntry.size), false)
    }

    @Synchronized
    fun ApplyTextures(textureEntry: SLTextureEntry, keepExisting: Boolean): Boolean {
        if (textureEntry.faceMask == 0L) {
            return false
        }
        val defaultTexture = textureEntry.GetDefaultTexture()
        var changed = false
        for (faceIndex in AvatarTextureFaceIndex.values()) {
            val face = textureEntry.GetFace(faceIndex.ordinal) ?: continue
            val textureID = face.getTextureID(defaultTexture) ?: continue
            val existing = avatarTextures[faceIndex]
            if (keepExisting && existing != null) {
                continue
            }
            if (existing == null || textureID != existing) {
                avatarTextures[faceIndex] = textureID
                changed = true
            }
        }
        return changed
    }

    /** The bake slots, for Bakes on Mesh attachments of this avatar. */
    @Synchronized
    fun getBakes(avatarUUID: UUID): AvatarBakes {
        val bakes = EnumMap<AvatarTextureFaceIndex, UUID>(AvatarTextureFaceIndex::class.java)
        for (faceIndex in BakesOnMesh.bakedFaces()) {
            val bake = avatarTextures[faceIndex]
            if (bake != null) {
                bakes[faceIndex] = bake
            }
        }
        return AvatarBakes(avatarUUID, bakes)
    }

    @Synchronized
    fun getTexture(avatarTextureFaceIndex: AvatarTextureFaceIndex): UUID? = avatarTextures[avatarTextureFaceIndex]

    companion object {
        @JvmField
        val DEFAULT_AVATAR_TEXTURE: UUID = UUID.fromString("c228d1cf-4b5d-4ba8-84f4-899a0796aa97")
    }
}
