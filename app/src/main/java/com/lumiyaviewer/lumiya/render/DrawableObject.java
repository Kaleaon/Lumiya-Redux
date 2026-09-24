package com.lumiyaviewer.lumiya.render;

import android.opengl.GLES10;
import android.opengl.Matrix;
import com.google.common.base.Objects;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.openjpeg.OpenJPEG;
import com.lumiyaviewer.lumiya.render.avatar.AvatarSkeleton;
import com.lumiyaviewer.lumiya.render.avatar.DrawableAvatar;
import com.lumiyaviewer.lumiya.render.avatar.DrawableHoverText;
import com.lumiyaviewer.lumiya.render.drawable.DrawablePrim;
import com.lumiyaviewer.lumiya.render.glres.GLQuery;
import com.lumiyaviewer.lumiya.render.picking.CollisionBox;
import com.lumiyaviewer.lumiya.render.picking.GLRayTrace;
import com.lumiyaviewer.lumiya.render.picking.IntersectInfo;
import com.lumiyaviewer.lumiya.render.picking.IntersectPickable;
import com.lumiyaviewer.lumiya.render.picking.ObjectIntersectInfo;
import com.lumiyaviewer.lumiya.res.ResourceConsumer;
import com.lumiyaviewer.lumiya.slproto.mesh.MeshJointTranslations;
import com.lumiyaviewer.lumiya.slproto.objects.HoverText;
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectInfo;
import com.lumiyaviewer.lumiya.slproto.prims.PrimDrawParams;
import com.lumiyaviewer.lumiya.slproto.prims.PrimFlexibleInfo;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import javax.annotation.Nullable;

public class DrawableObject implements IntersectPickable, ResourceConsumer {
    private static final int INVISIBLE_FRAMES_APPEAR = 10;
    private static final int INVISIBLE_FRAMES_DISAPPEAR = 10;
    private final DrawableAvatar attachedTo;
    private volatile DrawableHoverText drawableHoverText;
    private volatile DrawablePrim drawablePrim;
    private final DrawableStore drawableStore;
    private volatile PrimFlexibleInfo flexibleInfo;
    private volatile HoverText hoverText;
    private final float[] objCoordsData;
    private final int objCoordsScale;
    private final SLObjectInfo objInfo;
    private GLQuery occlusionQuery = null;
    private boolean isInvisible = false;
    private int invisibleCount = 0;
    private int invisibleFrames = 0;

    public DrawableObject(DrawableStore drawableStore, SLObjectInfo objectInfo, DrawableAvatar drawableAvatar) {
        this.drawableStore = drawableStore;
        this.objInfo = objectInfo;
        this.attachedTo = drawableAvatar;
        this.objCoordsData = objectInfo.getObjectCoords().getData();
        this.objCoordsScale = objectInfo.getObjectCoords().getElementOffset(1);
        setPrimDrawParams(objectInfo.getPrimDrawParams());
        setHoverText(objectInfo.getHoverText());
    }

    /** Rebuild faces that show the wearer's bakes (Bakes on Mesh) after an appearance change. */
    public void refreshBakesOnMesh() {
        PrimDrawParams primDrawParams = this.objInfo.getPrimDrawParams();
        if (this.attachedTo != null && primDrawParams != null && primDrawParams.usesBakesOnMesh()) {
            setPrimDrawParams(primDrawParams);
        }
    }

    public final void ApplyJointTranslations(MeshJointTranslations meshJointTranslations) {
        DrawablePrim drawablePrim = this.drawablePrim;
        if (drawablePrim != null) {
            drawablePrim.ApplyJointTranslations(meshJointTranslations);
        }
    }

    public final int Draw(RenderContext renderContext, int i) {
        DrawablePrim drawablePrim = this.drawablePrim;
        float[] worldMatrix = this.objInfo.worldMatrix;
        PrimFlexibleInfo primFlexibleInfo = this.flexibleInfo;
        if (drawablePrim == null || worldMatrix == null || !(!this.isInvisible)) {
            return 0;
        }
        float f = this.objCoordsData[this.objCoordsScale];
        float f2 = this.objCoordsData[this.objCoordsScale + 1];
        float f3 = this.objCoordsData[this.objCoordsScale + 2];
        renderContext.glObjWorldPushAndMultMatrixf(worldMatrix, 0);
        renderContext.glPushObjectScale(f, f2, f3);
        if (primFlexibleInfo != null) {
            primFlexibleInfo.doFlexibleUpdate(this.objInfo.getPrimDrawParams().getVolumeParams().FlexiParams, renderContext.objWorldMatrix.getMatrixData(), renderContext.objWorldMatrix.getMatrixDataOffset(), f, f2, f3);
        }
        int DrawFast20 = renderContext.hasGL20 ? drawablePrim.DrawFast20(renderContext, false, primFlexibleInfo, i) : drawablePrim.Draw(renderContext, false, primFlexibleInfo, i);
        renderContext.glPopObjectScale();
        renderContext.glObjWorldPopMatrix();
        return DrawFast20;
    }

    public void DrawHoverText(RenderContext renderContext, boolean z) {
        float f;
        DrawableHoverText drawableHoverText = this.drawableHoverText;
        HoverText hoverText = this.hoverText;
        float[] worldMatrix = this.objInfo.worldMatrix;
        if (drawableHoverText == null || worldMatrix == null || hoverText == null) {
            return;
        }
        float f2 = this.objInfo.worldMatrix[12];
        float f3 = this.objInfo.worldMatrix[13];
        float f4 = this.objInfo.worldMatrix[14];
        if (z) {
            f = 0.0f;
        } else {
            float f5 = this.objCoordsData[this.objCoordsScale];
            float f6 = this.objCoordsData[this.objCoordsScale + 1];
            float f7 = this.objCoordsData[this.objCoordsScale + 2];
            float max = (Math.max(Math.max(f5, f6), f7) + 0.01f) / 2.0f;
            LLVector3 vector3 = new LLVector3(renderContext.frameCamera.x - f2, renderContext.frameCamera.y - f3, renderContext.frameCamera.z - f4);
            vector3.normVec();
            vector3.mul(max);
            f2 += vector3.x;
            f3 += vector3.y;
            f4 += vector3.z;
            f = f7 / 2.0f;
        }
        drawableHoverText.DrawAtWorld(renderContext, f2, f3, f4, f, z ? renderContext.projectionHUDMatrix : renderContext.projectionMatrix, true, hoverText.color());
    }

    void DrawIfPicked(RenderContext renderContext, SLObjectInfo objectInfo) {
        if (this.objInfo == objectInfo) {
            DrawablePrim drawablePrim = this.drawablePrim;
            float[] worldMatrix = this.objInfo.worldMatrix;
            PrimFlexibleInfo primFlexibleInfo = this.flexibleInfo;
            if (drawablePrim == null || worldMatrix == null) {
                return;
            }
            float f = this.objCoordsData[this.objCoordsScale];
            float f2 = this.objCoordsData[this.objCoordsScale + 1];
            float f3 = this.objCoordsData[this.objCoordsScale + 2];
            renderContext.glObjWorldPushAndMultMatrixf(worldMatrix, 0);
            if (primFlexibleInfo != null) {
                primFlexibleInfo.doFlexibleUpdate(this.objInfo.getPrimDrawParams().getVolumeParams().FlexiParams, renderContext.objWorldMatrix.getMatrixData(), renderContext.objWorldMatrix.getMatrixDataOffset(), f, f2, f3);
            }
            renderContext.glPushObjectScale(f, f2, f3);
            GLES10.glDepthFunc(515);
            drawablePrim.Draw(renderContext, true, primFlexibleInfo, 3);
            GLES10.glDepthFunc(GLES10.GL_LESS);
            renderContext.glPopObjectScale();
            renderContext.glObjWorldPopMatrix();
        }
    }

    public final int DrawRigged(RenderContext renderContext, AvatarSkeleton avatarSkeleton, int i) {
        DrawablePrim drawablePrim = this.drawablePrim;
        if (drawablePrim == null) {
            return 0;
        }
        if ((i & 1) != 0) {
            drawablePrim.UpdateRigged(renderContext, avatarSkeleton);
        }
        return renderContext.hasGL20 ? drawablePrim.DrawFast20(renderContext, false, null, i) : drawablePrim.Draw(renderContext, false, null, i);
    }

    public final int DrawRigged30(RenderContext renderContext, int i) {
        DrawablePrim drawablePrim = this.drawablePrim;
        if (drawablePrim == null || !drawablePrim.isRiggedMesh()) {
            return 0;
        }
        return drawablePrim.DrawRigged30(renderContext, i);
    }

    @Override
    public void OnResourceReady(Object obj, boolean z) {
        if (obj instanceof DrawablePrim) {
            DrawablePrim drawablePrim = (DrawablePrim) obj;
            this.drawablePrim = drawablePrim;
            if (!drawablePrim.isRiggedMesh() || this.attachedTo == null) {
                return;
            }
            this.attachedTo.onRiggedMeshReady(this);
        }
    }

    @Override
    public ObjectIntersectInfo PickObject(RenderContext renderContext, float f, float f2, float f3) {
        IntersectInfo IntersectRay;
        DrawablePrim drawablePrim = this.drawablePrim;
        float[] worldMatrix = this.objInfo.worldMatrix;
        if (drawablePrim == null || worldMatrix == null) {
            return null;
        }
        int[] viewportRect = renderContext.viewportRect;
        float[] floats = new float[32];
        float[] floats2 = new float[6];
        float f4 = viewportRect[3] - f2;
        float f5 = this.objCoordsData[this.objCoordsScale];
        float f6 = this.objCoordsData[this.objCoordsScale + 1];
        float f7 = this.objCoordsData[this.objCoordsScale + 2];
        renderContext.glObjWorldPushAndMultMatrixf(worldMatrix, 0);
        if (renderContext.hasGL20) {
            Matrix.scaleM(floats, 0, renderContext.objWorldMatrix.getMatrixData(), renderContext.objWorldMatrix.getMatrixDataOffset(), f5, f6, f7);
            RenderContext.gluUnProject(f, f4, 0.0f, floats, 0, renderContext.modelViewMatrix.getMatrixData(), renderContext.modelViewMatrix.getMatrixDataOffset(), viewportRect, 0, floats2, 0);
            RenderContext.gluUnProject(f, f4, 1.0f, floats, 0, renderContext.modelViewMatrix.getMatrixData(), renderContext.modelViewMatrix.getMatrixDataOffset(), viewportRect, 0, floats2, 3);
        } else {
            Matrix.scaleM(floats, 16, renderContext.objWorldMatrix.getMatrixData(), renderContext.objWorldMatrix.getMatrixDataOffset(), f5, f6, f7);
            Matrix.multiplyMM(floats, 0, renderContext.modelViewMatrix.getMatrixData(), renderContext.modelViewMatrix.getMatrixDataOffset(), floats, 16);
            MatrixStack activeProjectionMatrix = renderContext.getActiveProjectionMatrix();
            if (activeProjectionMatrix != null) {
                RenderContext.gluUnProject(f, f4, 0.0f, floats, 0, activeProjectionMatrix.getMatrixData(), activeProjectionMatrix.getMatrixDataOffset(), viewportRect, 0, floats2, 0);
                RenderContext.gluUnProject(f, f4, 1.0f, floats, 0, activeProjectionMatrix.getMatrixData(), activeProjectionMatrix.getMatrixDataOffset(), viewportRect, 0, floats2, 3);
            }
        }
        renderContext.glObjWorldPopMatrix();
        LLVector3 vector3 = new LLVector3(floats2[0], floats2[1], floats2[2]);
        LLVector3 vector33 = new LLVector3(floats2[3], floats2[4], floats2[5]);
        boolean z = false;
        LLVector3[] vertices = CollisionBox.getInstance().vertices;
        int i = 0;
        while (true) {
            if (i >= 12) {
                break;
            }
            if (GLRayTrace.intersect_RayTriangle(vector3, vector33, vertices, i * 3) != null) {
                z = true;
                break;
            }
            i++;
        }
        if (!z || (IntersectRay = drawablePrim.IntersectRay(vector3, vector33)) == null) {
            return null;
        }
        float intersectionDepth = GLRayTrace.getIntersectionDepth(renderContext, IntersectRay.intersectPoint, floats);
        if (intersectionDepth >= f3) {
            return new ObjectIntersectInfo(IntersectRay, this.objInfo, intersectionDepth);
        }
        return null;
    }

    final void TestOcclusion(RenderContext renderContext, float[] floats) {
        float[] worldMatrix = this.objInfo.worldMatrix;
        if (worldMatrix != null) {
            if (this.occlusionQuery == null) {
                this.occlusionQuery = new GLQuery(renderContext.glResourceManager);
            }
            if (this.isInvisible && this.invisibleFrames <= 10) {
                this.invisibleFrames++;
                return;
            }
            GLQuery.OcclusionQueryResult occlusionQueryResult = this.occlusionQuery.getOcclusionQueryResult();
            if (occlusionQueryResult == GLQuery.OcclusionQueryResult.Invisible) {
                this.invisibleFrames = 0;
                if (!this.isInvisible) {
                    this.invisibleCount++;
                    if (this.invisibleCount > 10) {
                        int checkFrustrumOcclusion = OpenJPEG.checkFrustrumOcclusion(floats, worldMatrix, this.objCoordsData[this.objCoordsScale], this.objCoordsData[this.objCoordsScale + 1], this.objCoordsData[this.objCoordsScale + 2]);
                        if (checkFrustrumOcclusion == 0) {
                            this.invisibleCount = 0;
                        } else {
                            Debug.Printf("Occlusion: object seriously invisible %s (frustrumTest %d)", this, Integer.valueOf(checkFrustrumOcclusion));
                            this.isInvisible = true;
                        }
                    }
                }
            } else if (occlusionQueryResult == GLQuery.OcclusionQueryResult.Visible) {
                this.invisibleCount = 0;
                if (this.isInvisible) {
                    Debug.Printf("Occlusion: object visible again %s", this);
                    this.isInvisible = false;
                }
            }
            if (this.occlusionQuery.isQueryRunning()) {
                return;
            }
            float f = this.objCoordsData[this.objCoordsScale] * 1.001f;
            float f2 = this.objCoordsData[this.objCoordsScale + 1] * 1.001f;
            float f3 = this.objCoordsData[this.objCoordsScale + 2] * 1.001f;
            renderContext.glObjWorldPushAndMultMatrixf(worldMatrix, 0);
            renderContext.glPushObjectScale(f, f2, f3);
            renderContext.boundingBox.OcclusionQuery(renderContext, this.occlusionQuery);
            renderContext.glPopObjectScale();
            renderContext.glObjWorldPopMatrix();
        }
    }

    public SLObjectInfo getObjectInfo() {
        return this.objInfo;
    }

    public final boolean hasExtendedBones() {
        DrawablePrim drawablePrim = this.drawablePrim;
        if (drawablePrim != null) {
            return drawablePrim.hasExtendedBones();
        }
        return false;
    }

    public final boolean isRiggedMesh() {
        DrawablePrim drawablePrim = this.drawablePrim;
        if (drawablePrim != null) {
            return drawablePrim.isRiggedMesh();
        }
        return false;
    }

    public void setHoverText(@Nullable HoverText hoverText) {
        if (Objects.equal(this.hoverText, hoverText)) {
            return;
        }
        if (hoverText == null) {
            this.drawableHoverText = null;
        } else if (!hoverText.sameText(this.hoverText)) {
            this.drawableHoverText = new DrawableHoverText(this.drawableStore.textTextureCache, hoverText.text(), 0);
        }
        this.hoverText = hoverText;
    }

    public void setPrimDrawParams(PrimDrawParams primDrawParams) {
        if (this.attachedTo != null && primDrawParams != null) {
            primDrawParams = primDrawParams.withBakes(this.attachedTo.getAvatarBakes());
        }
        this.drawableStore.primCache.RequestResource(primDrawParams, this);
        if (primDrawParams.getVolumeParams().isFlexible()) {
            this.flexibleInfo = new PrimFlexibleInfo();
        } else {
            this.flexibleInfo = null;
        }
    }
}
