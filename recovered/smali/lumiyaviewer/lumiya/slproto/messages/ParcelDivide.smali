.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$ParcelData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$AgentData;

.field public ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$ParcelData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$ParcelData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$ParcelData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$ParcelData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x34

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleParcelDivide(Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x2d

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$ParcelData;->West:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$ParcelData;->South:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$ParcelData;->East:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$ParcelData;->North:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;->packFloat(Ljava/nio/ByteBuffer;F)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$ParcelData;->West:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$ParcelData;->South:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$ParcelData;->East:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide$ParcelData;->North:F

    return-void
.end method
