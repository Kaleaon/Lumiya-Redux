.class public Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest$EventData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest$QueryData;
    }
.end annotation


# instance fields
.field public EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest$EventData;

.field public QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest$QueryData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest$QueryData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest$QueryData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest$QueryData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest$EventData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest$EventData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest$EventData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x18

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleEventLocationRequest(Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x33

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest$QueryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest$QueryData;->QueryID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest$EventData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest$EventData;->EventID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest$QueryData;->QueryID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest$EventData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest$EventData;->EventID:I

    return-void
.end method
