.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease$Data;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease$AgentData;

.field public Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease$Data;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease$Data;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease$Data;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease$Data;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x28

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleParcelRelease(Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x2c

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease$Data;->LocalID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease$Data;->LocalID:I

    return-void
.end method
