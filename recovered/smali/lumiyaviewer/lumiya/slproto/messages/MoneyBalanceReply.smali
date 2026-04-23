.class public Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;
    }
.end annotation


# instance fields
.field public MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;

.field public TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;->Description:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x2e

    add-int/lit8 v0, v0, 0x4

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;->ItemDescription:[B

    array-length v1, v1

    add-int/lit8 v1, v1, 0x2b

    add-int/2addr v0, v1

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleMoneyBalanceReply(Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x3a

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;->TransactionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;->TransactionSuccess:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;->MoneyBalance:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;->SquareMetersCredit:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;->SquareMetersCommitted:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;->Description:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;->TransactionType:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;->SourceID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;->IsSourceGroup:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;->DestID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;->IsDestGroup:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;->Amount:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;->ItemDescription:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;->TransactionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;->TransactionSuccess:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;->MoneyBalance:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;->SquareMetersCredit:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;->SquareMetersCommitted:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;->Description:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;->TransactionType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;->SourceID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;->IsSourceGroup:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;->DestID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;->IsDestGroup:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;->Amount:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;->ItemDescription:[B

    return-void
.end method
