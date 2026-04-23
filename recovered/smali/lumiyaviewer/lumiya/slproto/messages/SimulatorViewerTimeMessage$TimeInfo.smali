.class public Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage$TimeInfo;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TimeInfo"
.end annotation


# instance fields
.field public SecPerDay:I

.field public SecPerYear:I

.field public SunAngVelocity:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public SunDirection:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public SunPhase:F

.field public UsecSinceStart:J


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
