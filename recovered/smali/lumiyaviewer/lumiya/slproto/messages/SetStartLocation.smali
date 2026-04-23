.class public Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation$StartLocationData;
    }
.end annotation


# instance fields
.field public StartLocationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation$StartLocationData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation$StartLocationData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation$StartLocationData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation;->StartLocationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation$StartLocationData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x48

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleSetStartLocation(Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x45

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation;->StartLocationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation$StartLocationData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation$StartLocationData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation;->StartLocationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation$StartLocationData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation$StartLocationData;->RegionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation;->StartLocationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation$StartLocationData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation$StartLocationData;->LocationID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation;->StartLocationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation$StartLocationData;

    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation$StartLocationData;->RegionHandle:J

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation;->packLong(Ljava/nio/ByteBuffer;J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation;->StartLocationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation$StartLocationData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation$StartLocationData;->LocationPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation;->StartLocationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation$StartLocationData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation$StartLocationData;->LocationLookAt:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation;->StartLocationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation$StartLocationData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation$StartLocationData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation;->StartLocationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation$StartLocationData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation$StartLocationData;->RegionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation;->StartLocationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation$StartLocationData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation$StartLocationData;->LocationID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation;->StartLocationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation$StartLocationData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation$StartLocationData;->RegionHandle:J

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation;->StartLocationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation$StartLocationData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation$StartLocationData;->LocationPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation;->StartLocationData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation$StartLocationData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation$StartLocationData;->LocationLookAt:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    return-void
.end method
