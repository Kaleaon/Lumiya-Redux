.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$AgentData;

.field public ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->Name:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x11

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->Desc:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->MusicURL:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->MediaURL:[B

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

    add-int/lit8 v0, v0, 0x24

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleParcelPropertiesUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x3a

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->LocalID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->Flags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->ParcelFlags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->SalePrice:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->Name:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->Desc:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->MusicURL:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->MediaURL:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->MediaID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->MediaAutoScale:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->PassPrice:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->PassHours:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->Category:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->AuthBuyerID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->SnapshotID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->UserLocation:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->UserLookAt:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->LandingType:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->LocalID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->Flags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->ParcelFlags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->SalePrice:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->Name:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->Desc:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->MusicURL:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->MediaURL:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->MediaID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->MediaAutoScale:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->GroupID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->PassPrice:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->PassHours:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->Category:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->AuthBuyerID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->SnapshotID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->UserLocation:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->UserLookAt:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate$ParcelData;->LandingType:I

    return-void
.end method
