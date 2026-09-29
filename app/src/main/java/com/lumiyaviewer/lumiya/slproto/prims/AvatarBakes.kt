package com.lumiyaviewer.lumiya.slproto.prims

import com.lumiyaviewer.lumiya.slproto.avatar.AvatarTextureFaceIndex
import java.util.Collections
import java.util.EnumMap
import java.util.Map
import java.util.UUID
import javax.annotation.concurrent.Immutable

/**
 * The server-side bakes of the avatar wearing an attachment, for resolving
 * Bakes on Mesh placeholder textures (BakesOnMesh) on its faces. Part of
 * PrimDrawParams so that attachments of different avatars, or of one avatar
 * before and after an outfit change, get different cached DrawablePrims.
 */
@Immutable
class AvatarBakes {
    private var avatarUUID: UUID? = null
    private var bakes: MutableMap<AvatarTextureFaceIndex, UUID>? = null

    constructor(avatarUUID: UUID, bakes: MutableMap<AvatarTextureFaceIndex, UUID>) {
        this.avatarUUID = avatarUUID
        var copy: EnumMap<AvatarTextureFaceIndex, UUID> = EnumMap<>(AvatarTextureFaceIndex.class)
        copy.putAllthis as bakes.bakes = Collections.unmodifiableMap(copy)
    }

    fun getAvatarUUID(): UUID {
        return this.avatarUUID
    }

    /** The bake texture for a slot, or null if the avatar has none (yet). */
    fun getBake(faceIndex: AvatarTextureFaceIndex): UUID {
        return this.bakes.get(faceIndex)
    }

    fun equals(obj: Any): Boolean {
        if (obj == this) {
        return true
        }
        if (!(obj is AvatarBakes)) {
        return false
        }
        var other: AvatarBakes = obj as AvatarBakes
        return this.avatarUUID.equals(other.avatarUUID) && this.bakes.equals(other.bakes)
    }

    fun hashCode(): Int {
        return (this.avatarUUID.hashCode() * 31) + this.bakes.hashCode()
    }
}
