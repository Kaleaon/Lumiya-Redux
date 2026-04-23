.class public Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;,
        Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDDefaultContentHandler;
    }
.end annotation


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-slproto-https-LLSDContentTypeDetector$LLSDContentTypeSwitchesValues:[I

.field private static final synthetic -com-lumiyaviewer-lumiya-slproto-llsd-LLSDNodeTypeSwitchesValues:[I


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-slproto-https-LLSDContentTypeDetector$LLSDContentTypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser;->-com-lumiyaviewer-lumiya-slproto-https-LLSDContentTypeDetector$LLSDContentTypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser;->-com-lumiyaviewer-lumiya-slproto-https-LLSDContentTypeDetector$LLSDContentTypeSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;->values()[Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;->llsdBinary:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_1

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;->llsdXML:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_0

    :goto_1
    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser;->-com-lumiyaviewer-lumiya-slproto-https-LLSDContentTypeDetector$LLSDContentTypeSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_1

    :catch_1
    move-exception v1

    goto :goto_0
.end method

.method private static synthetic -getcom-lumiyaviewer-lumiya-slproto-llsd-LLSDNodeTypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser;->-com-lumiyaviewer-lumiya-slproto-llsd-LLSDNodeTypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser;->-com-lumiyaviewer-lumiya-slproto-llsd-LLSDNodeTypeSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->values()[Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdArray:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_c

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdBinary:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_b

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdBoolean:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_a

    :goto_2
    :try_start_3
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdDate:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_9

    :goto_3
    :try_start_4
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdDouble:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_8

    :goto_4
    :try_start_5
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdInteger:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_7

    :goto_5
    :try_start_6
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdKey:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_6

    :goto_6
    :try_start_7
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdMap:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_5

    :goto_7
    :try_start_8
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdRoot:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_4

    :goto_8
    :try_start_9
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdString:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_3

    :goto_9
    :try_start_a
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdURI:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->ordinal()I

    move-result v1

    const/16 v2, 0xb

    aput v2, v0, v1
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_2

    :goto_a
    :try_start_b
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdUUID:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->ordinal()I

    move-result v1

    const/16 v2, 0xc

    aput v2, v0, v1
    :try_end_b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_b .. :try_end_b} :catch_1

    :goto_b
    :try_start_c
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->llsdUndef:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->ordinal()I

    move-result v1

    const/16 v2, 0xd

    aput v2, v0, v1
    :try_end_c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_c} :catch_0

    :goto_c
    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser;->-com-lumiyaviewer-lumiya-slproto-llsd-LLSDNodeTypeSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_c

    :catch_1
    move-exception v1

    goto :goto_b

    :catch_2
    move-exception v1

    goto :goto_a

    :catch_3
    move-exception v1

    goto :goto_9

    :catch_4
    move-exception v1

    goto :goto_8

    :catch_5
    move-exception v1

    goto :goto_7

    :catch_6
    move-exception v1

    goto :goto_6

    :catch_7
    move-exception v1

    goto :goto_5

    :catch_8
    move-exception v1

    goto :goto_4

    :catch_9
    move-exception v1

    goto :goto_3

    :catch_a
    move-exception v1

    goto :goto_2

    :catch_b
    move-exception v1

    goto/16 :goto_1

    :catch_c
    move-exception v1

    goto/16 :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parseAny(Ljava/io/InputStream;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;
        }
    .end annotation

    :try_start_0
    new-instance v0, Ljava/io/BufferedInputStream;

    const/high16 v1, 0x10000

    invoke-direct {v0, p0, v1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser;->-getcom-lumiyaviewer-lumiya-slproto-https-LLSDContentTypeDetector$LLSDContentTypeSwitchesValues()[I

    move-result-object v1

    invoke-static {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector;->DetectContentType(Ljava/io/BufferedInputStream;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    new-instance v1, Ljava/io/DataInputStream;

    invoke-direct {v1, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static {v1, p2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser;->parseBinary(Ljava/io/DataInputStream;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;

    const-string/jumbo v2, "I/O error"

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    throw v1

    :pswitch_1
    :try_start_1
    const-string/jumbo v1, "UTF-8"

    invoke-static {v0, v1, p2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser;->parseXML(Ljava/io/InputStream;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static parseBinary(Ljava/io/DataInputStream;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;
        }
    .end annotation

    const/4 v0, 0x1

    const/4 v1, 0x0

    :try_start_0
    invoke-static {v0, v1, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser;->parseBinaryNode(ILjava/lang/String;Ljava/io/DataInputStream;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;)V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;

    const-string/jumbo v2, "I/O error"

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    throw v1

    :catch_1
    move-exception v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;

    const-string/jumbo v2, "Interrupted"

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    throw v1

    :catch_2
    move-exception v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;

    const-string/jumbo v2, "Invalid value type"

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    throw v1
.end method

.method private static parseBinaryNode(ILjava/lang/String;Ljava/io/DataInputStream;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;)V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;,
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;,
            Ljava/lang/InterruptedException;,
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v9, 0x1

    const/4 v8, 0x0

    const/4 v3, 0x0

    move v1, p0

    :goto_0
    if-lez v1, :cond_9

    invoke-virtual {p2}, Ljava/io/DataInputStream;->readByte()B

    move-result v0

    sparse-switch v0, :sswitch_data_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Unknown LLSD element 0x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;-><init>(Ljava/lang/String;)V

    throw v1

    :sswitch_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUndefined;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUndefined;-><init>()V

    invoke-interface {p3, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;->onPrimitiveValue(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    add-int/lit8 v0, v1, -0x1

    :goto_1
    move v1, v0

    goto :goto_0

    :sswitch_1
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBoolean;

    invoke-direct {v0, v9}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBoolean;-><init>(Z)V

    invoke-interface {p3, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;->onPrimitiveValue(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    add-int/lit8 v0, v1, -0x1

    goto :goto_1

    :sswitch_2
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBoolean;

    invoke-direct {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBoolean;-><init>(Z)V

    invoke-interface {p3, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;->onPrimitiveValue(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    add-int/lit8 v0, v1, -0x1

    goto :goto_1

    :sswitch_3
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDInt;

    invoke-virtual {p2}, Ljava/io/DataInputStream;->readInt()I

    move-result v2

    invoke-direct {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDInt;-><init>(I)V

    invoke-interface {p3, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;->onPrimitiveValue(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    add-int/lit8 v0, v1, -0x1

    goto :goto_1

    :sswitch_4
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDDouble;

    invoke-virtual {p2}, Ljava/io/DataInputStream;->readDouble()D

    move-result-wide v4

    invoke-direct {v0, v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDDouble;-><init>(D)V

    invoke-interface {p3, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;->onPrimitiveValue(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    add-int/lit8 v0, v1, -0x1

    goto :goto_1

    :sswitch_5
    invoke-virtual {p2}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v4

    invoke-virtual {p2}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v6

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;

    new-instance v2, Ljava/util/UUID;

    invoke-direct {v2, v4, v5, v6, v7}, Ljava/util/UUID;-><init>(JJ)V

    invoke-direct {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;-><init>(Ljava/util/UUID;)V

    invoke-interface {p3, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;->onPrimitiveValue(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    add-int/lit8 v0, v1, -0x1

    goto :goto_1

    :sswitch_6
    invoke-virtual {p2}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    new-array v0, v0, [B

    invoke-virtual {p2, v0}, Ljava/io/DataInputStream;->readFully([B)V

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBinary;

    invoke-direct {v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBinary;-><init>([B)V

    invoke-interface {p3, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;->onPrimitiveValue(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    add-int/lit8 v0, v1, -0x1

    goto :goto_1

    :sswitch_7
    invoke-virtual {p2}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;

    const-string/jumbo v2, ""

    invoke-direct {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;-><init>(Ljava/lang/String;)V

    invoke-interface {p3, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;->onPrimitiveValue(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    :goto_2
    add-int/lit8 v0, v1, -0x1

    goto :goto_1

    :cond_0
    new-array v0, v0, [B

    invoke-virtual {p2, v0}, Ljava/io/DataInputStream;->readFully([B)V

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;-><init>(Ljava/lang/String;)V

    invoke-interface {p3, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;->onPrimitiveValue(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    goto :goto_2

    :sswitch_8
    invoke-virtual {p2}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDURI;

    const-string/jumbo v2, ""

    invoke-direct {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDURI;-><init>(Ljava/lang/String;)V

    invoke-interface {p3, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;->onPrimitiveValue(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    :goto_3
    add-int/lit8 v0, v1, -0x1

    goto/16 :goto_1

    :cond_1
    new-array v0, v0, [B

    invoke-virtual {p2, v0}, Ljava/io/DataInputStream;->readFully([B)V

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDURI;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDURI;-><init>(Ljava/lang/String;)V

    invoke-interface {p3, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;->onPrimitiveValue(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    goto :goto_3

    :sswitch_9
    invoke-virtual {p2}, Ljava/io/DataInputStream;->readDouble()D

    move-result-wide v4

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDDate;

    new-instance v2, Ljava/util/Date;

    const-wide v6, 0x408f400000000000L    # 1000.0

    mul-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->round(D)J

    move-result-wide v4

    invoke-direct {v2, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-direct {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDDate;-><init>(Ljava/util/Date;)V

    invoke-interface {p3, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;->onPrimitiveValue(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    add-int/lit8 v0, v1, -0x1

    goto/16 :goto_1

    :sswitch_a
    invoke-virtual {p2}, Ljava/io/DataInputStream;->readInt()I

    move-result v2

    invoke-interface {p3, p1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;->onArrayBegin(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;

    move-result-object v0

    if-nez v0, :cond_2

    move-object v0, p3

    :cond_2
    invoke-static {v2, v8, p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser;->parseBinaryNode(ILjava/lang/String;Ljava/io/DataInputStream;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;)V

    invoke-virtual {p2}, Ljava/io/DataInputStream;->readByte()B

    move-result v2

    const/16 v4, 0x5d

    if-eq v2, v4, :cond_3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;

    const-string/jumbo v1, "Array terminator expected"

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;->onMapEnd(Ljava/lang/String;)V

    add-int/lit8 v0, v1, -0x1

    goto/16 :goto_1

    :sswitch_b
    invoke-virtual {p2}, Ljava/io/DataInputStream;->readInt()I

    move-result v4

    invoke-interface {p3, p1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;->onMapBegin(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;

    move-result-object v0

    if-nez v0, :cond_4

    move-object v0, p3

    :cond_4
    move v2, v3

    :goto_4
    if-ge v2, v4, :cond_6

    invoke-virtual {p2}, Ljava/io/DataInputStream;->readByte()B

    move-result v5

    const/16 v6, 0x6b

    if-eq v5, v6, :cond_5

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;

    const-string/jumbo v1, "Map key expected"

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5
    invoke-virtual {p2}, Ljava/io/DataInputStream;->readInt()I

    move-result v5

    new-array v5, v5, [B

    invoke-virtual {p2, v5}, Ljava/io/DataInputStream;->readFully([B)V

    invoke-static {v5}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v5

    invoke-static {v9, v5, p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser;->parseBinaryNode(ILjava/lang/String;Ljava/io/DataInputStream;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_6
    invoke-virtual {p2}, Ljava/io/DataInputStream;->readByte()B

    move-result v2

    const/16 v4, 0x7d

    if-eq v2, v4, :cond_7

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;

    const-string/jumbo v1, "Map terminator expected"

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_7
    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;->onMapEnd(Ljava/lang/String;)V

    add-int/lit8 v0, v1, -0x1

    goto/16 :goto_1

    :cond_8
    :sswitch_c
    invoke-virtual {p2}, Ljava/io/DataInputStream;->readByte()B

    move-result v0

    const/16 v2, 0x3e

    if-ne v0, v2, :cond_8

    move v0, v1

    goto/16 :goto_1

    :sswitch_d
    move v0, v1

    goto/16 :goto_1

    :cond_9
    return-void

    :sswitch_data_0
    .sparse-switch
        0xa -> :sswitch_d
        0x21 -> :sswitch_0
        0x30 -> :sswitch_2
        0x31 -> :sswitch_1
        0x3c -> :sswitch_c
        0x5b -> :sswitch_a
        0x62 -> :sswitch_6
        0x64 -> :sswitch_9
        0x69 -> :sswitch_3
        0x6c -> :sswitch_8
        0x72 -> :sswitch_4
        0x73 -> :sswitch_7
        0x75 -> :sswitch_5
        0x7b -> :sswitch_b
    .end sparse-switch
.end method

.method public static parseXML(Ljava/io/InputStream;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;
        }
    .end annotation

    :try_start_0
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v0

    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    const-string/jumbo v1, "llsd"

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3, v1}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    const/4 v1, 0x0

    invoke-static {v1, v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser;->parseXMLNode(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;)V

    const-string/jumbo v1, "llsd"

    const/4 v2, 0x3

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3, v1}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;

    const-string/jumbo v2, "Interrupted"

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    throw v1

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;->printStackTrace()V

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;

    const-string/jumbo v2, "Malformed XML"

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    throw v1

    :catch_2
    move-exception v0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;

    const-string/jumbo v1, "Input stream error"

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;-><init>(Ljava/lang/String;)V

    throw v0

    :catch_3
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "XmlPullParserException: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;

    const-string/jumbo v2, "Malformed XML"

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    throw v1
.end method

.method private static parseXMLNode(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;,
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;,
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    const/4 v4, 0x3

    const/4 v3, 0x0

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->byTag(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;

    move-result-object v1

    if-nez v1, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Unknown tag: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser;->-getcom-lumiyaviewer-lumiya-slproto-llsd-LLSDNodeTypeSwitchesValues()[I

    move-result-object v2

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeType;->ordinal()I

    move-result v1

    aget v1, v2, v1

    packed-switch v1, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDInt;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDInt;-><init>(Ljava/lang/String;)V

    invoke-interface {p2, p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;->onPrimitiveValue(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    goto :goto_0

    :pswitch_1
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBoolean;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBoolean;-><init>(Ljava/lang/String;)V

    invoke-interface {p2, p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;->onPrimitiveValue(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    goto :goto_0

    :pswitch_2
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;-><init>(Ljava/lang/String;)V

    invoke-interface {p2, p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;->onPrimitiveValue(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    goto :goto_0

    :pswitch_3
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDDouble;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDDouble;-><init>(Ljava/lang/String;)V

    invoke-interface {p2, p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;->onPrimitiveValue(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    goto :goto_0

    :pswitch_4
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;-><init>(Ljava/lang/String;)V

    invoke-interface {p2, p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;->onPrimitiveValue(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    goto :goto_0

    :pswitch_5
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBinary;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBinary;-><init>(Ljava/lang/String;)V

    invoke-interface {p2, p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;->onPrimitiveValue(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    goto :goto_0

    :pswitch_6
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDDate;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDDate;-><init>(Ljava/lang/String;)V

    invoke-interface {p2, p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;->onPrimitiveValue(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    goto :goto_0

    :pswitch_7
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDURI;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDURI;-><init>(Ljava/lang/String;)V

    invoke-interface {p2, p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;->onPrimitiveValue(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    goto :goto_0

    :pswitch_8
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUndefined;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUndefined;-><init>()V

    invoke-interface {p2, p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;->onPrimitiveValue(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    goto/16 :goto_0

    :pswitch_9
    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Unexpected tag: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;-><init>(Ljava/lang/String;)V

    throw v1

    :pswitch_a
    invoke-interface {p2, p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;->onArrayBegin(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;

    move-result-object v0

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    if-nez v0, :cond_5

    :goto_1
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    if-eq v0, v4, :cond_1

    invoke-static {v3, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser;->parseXMLNode(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;)V

    goto :goto_1

    :cond_1
    invoke-interface {p2, p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;->onArrayEnd(Ljava/lang/String;)V

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    goto/16 :goto_0

    :pswitch_b
    invoke-interface {p2, p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;->onMapBegin(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;

    move-result-object v0

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    if-nez v0, :cond_4

    :goto_2
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    if-eq v0, v4, :cond_3

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "key"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Unexpected tag: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_2
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    invoke-static {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser;->parseXMLNode(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;)V

    goto :goto_2

    :cond_3
    invoke-interface {p2, p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;->onMapEnd(Ljava/lang/String;)V

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    goto/16 :goto_0

    :pswitch_c
    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Unexpected tag: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_4
    move-object p2, v0

    goto :goto_2

    :cond_5
    move-object p2, v0

    goto :goto_1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_a
        :pswitch_5
        :pswitch_1
        :pswitch_6
        :pswitch_3
        :pswitch_0
        :pswitch_c
        :pswitch_b
        :pswitch_9
        :pswitch_2
        :pswitch_7
        :pswitch_4
        :pswitch_8
    .end packed-switch
.end method
