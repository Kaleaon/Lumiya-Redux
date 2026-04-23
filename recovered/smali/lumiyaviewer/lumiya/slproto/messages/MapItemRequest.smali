.class public Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$RequestData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$AgentData;

.field public RequestData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$RequestData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$RequestData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$RequestData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->RequestData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$RequestData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x39

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleMapItemRequest(Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x66

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$AgentData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$AgentData;->Flags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$AgentData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$AgentData;->EstateID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$AgentData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$AgentData;->Godlike:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->RequestData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$RequestData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$RequestData;->ItemType:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->RequestData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$RequestData;

    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$RequestData;->RegionHandle:J

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->packLong(Ljava/nio/ByteBuffer;J)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$AgentData;->Flags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$AgentData;->EstateID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$AgentData;->Godlike:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->RequestData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$RequestData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$RequestData;->ItemType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->RequestData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$RequestData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest$RequestData;->RegionHandle:J

    return-void
.end method
