.class public Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$Throttle;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$AgentData;

.field public Throttle_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$Throttle;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$Throttle;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$Throttle;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle;->Throttle_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$Throttle;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle;->Throttle_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$Throttle;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$Throttle;->Throttles:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x5

    add-int/lit8 v0, v0, 0x28

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleAgentThrottle(Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x51

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$AgentData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$AgentData;->CircuitCode:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle;->Throttle_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$Throttle;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$Throttle;->GenCounter:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle;->Throttle_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$Throttle;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$Throttle;->Throttles:[B

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$AgentData;->CircuitCode:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle;->Throttle_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$Throttle;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$Throttle;->GenCounter:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle;->Throttle_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$Throttle;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle$Throttle;->Throttles:[B

    return-void
.end method
