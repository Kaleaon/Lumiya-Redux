package com.lumiyaviewer.lumiya.slproto.prims;

import com.lumiyaviewer.lumiya.slproto.avatar.AvatarTextureFaceIndex;
import java.util.Collections;
import java.util.EnumMap;
import java.util.Map;
import java.util.UUID;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;

/**
 * The server-side bakes of the avatar wearing an attachment, for resolving
 * Bakes on Mesh placeholder textures (BakesOnMesh) on its faces. Part of
 * PrimDrawParams so that attachments of different avatars, or of one avatar
 * before and after an outfit change, get different cached DrawablePrims.
 */
@Immutable
public final class AvatarBakes {
    @Nonnull
    private final UUID avatarUUID;
    @Nonnull
    private final Map<AvatarTextureFaceIndex, UUID> bakes;

    public AvatarBakes(@Nonnull UUID avatarUUID, @Nonnull Map<AvatarTextureFaceIndex, UUID> bakes) {
        this.avatarUUID = avatarUUID;
        EnumMap<AvatarTextureFaceIndex, UUID> copy = new EnumMap<>(AvatarTextureFaceIndex.class);
        copy.putAll(bakes);
        this.bakes = Collections.unmodifiableMap(copy);
    }

    @Nonnull
    public UUID getAvatarUUID() {
        return this.avatarUUID;
    }

    /** The bake texture for a slot, or null if the avatar has none (yet). */
    @Nullable
    public UUID getBake(AvatarTextureFaceIndex faceIndex) {
        return this.bakes.get(faceIndex);
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof AvatarBakes)) {
            return false;
        }
        AvatarBakes other = (AvatarBakes) obj;
        return this.avatarUUID.equals(other.avatarUUID) && this.bakes.equals(other.bakes);
    }

    public int hashCode() {
        return (this.avatarUUID.hashCode() * 31) + this.bakes.hashCode();
    }
}
