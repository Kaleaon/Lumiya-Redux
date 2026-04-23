.class public Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$RequestData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$AgentData;

.field public RequestData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$RequestData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$RequestData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$RequestData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;->RequestData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$RequestData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;->RequestData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$RequestData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$RequestData;->Filter:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x9

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x24

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleLandStatRequest(Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x5b

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;->RequestData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$RequestData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$RequestData;->ReportType:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;->RequestData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$RequestData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$RequestData;->RequestFlags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;->RequestData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$RequestData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$RequestData;->Filter:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;->RequestData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$RequestData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$RequestData;->ParcelLocalID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;->RequestData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$RequestData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$RequestData;->ReportType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;->RequestData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$RequestData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$RequestData;->RequestFlags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;->RequestData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$RequestData;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$RequestData;->Filter:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;->RequestData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$RequestData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest$RequestData;->ParcelLocalID:I

    return-void
.end method
