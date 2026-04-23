.class public Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply$ReplyData;
    }
.end annotation


# instance fields
.field public ReplyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply$ReplyData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply$ReplyData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply$ReplyData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply;->ReplyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply$ReplyData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply;->ReplyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply$ReplyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply$ReplyData;->Selection:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x21

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleLiveHelpGroupReply(Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x7c

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply;->ReplyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply$ReplyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply$ReplyData;->RequestID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply;->ReplyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply$ReplyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply$ReplyData;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply;->ReplyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply$ReplyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply$ReplyData;->Selection:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply;->ReplyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply$ReplyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply$ReplyData;->RequestID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply;->ReplyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply$ReplyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply$ReplyData;->GroupID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply;->ReplyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply$ReplyData;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply$ReplyData;->Selection:[B

    return-void
.end method
