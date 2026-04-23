.class interface abstract Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory$LLSDNodeConstructor;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNodeFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x60a
    name = "LLSDNodeConstructor"
.end annotation


# virtual methods
.method public abstract createNodeFromXML(Lorg/xmlpull/v1/XmlPullParser;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;,
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method
