.class Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$RootContentHandler$1$1;
.super Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDDefaultContentHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$RootContentHandler$1;->onArrayBegin(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$RootContentHandler$1;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$RootContentHandler$1;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$RootContentHandler$1$1;->this$2:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$RootContentHandler$1;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDDefaultContentHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public onMapBegin(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDContentHandler;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$FolderDataContentHandler;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$RootContentHandler$1$1;->this$2:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$RootContentHandler$1;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$RootContentHandler$1;->this$1:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$RootContentHandler;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$RootContentHandler;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$RootContentHandler$1$1;->this$2:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$RootContentHandler$1;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$RootContentHandler$1;->this$1:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$RootContentHandler;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$RootContentHandler;->-get0(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$RootContentHandler;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$FolderDataContentHandler;-><init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$DatabaseCommitThread;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$FolderDataContentHandler;)V

    return-object v0
.end method
