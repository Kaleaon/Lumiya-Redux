.class public Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest$AssetBlock;
    }
.end annotation


# instance fields
.field public AssetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest$AssetBlock;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest$AssetBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest$AssetBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest;->AssetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest$AssetBlock;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest;->AssetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest$AssetBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest$AssetBlock;->AssetData:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x15

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleAssetUploadRequest(Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x4d

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest;->AssetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest$AssetBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest$AssetBlock;->TransactionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest;->AssetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest$AssetBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest$AssetBlock;->Type:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest;->AssetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest$AssetBlock;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest$AssetBlock;->Tempfile:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest;->AssetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest$AssetBlock;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest$AssetBlock;->StoreLocal:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest;->AssetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest$AssetBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest$AssetBlock;->AssetData:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest;->AssetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest$AssetBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest$AssetBlock;->TransactionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest;->AssetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest$AssetBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest$AssetBlock;->Type:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest;->AssetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest$AssetBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest$AssetBlock;->Tempfile:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest;->AssetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest$AssetBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest$AssetBlock;->StoreLocal:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest;->AssetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest$AssetBlock;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest$AssetBlock;->AssetData:[B

    return-void
.end method
