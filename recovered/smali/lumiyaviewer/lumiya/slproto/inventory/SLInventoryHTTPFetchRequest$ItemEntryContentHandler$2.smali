.class Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler$2;
.super Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDDefaultContentHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler$2;->this$1:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDDefaultContentHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public onPrimitiveValue(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;,
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;
        }
    .end annotation

    const-string/jumbo v0, "sale_type"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->isString()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler$2;->this$1:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;->-get0(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;->getByString(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLSaleType;->getTypeCode()I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->saleType:I

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler$2;->this$1:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;->-get0(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->saleType:I

    goto :goto_0

    :cond_1
    const-string/jumbo v0, "sale_price"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler$2;->this$1:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;->-get0(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->salePrice:I

    goto :goto_0

    :cond_2
    const-string/jumbo v0, "InvFetch: Sale info unknown key \'%s\'"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method
