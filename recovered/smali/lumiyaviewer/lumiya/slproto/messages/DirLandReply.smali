.class public Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$QueryData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$QueryReplies;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$AgentData;

.field public QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$QueryData;

.field public QueryReplies_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$QueryReplies;",
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

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;->QueryReplies_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$QueryData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$QueryData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$QueryData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 3

    const/16 v0, 0x25

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;->QueryReplies_Fields:Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$QueryReplies;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$QueryReplies;->Name:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x11

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/2addr v0, v1

    move v1, v0

    goto :goto_0

    :cond_0
    return v1
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleDirLandReply(Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x32

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$QueryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$QueryData;->QueryID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;->QueryReplies_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;->QueryReplies_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$QueryReplies;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$QueryReplies;->ParcelID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$QueryReplies;->Name:[B

    const/4 v3, 0x1

    invoke-virtual {p0, p1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-boolean v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$QueryReplies;->Auction:Z

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-boolean v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$QueryReplies;->ForSale:Z

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$QueryReplies;->SalePrice:I

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$QueryReplies;->ActualArea:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;->packInt(Ljava/nio/ByteBuffer;I)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$QueryData;->QueryID:Ljava/util/UUID;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v1, v0, 0xff

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$QueryReplies;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$QueryReplies;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$QueryReplies;->ParcelID:Ljava/util/UUID;

    const/4 v3, 0x1

    invoke-virtual {p0, p1, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$QueryReplies;->Name:[B

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v3

    iput-boolean v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$QueryReplies;->Auction:Z

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v3

    iput-boolean v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$QueryReplies;->ForSale:Z

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$QueryReplies;->SalePrice:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply$QueryReplies;->ActualArea:I

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;->QueryReplies_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
