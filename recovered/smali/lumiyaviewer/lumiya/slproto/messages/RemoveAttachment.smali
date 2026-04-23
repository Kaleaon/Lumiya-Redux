.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment$AttachmentBlock;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment$AgentData;

.field public AttachmentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment$AttachmentBlock;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment$AttachmentBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment$AttachmentBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment;->AttachmentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment$AttachmentBlock;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x35

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleRemoveAttachment(Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x4c

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment;->AttachmentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment$AttachmentBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment$AttachmentBlock;->AttachmentPoint:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment;->AttachmentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment$AttachmentBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment$AttachmentBlock;->ItemID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment;->AttachmentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment$AttachmentBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment$AttachmentBlock;->AttachmentPoint:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment;->AttachmentBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment$AttachmentBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment$AttachmentBlock;->ItemID:Ljava/util/UUID;

    return-void
.end method
