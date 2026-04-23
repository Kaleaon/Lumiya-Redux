.class final Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$11;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createNodeFromXML(Lorg/xmlpull/v1/XmlPullParser;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;,
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;

    invoke-direct {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;-><init>(Lorg/xmlpull/v1/XmlPullParser;)V

    return-object v0
.end method
