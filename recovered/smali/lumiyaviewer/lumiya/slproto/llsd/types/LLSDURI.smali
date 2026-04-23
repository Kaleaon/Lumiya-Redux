.class public Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDURI;
.super Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;


# instance fields
.field private value:Ljava/net/URI;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;-><init>()V

    const-string/jumbo v0, ""

    invoke-static {v0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDURI;->value:Ljava/net/URI;

    return-void
.end method

.method public constructor <init>(Ljava/net/URI;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDURI;->value:Ljava/net/URI;

    return-void
.end method


# virtual methods
.method public asURI()Ljava/net/URI;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDURI;->value:Ljava/net/URI;

    return-object v0
.end method

.method public toBinary(Ljava/io/DataOutputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDURI;->value:Ljava/net/URI;

    invoke-virtual {v0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x6c

    invoke-virtual {p1, v1}, Ljava/io/DataOutputStream;->writeByte(I)V

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeInt(I)V

    :goto_0
    return-void

    :cond_0
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableUTF(Ljava/lang/String;)[B

    move-result-object v0

    array-length v1, v0

    invoke-virtual {p1, v1}, Ljava/io/DataOutputStream;->writeInt(I)V

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->write([B)V

    goto :goto_0
.end method

.method public toXML(Lorg/xmlpull/v1/XmlSerializer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string/jumbo v0, ""

    const-string/jumbo v1, "uri"

    invoke-interface {p1, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDURI;->value:Ljava/net/URI;

    invoke-virtual {v0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const-string/jumbo v0, ""

    const-string/jumbo v1, "uri"

    invoke-interface {p1, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    return-void
.end method
