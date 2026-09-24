package com.lumiyaviewer.lumiya.slproto.modules.texfetcher;

import com.lumiyaviewer.lumiya.render.tex.TextureClass;
import com.lumiyaviewer.lumiya.render.tex.TexturePriority;
import com.lumiyaviewer.lumiya.slproto.avatar.AvatarTextureFaceIndex;
import com.lumiyaviewer.lumiya.utils.HasPriority;
import java.io.File;
import java.util.UUID;

public class SLTextureFetchRequest implements HasPriority {

    public AvatarTextureFaceIndex avatarFaceIndex;
    public UUID avatarUUID;
    public final File destFile;
    public TextureClass textureClass;
    public UUID textureID;
    public int textureLayer;
    TextureFetchCompleteListener onFetchComplete = null;
    public File outputFile = null;
    private int visibleRangeCategory = -1;

    public interface TextureFetchCompleteListener {
        void OnTextureFetchComplete(SLTextureFetchRequest textureFetchRequest);
    }

    public SLTextureFetchRequest(UUID uuid, int textureLayer, TextureClass textureClass, AvatarTextureFaceIndex avatarTextureFaceIndex, UUID avatarUUID, File file) {
        this.textureID = uuid;
        this.textureLayer = textureLayer;
        this.textureClass = textureClass;
        this.avatarFaceIndex = avatarTextureFaceIndex;
        this.avatarUUID = avatarUUID;
        this.destFile = file;
    }

    public static int getPriorityForClass(TextureClass textureClass, int i) {
        switch (textureClass) {
            case Asset:
                return TexturePriority.Asset.ordinal();
            case Baked:
                return TexturePriority.PrimVisibleClose.ordinal();
            case Prim:
                switch (i) {
                    case -1:
                        return TexturePriority.PrimInvisible.ordinal();
                    case 0:
                        return TexturePriority.PrimVisibleClose.ordinal();
                    case 1:
                        return TexturePriority.PrimVisibleMedium.ordinal();
                    default:
                        return TexturePriority.PrimVisibleFar.ordinal();
                }
            case Sculpt:
                return TexturePriority.Sculpt.ordinal();
            case Terrain:
                return TexturePriority.Terrain.ordinal();
            default:
                return TexturePriority.Lowest.ordinal();
        }
    }

    @Override
    public int getPriority() {
        return getPriorityForClass(this.textureClass, this.visibleRangeCategory);
    }

    public void setOnFetchComplete(TextureFetchCompleteListener textureFetchCompleteListener) {
        this.onFetchComplete = textureFetchCompleteListener;
    }
}
