.class public Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard$TransactionBlock;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard$AgentData;

.field public TransactionBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard$TransactionBlock;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard$TransactionBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard$TransactionBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard;->TransactionBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard$TransactionBlock;

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

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleDeclineCallingCard(Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x2f

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard;->TransactionBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard$TransactionBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard$TransactionBlock;->TransactionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard;->TransactionBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard$TransactionBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard$TransactionBlock;->TransactionID:Ljava/util/UUID;

    return-void
.end method
