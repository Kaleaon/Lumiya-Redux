.class public Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;->FirstName:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x11

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;->LastName:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;->GroupTitle:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x8

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;->GroupName:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleAgentDataUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x7d

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;->FirstName:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;->LastName:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;->GroupTitle:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;->ActiveGroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;

    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;->GroupPowers:J

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->packLong(Ljava/nio/ByteBuffer;J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;->GroupName:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 5

    const/4 v4, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;

    invoke-virtual {p0, p1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;->FirstName:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;

    invoke-virtual {p0, p1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;->LastName:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;

    invoke-virtual {p0, p1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;->GroupTitle:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;->ActiveGroupID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;->GroupPowers:J

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;

    invoke-virtual {p0, p1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;->GroupName:[B

    return-void
.end method
