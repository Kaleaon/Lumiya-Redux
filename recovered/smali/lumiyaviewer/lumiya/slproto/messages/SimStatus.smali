.class public Lcom/lumiyaviewer/lumiya/slproto/messages/SimStatus;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/SimStatus$SimStatusData;
    }
.end annotation


# instance fields
.field public SimStatusData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimStatus$SimStatusData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStatus;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStatus$SimStatusData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStatus$SimStatusData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStatus;->SimStatusData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimStatus$SimStatusData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/4 v0, 0x4

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleSimStatus(Lcom/lumiyaviewer/lumiya/slproto/messages/SimStatus;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0xc

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStatus;->SimStatusData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimStatus$SimStatusData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStatus$SimStatusData;->CanAcceptAgents:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStatus;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStatus;->SimStatusData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimStatus$SimStatusData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStatus$SimStatusData;->CanAcceptTasks:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStatus;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStatus;->SimStatusData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimStatus$SimStatusData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStatus;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStatus$SimStatusData;->CanAcceptAgents:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStatus;->SimStatusData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SimStatus$SimStatusData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStatus;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStatus$SimStatusData;->CanAcceptTasks:Z

    return-void
.end method
