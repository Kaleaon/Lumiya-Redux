.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$AgentData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AgentData"
.end annotation


# instance fields
.field public AgentID:Ljava/util/UUID;

.field public AgentsInView:I

.field public FPS:F

.field public IP:Ljava/net/Inet4Address;

.field public MetersTraveled:D

.field public Ping:F

.field public RegionsVisited:I

.field public RunTime:F

.field public SessionID:Ljava/util/UUID;

.field public SimFPS:F

.field public StartTime:I

.field public SysCPU:[B

.field public SysGPU:[B

.field public SysOS:[B

.field public SysRAM:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
