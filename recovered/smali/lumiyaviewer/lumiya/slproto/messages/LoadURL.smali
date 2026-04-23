.class public Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;
    }
.end annotation


# instance fields
.field public Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;->ObjectName:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;->Message:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;->URL:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleLoadURL(Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x3e

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;->ObjectName:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;->ObjectID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;->OwnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;->OwnerIsGroup:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;->Message:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;->URL:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;->ObjectName:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;->ObjectID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;->OwnerID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;->OwnerIsGroup:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;->Message:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL$Data;->URL:[B

    return-void
.end method
