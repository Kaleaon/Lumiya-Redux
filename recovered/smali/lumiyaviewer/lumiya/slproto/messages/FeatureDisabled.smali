.class public Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled$FailureInfo;
    }
.end annotation


# instance fields
.field public FailureInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled$FailureInfo;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled$FailureInfo;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled$FailureInfo;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled;->FailureInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled$FailureInfo;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled;->FailureInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled$FailureInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled$FailureInfo;->ErrorMessage:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleFeatureDisabled(Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x13

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled;->FailureInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled$FailureInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled$FailureInfo;->ErrorMessage:[B

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled;->FailureInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled$FailureInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled$FailureInfo;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled;->FailureInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled$FailureInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled$FailureInfo;->TransactionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled;->FailureInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled$FailureInfo;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled$FailureInfo;->ErrorMessage:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled;->FailureInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled$FailureInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled$FailureInfo;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled;->FailureInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled$FailureInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled$FailureInfo;->TransactionID:Ljava/util/UUID;

    return-void
.end method
