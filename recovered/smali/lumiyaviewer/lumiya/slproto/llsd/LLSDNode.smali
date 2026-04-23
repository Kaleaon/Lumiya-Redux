.class public abstract Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;
.super Ljava/lang/Object;


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-slproto-https-LLSDContentTypeDetector$LLSDContentTypeSwitchesValues:[I


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-slproto-https-LLSDContentTypeDetector$LLSDContentTypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->-com-lumiyaviewer-lumiya-slproto-https-LLSDContentTypeDetector$LLSDContentTypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->-com-lumiyaviewer-lumiya-slproto-https-LLSDContentTypeDetector$LLSDContentTypeSwitchesValues:[I

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
    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->-com-lumiyaviewer-lumiya-slproto-https-LLSDContentTypeDetector$LLSDContentTypeSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_1

    :catch_1
    move-exception v1

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static fromAny(Ljava/io/InputStream;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;
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

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->-getcom-lumiyaviewer-lumiya-slproto-https-LLSDContentTypeDetector$LLSDContentTypeSwitchesValues()[I

    move-result-object v1

    invoke-static {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector;->DetectContentType(Ljava/io/BufferedInputStream;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;

    const-string/jumbo v1, "Unknown content type"

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;

    const-string/jumbo v2, "I/O error"

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    throw v1

    :pswitch_0
    :try_start_1
    new-instance v1, Ljava/io/DataInputStream;

    invoke-direct {v1, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->fromBinary(Ljava/io/DataInputStream;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    return-object v0

    :pswitch_1
    const-string/jumbo v1, "UTF-8"

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->parseXML(Ljava/io/InputStream;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v0

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static fromBinary(Ljava/io/DataInputStream;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;
        }
    .end annotation

    const/4 v0, 0x0

    :cond_0
    :sswitch_0
    :try_start_0
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readByte()B

    move-result v1

    sparse-switch v1, :sswitch_data_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Unknown LLSD element 0x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    throw v1

    :sswitch_1
    :try_start_1
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUndefined;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUndefined;-><init>()V

    return-object v0

    :sswitch_2
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBoolean;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBoolean;-><init>(Z)V

    return-object v0

    :sswitch_3
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBoolean;-><init>(Z)V

    return-object v0

    :sswitch_4
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDInt;

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDInt;-><init>(I)V

    return-object v0

    :sswitch_5
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDDouble;

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readDouble()D

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDDouble;-><init>(D)V

    return-object v0

    :sswitch_6
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v0

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v2

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;

    new-instance v5, Ljava/util/UUID;

    invoke-direct {v5, v0, v1, v2, v3}, Ljava/util/UUID;-><init>(JJ)V

    invoke-direct {v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;-><init>(Ljava/util/UUID;)V

    return-object v4

    :sswitch_7
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    new-array v0, v0, [B

    invoke-virtual {p0, v0}, Ljava/io/DataInputStream;->readFully([B)V

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBinary;

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBinary;-><init>([B)V

    return-object v1

    :sswitch_8
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;

    const-string/jumbo v1, ""

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;-><init>(Ljava/lang/String;)V

    return-object v0

    :cond_1
    new-array v0, v0, [B

    invoke-virtual {p0, v0}, Ljava/io/DataInputStream;->readFully([B)V

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;-><init>(Ljava/lang/String;)V

    return-object v1

    :sswitch_9
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    if-nez v0, :cond_2

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDURI;

    const-string/jumbo v1, ""

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDURI;-><init>(Ljava/lang/String;)V

    return-object v0

    :cond_2
    new-array v0, v0, [B

    invoke-virtual {p0, v0}, Ljava/io/DataInputStream;->readFully([B)V

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDURI;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDURI;-><init>(Ljava/lang/String;)V

    return-object v1

    :sswitch_a
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readDouble()D

    move-result-wide v0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDDate;

    new-instance v3, Ljava/util/Date;

    const-wide v4, 0x408f400000000000L    # 1000.0

    mul-double/2addr v0, v4

    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    invoke-direct {v3, v0, v1}, Ljava/util/Date;-><init>(J)V

    invoke-direct {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDDate;-><init>(Ljava/util/Date;)V

    return-object v2

    :sswitch_b
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDArray;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDArray;-><init>()V

    :goto_0
    if-ge v0, v1, :cond_3

    invoke-static {p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->fromBinary(Ljava/io/DataInputStream;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDArray;->add(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readByte()B

    move-result v0

    const/16 v1, 0x5d

    if-eq v0, v1, :cond_4

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;

    const-string/jumbo v1, "Array terminator expected"

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    return-object v2

    :sswitch_c
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v1

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2, v1}, Ljava/util/HashMap;-><init>(I)V

    :goto_1
    if-ge v0, v1, :cond_6

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readByte()B

    move-result v3

    const/16 v4, 0x6b

    if-eq v3, v4, :cond_5

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;

    const-string/jumbo v1, "Map key expected"

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v3

    new-array v3, v3, [B

    invoke-virtual {p0, v3}, Ljava/io/DataInputStream;->readFully([B)V

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v3

    invoke-static {p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->fromBinary(Ljava/io/DataInputStream;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_6
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;

    invoke-direct {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;-><init>(Ljava/util/Map;)V

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readByte()B

    move-result v1

    const/16 v2, 0x7d

    if-eq v1, v2, :cond_7

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;

    const-string/jumbo v1, "Map terminator expected"

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_7
    return-object v0

    :goto_2
    :sswitch_d
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readByte()B
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v1

    const/16 v2, 0x3e

    if-eq v1, v2, :cond_0

    goto :goto_2

    nop

    :sswitch_data_0
    .sparse-switch
        0xa -> :sswitch_0
        0x21 -> :sswitch_1
        0x30 -> :sswitch_3
        0x31 -> :sswitch_2
        0x3c -> :sswitch_d
        0x5b -> :sswitch_b
        0x62 -> :sswitch_7
        0x64 -> :sswitch_a
        0x69 -> :sswitch_4
        0x6c -> :sswitch_9
        0x72 -> :sswitch_5
        0x73 -> :sswitch_8
        0x75 -> :sswitch_6
        0x7b -> :sswitch_c
    .end sparse-switch
.end method

.method public static fromBinaryFile(Ljava/io/File;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;
        }
    .end annotation

    const/4 v2, 0x0

    :try_start_0
    new-instance v1, Ljava/io/DataInputStream;

    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->fromBinary(Ljava/io/DataInputStream;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v0

    if-eqz v1, :cond_0

    :try_start_2
    invoke-virtual {v1}, Ljava/io/DataInputStream;->close()V

    :cond_0
    return-object v0

    :catchall_0
    move-exception v0

    move-object v1, v2

    :goto_0
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/io/DataInputStream;->close()V

    :cond_1
    throw v0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    throw v1

    :catchall_1
    move-exception v0

    goto :goto_0
.end method

.method public static parseXML(Ljava/io/InputStream;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;
    .locals 5
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

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->parseNode(Lorg/xmlpull/v1/XmlPullParser;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v1

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    const-string/jumbo v2, "llsd"

    const/4 v3, 0x3

    const/4 v4, 0x0

    invoke-interface {v0, v3, v4, v2}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;

    const-string/jumbo v1, "Input stream error"

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;-><init>(Ljava/lang/String;)V

    throw v0

    :catch_1
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


# virtual methods
.method public asBinary()[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;

    const-string/jumbo v1, "binary"

    invoke-direct {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    throw v0
.end method

.method public asBoolean()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;

    const-string/jumbo v1, "boolean"

    invoke-direct {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    throw v0
.end method

.method public asDate()Ljava/util/Date;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;

    const-string/jumbo v1, "date"

    invoke-direct {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    throw v0
.end method

.method public asDouble()D
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;

    const-string/jumbo v1, "real"

    invoke-direct {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    throw v0
.end method

.method public asInt()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;

    const-string/jumbo v1, "integer"

    invoke-direct {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    throw v0
.end method

.method public asLong()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;

    const-string/jumbo v1, "long"

    invoke-direct {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    throw v0
.end method

.method public asString()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;

    const-string/jumbo v1, "string"

    invoke-direct {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    throw v0
.end method

.method public asURI()Ljava/net/URI;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;

    const-string/jumbo v1, "uri"

    invoke-direct {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    throw v0
.end method

.method public asUUID()Ljava/util/UUID;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;

    const-string/jumbo v1, "uuid"

    invoke-direct {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    throw v0
.end method

.method public byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException;
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;

    const-string/jumbo v1, "array"

    invoke-direct {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    throw v0
.end method

.method public byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException;
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;

    const-string/jumbo v1, "map"

    invoke-direct {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    throw v0
.end method

.method public getCount()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException;
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;

    const-string/jumbo v1, "array"

    invoke-direct {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    throw v0
.end method

.method public isBinary()Z
    .locals 1

    instance-of v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBinary;

    return v0
.end method

.method public isBoolean()Z
    .locals 1

    instance-of v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDBoolean;

    return v0
.end method

.method public isDate()Z
    .locals 1

    instance-of v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDDate;

    return v0
.end method

.method public isDouble()Z
    .locals 1

    instance-of v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDDouble;

    return v0
.end method

.method public isInt()Z
    .locals 1

    instance-of v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDInt;

    return v0
.end method

.method public isLong()Z
    .locals 1

    instance-of v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDInt;

    return v0
.end method

.method public isString()Z
    .locals 1

    instance-of v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;

    return v0
.end method

.method public isURI()Z
    .locals 1

    instance-of v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDURI;

    return v0
.end method

.method public isUUID()Z
    .locals 1

    instance-of v0, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;

    return v0
.end method

.method public keyExists(Ljava/lang/String;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException;
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;

    const-string/jumbo v1, "map"

    invoke-direct {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    throw v0
.end method

.method public serializeToXML()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-static {}, Landroid/util/Xml;->newSerializer()Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v0

    new-instance v1, Ljava/io/StringWriter;

    invoke-direct {v1}, Ljava/io/StringWriter;-><init>()V

    invoke-interface {v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/Writer;)V

    const-string/jumbo v2, ""

    const-string/jumbo v3, "llsd"

    invoke-interface {v0, v2, v3}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->toXML(Lorg/xmlpull/v1/XmlSerializer;)V

    const-string/jumbo v2, ""

    const-string/jumbo v3, "llsd"

    invoke-interface {v0, v2, v3}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V

    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public serializeToXML(Ljava/io/OutputStream;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-static {}, Landroid/util/Xml;->newSerializer()Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    const-string/jumbo v1, ""

    const-string/jumbo v2, "llsd"

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->toXML(Lorg/xmlpull/v1/XmlSerializer;)V

    const-string/jumbo v1, ""

    const-string/jumbo v2, "llsd"

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V

    return-void
.end method

.method public abstract toBinary(Ljava/io/DataOutputStream;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public toObject(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<+TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException;
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Cannot deserialize "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public abstract toXML(Lorg/xmlpull/v1/XmlSerializer;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
