.class public Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;
    }
.end annotation


# instance fields
.field public ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->Name:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x2b

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->Description:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->MusicURL:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0xc

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleUpdateParcel(Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x23

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->ParcelID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->RegionHandle:J

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->packLong(Ljava/nio/ByteBuffer;J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->OwnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->GroupOwned:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->Status:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->Name:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->Description:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->MusicURL:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->RegionX:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->RegionY:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->ActualArea:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->BillableArea:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->ShowDir:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->IsForSale:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->Category:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->SnapshotID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->UserLocation:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->SalePrice:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->AuthorizedBuyerID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->AllowPublish:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->MaturePublish:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 5

    const/4 v4, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->ParcelID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->RegionHandle:J

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->OwnerID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->GroupOwned:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->Status:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    invoke-virtual {p0, p1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->Name:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    invoke-virtual {p0, p1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->Description:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    invoke-virtual {p0, p1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->MusicURL:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->RegionX:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->RegionY:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->ActualArea:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->BillableArea:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->ShowDir:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->IsForSale:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->Category:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->SnapshotID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->UserLocation:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->SalePrice:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->AuthorizedBuyerID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->AllowPublish:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel$ParcelData;->MaturePublish:Z

    return-void
.end method
