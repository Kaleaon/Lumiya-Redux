.class public Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$Data;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$AgentData;

.field public Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$Data;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$Data;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$Data;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$Data;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$Data;->Name:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x35

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleAvatarPickerRequestBackend(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x1b

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$AgentData;->QueryID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$AgentData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$AgentData;->GodLevel:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$Data;->Name:[B

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$AgentData;->QueryID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$AgentData;->GodLevel:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$Data;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend$Data;->Name:[B

    return-void
.end method
