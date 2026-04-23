.class public Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Info"
.end annotation


# instance fields
.field public AgentID:Ljava/util/UUID;

.field public LocationID:I

.field public RegionHandle:J

.field public SeedCapability:[B

.field public SimAccess:I

.field public SimIP:Ljava/net/Inet4Address;

.field public SimPort:I

.field public TeleportFlags:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
