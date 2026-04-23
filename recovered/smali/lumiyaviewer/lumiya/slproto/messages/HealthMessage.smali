.class public Lcom/lumiyaviewer/lumiya/slproto/messages/HealthMessage;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/HealthMessage$HealthData;
    }
.end annotation


# instance fields
.field public HealthData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/HealthMessage$HealthData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/HealthMessage;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/HealthMessage$HealthData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/HealthMessage$HealthData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/HealthMessage;->HealthData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/HealthMessage$HealthData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x8

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleHealthMessage(Lcom/lumiyaviewer/lumiya/slproto/messages/HealthMessage;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x76

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/HealthMessage;->HealthData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/HealthMessage$HealthData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/HealthMessage$HealthData;->Health:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/HealthMessage;->packFloat(Ljava/nio/ByteBuffer;F)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/HealthMessage;->HealthData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/HealthMessage$HealthData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/HealthMessage;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/HealthMessage$HealthData;->Health:F

    return-void
.end method
