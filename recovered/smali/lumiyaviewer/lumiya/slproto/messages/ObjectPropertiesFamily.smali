.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;
    }
.end annotation


# instance fields
.field public ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->Name:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x66

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->Description:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x2

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleObjectPropertiesFamily(Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0xa

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->RequestFlags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->ObjectID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->OwnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->BaseMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->OwnerMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->GroupMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->EveryoneMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->NextOwnerMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->OwnershipCost:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->SaleType:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->SalePrice:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->Category:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->LastOwnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->Name:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->Description:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->RequestFlags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->ObjectID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->OwnerID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->GroupID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->BaseMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->OwnerMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->GroupMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->EveryoneMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->NextOwnerMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->OwnershipCost:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->SaleType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->SalePrice:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->Category:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->LastOwnerID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->Name:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily$ObjectData;->Description:[B

    return-void
.end method
