.class public Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;->To:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x49

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;->From:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;->Name:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;->Subject:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;->Msg:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleSendPostcard(Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x64

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;->AssetID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;->PosGlobal:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->packLLVector3d(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;->To:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;->From:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;->Name:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;->Subject:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;->Msg:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;->AllowPublish:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;->MaturePublish:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;->AssetID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->unpackLLVector3d(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;->PosGlobal:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;->To:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;->From:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;->Name:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;->Subject:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;->Msg:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;->AllowPublish:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;->MaturePublish:Z

    return-void
.end method
