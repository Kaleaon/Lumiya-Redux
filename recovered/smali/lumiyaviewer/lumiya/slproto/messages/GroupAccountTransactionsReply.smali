.class public Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$HistoryData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$MoneyData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$AgentData;

.field public HistoryData_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$HistoryData;",
            ">;"
        }
    .end annotation
.end field

.field public MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$MoneyData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->HistoryData_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$MoneyData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$MoneyData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$MoneyData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$MoneyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$MoneyData;->StartDate:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x19

    add-int/lit8 v0, v0, 0x24

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->HistoryData_Fields:Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$HistoryData;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$HistoryData;->Time:[B

    array-length v3, v3

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v3, v3, 0x1

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$HistoryData;->User:[B

    array-length v4, v4

    add-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x4

    add-int/lit8 v3, v3, 0x1

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$HistoryData;->Item:[B

    array-length v0, v0

    add-int/2addr v0, v3

    add-int/lit8 v0, v0, 0x4

    add-int/2addr v0, v1

    move v1, v0

    goto :goto_0

    :cond_0
    return v1
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleGroupAccountTransactionsReply(Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    const/4 v3, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x66

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$AgentData;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$MoneyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$MoneyData;->RequestID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$MoneyData;->IntervalDays:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$MoneyData;->CurrentInterval:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$MoneyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$MoneyData;->StartDate:[B

    invoke-virtual {p0, p1, v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->HistoryData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->HistoryData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$HistoryData;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$HistoryData;->Time:[B

    invoke-virtual {p0, p1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$HistoryData;->User:[B

    invoke-virtual {p0, p1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$HistoryData;->Type:I

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$HistoryData;->Item:[B

    invoke-virtual {p0, p1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$HistoryData;->Amount:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->packInt(Ljava/nio/ByteBuffer;I)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 5

    const/4 v4, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$AgentData;->GroupID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$MoneyData;->RequestID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$MoneyData;->IntervalDays:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$MoneyData;->CurrentInterval:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$MoneyData;

    invoke-virtual {p0, p1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$MoneyData;->StartDate:[B

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v1, v0, 0xff

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$HistoryData;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$HistoryData;-><init>()V

    invoke-virtual {p0, p1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$HistoryData;->Time:[B

    invoke-virtual {p0, p1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$HistoryData;->User:[B

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$HistoryData;->Type:I

    invoke-virtual {p0, p1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$HistoryData;->Item:[B

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply$HistoryData;->Amount:I

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;->HistoryData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
