.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$RegionData;
    }
.end annotation


# instance fields
.field public ObjectData_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;",
            ">;"
        }
    .end annotation
.end field

.field public RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$RegionData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->ObjectData_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$RegionData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$RegionData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$RegionData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 5

    const/16 v0, 0xc

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->ObjectData:[B

    array-length v3, v3

    add-int/lit8 v3, v3, 0x29

    add-int/lit8 v3, v3, 0x4

    add-int/lit8 v3, v3, 0x4

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v3, v3, 0x2

    add-int/lit8 v3, v3, 0x2

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v3, v3, 0x2

    add-int/lit8 v3, v3, 0x2

    add-int/lit8 v3, v3, 0x2

    add-int/lit8 v3, v3, 0x2

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->TextureEntry:[B

    array-length v4, v4

    add-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x1

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->TextureAnim:[B

    array-length v4, v4

    add-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x2

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->NameValue:[B

    array-length v4, v4

    add-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x2

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->Data:[B

    array-length v4, v4

    add-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x1

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->Text:[B

    array-length v4, v4

    add-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x4

    add-int/lit8 v3, v3, 0x1

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->MediaURL:[B

    array-length v4, v4

    add-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x1

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PSBlock:[B

    array-length v4, v4

    add-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x1

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->ExtraParams:[B

    array-length v0, v0

    add-int/2addr v0, v3

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0xc

    add-int/lit8 v0, v0, 0xc

    add-int/2addr v0, v1

    move v1, v0

    goto :goto_0

    :cond_0
    return v1
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleObjectUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 6

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/16 v0, 0xc

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$RegionData;

    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$RegionData;->RegionHandle:J

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packLong(Ljava/nio/ByteBuffer;J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$RegionData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$RegionData;->TimeDilation:I

    int-to-short v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packShort(Ljava/nio/ByteBuffer;S)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->ID:I

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packInt(Ljava/nio/ByteBuffer;I)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->State:I

    int-to-byte v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->FullID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->CRC:I

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packInt(Ljava/nio/ByteBuffer;I)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PCode:I

    int-to-byte v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->Material:I

    int-to-byte v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->ClickAction:I

    int-to-byte v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->Scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->ObjectData:[B

    invoke-virtual {p0, p1, v2, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->ParentID:I

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packInt(Ljava/nio/ByteBuffer;I)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->UpdateFlags:I

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packInt(Ljava/nio/ByteBuffer;I)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathCurve:I

    int-to-byte v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->ProfileCurve:I

    int-to-byte v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathBegin:I

    int-to-short v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packShort(Ljava/nio/ByteBuffer;S)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathEnd:I

    int-to-short v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packShort(Ljava/nio/ByteBuffer;S)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathScaleX:I

    int-to-byte v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathScaleY:I

    int-to-byte v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathShearX:I

    int-to-byte v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathShearY:I

    int-to-byte v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathTwist:I

    int-to-byte v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathTwistBegin:I

    int-to-byte v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathRadiusOffset:I

    int-to-byte v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathTaperX:I

    int-to-byte v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathTaperY:I

    int-to-byte v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathRevolutions:I

    int-to-byte v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathSkew:I

    int-to-byte v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->ProfileBegin:I

    int-to-short v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packShort(Ljava/nio/ByteBuffer;S)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->ProfileEnd:I

    int-to-short v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packShort(Ljava/nio/ByteBuffer;S)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->ProfileHollow:I

    int-to-short v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packShort(Ljava/nio/ByteBuffer;S)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->TextureEntry:[B

    invoke-virtual {p0, p1, v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->TextureAnim:[B

    invoke-virtual {p0, p1, v2, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->NameValue:[B

    invoke-virtual {p0, p1, v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->Data:[B

    invoke-virtual {p0, p1, v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->Text:[B

    invoke-virtual {p0, p1, v2, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->TextColor:[B

    const/4 v3, 0x4

    invoke-virtual {p0, p1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packFixed(Ljava/nio/ByteBuffer;[BI)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->MediaURL:[B

    invoke-virtual {p0, p1, v2, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PSBlock:[B

    invoke-virtual {p0, p1, v2, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->ExtraParams:[B

    invoke-virtual {p0, p1, v2, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->Sound:Ljava/util/UUID;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->OwnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->Gain:F

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->Flags:I

    int-to-byte v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->Radius:F

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->JointType:I

    int-to-byte v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->JointPivot:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->JointAxisOrAnchor:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    goto/16 :goto_0

    :cond_0
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 7

    const/4 v6, 0x2

    const v5, 0xffff

    const/4 v4, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$RegionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$RegionData;->RegionHandle:J

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$RegionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v1

    and-int/2addr v1, v5

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$RegionData;->TimeDilation:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v1, v0, 0xff

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->ID:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->State:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->FullID:Ljava/util/UUID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->CRC:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PCode:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->Material:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->ClickAction:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->Scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->ObjectData:[B

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->ParentID:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->UpdateFlags:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathCurve:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->ProfileCurve:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v3

    and-int/2addr v3, v5

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathBegin:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v3

    and-int/2addr v3, v5

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathEnd:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathScaleX:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathScaleY:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathShearX:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathShearY:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathTwist:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathTwistBegin:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathRadiusOffset:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathTaperX:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathTaperY:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathRevolutions:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathSkew:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v3

    and-int/2addr v3, v5

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->ProfileBegin:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v3

    and-int/2addr v3, v5

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->ProfileEnd:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v3

    and-int/2addr v3, v5

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->ProfileHollow:I

    invoke-virtual {p0, p1, v6}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->TextureEntry:[B

    invoke-virtual {p0, p1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->TextureAnim:[B

    invoke-virtual {p0, p1, v6}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->NameValue:[B

    invoke-virtual {p0, p1, v6}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->Data:[B

    invoke-virtual {p0, p1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->Text:[B

    const/4 v3, 0x4

    invoke-virtual {p0, p1, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackFixed(Ljava/nio/ByteBuffer;I)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->TextColor:[B

    invoke-virtual {p0, p1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->MediaURL:[B

    invoke-virtual {p0, p1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PSBlock:[B

    invoke-virtual {p0, p1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->ExtraParams:[B

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->Sound:Ljava/util/UUID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->OwnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->Gain:F

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->Flags:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->Radius:F

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->JointType:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->JointPivot:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->JointAxisOrAnchor:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    :cond_0
    return-void
.end method
