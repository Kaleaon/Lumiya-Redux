.class public Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$Info;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$RegionData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$AgentData;

.field public Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$Info;

.field public RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$RegionData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$RegionData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$RegionData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$RegionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$Info;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$Info;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$Info;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$RegionData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$RegionData;->SeedCapability:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x22

    add-int/lit8 v0, v0, 0x18

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleCrossedRegion(Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/4 v0, 0x7

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$RegionData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$RegionData;->SimIP:Ljava/net/Inet4Address;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->packIPAddress(Ljava/nio/ByteBuffer;Ljava/net/Inet4Address;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$RegionData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$RegionData;->SimPort:I

    int-to-short v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->packShort(Ljava/nio/ByteBuffer;S)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$RegionData;

    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$RegionData;->RegionHandle:J

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->packLong(Ljava/nio/ByteBuffer;J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$RegionData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$RegionData;->SeedCapability:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$Info;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$Info;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$Info;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$Info;->LookAt:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$RegionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->unpackIPAddress(Ljava/nio/ByteBuffer;)Ljava/net/Inet4Address;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$RegionData;->SimIP:Ljava/net/Inet4Address;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$RegionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v1

    const v2, 0xffff

    and-int/2addr v1, v2

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$RegionData;->SimPort:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$RegionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$RegionData;->RegionHandle:J

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$RegionData;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$RegionData;->SeedCapability:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$Info;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$Info;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$Info;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion$Info;->LookAt:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    return-void
.end method
