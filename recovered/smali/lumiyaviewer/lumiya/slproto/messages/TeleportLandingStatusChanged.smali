.class public Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandingStatusChanged;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandingStatusChanged$RegionData;
    }
.end annotation


# instance fields
.field public RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandingStatusChanged$RegionData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandingStatusChanged;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandingStatusChanged$RegionData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandingStatusChanged$RegionData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandingStatusChanged;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandingStatusChanged$RegionData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0xc

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleTeleportLandingStatusChanged(Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandingStatusChanged;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x6d

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandingStatusChanged;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandingStatusChanged$RegionData;

    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandingStatusChanged$RegionData;->RegionHandle:J

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandingStatusChanged;->packLong(Ljava/nio/ByteBuffer;J)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandingStatusChanged;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandingStatusChanged$RegionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandingStatusChanged;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandingStatusChanged$RegionData;->RegionHandle:J

    return-void
.end method
