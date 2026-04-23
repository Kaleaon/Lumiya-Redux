.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$Data;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$ParcelData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$AgentData;

.field public Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$Data;

.field public ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$ParcelData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$Data;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$Data;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$Data;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$ParcelData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$ParcelData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$ParcelData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x43

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleParcelBuy(Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x2b

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$Data;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$Data;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$Data;->IsGroupOwned:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$Data;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$Data;->RemoveContribution:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$Data;->LocalID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$Data;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$Data;->Final:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$ParcelData;->Price:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$ParcelData;->Area:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$Data;->GroupID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$Data;->IsGroupOwned:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$Data;->RemoveContribution:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$Data;->LocalID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$Data;->Final:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$ParcelData;->Price:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy$ParcelData;->Area:I

    return-void
.end method
