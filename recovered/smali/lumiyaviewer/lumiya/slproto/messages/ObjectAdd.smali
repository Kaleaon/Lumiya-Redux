.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$AgentData;

.field public ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x92

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleObjectAdd(Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$AgentData;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->PCode:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->Material:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->AddFlags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->PathCurve:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->ProfileCurve:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->PathBegin:I

    int-to-short v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packShort(Ljava/nio/ByteBuffer;S)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->PathEnd:I

    int-to-short v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packShort(Ljava/nio/ByteBuffer;S)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->PathScaleX:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->PathScaleY:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->PathShearX:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->PathShearY:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->PathTwist:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->PathTwistBegin:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->PathRadiusOffset:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->PathTaperX:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->PathTaperY:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->PathRevolutions:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->PathSkew:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->ProfileBegin:I

    int-to-short v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packShort(Ljava/nio/ByteBuffer;S)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->ProfileEnd:I

    int-to-short v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packShort(Ljava/nio/ByteBuffer;S)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->ProfileHollow:I

    int-to-short v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packShort(Ljava/nio/ByteBuffer;S)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->BypassRaycast:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->RayStart:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->RayEnd:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->RayTargetID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->RayEndIsIntersection:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->Scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->Rotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packLLQuaternion(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->State:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->packByte(Ljava/nio/ByteBuffer;B)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const v2, 0xffff

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$AgentData;->GroupID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->PCode:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->Material:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->AddFlags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->PathCurve:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->ProfileCurve:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v1

    and-int/2addr v1, v2

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->PathBegin:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v1

    and-int/2addr v1, v2

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->PathEnd:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->PathScaleX:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->PathScaleY:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->PathShearX:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->PathShearY:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->PathTwist:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->PathTwistBegin:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->PathRadiusOffset:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->PathTaperX:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->PathTaperY:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->PathRevolutions:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->PathSkew:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v1

    and-int/2addr v1, v2

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->ProfileBegin:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v1

    and-int/2addr v1, v2

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->ProfileEnd:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v1

    and-int/2addr v1, v2

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->ProfileHollow:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->BypassRaycast:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->RayStart:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->RayEnd:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->RayTargetID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->RayEndIsIntersection:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->Scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackLLQuaternion(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->Rotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;->State:I

    return-void
.end method
