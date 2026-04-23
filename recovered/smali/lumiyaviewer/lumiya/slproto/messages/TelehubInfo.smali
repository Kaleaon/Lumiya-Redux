.class public Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo$SpawnPointBlock;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo$TelehubBlock;
    }
.end annotation


# instance fields
.field public SpawnPointBlock_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo$SpawnPointBlock;",
            ">;"
        }
    .end annotation
.end field

.field public TelehubBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo$TelehubBlock;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo;->SpawnPointBlock_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo$TelehubBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo$TelehubBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo;->TelehubBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo$TelehubBlock;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo;->TelehubBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo$TelehubBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo$TelehubBlock;->ObjectName:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x11

    add-int/lit8 v0, v0, 0xc

    add-int/lit8 v0, v0, 0xc

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo;->SpawnPointBlock_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0xc

    add-int/2addr v0, v1

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleTelehubInfo(Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0xa

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo;->TelehubBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo$TelehubBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo$TelehubBlock;->ObjectID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo;->TelehubBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo$TelehubBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo$TelehubBlock;->ObjectName:[B

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo;->TelehubBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo$TelehubBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo$TelehubBlock;->TelehubPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo;->TelehubBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo$TelehubBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo$TelehubBlock;->TelehubRot:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo;->packLLQuaternion(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo;->SpawnPointBlock_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo;->SpawnPointBlock_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo$SpawnPointBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo$SpawnPointBlock;->SpawnPointPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo;->TelehubBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo$TelehubBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo$TelehubBlock;->ObjectID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo;->TelehubBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo$TelehubBlock;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo$TelehubBlock;->ObjectName:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo;->TelehubBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo$TelehubBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo$TelehubBlock;->TelehubPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo;->TelehubBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo$TelehubBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo;->unpackLLQuaternion(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo$TelehubBlock;->TelehubRot:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v1, v0, 0xff

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo$SpawnPointBlock;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo$SpawnPointBlock;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo$SpawnPointBlock;->SpawnPointPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo;->SpawnPointBlock_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
