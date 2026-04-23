.class public Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;
.super Ljava/lang/Object;


# instance fields
.field public final faceID:I

.field public final faceKnown:Z

.field public final intersectPoint:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

.field public final s:F

.field public final t:F

.field public final u:F

.field public final v:F


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;[FI)V
    .locals 6

    const/4 v1, 0x4

    const/4 v5, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->intersectPoint:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->intersectPoint:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    iget v0, p1, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->faceID:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->faceID:I

    iget v0, p1, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->s:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->s:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->t:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->t:F

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->faceKnown:Z

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->faceKnown:Z

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->faceKnown:Z

    if-eqz v0, :cond_0

    const/16 v0, 0x8

    new-array v0, v0, [F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->s:F

    aput v2, v0, v5

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->t:F

    const/4 v3, 0x1

    aput v2, v0, v3

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x3

    aput v2, v0, v3

    move-object v2, p2

    move v3, p3

    move-object v4, v0

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->multiplyMV([FI[FI[FI)V

    aget v1, v0, v1

    iput v1, p0, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->u:F

    const/4 v1, 0x5

    aget v0, v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->v:F

    :goto_0
    return-void

    :cond_0
    iget v0, p1, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->u:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->u:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->v:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->v:F

    goto :goto_0
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;)V
    .locals 2

    const/4 v1, 0x0

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->intersectPoint:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    iput v1, p0, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->faceID:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->u:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->v:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->s:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->t:F

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->faceKnown:Z

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;IFF)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->intersectPoint:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    iput p2, p0, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->faceID:I

    iput p3, p0, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->u:F

    iput p4, p0, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->v:F

    iput p3, p0, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->s:F

    iput p4, p0, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->t:F

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->faceKnown:Z

    return-void
.end method
