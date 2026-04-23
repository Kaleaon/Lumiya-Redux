.class public Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$AgentData;

.field public MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->StartDate:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x19

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->LastTaxDate:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->TaxDate:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x24

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleGroupAccountSummaryReply(Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x62

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$AgentData;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->RequestID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->IntervalDays:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->CurrentInterval:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->StartDate:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->Balance:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->TotalCredits:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->TotalDebits:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->ObjectTaxCurrent:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->LightTaxCurrent:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->LandTaxCurrent:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->GroupTaxCurrent:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->ParcelDirFeeCurrent:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->ObjectTaxEstimate:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->LightTaxEstimate:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->LandTaxEstimate:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->GroupTaxEstimate:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->ParcelDirFeeEstimate:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->NonExemptMembers:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->LastTaxDate:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->TaxDate:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$AgentData;->GroupID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->RequestID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->IntervalDays:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->CurrentInterval:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->StartDate:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->Balance:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->TotalCredits:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->TotalDebits:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->ObjectTaxCurrent:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->LightTaxCurrent:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->LandTaxCurrent:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->GroupTaxCurrent:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->ParcelDirFeeCurrent:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->ObjectTaxEstimate:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->LightTaxEstimate:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->LandTaxEstimate:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->GroupTaxEstimate:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->ParcelDirFeeEstimate:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->NonExemptMembers:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->LastTaxDate:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply$MoneyData;->TaxDate:[B

    return-void
.end method
