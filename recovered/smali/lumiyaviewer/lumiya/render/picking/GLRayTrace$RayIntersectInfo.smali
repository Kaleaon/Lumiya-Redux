.class public Lcom/lumiyaviewer/lumiya/render/picking/GLRayTrace$RayIntersectInfo;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/render/picking/GLRayTrace;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RayIntersectInfo"
.end annotation


# instance fields
.field public final intersectPoint:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

.field public final s:F

.field public final t:F


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;FF)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/picking/GLRayTrace$RayIntersectInfo;->intersectPoint:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    iput p2, p0, Lcom/lumiyaviewer/lumiya/render/picking/GLRayTrace$RayIntersectInfo;->s:F

    iput p3, p0, Lcom/lumiyaviewer/lumiya/render/picking/GLRayTrace$RayIntersectInfo;->t:F

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "RayIntersectInfo{intersectPoint="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/picking/GLRayTrace$RayIntersectInfo;->intersectPoint:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", s="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/picking/GLRayTrace$RayIntersectInfo;->s:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", t="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/picking/GLRayTrace$RayIntersectInfo;->t:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
