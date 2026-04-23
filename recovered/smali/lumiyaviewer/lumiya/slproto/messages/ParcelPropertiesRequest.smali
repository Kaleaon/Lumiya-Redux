.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$ParcelData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$AgentData;

.field public ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$ParcelData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$ParcelData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$ParcelData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$ParcelData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x37

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleParcelPropertiesRequest(Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0xb

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$ParcelData;->SequenceID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$ParcelData;->West:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$ParcelData;->South:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$ParcelData;->East:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$ParcelData;->North:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$ParcelData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$ParcelData;->SnapSelection:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$ParcelData;->SequenceID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$ParcelData;->West:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$ParcelData;->South:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$ParcelData;->East:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$ParcelData;->North:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest$ParcelData;->SnapSelection:Z

    return-void
.end method
