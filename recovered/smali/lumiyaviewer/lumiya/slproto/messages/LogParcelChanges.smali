.class public Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$ParcelData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$RegionData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$AgentData;

.field public ParcelData_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$ParcelData;",
            ">;"
        }
    .end annotation
.end field

.field public RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$RegionData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;->ParcelData_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$RegionData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$RegionData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$RegionData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;->ParcelData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x36

    add-int/lit8 v0, v0, 0x1d

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleLogParcelChanges(Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x20

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$RegionData;

    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$RegionData;->RegionHandle:J

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;->packLong(Ljava/nio/ByteBuffer;J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;->ParcelData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;->ParcelData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$ParcelData;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$ParcelData;->ParcelID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$ParcelData;->OwnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-boolean v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$ParcelData;->IsOwnerGroup:Z

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$ParcelData;->ActualArea:I

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;->packInt(Ljava/nio/ByteBuffer;I)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$ParcelData;->Action:I

    int-to-byte v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$ParcelData;->TransactionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$RegionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$RegionData;->RegionHandle:J

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v1, v0, 0xff

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$ParcelData;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$ParcelData;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$ParcelData;->ParcelID:Ljava/util/UUID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$ParcelData;->OwnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v3

    iput-boolean v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$ParcelData;->IsOwnerGroup:Z

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$ParcelData;->ActualArea:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$ParcelData;->Action:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges$ParcelData;->TransactionID:Ljava/util/UUID;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;->ParcelData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
