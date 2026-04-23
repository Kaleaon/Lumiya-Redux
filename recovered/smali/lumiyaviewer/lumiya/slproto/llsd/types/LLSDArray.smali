.class public Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDArray;
.super Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;


# instance fields
.field private items:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDArray;->items:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;,
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDArray;->items:Ljava/util/ArrayList;

    :goto_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDArray;->items:Ljava/util/ArrayList;

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->parseNode(Lorg/xmlpull/v1/XmlPullParser;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-void
.end method

.method public varargs constructor <init>([Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 4

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDArray;->items:Ljava/util/ArrayList;

    const/4 v0, 0x0

    array-length v1, p1

    :goto_0
    if-ge v0, v1, :cond_0

    aget-object v2, p1, v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDArray;->items:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public add(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDArray;->items:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDInvalidKeyException;
        }
    .end annotation

    const/4 v4, 0x0

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDArray;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDArray;->items:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    return-object v0

    :cond_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDInvalidKeyException;

    const-string/jumbo v1, "Array index out of range: req %d, size %d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDArray;->items:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDInvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDArray;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public toBinary(Ljava/io/DataOutputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x5b

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeByte(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDArray;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeInt(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDArray;->items:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->toBinary(Ljava/io/DataOutputStream;)V

    goto :goto_0

    :cond_0
    const/16 v0, 0x5d

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeByte(I)V

    return-void
.end method

.method public toXML(Lorg/xmlpull/v1/XmlSerializer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string/jumbo v0, ""

    const-string/jumbo v1, "array"

    invoke-interface {p1, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDArray;->items:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->toXML(Lorg/xmlpull/v1/XmlSerializer;)V

    goto :goto_0

    :cond_0
    const-string/jumbo v0, ""

    const-string/jumbo v1, "array"

    invoke-interface {p1, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    return-void
.end method
