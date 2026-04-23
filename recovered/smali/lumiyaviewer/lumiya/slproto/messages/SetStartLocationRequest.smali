.class public Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$StartLocationData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$AgentData;

.field public StartLocationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$StartLocationData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$StartLocationData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$StartLocationData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;->StartLocationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$StartLocationData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;->StartLocationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$StartLocationData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$StartLocationData;->SimName:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0xc

    add-int/lit8 v0, v0, 0xc

    add-int/lit8 v0, v0, 0x24

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleSetStartLocationRequest(Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x44

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;->StartLocationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$StartLocationData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$StartLocationData;->SimName:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;->StartLocationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$StartLocationData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$StartLocationData;->LocationID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;->StartLocationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$StartLocationData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$StartLocationData;->LocationPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;->StartLocationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$StartLocationData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$StartLocationData;->LocationLookAt:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;->StartLocationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$StartLocationData;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$StartLocationData;->SimName:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;->StartLocationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$StartLocationData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$StartLocationData;->LocationID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;->StartLocationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$StartLocationData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$StartLocationData;->LocationPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;->StartLocationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$StartLocationData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$StartLocationData;->LocationLookAt:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    return-void
.end method
