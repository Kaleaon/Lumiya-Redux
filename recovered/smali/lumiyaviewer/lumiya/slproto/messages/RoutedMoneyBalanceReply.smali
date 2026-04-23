.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TargetBlock;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;
    }
.end annotation


# instance fields
.field public MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;

.field public TargetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TargetBlock;

.field public TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TargetBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TargetBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->TargetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TargetBlock;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;->Description:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x2e

    add-int/lit8 v0, v0, 0xa

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;->ItemDescription:[B

    array-length v1, v1

    add-int/lit8 v1, v1, 0x2b

    add-int/2addr v0, v1

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleRoutedMoneyBalanceReply(Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x3b

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->TargetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TargetBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TargetBlock;->TargetIP:Ljava/net/Inet4Address;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->packIPAddress(Ljava/nio/ByteBuffer;Ljava/net/Inet4Address;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->TargetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TargetBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TargetBlock;->TargetPort:I

    int-to-short v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->packShort(Ljava/nio/ByteBuffer;S)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;->TransactionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;->TransactionSuccess:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;->MoneyBalance:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;->SquareMetersCredit:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;->SquareMetersCommitted:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;->Description:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;->TransactionType:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;->SourceID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;->IsSourceGroup:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;->DestID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;->IsDestGroup:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;->Amount:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;->ItemDescription:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    const/4 v3, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->TargetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TargetBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->unpackIPAddress(Ljava/nio/ByteBuffer;)Ljava/net/Inet4Address;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TargetBlock;->TargetIP:Ljava/net/Inet4Address;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->TargetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TargetBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v1

    const v2, 0xffff

    and-int/2addr v1, v2

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TargetBlock;->TargetPort:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;->TransactionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;->TransactionSuccess:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;->MoneyBalance:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;->SquareMetersCredit:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;->SquareMetersCommitted:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;

    invoke-virtual {p0, p1, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;->Description:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;->TransactionType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;->SourceID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;->IsSourceGroup:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;->DestID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;->IsDestGroup:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;->Amount:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;

    invoke-virtual {p0, p1, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$TransactionInfo;->ItemDescription:[B

    return-void
.end method
