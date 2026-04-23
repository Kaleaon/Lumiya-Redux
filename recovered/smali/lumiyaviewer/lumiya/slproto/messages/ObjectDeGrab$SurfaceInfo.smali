.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDeGrab$SurfaceInfo;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDeGrab;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SurfaceInfo"
.end annotation


# instance fields
.field public Binormal:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public FaceIndex:I

.field public Normal:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public STCoord:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public UVCoord:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
