package com.lumiyaviewer.lumiya.slproto.prims;

import com.lumiyaviewer.lumiya.slproto.avatar.BakesOnMesh;
import com.lumiyaviewer.lumiya.slproto.textures.SLTextureEntry;
import com.lumiyaviewer.lumiya.slproto.textures.SLTextureEntryFace;
import javax.annotation.Nullable;

public class PrimDrawParams {
    /** Wearer's bakes for Bakes on Mesh faces; null except on attachments that use them. */
    @Nullable
    private final AvatarBakes bakes;
    private final SLTextureEntry textures;
    private final PrimVolumeParams volumeParams;

    public PrimDrawParams(PrimVolumeParams primVolumeParams, SLTextureEntry textureEntry) {
        this(primVolumeParams, textureEntry, null);
    }

    private PrimDrawParams(PrimVolumeParams primVolumeParams, SLTextureEntry textureEntry, @Nullable AvatarBakes bakes) {
        this.volumeParams = primVolumeParams;
        this.textures = textureEntry;
        this.bakes = bakes;
    }

    /** Whether any face shows a Bakes on Mesh placeholder texture. */
    public boolean usesBakesOnMesh() {
        if (this.textures == null) {
            return false;
        }
        SLTextureEntryFace defaultFace = this.textures.GetDefaultTexture();
        if (BakesOnMesh.isBakedImageId(defaultFace.getTextureID(defaultFace))) {
            return true;
        }
        for (int i = 0; i < SLTextureEntry.MAX_FACES; i++) {
            SLTextureEntryFace face = this.textures.GetFace(i);
            if (face != null && BakesOnMesh.isBakedImageId(face.getTextureID(defaultFace))) {
                return true;
            }
        }
        return false;
    }

    /**
     * These parameters as worn by an avatar with the given bakes. Unchanged
     * when no face uses Bakes on Mesh, so ordinary attachments keep sharing
     * cached geometry with identical prims.
     */
    public PrimDrawParams withBakes(@Nullable AvatarBakes avatarBakes) {
        AvatarBakes effective = (avatarBakes != null && usesBakesOnMesh()) ? avatarBakes : null;
        if (effective == null ? this.bakes == null : effective.equals(this.bakes)) {
            return this;
        }
        return new PrimDrawParams(this.volumeParams, this.textures, effective);
    }

    @Nullable
    public final AvatarBakes getBakes() {
        return this.bakes;
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj == null || !(obj instanceof PrimDrawParams)) {
            return false;
        }
        PrimDrawParams primDrawParams = (PrimDrawParams) obj;
        if ((this.volumeParams == null) != (primDrawParams.volumeParams == null)) {
            return false;
        }
        if (this.volumeParams != null && !this.volumeParams.equals(primDrawParams.volumeParams)) {
            return false;
        }
        if ((this.textures == null) != (primDrawParams.textures == null)) {
            return false;
        }
        if (this.bakes == null ? primDrawParams.bakes != null : !this.bakes.equals(primDrawParams.bakes)) {
            return false;
        }
        return this.textures == null || this.textures.equals(primDrawParams.textures);
    }

    public final SLTextureEntry getTextures() {
        return this.textures;
    }

    public final PrimVolumeParams getVolumeParams() {
        return this.volumeParams;
    }

    public int hashCode() {
        int hashCode = this.volumeParams != null ? this.volumeParams.hashCode() + 0 : 0;
        if (this.bakes != null) {
            hashCode += this.bakes.hashCode();
        }
        return this.textures != null ? hashCode + this.textures.hashCode() : hashCode;
    }
}
