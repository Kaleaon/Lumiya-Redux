.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$Requester;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$SensedData;
    }
.end annotation


# instance fields
.field public Requester_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$Requester;

.field public SensedData_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$SensedData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;->SensedData_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$Requester;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$Requester;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;->Requester_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$Requester;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 3

    const/16 v0, 0x15

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;->SensedData_Fields:Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$SensedData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$SensedData;->Name:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x55

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/2addr v0, v1

    move v1, v0

    goto :goto_0

    :cond_0
    return v1
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleScriptSensorReply(Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/4 v0, -0x8

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;->Requester_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$Requester;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$Requester;->SourceID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;->SensedData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;->SensedData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$SensedData;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$SensedData;->ObjectID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$SensedData;->OwnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$SensedData;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$SensedData;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$SensedData;->Velocity:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$SensedData;->Rotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;->packLLQuaternion(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$SensedData;->Name:[B

    const/4 v3, 0x1

    invoke-virtual {p0, p1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$SensedData;->Type:I

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$SensedData;->Range:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;->packFloat(Ljava/nio/ByteBuffer;F)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;->Requester_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$Requester;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$Requester;->SourceID:Ljava/util/UUID;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v1, v0, 0xff

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$SensedData;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$SensedData;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$SensedData;->ObjectID:Ljava/util/UUID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$SensedData;->OwnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$SensedData;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$SensedData;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$SensedData;->Velocity:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;->unpackLLQuaternion(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$SensedData;->Rotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    const/4 v3, 0x1

    invoke-virtual {p0, p1, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$SensedData;->Name:[B

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$SensedData;->Type:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$SensedData;->Range:F

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;->SensedData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
