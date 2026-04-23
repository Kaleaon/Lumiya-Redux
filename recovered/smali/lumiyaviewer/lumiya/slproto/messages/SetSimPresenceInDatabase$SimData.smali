.class public Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SimData"
.end annotation


# instance fields
.field public AgentCount:I

.field public GridX:I

.field public GridY:I

.field public HostName:[B

.field public PID:I

.field public RegionID:Ljava/util/UUID;

.field public Status:[B

.field public TimeToLive:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
