.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;
    }
.end annotation


# instance fields
.field public ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;->Name:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x31

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;->Message:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleChatPass(Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x11

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;->Channel:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;->ID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;->OwnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;->Name:[B

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;->SourceType:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;->Type:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;->Radius:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;->SimAccess:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;->Message:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;->Channel:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;->ID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;->OwnerID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;->Name:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;->SourceType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;->Type:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;->Radius:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;->SimAccess:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass$ChatData;->Message:[B

    return-void
.end method
