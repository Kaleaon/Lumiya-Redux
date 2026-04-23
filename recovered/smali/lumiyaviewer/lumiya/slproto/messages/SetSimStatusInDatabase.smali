.class public Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;
    }
.end annotation


# instance fields
.field public Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;->HostName:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x11

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;->Status:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleSetSimStatusInDatabase(Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x16

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;->RegionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;->HostName:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;->X:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;->Y:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;->PID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;->AgentCount:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;->TimeToLive:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;->Status:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;->RegionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;->HostName:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;->X:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;->Y:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;->PID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;->AgentCount:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;->TimeToLive:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;->Status:[B

    return-void
.end method
