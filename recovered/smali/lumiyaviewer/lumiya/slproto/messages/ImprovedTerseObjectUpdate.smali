.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$ObjectData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$RegionData;
    }
.end annotation


# instance fields
.field public ObjectData_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$ObjectData;",
            ">;"
        }
    .end annotation
.end field

.field public RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$RegionData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate;->ObjectData_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$RegionData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$RegionData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$RegionData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 4

    const/16 v0, 0xc

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$ObjectData;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$ObjectData;->Data:[B

    array-length v3, v3

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v3, v3, 0x2

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$ObjectData;->TextureEntry:[B

    array-length v0, v0

    add-int/2addr v0, v3

    add-int/2addr v0, v1

    move v1, v0

    goto :goto_0

    :cond_0
    return v1
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleImprovedTerseObjectUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    const/16 v0, 0xf

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$RegionData;

    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$RegionData;->RegionHandle:J

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate;->packLong(Ljava/nio/ByteBuffer;J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$RegionData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$RegionData;->TimeDilation:I

    int-to-short v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate;->packShort(Ljava/nio/ByteBuffer;S)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$ObjectData;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$ObjectData;->Data:[B

    const/4 v3, 0x1

    invoke-virtual {p0, p1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$ObjectData;->TextureEntry:[B

    const/4 v2, 0x2

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$RegionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$RegionData;->RegionHandle:J

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate;->RegionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$RegionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v1

    const v2, 0xffff

    and-int/2addr v1, v2

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$RegionData;->TimeDilation:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v1, v0, 0xff

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$ObjectData;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$ObjectData;-><init>()V

    const/4 v3, 0x1

    invoke-virtual {p0, p1, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$ObjectData;->Data:[B

    const/4 v3, 0x2

    invoke-virtual {p0, p1, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$ObjectData;->TextureEntry:[B

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate;->ObjectData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
