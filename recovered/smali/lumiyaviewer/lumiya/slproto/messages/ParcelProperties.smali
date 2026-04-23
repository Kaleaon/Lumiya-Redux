.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$AgeVerificationBlock;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;
    }
.end annotation


# instance fields
.field public AgeVerificationBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$AgeVerificationBlock;

.field public ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$AgeVerificationBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$AgeVerificationBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->AgeVerificationBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$AgeVerificationBlock;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->Bitmap:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x54

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

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

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->Name:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->Desc:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->MusicURL:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->MediaURL:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0xc

    add-int/lit8 v0, v0, 0xc

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleParcelProperties(Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    const/16 v0, 0x17

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->RequestResult:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->SequenceID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->SnapSelection:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->SelfCount:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->OtherCount:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->PublicCount:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->LocalID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->OwnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->IsGroupOwned:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->AuctionID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->ClaimDate:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->ClaimPrice:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->RentPrice:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->AABBMin:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->AABBMax:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->Bitmap:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->Area:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->Status:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->SimWideMaxPrims:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->SimWideTotalPrims:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->MaxPrims:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->TotalPrims:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->OwnerPrims:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->GroupPrims:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->OtherPrims:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->SelectedPrims:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->ParcelPrimBonus:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->OtherCleanTime:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->ParcelFlags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->SalePrice:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->Name:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->Desc:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->MusicURL:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->MediaURL:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->MediaID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->MediaAutoScale:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->PassPrice:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->PassHours:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->Category:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->AuthBuyerID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->SnapshotID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->UserLocation:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->UserLookAt:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->LandingType:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->RegionPushOverride:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->RegionDenyAnonymous:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->RegionDenyIdentified:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->RegionDenyTransacted:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->AgeVerificationBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$AgeVerificationBlock;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$AgeVerificationBlock;->RegionDenyAgeUnverified:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->RequestResult:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->SequenceID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->SnapSelection:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->SelfCount:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->OtherCount:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->PublicCount:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->LocalID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->OwnerID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->IsGroupOwned:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->AuctionID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->ClaimDate:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->ClaimPrice:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->RentPrice:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->AABBMin:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->AABBMax:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->Bitmap:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->Area:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->Status:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->SimWideMaxPrims:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->SimWideTotalPrims:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->MaxPrims:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->TotalPrims:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->OwnerPrims:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->GroupPrims:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->OtherPrims:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->SelectedPrims:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->ParcelPrimBonus:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->OtherCleanTime:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->ParcelFlags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->SalePrice:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->Name:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->Desc:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->MusicURL:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->MediaURL:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->MediaID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->MediaAutoScale:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->GroupID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->PassPrice:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->PassHours:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->Category:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->AuthBuyerID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->SnapshotID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->UserLocation:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->UserLookAt:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->LandingType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->RegionPushOverride:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->RegionDenyAnonymous:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->RegionDenyIdentified:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$ParcelData;->RegionDenyTransacted:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->AgeVerificationBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$AgeVerificationBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties$AgeVerificationBlock;->RegionDenyAgeUnverified:Z

    return-void
.end method
