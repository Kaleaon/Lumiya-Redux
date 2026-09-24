package com.lumiyaviewer.lumiya.render.tex;

import com.lumiyaviewer.lumiya.slproto.avatar.AvatarTextureFaceIndex;
import java.util.UUID;
import javax.annotation.Nullable;

final class AutoValue_DrawableTextureParams extends DrawableTextureParams {
    private final AvatarTextureFaceIndex avatarFaceIndex;
    private final UUID avatarUUID;
    private final TextureClass textureClass;
    private final UUID uuid;

    AutoValue_DrawableTextureParams(UUID uuid, TextureClass textureClass, @Nullable AvatarTextureFaceIndex avatarTextureFaceIndex, @Nullable UUID avatarUUID) {
        if (uuid == null) {
            throw new NullPointerException("Null uuid");
        }
        this.uuid = uuid;
        if (textureClass == null) {
            throw new NullPointerException("Null textureClass");
        }
        this.textureClass = textureClass;
        this.avatarFaceIndex = avatarTextureFaceIndex;
        this.avatarUUID = avatarUUID;
    }

    @Override
    @Nullable
    public AvatarTextureFaceIndex avatarFaceIndex() {
        return this.avatarFaceIndex;
    }

    @Override
    @Nullable
    public UUID avatarUUID() {
        return this.avatarUUID;
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof DrawableTextureParams)) {
            return false;
        }
        DrawableTextureParams drawableTextureParams = (DrawableTextureParams) obj;
        if (this.uuid.equals(drawableTextureParams.uuid()) && this.textureClass.equals(drawableTextureParams.textureClass()) && (this.avatarFaceIndex != null ? this.avatarFaceIndex.equals(drawableTextureParams.avatarFaceIndex()) : drawableTextureParams.avatarFaceIndex() == null)) {
            return this.avatarUUID == null ? drawableTextureParams.avatarUUID() == null : this.avatarUUID.equals(drawableTextureParams.avatarUUID());
        }
        return false;
    }

    public int hashCode() {
        return (((this.avatarFaceIndex == null ? 0 : this.avatarFaceIndex.hashCode()) ^ ((((this.uuid.hashCode() ^ 1000003) * 1000003) ^ this.textureClass.hashCode()) * 1000003)) * 1000003) ^ (this.avatarUUID != null ? this.avatarUUID.hashCode() : 0);
    }

    @Override
    public TextureClass textureClass() {
        return this.textureClass;
    }

    public String toString() {
        return "DrawableTextureParams{uuid=" + this.uuid + ", textureClass=" + this.textureClass + ", avatarFaceIndex=" + this.avatarFaceIndex + ", avatarUUID=" + this.avatarUUID + "}";
    }

    @Override
    public UUID uuid() {
        return this.uuid;
    }
}
