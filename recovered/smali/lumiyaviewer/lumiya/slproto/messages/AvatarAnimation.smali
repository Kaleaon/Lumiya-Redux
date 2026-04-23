.class public Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$AnimationList;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$AnimationSourceList;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$PhysicalAvatarEventList;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$Sender;
    }
.end annotation


# instance fields
.field public AnimationList_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$AnimationList;",
            ">;"
        }
    .end annotation
.end field

.field public AnimationSourceList_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$AnimationSourceList;",
            ">;"
        }
    .end annotation
.end field

.field public PhysicalAvatarEventList_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$PhysicalAvatarEventList;",
            ">;"
        }
    .end annotation
.end field

.field public Sender_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$Sender;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->AnimationList_Fields:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->AnimationSourceList_Fields:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->PhysicalAvatarEventList_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$Sender;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$Sender;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->Sender_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$Sender;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->AnimationList_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x14

    add-int/lit8 v0, v0, 0x12

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->AnimationSourceList_Fields:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x10

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->PhysicalAvatarEventList_Fields:Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$PhysicalAvatarEventList;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$PhysicalAvatarEventList;->TypeData:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    add-int/2addr v0, v1

    move v1, v0

    goto :goto_0

    :cond_0
    return v1
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleAvatarAnimation(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/16 v0, 0x14

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->Sender_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$Sender;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$Sender;->ID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->AnimationList_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->AnimationList_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$AnimationList;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$AnimationList;->AnimID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$AnimationList;->AnimSequenceID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->packInt(Ljava/nio/ByteBuffer;I)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->AnimationSourceList_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->AnimationSourceList_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$AnimationSourceList;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$AnimationSourceList;->ObjectID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->PhysicalAvatarEventList_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->PhysicalAvatarEventList_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$PhysicalAvatarEventList;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$PhysicalAvatarEventList;->TypeData:[B

    const/4 v2, 0x1

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    goto :goto_2

    :cond_2
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 5

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->Sender_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$Sender;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$Sender;->ID:Ljava/util/UUID;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v2, v1, 0xff

    move v1, v0

    :goto_0
    if-ge v1, v2, :cond_0

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$AnimationList;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$AnimationList;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v4

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$AnimationList;->AnimID:Ljava/util/UUID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v4

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$AnimationList;->AnimSequenceID:I

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->AnimationList_Fields:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v2, v1, 0xff

    move v1, v0

    :goto_1
    if-ge v1, v2, :cond_1

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$AnimationSourceList;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$AnimationSourceList;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v4

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$AnimationSourceList;->ObjectID:Ljava/util/UUID;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->AnimationSourceList_Fields:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    :goto_2
    if-ge v0, v1, :cond_2

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$PhysicalAvatarEventList;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$PhysicalAvatarEventList;-><init>()V

    const/4 v3, 0x1

    invoke-virtual {p0, p1, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation$PhysicalAvatarEventList;->TypeData:[B

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;->PhysicalAvatarEventList_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_2
    return-void
.end method
