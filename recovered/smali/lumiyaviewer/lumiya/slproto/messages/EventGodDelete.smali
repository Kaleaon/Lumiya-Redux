.class public Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$EventData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$QueryData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$AgentData;

.field public EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$EventData;

.field public QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$QueryData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$EventData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$EventData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$EventData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$QueryData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$QueryData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$QueryData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$QueryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$QueryData;->QueryText:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x11

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x28

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleEventGodDelete(Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x49

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$EventData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$EventData;->EventID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$QueryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$QueryData;->QueryID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$QueryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$QueryData;->QueryText:[B

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$QueryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$QueryData;->QueryFlags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$QueryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$QueryData;->QueryStart:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$EventData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$EventData;->EventID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$QueryData;->QueryID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$QueryData;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$QueryData;->QueryText:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$QueryData;->QueryFlags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete$QueryData;->QueryStart:I

    return-void
.end method
