package com.lumiyaviewer.lumiya.slproto.objects

import com.lumiyaviewer.lumiya.render.avatar.AvatarVisualState
import com.lumiyaviewer.lumiya.render.spatial.DrawListAvatarEntry
import com.lumiyaviewer.lumiya.render.spatial.DrawListObjectEntry
import com.lumiyaviewer.lumiya.slproto.messages.AvatarAnimation
import com.lumiyaviewer.lumiya.slproto.messages.AvatarAppearance
import com.lumiyaviewer.lumiya.slproto.textures.SLTextureEntry
import java.util.UUID

open class SLObjectAvatarInfo : SLObjectInfo() {

    private var avatarVisualState: AvatarVisualState = null
    private var isMyAvatar: Boolean = false

    constructor(uuid: UUID, uuid2: UUID, isMyAvatar: Boolean) {
        this.isMyAvatar = isMyAvatar
        this.avatarVisualState = AvatarVisualState(uuid, this, uuid2)
    }

    fun ApplyAvatarAnimation(avatarAnimation: AvatarAnimation) {
        this.avatarVisualState.ApplyAvatarAnimation(avatarAnimation)
    }

    fun ApplyAvatarAppearance(avatarAppearance: AvatarAppearance) {
        this.avatarVisualState.ApplyAvatarAppearance(avatarAppearance)
    }

    fun ApplyAvatarTextures(textureEntry: SLTextureEntry, z: Boolean) {
        this.avatarVisualState.ApplyTextures(textureEntry, z)
    }

    fun ApplyAvatarVisualParams(ints: IntArray) {
        this.avatarVisualState.ApplyVisualParams(ints)
    }
    protected fun createDrawListEntry(): DrawListObjectEntry {
        return DrawListAvatarEntry(this)
    }

    fun getAvatarVisualState(): AvatarVisualState {
        return this.avatarVisualState
    }
    fun getName(): String {
        return if (this.isMyAvatar) "(my avatar)" else "(avatar)"
    }
    fun isAvatar(): Boolean {
        return true
    }

    fun isMyAvatar(): Boolean {
        return this.isMyAvatar
    }
    fun onTexturesUpdate(textureEntry: SLTextureEntry) {
        this.avatarVisualState.ApplyTextures(textureEntry, false)
    }
}
