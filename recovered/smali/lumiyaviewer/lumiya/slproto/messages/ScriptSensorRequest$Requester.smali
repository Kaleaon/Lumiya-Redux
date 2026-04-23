.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Requester"
.end annotation


# instance fields
.field public Arc:F

.field public Range:F

.field public RegionHandle:J

.field public RequestID:Ljava/util/UUID;

.field public SearchDir:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

.field public SearchID:Ljava/util/UUID;

.field public SearchName:[B

.field public SearchPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public SearchRegions:I

.field public SourceID:Ljava/util/UUID;

.field public Type:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
