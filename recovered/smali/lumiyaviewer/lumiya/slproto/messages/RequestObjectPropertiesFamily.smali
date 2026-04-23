.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily$ObjectData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily$AgentData;

.field public ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily$ObjectData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily$ObjectData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily$ObjectData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily$ObjectData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x36

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleRequestObjectPropertiesFamily(Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/4 v0, 0x5

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily$ObjectData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily$ObjectData;->RequestFlags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily$ObjectData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily$ObjectData;->ObjectID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily$ObjectData;->RequestFlags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily$ObjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily$ObjectData;->ObjectID:Ljava/util/UUID;

    return-void
.end method
