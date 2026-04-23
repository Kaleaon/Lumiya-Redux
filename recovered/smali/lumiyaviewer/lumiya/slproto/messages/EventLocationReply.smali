.class public Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply$EventData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply$QueryData;
    }
.end annotation


# instance fields
.field public EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply$EventData;

.field public QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply$QueryData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply$QueryData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply$QueryData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply$QueryData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply$EventData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply$EventData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply$EventData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x31

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleEventLocationReply(Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x34

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply$QueryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply$QueryData;->QueryID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply$EventData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply$EventData;->Success:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply$EventData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply$EventData;->RegionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply$EventData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply$EventData;->RegionPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply$QueryData;->QueryID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply$EventData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply$EventData;->Success:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply$EventData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply$EventData;->RegionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply$EventData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply$EventData;->RegionPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    return-void
.end method
