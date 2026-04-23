.class public Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBinary;
.super Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;


# instance fields
.field private value:[B


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;-><init>()V

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/base64/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBinary;->value:[B

    return-void
.end method

.method public constructor <init>([B)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBinary;->value:[B

    return-void
.end method


# virtual methods
.method public asBinary()[B
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBinary;->value:[B

    return-object v0
.end method

.method public asInt()I
    .locals 3

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    const/4 v2, 0x4

    if-ge v0, v2, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBinary;->value:[B

    array-length v2, v2

    if-ge v0, v2, :cond_0

    shl-int/lit8 v1, v1, 0x8

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBinary;->value:[B

    aget-byte v2, v2, v0

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return v1
.end method

.method public asLong()J
    .locals 7

    const/16 v6, 0x8

    const-wide/16 v2, 0x0

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v6, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBinary;->value:[B

    array-length v1, v1

    if-ge v0, v1, :cond_0

    shl-long/2addr v2, v6

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBinary;->value:[B

    aget-byte v1, v1, v0

    and-int/lit16 v1, v1, 0xff

    int-to-long v4, v1

    or-long/2addr v2, v4

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-wide v2
.end method

.method public toBinary(Ljava/io/DataOutputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x62

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeByte(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBinary;->value:[B

    array-length v0, v0

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeInt(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBinary;->value:[B

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->write([B)V

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

    const-string/jumbo v1, "binary"

    invoke-interface {p1, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBinary;->value:[B

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/base64/Base64;->encodeToString([BZ)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const-string/jumbo v0, ""

    const-string/jumbo v1, "binary"

    invoke-interface {p1, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    return-void
.end method
