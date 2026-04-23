.class public Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;
.super Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;


# instance fields
.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;->value:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public asBoolean()Z
    .locals 2

    const-string/jumbo v0, "true"

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public asString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;->value:Ljava/lang/String;

    return-object v0
.end method

.method public asUUID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;->value:Ljava/lang/String;

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    return-object v0
.end method

.method public toBinary(Ljava/io/DataOutputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x73

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeByte(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;->value:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeInt(I)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;->value:Ljava/lang/String;

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

    const-string/jumbo v1, "string"

    invoke-interface {p1, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;->value:Ljava/lang/String;

    invoke-interface {p1, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const-string/jumbo v0, ""

    const-string/jumbo v1, "string"

    invoke-interface {p1, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    return-void
.end method
