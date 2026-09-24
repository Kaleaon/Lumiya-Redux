package com.lumiyaviewer.lumiya.slproto.avatar;

import javax.annotation.Nullable;

public class SLAvatarParamAlpha {
    public final float domain;
    public final boolean multiplyBlend;
    public final boolean skipIfZero;

    @Nullable
    public final String tgaFile;

    SLAvatarParamAlpha(float domain, @Nullable String tgaFile, boolean skipIfZero, boolean multiplyBlend) {
        this.domain = domain;
        this.tgaFile = tgaFile;
        this.skipIfZero = skipIfZero;
        this.multiplyBlend = multiplyBlend;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        SLAvatarParamAlpha avatarParamAlpha = (SLAvatarParamAlpha) obj;
        if (Float.compare(avatarParamAlpha.domain, this.domain) == 0 && this.skipIfZero == avatarParamAlpha.skipIfZero && this.multiplyBlend == avatarParamAlpha.multiplyBlend) {
            return this.tgaFile != null ? this.tgaFile.equals(avatarParamAlpha.tgaFile) : avatarParamAlpha.tgaFile == null;
        }
        return false;
    }

    public int hashCode() {
        return (((this.skipIfZero ? 1 : 0) + (((this.tgaFile != null ? this.tgaFile.hashCode() : 0) + ((this.domain != 0.0f ? Float.floatToIntBits(this.domain) : 0) * 31)) * 31)) * 31) + (this.multiplyBlend ? 1 : 0);
    }
}
