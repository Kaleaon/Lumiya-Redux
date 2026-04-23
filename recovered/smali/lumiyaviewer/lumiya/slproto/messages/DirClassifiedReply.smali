.class public Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$QueryData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$QueryReplies;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$StatusData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$AgentData;

.field public QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$QueryData;

.field public QueryReplies_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$QueryReplies;",
            ">;"
        }
    .end annotation
.end field

.field public StatusData_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$StatusData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->QueryReplies_Fields:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->StatusData_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$QueryData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$QueryData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$QueryData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 3

    const/16 v0, 0x25

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->QueryReplies_Fields:Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$QueryReplies;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$QueryReplies;->Name:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x11

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/2addr v0, v1

    move v1, v0

    goto :goto_0

    :cond_0
    add-int/lit8 v0, v1, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->StatusData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x4

    add-int/2addr v0, v1

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleDirClassifiedReply(Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x29

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$QueryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$QueryData;->QueryID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->QueryReplies_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->QueryReplies_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$QueryReplies;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$QueryReplies;->ClassifiedID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$QueryReplies;->Name:[B

    const/4 v3, 0x1

    invoke-virtual {p0, p1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$QueryReplies;->ClassifiedFlags:I

    int-to-byte v2, v2

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->packByte(Ljava/nio/ByteBuffer;B)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$QueryReplies;->CreationDate:I

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$QueryReplies;->ExpirationDate:I

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$QueryReplies;->PriceForListing:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->packInt(Ljava/nio/ByteBuffer;I)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->StatusData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->StatusData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$StatusData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$StatusData;->Status:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->packInt(Ljava/nio/ByteBuffer;I)V

    goto :goto_1

    :cond_1
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 5

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$QueryData;->QueryID:Ljava/util/UUID;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v2, v1, 0xff

    move v1, v0

    :goto_0
    if-ge v1, v2, :cond_0

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$QueryReplies;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$QueryReplies;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v4

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$QueryReplies;->ClassifiedID:Ljava/util/UUID;

    const/4 v4, 0x1

    invoke-virtual {p0, p1, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v4

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$QueryReplies;->Name:[B

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v4

    and-int/lit16 v4, v4, 0xff

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$QueryReplies;->ClassifiedFlags:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v4

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$QueryReplies;->CreationDate:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v4

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$QueryReplies;->ExpirationDate:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v4

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$QueryReplies;->PriceForListing:I

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->QueryReplies_Fields:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    :goto_1
    if-ge v0, v1, :cond_1

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$StatusData;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$StatusData;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply$StatusData;->Status:I

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;->StatusData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    return-void
.end method
