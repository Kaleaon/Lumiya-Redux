.class public Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;
    }
.end annotation


# instance fields
.field public SoundData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;->SoundData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x59

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleSoundTrigger(Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/16 v0, 0x1d

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;->SoundData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;->SoundID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;->SoundData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;->OwnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;->SoundData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;->ObjectID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;->SoundData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;->ParentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;->SoundData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;

    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;->Handle:J

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;->packLong(Ljava/nio/ByteBuffer;J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;->SoundData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;->SoundData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;->Gain:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;->packFloat(Ljava/nio/ByteBuffer;F)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;->SoundData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;->SoundID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;->SoundData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;->OwnerID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;->SoundData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;->ObjectID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;->SoundData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;->ParentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;->SoundData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;->Handle:J

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;->SoundData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;->SoundData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger$SoundData;->Gain:F

    return-void
.end method
