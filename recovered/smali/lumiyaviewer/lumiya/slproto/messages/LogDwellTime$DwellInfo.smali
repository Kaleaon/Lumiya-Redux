.class public Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime$DwellInfo;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DwellInfo"
.end annotation


# instance fields
.field public AgentID:Ljava/util/UUID;

.field public AvgAgentsInView:I

.field public AvgViewerFPS:I

.field public Duration:F

.field public RegionX:I

.field public RegionY:I

.field public SessionID:Ljava/util/UUID;

.field public SimName:[B


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
