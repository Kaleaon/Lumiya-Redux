.class public Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$10;,
        Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$11;,
        Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$1;,
        Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$2;,
        Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$3;,
        Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$4;,
        Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$5;,
        Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$6;,
        Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$7;,
        Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$8;,
        Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$9;,
        Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;
    }
.end annotation


# static fields
.field private static createArray:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

.field private static createBinary:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

.field private static createBoolean:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

.field private static createDate:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

.field private static createDouble:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

.field private static createInt:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

.field private static createMap:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

.field private static createString:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

.field private static createURI:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

.field private static createUUID:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

.field private static createUndef:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

.field private static tagMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    const/16 v1, 0x16

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->tagMap:Ljava/util/Map;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$1;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$1;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->createUndef:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$2;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$2;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->createBoolean:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$3;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$3;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->createInt:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$4;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$4;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->createDouble:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$5;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$5;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->createUUID:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$6;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$6;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->createString:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$7;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$7;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->createDate:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$8;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$8;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->createURI:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$9;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$9;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->createBinary:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$10;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$10;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->createArray:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$11;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$11;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->createMap:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->tagMap:Ljava/util/Map;

    const-string/jumbo v1, "undef"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->createUndef:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->tagMap:Ljava/util/Map;

    const-string/jumbo v1, "boolean"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->createBoolean:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->tagMap:Ljava/util/Map;

    const-string/jumbo v1, "integer"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->createInt:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->tagMap:Ljava/util/Map;

    const-string/jumbo v1, "real"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->createDouble:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->tagMap:Ljava/util/Map;

    const-string/jumbo v1, "uuid"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->createUUID:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->tagMap:Ljava/util/Map;

    const-string/jumbo v1, "string"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->createString:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->tagMap:Ljava/util/Map;

    const-string/jumbo v1, "date"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->createDate:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->tagMap:Ljava/util/Map;

    const-string/jumbo v1, "uri"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->createURI:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->tagMap:Ljava/util/Map;

    const-string/jumbo v1, "binary"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->createBinary:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->tagMap:Ljava/util/Map;

    const-string/jumbo v1, "array"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->createArray:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->tagMap:Ljava/util/Map;

    const-string/jumbo v1, "map"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->createMap:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parseNode(Lorg/xmlpull/v1/XmlPullParser;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;,
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;
        }
    .end annotation

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;->tagMap:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;

    if-nez v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Invalid tag name: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-interface {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;->createNodeFromXML(Lorg/xmlpull/v1/XmlPullParser;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    return-object v0
.end method
