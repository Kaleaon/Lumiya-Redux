.class Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$RootContentHandler$1;
.super Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDDefaultContentHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$RootContentHandler;->onMapBegin(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$RootContentHandler;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$RootContentHandler;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$RootContentHandler$1;->this$1:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$RootContentHandler;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDDefaultContentHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public onArrayBegin(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;
        }
    .end annotation

    const-string/jumbo v0, "folders"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$RootContentHandler$1$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$RootContentHandler$1$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$RootContentHandler$1;)V

    return-object v0

    :cond_0
    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDDefaultContentHandler;->onArrayBegin(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;

    move-result-object v0

    return-object v0
.end method
