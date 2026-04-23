.class public Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest$EventData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest$AgentData;

.field public EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest$EventData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest$EventData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest$EventData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest$EventData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x28

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleEventNotificationRemoveRequest(Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x4a

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest$EventData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest$EventData;->EventID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest$EventData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest$EventData;->EventID:I

    return-void
.end method
