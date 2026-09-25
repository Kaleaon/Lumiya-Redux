package com.lumiyaviewer.lumiya.render.tex

import com.lumiyaviewer.lumiya.slproto.avatar.AvatarTextureFaceIndex
import java.io.File
import java.util.UUID

abstract class DrawableTextureParams {
    abstract fun avatarFaceIndex(): AvatarTextureFaceIndex?
    abstract fun avatarUUID(): UUID?
    abstract fun textureClass(): TextureClass
    abstract fun uuid(): UUID

    fun getTextureRawPath(directory: File, highQuality: Boolean): File {
        val hash = uuid().hashCode()
        val bucket = (hash xor (hash shr 8) xor (hash shr 16) xor (hash shr 24)) and 0xff
        val storePath = textureClass().storePath +
            if (textureClass() == TextureClass.Prim && highQuality) "-hq" else ""
        return File(directory, String.format("%s-raw/%02x/%s.raw", storePath, bucket, uuid()))
    }

    companion object {
        @JvmStatic
        fun create(uuid: UUID, textureClass: TextureClass): DrawableTextureParams =
            AutoValue_DrawableTextureParams(uuid, textureClass, null, null)

        @JvmStatic
        fun create(
            uuid: UUID,
            avatarTextureFaceIndex: AvatarTextureFaceIndex?,
            avatarUUID: UUID?,
        ): DrawableTextureParams = AutoValue_DrawableTextureParams(
            uuid,
            TextureClass.Baked,
            avatarTextureFaceIndex,
            avatarUUID,
        )
    }
}
