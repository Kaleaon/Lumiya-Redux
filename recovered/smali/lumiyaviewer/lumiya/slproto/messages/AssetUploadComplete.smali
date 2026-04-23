.class public Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete$AssetBlock;
    }
.end annotation


# instance fields
.field public AssetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete$AssetBlock;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete$AssetBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete$AssetBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete;->AssetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete$AssetBlock;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x16

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleAssetUploadComplete(Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x4e

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete;->AssetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete$AssetBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete$AssetBlock;->UUID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete;->AssetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete$AssetBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete$AssetBlock;->Type:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete;->AssetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete$AssetBlock;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete$AssetBlock;->Success:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete;->AssetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete$AssetBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete$AssetBlock;->UUID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete;->AssetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete$AssetBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete$AssetBlock;->Type:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete;->AssetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete$AssetBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete$AssetBlock;->Success:Z

    return-void
.end method
