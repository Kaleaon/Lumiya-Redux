.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$OwnerIDs;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$ParcelData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$TaskIDs;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$AgentData;

.field public OwnerIDs_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$OwnerIDs;",
            ">;"
        }
    .end annotation
.end field

.field public ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$ParcelData;

.field public TaskIDs_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$TaskIDs;",
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

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->TaskIDs_Fields:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->OwnerIDs_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$ParcelData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$ParcelData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$ParcelData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->TaskIDs_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x2d

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->OwnerIDs_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x10

    add-int/2addr v0, v1

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleParcelReturnObjects(Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x39

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$ParcelData;->LocalID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$ParcelData;->ReturnType:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->TaskIDs_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->TaskIDs_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$TaskIDs;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$TaskIDs;->TaskID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->OwnerIDs_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->OwnerIDs_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$OwnerIDs;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$OwnerIDs;->OwnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    goto :goto_1

    :cond_1
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 5

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$ParcelData;->LocalID:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$ParcelData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$ParcelData;->ReturnType:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v2, v1, 0xff

    move v1, v0

    :goto_0
    if-ge v1, v2, :cond_0

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$TaskIDs;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$TaskIDs;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v4

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$TaskIDs;->TaskID:Ljava/util/UUID;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->TaskIDs_Fields:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    :goto_1
    if-ge v0, v1, :cond_1

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$OwnerIDs;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$OwnerIDs;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects$OwnerIDs;->OwnerID:Ljava/util/UUID;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;->OwnerIDs_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    return-void
.end method
