.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RebakeAvatarTextures;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/RebakeAvatarTextures$TextureData;
    }
.end annotation


# instance fields
.field public TextureData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RebakeAvatarTextures$TextureData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RebakeAvatarTextures;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RebakeAvatarTextures$TextureData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RebakeAvatarTextures$TextureData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RebakeAvatarTextures;->TextureData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RebakeAvatarTextures$TextureData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x14

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleRebakeAvatarTextures(Lcom/lumiyaviewer/lumiya/slproto/messages/RebakeAvatarTextures;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x57

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RebakeAvatarTextures;->TextureData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RebakeAvatarTextures$TextureData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RebakeAvatarTextures$TextureData;->TextureID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RebakeAvatarTextures;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RebakeAvatarTextures;->TextureData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RebakeAvatarTextures$TextureData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RebakeAvatarTextures;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RebakeAvatarTextures$TextureData;->TextureID:Ljava/util/UUID;

    return-void
.end method
