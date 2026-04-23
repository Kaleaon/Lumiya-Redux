.class public Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryNewContentsEvent;
.super Ljava/lang/Object;


# instance fields
.field public firstIsFolder:Z

.field public firstItemName:Ljava/lang/String;

.field public firstParentUUID:Ljava/util/UUID;

.field public newFolderCount:I

.field public newItemCount:I


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v1, 0x0

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryNewContentsEvent;->newFolderCount:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryNewContentsEvent;->newItemCount:I

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryNewContentsEvent;->firstParentUUID:Ljava/util/UUID;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryNewContentsEvent;->firstItemName:Ljava/lang/String;

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryNewContentsEvent;->firstIsFolder:Z

    return-void
.end method


# virtual methods
.method public AddItem(ZLjava/util/UUID;Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryNewContentsEvent;->newFolderCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryNewContentsEvent;->newFolderCount:I

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryNewContentsEvent;->firstParentUUID:Ljava/util/UUID;

    if-nez v0, :cond_2

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryNewContentsEvent;->firstIsFolder:Z

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryNewContentsEvent;->firstParentUUID:Ljava/util/UUID;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryNewContentsEvent;->firstItemName:Ljava/lang/String;

    :cond_0
    :goto_1
    return-void

    :cond_1
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryNewContentsEvent;->newItemCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryNewContentsEvent;->newItemCount:I

    goto :goto_0

    :cond_2
    if-eqz p1, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryNewContentsEvent;->firstIsFolder:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryNewContentsEvent;->firstIsFolder:Z

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryNewContentsEvent;->firstParentUUID:Ljava/util/UUID;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryNewContentsEvent;->firstItemName:Ljava/lang/String;

    goto :goto_1
.end method

.method public isEmpty()Z
    .locals 2

    const/4 v0, 0x0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryNewContentsEvent;->newFolderCount:I

    if-nez v1, :cond_0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryNewContentsEvent;->newItemCount:I

    if-nez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method
