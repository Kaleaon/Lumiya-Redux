.class public Lcom/lumiyaviewer/lumiya/render/DrawableObject;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/render/picking/IntersectPickable;
.implements Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;


# static fields
.field private static final INVISIBLE_FRAMES_APPEAR:I = 0xa

.field private static final INVISIBLE_FRAMES_DISAPPEAR:I = 0xa


# instance fields
.field private final attachedTo:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;

.field private volatile drawableHoverText:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;

.field private volatile drawablePrim:Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;

.field private final drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

.field private volatile flexibleInfo:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;

.field private volatile hoverText:Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;

.field private invisibleCount:I

.field private invisibleFrames:I

.field private isInvisible:Z

.field private final objCoordsData:[F

.field private final objCoordsScale:I

.field private final objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

.field private occlusionQuery:Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/DrawableStore;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->occlusionQuery:Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->isInvisible:Z

    iput v1, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->invisibleCount:I

    iput v1, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->invisibleFrames:I

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->attachedTo:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getObjectCoords()Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->getData()[F

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsData:[F

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getObjectCoords()Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->getElementOffset(I)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsScale:I

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getPrimDrawParams()Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->setPrimDrawParams(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;)V

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getHoverText()Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->setHoverText(Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;)V

    return-void
.end method


# virtual methods
.method public final ApplyJointTranslations(Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshJointTranslations;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->drawablePrim:Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->ApplyJointTranslations(Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshJointTranslations;)V

    :cond_0
    return-void
.end method

.method public final Draw(Lcom/lumiyaviewer/lumiya/render/RenderContext;I)I
    .locals 9

    const/4 v8, 0x0

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->drawablePrim:Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->worldMatrix:[F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->flexibleInfo:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;

    if-eqz v7, :cond_2

    if-eqz v1, :cond_2

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->isInvisible:Z

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsData:[F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsScale:I

    aget v4, v2, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsData:[F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsScale:I

    add-int/lit8 v3, v3, 0x1

    aget v5, v2, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsData:[F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsScale:I

    add-int/lit8 v3, v3, 0x2

    aget v6, v2, v3

    invoke-virtual {p1, v1, v8}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjWorldPushAndMultMatrixf([FI)V

    invoke-virtual {p1, v4, v5, v6}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glPushObjectScale(FFF)V

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getPrimDrawParams()Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;->getVolumeParams()Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    move-result-object v1

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->FlexiParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->objWorldMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v2

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->objWorldMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v3

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->doFlexibleUpdate(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;[FIFFF)Z

    :cond_0
    iget-boolean v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v1, :cond_1

    invoke-virtual {v7, p1, v8, v0, p2}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->DrawFast20(Lcom/lumiyaviewer/lumiya/render/RenderContext;ZLcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;I)I

    move-result v0

    :goto_0
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glPopObjectScale()V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjWorldPopMatrix()V

    return v0

    :cond_1
    invoke-virtual {v7, p1, v8, v0, p2}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->Draw(Lcom/lumiyaviewer/lumiya/render/RenderContext;ZLcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;I)I

    move-result v0

    goto :goto_0

    :cond_2
    return v8
.end method

.method public DrawHoverText(Lcom/lumiyaviewer/lumiya/render/RenderContext;Z)V
    .locals 12

    const/high16 v11, 0x40000000    # 2.0f

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->drawableHoverText:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->hoverText:Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->worldMatrix:[F

    if-eqz v0, :cond_0

    if-eqz v2, :cond_0

    if-eqz v1, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->worldMatrix:[F

    const/16 v3, 0xc

    aget v2, v2, v3

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->worldMatrix:[F

    const/16 v4, 0xd

    aget v3, v3, v4

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->worldMatrix:[F

    const/16 v5, 0xe

    aget v4, v4, v5

    if-nez p2, :cond_1

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsData:[F

    iget v6, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsScale:I

    aget v5, v5, v6

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsData:[F

    iget v7, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsScale:I

    add-int/lit8 v7, v7, 0x1

    aget v6, v6, v7

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsData:[F

    iget v8, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsScale:I

    add-int/lit8 v8, v8, 0x2

    aget v7, v7, v8

    invoke-static {v5, v6}, Ljava/lang/Math;->max(FF)F

    move-result v5

    invoke-static {v5, v7}, Ljava/lang/Math;->max(FF)F

    move-result v5

    const v6, 0x3c23d70a    # 0.01f

    add-float/2addr v5, v6

    div-float/2addr v5, v11

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v8, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameCamera:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v8, v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    sub-float/2addr v8, v2

    iget-object v9, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameCamera:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v9, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    sub-float/2addr v9, v3

    iget-object v10, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameCamera:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v10, v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    sub-float/2addr v10, v4

    invoke-direct {v6, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->normVec()F

    invoke-virtual {v6, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mul(F)V

    iget v5, v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    add-float/2addr v2, v5

    iget v5, v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    add-float/2addr v3, v5

    iget v5, v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    add-float/2addr v4, v5

    div-float v5, v7, v11

    :goto_0
    if-eqz p2, :cond_2

    iget-object v6, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->projectionHUDMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    :goto_1
    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;->color()I

    move-result v8

    const/4 v7, 0x1

    move-object v1, p1

    invoke-virtual/range {v0 .. v8}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;->DrawAtWorld(Lcom/lumiyaviewer/lumiya/render/RenderContext;FFFFLcom/lumiyaviewer/lumiya/render/MatrixStack;ZI)V

    :cond_0
    return-void

    :cond_1
    const/4 v5, 0x0

    goto :goto_0

    :cond_2
    iget-object v6, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->projectionMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    goto :goto_1
.end method

.method DrawIfPicked(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V
    .locals 8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    if-ne v0, p2, :cond_1

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->drawablePrim:Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->worldMatrix:[F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->flexibleInfo:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;

    if-eqz v7, :cond_1

    if-eqz v1, :cond_1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsData:[F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsScale:I

    aget v4, v2, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsData:[F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsScale:I

    add-int/lit8 v3, v3, 0x1

    aget v5, v2, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsData:[F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsScale:I

    add-int/lit8 v3, v3, 0x2

    aget v6, v2, v3

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjWorldPushAndMultMatrixf([FI)V

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getPrimDrawParams()Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;->getVolumeParams()Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    move-result-object v1

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->FlexiParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->objWorldMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v2

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->objWorldMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v3

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->doFlexibleUpdate(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;[FIFFF)Z

    :cond_0
    invoke-virtual {p1, v4, v5, v6}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glPushObjectScale(FFF)V

    const/16 v1, 0x203

    invoke-static {v1}, Landroid/opengl/GLES10;->glDepthFunc(I)V

    const/4 v1, 0x1

    const/4 v2, 0x3

    invoke-virtual {v7, p1, v1, v0, v2}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->Draw(Lcom/lumiyaviewer/lumiya/render/RenderContext;ZLcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;I)I

    const/16 v0, 0x201

    invoke-static {v0}, Landroid/opengl/GLES10;->glDepthFunc(I)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glPopObjectScale()V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjWorldPopMatrix()V

    :cond_1
    return-void
.end method

.method public final DrawRigged(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;I)I
    .locals 4

    const/4 v3, 0x0

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->drawablePrim:Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;

    if-eqz v0, :cond_2

    and-int/lit8 v1, p3, 0x1

    if-eqz v1, :cond_0

    invoke-virtual {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->UpdateRigged(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;)Z

    :cond_0
    iget-boolean v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v1, :cond_1

    invoke-virtual {v0, p1, v2, v3, p3}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->DrawFast20(Lcom/lumiyaviewer/lumiya/render/RenderContext;ZLcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;I)I

    move-result v0

    return v0

    :cond_1
    invoke-virtual {v0, p1, v2, v3, p3}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->Draw(Lcom/lumiyaviewer/lumiya/render/RenderContext;ZLcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;I)I

    move-result v0

    return v0

    :cond_2
    return v2
.end method

.method public final DrawRigged30(Lcom/lumiyaviewer/lumiya/render/RenderContext;I)I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->drawablePrim:Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->isRiggedMesh()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->DrawRigged30(Lcom/lumiyaviewer/lumiya/render/RenderContext;I)I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public OnResourceReady(Ljava/lang/Object;Z)V
    .locals 1

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->drawablePrim:Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->isRiggedMesh()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->attachedTo:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->attachedTo:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->onRiggedMeshReady(Lcom/lumiyaviewer/lumiya/render/DrawableObject;)V

    :cond_0
    return-void
.end method

.method public PickObject(Lcom/lumiyaviewer/lumiya/render/RenderContext;FFF)Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;
    .locals 16

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->drawablePrim:Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->worldMatrix:[F

    if-eqz v13, :cond_4

    if-eqz v2, :cond_4

    move-object/from16 v0, p1

    iget-object v9, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->viewportRect:[I

    const/16 v1, 0x20

    new-array v1, v1, [F

    const/4 v3, 0x6

    new-array v11, v3, [F

    const/4 v3, 0x3

    aget v3, v9, v3

    int-to-float v3, v3

    sub-float v14, v3, p3

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsData:[F

    move-object/from16 v0, p0

    iget v4, v0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsScale:I

    aget v5, v3, v4

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsData:[F

    move-object/from16 v0, p0

    iget v4, v0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsScale:I

    add-int/lit8 v4, v4, 0x1

    aget v6, v3, v4

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsData:[F

    move-object/from16 v0, p0

    iget v4, v0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsScale:I

    add-int/lit8 v4, v4, 0x2

    aget v7, v3, v4

    const/4 v3, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjWorldPushAndMultMatrixf([FI)V

    move-object/from16 v0, p1

    iget-boolean v2, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v2, :cond_2

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->objWorldMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v3

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->objWorldMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v4

    const/4 v2, 0x0

    invoke-static/range {v1 .. v7}, Landroid/opengl/Matrix;->scaleM([FI[FIFFF)V

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v7

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v8

    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v10, 0x0

    const/4 v12, 0x0

    move/from16 v2, p2

    move v3, v14

    move-object v5, v1

    invoke-static/range {v2 .. v12}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->gluUnProject(FFF[FI[FI[II[FI)I

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v7

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v8

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    const/4 v10, 0x0

    const/4 v12, 0x3

    move/from16 v2, p2

    move v3, v14

    move-object v5, v1

    invoke-static/range {v2 .. v12}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->gluUnProject(FFF[FI[FI[II[FI)I

    :cond_0
    :goto_0
    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjWorldPopMatrix()V

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v2, 0x0

    aget v2, v11, v2

    const/4 v3, 0x1

    aget v3, v11, v3

    const/4 v5, 0x2

    aget v5, v11, v5

    invoke-direct {v4, v2, v3, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v2, 0x3

    aget v2, v11, v2

    const/4 v3, 0x4

    aget v3, v11, v3

    const/4 v6, 0x5

    aget v6, v11, v6

    invoke-direct {v5, v2, v3, v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v2, 0x0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/picking/CollisionBox;->getInstance()Lcom/lumiyaviewer/lumiya/render/picking/CollisionBox;

    move-result-object v3

    iget-object v6, v3, Lcom/lumiyaviewer/lumiya/render/picking/CollisionBox;->vertices:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v3, 0x0

    :goto_1
    const/16 v7, 0xc

    if-ge v3, v7, :cond_1

    mul-int/lit8 v7, v3, 0x3

    invoke-static {v4, v5, v6, v7}, Lcom/lumiyaviewer/lumiya/render/picking/GLRayTrace;->intersect_RayTriangle(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;I)Lcom/lumiyaviewer/lumiya/render/picking/GLRayTrace$RayIntersectInfo;

    move-result-object v7

    if-eqz v7, :cond_3

    const/4 v2, 0x1

    :cond_1
    if-eqz v2, :cond_4

    invoke-virtual {v13, v4, v5}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->IntersectRay(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

    move-result-object v2

    if-eqz v2, :cond_4

    iget-object v3, v2, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->intersectPoint:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    move-object/from16 v0, p1

    invoke-static {v0, v3, v1}, Lcom/lumiyaviewer/lumiya/render/picking/GLRayTrace;->getIntersectionDepth(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;[F)F

    move-result v1

    cmpl-float v3, v1, p4

    if-ltz v3, :cond_4

    new-instance v3, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-direct {v3, v2, v4, v1}, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;-><init>(Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;F)V

    return-object v3

    :cond_2
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->objWorldMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v3

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->objWorldMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v4

    const/16 v2, 0x10

    invoke-static/range {v1 .. v7}, Landroid/opengl/Matrix;->scaleM([FI[FIFFF)V

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v3

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v4

    const/4 v2, 0x0

    const/16 v6, 0x10

    move-object v5, v1

    invoke-static/range {v1 .. v6}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->getActiveProjectionMatrix()Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    move-result-object v15

    if-eqz v15, :cond_0

    invoke-virtual {v15}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v7

    invoke-virtual {v15}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v8

    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v10, 0x0

    const/4 v12, 0x0

    move/from16 v2, p2

    move v3, v14

    move-object v5, v1

    invoke-static/range {v2 .. v12}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->gluUnProject(FFF[FI[FI[II[FI)I

    invoke-virtual {v15}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v7

    invoke-virtual {v15}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v8

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    const/4 v10, 0x0

    const/4 v12, 0x3

    move/from16 v2, p2

    move v3, v14

    move-object v5, v1

    invoke-static/range {v2 .. v12}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->gluUnProject(FFF[FI[FI[II[FI)I

    goto/16 :goto_0

    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_1

    :cond_4
    const/4 v1, 0x0

    return-object v1
.end method

.method final TestOcclusion(Lcom/lumiyaviewer/lumiya/render/RenderContext;[F)V
    .locals 8

    const/16 v3, 0xa

    const/4 v7, 0x1

    const v6, 0x3f8020c5    # 1.001f

    const/4 v5, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->worldMatrix:[F

    if-eqz v0, :cond_3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->occlusionQuery:Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;

    if-nez v1, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->occlusionQuery:Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;

    :cond_0
    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->isInvisible:Z

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->invisibleFrames:I

    if-le v1, v3, :cond_6

    :cond_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->occlusionQuery:Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;->getOcclusionQueryResult()Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$OcclusionQueryResult;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$OcclusionQueryResult;->Invisible:Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$OcclusionQueryResult;

    if-ne v1, v2, :cond_5

    iput v5, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->invisibleFrames:I

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->isInvisible:Z

    if-nez v1, :cond_2

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->invisibleCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->invisibleCount:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->invisibleCount:I

    if-le v1, v3, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsData:[F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsScale:I

    aget v1, v1, v2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsData:[F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsScale:I

    add-int/lit8 v3, v3, 0x1

    aget v2, v2, v3

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsData:[F

    iget v4, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsScale:I

    add-int/lit8 v4, v4, 0x2

    aget v3, v3, v4

    invoke-static {p2, v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->checkFrustrumOcclusion([F[FFFF)I

    move-result v1

    if-nez v1, :cond_4

    iput v5, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->invisibleCount:I

    :cond_2
    :goto_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->occlusionQuery:Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;->isQueryRunning()Z

    move-result v1

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsData:[F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsScale:I

    aget v1, v1, v2

    mul-float/2addr v1, v6

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsData:[F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsScale:I

    add-int/lit8 v3, v3, 0x1

    aget v2, v2, v3

    mul-float/2addr v2, v6

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsData:[F

    iget v4, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objCoordsScale:I

    add-int/lit8 v4, v4, 0x2

    aget v3, v3, v4

    mul-float/2addr v3, v6

    invoke-virtual {p1, v0, v5}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjWorldPushAndMultMatrixf([FI)V

    invoke-virtual {p1, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glPushObjectScale(FFF)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->boundingBox:Lcom/lumiyaviewer/lumiya/render/BoundingBox;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->occlusionQuery:Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;

    invoke-virtual {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/render/BoundingBox;->OcclusionQuery(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glPopObjectScale()V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjWorldPopMatrix()V

    :cond_3
    :goto_1
    return-void

    :cond_4
    const-string/jumbo v2, "Occlusion: object seriously invisible %s (frustrumTest %d)"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p0, v3, v5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v3, v7

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iput-boolean v7, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->isInvisible:Z

    goto :goto_0

    :cond_5
    sget-object v2, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$OcclusionQueryResult;->Visible:Lcom/lumiyaviewer/lumiya/render/glres/GLQuery$OcclusionQueryResult;

    if-ne v1, v2, :cond_2

    iput v5, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->invisibleCount:I

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->isInvisible:Z

    if-eqz v1, :cond_2

    const-string/jumbo v1, "Occlusion: object visible again %s"

    new-array v2, v7, [Ljava/lang/Object;

    aput-object p0, v2, v5

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iput-boolean v5, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->isInvisible:Z

    goto :goto_0

    :cond_6
    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->invisibleFrames:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->invisibleFrames:I

    goto :goto_1
.end method

.method public getObjectInfo()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    return-object v0
.end method

.method public final hasExtendedBones()Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->drawablePrim:Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->hasExtendedBones()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final isRiggedMesh()Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->drawablePrim:Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->isRiggedMesh()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setHoverText(Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;)V
    .locals 4
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->hoverText:Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;

    invoke-static {v0, p1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    if-nez p1, :cond_2

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->drawableHoverText:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;

    :cond_0
    :goto_0
    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->hoverText:Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;

    :cond_1
    return-void

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->hoverText:Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;->sameText(Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->textTextureCache:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextTextureCache;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;->text()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextTextureCache;Ljava/lang/String;I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->drawableHoverText:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;

    goto :goto_0
.end method

.method public setPrimDrawParams(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->primCache:Lcom/lumiyaviewer/lumiya/res/geometry/PrimCache;

    invoke-virtual {v0, p1, p0}, Lcom/lumiyaviewer/lumiya/res/geometry/PrimCache;->RequestResource(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;->getVolumeParams()Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->isFlexible()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->flexibleInfo:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;

    :goto_0
    return-void

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->flexibleInfo:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;

    goto :goto_0
.end method
