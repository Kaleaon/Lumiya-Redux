.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;
    }
.end annotation


# instance fields
.field public Requester_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->Requester_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->Requester_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;->SearchName:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x49

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x8

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleScriptSensorRequest(Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x9

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->Requester_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;->SourceID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->Requester_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;->RequestID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->Requester_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;->SearchID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->Requester_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;->SearchPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->Requester_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;->SearchDir:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->packLLQuaternion(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->Requester_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;->SearchName:[B

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->Requester_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;->Type:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->Requester_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;->Range:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->Requester_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;->Arc:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->Requester_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;

    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;->RegionHandle:J

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->packLong(Ljava/nio/ByteBuffer;J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->Requester_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;->SearchRegions:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->packByte(Ljava/nio/ByteBuffer;B)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->Requester_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;->SourceID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->Requester_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;->RequestID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->Requester_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;->SearchID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->Requester_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;->SearchPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->Requester_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->unpackLLQuaternion(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;->SearchDir:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->Requester_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;->SearchName:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->Requester_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;->Type:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->Requester_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;->Range:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->Requester_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;->Arc:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->Requester_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;->RegionHandle:J

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->Requester_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest$Requester;->SearchRegions:I

    return-void
.end method
