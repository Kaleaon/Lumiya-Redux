.class public Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;
.super Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;


# instance fields
.field private value:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;->value:Ljava/util/UUID;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 18

    invoke-direct/range {p0 .. p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;-><init>()V

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v12

    const-wide/16 v10, 0x0

    const-wide/16 v6, 0x0

    const-wide/16 v4, 0x0

    const/4 v9, 0x0

    const/4 v8, 0x0

    const/4 v2, 0x0

    move/from16 v16, v2

    move-wide v2, v6

    move-wide v6, v10

    move/from16 v11, v16

    :goto_0
    if-ge v11, v12, :cond_4

    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v10

    const/16 v13, 0x2d

    if-eq v10, v13, :cond_5

    const/16 v13, 0x30

    if-lt v10, v13, :cond_0

    const/16 v13, 0x39

    if-gt v10, v13, :cond_0

    add-int/lit8 v10, v10, -0x30

    :goto_1
    const/4 v13, 0x4

    shl-long/2addr v4, v13

    int-to-long v14, v10

    or-long/2addr v4, v14

    add-int/lit8 v9, v9, 0x1

    const/16 v10, 0x10

    if-lt v9, v10, :cond_5

    if-nez v8, :cond_3

    move-wide v6, v4

    :goto_2
    add-int/lit8 v8, v8, 0x1

    move/from16 v16, v8

    move/from16 v17, v9

    move-wide v8, v6

    move-wide v6, v2

    move/from16 v2, v16

    move/from16 v3, v17

    :goto_3
    add-int/lit8 v10, v11, 0x1

    move v11, v10

    move/from16 v16, v2

    move/from16 v17, v3

    move-wide v2, v6

    move-wide v6, v8

    move/from16 v9, v17

    move/from16 v8, v16

    goto :goto_0

    :cond_0
    const/16 v13, 0x61

    if-lt v10, v13, :cond_1

    const/16 v13, 0x66

    if-gt v10, v13, :cond_1

    add-int/lit8 v10, v10, -0x61

    add-int/lit8 v10, v10, 0xa

    goto :goto_1

    :cond_1
    const/16 v13, 0x41

    if-lt v10, v13, :cond_2

    const/16 v13, 0x46

    if-gt v10, v13, :cond_2

    add-int/lit8 v10, v10, -0x41

    add-int/lit8 v10, v10, 0xa

    goto :goto_1

    :cond_2
    const/4 v10, 0x0

    goto :goto_1

    :cond_3
    move-wide v2, v4

    goto :goto_2

    :cond_4
    new-instance v4, Ljava/util/UUID;

    invoke-direct {v4, v6, v7, v2, v3}, Ljava/util/UUID;-><init>(JJ)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;->value:Ljava/util/UUID;

    return-void

    :cond_5
    move/from16 v16, v8

    move/from16 v17, v9

    move-wide v8, v6

    move-wide v6, v2

    move/from16 v2, v16

    move/from16 v3, v17

    goto :goto_3
.end method

.method public constructor <init>(Ljava/util/UUID;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;->value:Ljava/util/UUID;

    return-void
.end method


# virtual methods
.method public asString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;->value:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public asUUID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;->value:Ljava/util/UUID;

    return-object v0
.end method

.method public toBinary(Ljava/io/DataOutputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x75

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeByte(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;->value:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/io/DataOutputStream;->writeLong(J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;->value:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/io/DataOutputStream;->writeLong(J)V

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

    const-string/jumbo v1, "uuid"

    invoke-interface {p1, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;->value:Ljava/util/UUID;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;->value:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    :cond_0
    const-string/jumbo v0, ""

    const-string/jumbo v1, "uuid"

    invoke-interface {p1, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    return-void
.end method
