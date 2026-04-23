.class public Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship$ExBlock;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship$AgentData;

.field public ExBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship$ExBlock;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship$ExBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship$ExBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship;->ExBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship$ExBlock;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x34

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleTerminateFriendship(Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x2c

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship;->ExBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship$ExBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship$ExBlock;->OtherID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship;->ExBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship$ExBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship$ExBlock;->OtherID:Ljava/util/UUID;

    return-void
.end method
