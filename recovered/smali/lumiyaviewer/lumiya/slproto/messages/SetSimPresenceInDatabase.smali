.class public Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;
    }
.end annotation


# instance fields
.field public SimData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->SimData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->SimData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;->HostName:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x11

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->SimData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;->Status:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleSetSimPresenceInDatabase(Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x17

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->SimData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;->RegionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->SimData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;->HostName:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->SimData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;->GridX:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->SimData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;->GridY:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->SimData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;->PID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->SimData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;->AgentCount:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->SimData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;->TimeToLive:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->SimData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;->Status:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->SimData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;->RegionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->SimData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;->HostName:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->SimData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;->GridX:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->SimData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;->GridY:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->SimData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;->PID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->SimData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;->AgentCount:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->SimData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;->TimeToLive:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->SimData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase$SimData;->Status:[B

    return-void
.end method
