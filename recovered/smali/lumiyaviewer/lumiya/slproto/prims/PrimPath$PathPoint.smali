.class public Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PathPoint"
.end annotation


# instance fields
.field TexT:F

.field pos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field rot:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

.field scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->pos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->rot:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->TexT:F

    return-void
.end method
