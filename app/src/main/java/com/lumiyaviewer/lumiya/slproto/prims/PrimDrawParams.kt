package com.lumiyaviewer.lumiya.slproto.prims

import com.lumiyaviewer.lumiya.slproto.avatar.BakesOnMesh
import com.lumiyaviewer.lumiya.slproto.textures.SLTextureEntry
import com.lumiyaviewer.lumiya.slproto.textures.SLTextureEntryFace

open class PrimDrawParams {
    /** Wearer's bakes for Bakes on Mesh faces; null except on attachments that use them. */
    private var bakes: AvatarBakes = null
    private var textures: SLTextureEntry = null
    private var volumeParams: PrimVolumeParams = null

    constructor(primVolumeParams: PrimVolumeParams, textureEntry: SLTextureEntry) {
        this(primVolumeParams, textureEntry, null)
    }

    fun PrimDrawParams(primVolumeParams: PrimVolumeParams, textureEntry: SLTextureEntry, bakes: AvatarBakes): private {
        this.volumeParams = primVolumeParams
        this.textures = textureEntry
        this.bakes = bakes
    }

    /** Whether any face shows a Bakes on Mesh placeholder texture. */
    fun usesBakesOnMesh(): Boolean {
        if (this.textures == null) {
        return false
        }
        var defaultFace: SLTextureEntryFace = this.textures.GetDefaultTexture()
        if (BakesOnMesh.isBakedImageId(defaultFace.getTextureID(defaultFace))) {
        return true
        }
        for (int i = 0; i < SLTextureEntry.MAX_FACES; i++) {
            var face: SLTextureEntryFace = this.textures.GetFace(i)
            if (face != null && BakesOnMesh.isBakedImageId(face.getTextureID(defaultFace))) {
        return true
            }
        }
        return false
    }

    /**
     * These parameters as worn by an avatar with the given bakes. Unchanged
     * when no face uses Bakes on Mesh, so ordinary attachments keep sharing
     * cached geometry with identical prims.
     */
    fun withBakes(avatarBakes: AvatarBakes): PrimDrawParams {
        var effective: AvatarBakes = (avatarBakes != null && usesBakesOnMesh()) ? avatarBakes : null
        if (if (effective == null) this.bakes == null else effective.equals(this.bakes)) {
        return this
        }
        return PrimDrawParams(this.volumeParams, this.textures, effective)
    }

    fun getBakes(): AvatarBakes {
        return this.bakes
    }

    fun equals(obj: Any): Boolean {
        if (obj == this) {
        return true
        }
        if (obj == null || !(obj is PrimDrawParams)) {
        return false
        }
        var primDrawParams: PrimDrawParams = obj as PrimDrawParams
        if ((this.volumeParams == null) != (primDrawParams.volumeParams == null)) {
        return false
        }
        if (this.volumeParams != null && !this.volumeParams.equals(primDrawParams.volumeParams)) {
        return false
        }
        if ((this.textures == null) != (primDrawParams.textures == null)) {
        return false
        }
        if (if (this.bakes == null) primDrawParams.bakes != null else !this.bakes.equals(primDrawParams.bakes)) {
        return false
        }
        return this.textures == null || this.textures.equals(primDrawParams.textures)
    }

    fun getTextures(): SLTextureEntry {
        return this.textures
    }

    fun getVolumeParams(): PrimVolumeParams {
        return this.volumeParams
    }

    fun hashCode(): Int {
        var hashCode: Int = if (this.volumeParams != null) this.volumeParams.hashCode() + 0 else 0
        if (this.bakes != null) {
            hashCode += this.bakes.hashCode()
        }
        return if (this.textures != null) hashCode + this.textures.hashCode() else hashCode
    }
}
