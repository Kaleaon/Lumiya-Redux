.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction$ParcelData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction$AgentData;

.field public ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction$ParcelData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction$ParcelData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction$ParcelData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction$ParcelData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x38

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleViewerStartAuction(Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x1c

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction$ParcelData;->LocalID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction$ParcelData;->SnapshotID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction$ParcelData;->LocalID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction$ParcelData;->SnapshotID:Ljava/util/UUID;

    return-void
.end method
