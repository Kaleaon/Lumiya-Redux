.class public Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;
.super Ljava/lang/Object;


# instance fields
.field public final intersectInfo:Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

.field public final objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

.field public final pickDepth:F


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;F)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->intersectInfo:Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iput p3, p0, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->pickDepth:F

    return-void
.end method
