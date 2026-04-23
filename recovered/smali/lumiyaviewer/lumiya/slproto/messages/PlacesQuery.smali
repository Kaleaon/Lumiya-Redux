.class public Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$QueryData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$TransactionData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$AgentData;

.field public QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$QueryData;

.field public TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$TransactionData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$TransactionData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$TransactionData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$TransactionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$QueryData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$QueryData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$QueryData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$QueryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$QueryData;->QueryText:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$QueryData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$QueryData;->SimName:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x44

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandlePlacesQuery(Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x1d

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$AgentData;->QueryID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$TransactionData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$TransactionData;->TransactionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$QueryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$QueryData;->QueryText:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$QueryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$QueryData;->QueryFlags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$QueryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$QueryData;->Category:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$QueryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$QueryData;->SimName:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$AgentData;->QueryID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$TransactionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$TransactionData;->TransactionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$QueryData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$QueryData;->QueryText:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$QueryData;->QueryFlags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$QueryData;->Category:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$QueryData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery$QueryData;->SimName:[B

    return-void
.end method
