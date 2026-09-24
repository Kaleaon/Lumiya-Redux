package com.lumiyaviewer.lumiya.render.avatar;

import android.opengl.Matrix;
import com.google.common.base.Objects;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.render.DrawableStore;
import com.lumiyaviewer.lumiya.render.RenderContext;
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectAvatarInfo;
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever;
import java.util.UUID;

public class DrawableAvatarStub implements ChatterNameRetriever.OnChatterNameUpdated {
    final SLObjectAvatarInfo avatarObject;
    private final ChatterNameRetriever chatterNameRetriever;
    volatile DrawableHoverText drawableNameTag;
    protected final DrawableStore drawableStore;
    private volatile String nameTag;

    DrawableAvatarStub(DrawableStore drawableStore, UUID uuid, SLObjectAvatarInfo objectAvatarInfo) {
        this.drawableStore = drawableStore;
        this.avatarObject = objectAvatarInfo;
        this.chatterNameRetriever = new ChatterNameRetriever(ChatterID.getUserChatterID(uuid, objectAvatarInfo.getId()), this, null);
    }

    private void setNameTag(String nameTag) {
        if (Objects.equal(this.nameTag, nameTag)) {
            return;
        }
        this.nameTag = nameTag;
        Object[] objArr = new Object[1];
        objArr[0] = nameTag != null ? nameTag : "null";
        Debug.Printf("DrawableAvatar: setting: nameTag = %s", objArr);
        if (nameTag != null) {
            this.drawableNameTag = new DrawableHoverText(this.drawableStore.textTextureCache, nameTag, Integer.MIN_VALUE);
        }
    }

    public void DrawNameTag(RenderContext renderContext) {
        DrawableHoverText drawableHoverText = this.drawableNameTag;
        float[] worldMatrix = getWorldMatrix(renderContext);
        if (drawableHoverText == null || worldMatrix == null) {
            return;
        }
        drawableHoverText.DrawAtWorld(renderContext, worldMatrix[12], worldMatrix[13], 0.75f + worldMatrix[14], 0.5f, renderContext.projectionMatrix, false, 0);
    }

    float[] getWorldMatrix(RenderContext renderContext) {
        if (!this.avatarObject.isMyAvatar() || this.avatarObject.parentID != 0) {
            return this.avatarObject.worldMatrix;
        }
        float[] floats = new float[32];
        LLQuaternion rotation = this.avatarObject.getRotation();
        if (rotation != null) {
            Matrix.setIdentityM(floats, 16);
            Matrix.translateM(floats, 16, renderContext.myAviPosition.x, renderContext.myAviPosition.y, renderContext.myAviPosition.z);
            Matrix.multiplyMM(floats, 0, floats, 16, rotation.getInverseMatrix(), 0);
        }
        return floats;
    }

    @Override
    public void onChatterNameUpdated(ChatterNameRetriever chatterNameRetriever) {
        setNameTag(chatterNameRetriever.getResolvedName());
    }
}
