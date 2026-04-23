.class public Lcom/lumiyaviewer/lumiya/slproto/messages/Error;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/Error$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/Error$AgentData;

.field public Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/Error$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/Error$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;->Token:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x5

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;->System:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;->Message:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;->Data:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x14

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleError(Lcom/lumiyaviewer/lumiya/slproto/messages/Error;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x59

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/Error$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;->Code:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;->Token:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;->ID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;->System:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;->Message:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;->Data:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    const/4 v3, 0x2

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/Error$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;->Code:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;->Token:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;->ID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;->System:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;

    invoke-virtual {p0, p1, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;->Message:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;

    invoke-virtual {p0, p1, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error$Data;->Data:[B

    return-void
.end method
