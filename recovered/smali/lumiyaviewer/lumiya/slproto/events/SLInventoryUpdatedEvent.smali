.class public Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryUpdatedEvent;
.super Ljava/lang/Object;


# instance fields
.field private needsReload:Z

.field private updatedFolders:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private updatedItems:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Set;Ljava/util/Set;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Long;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Long;",
            ">;Z)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryUpdatedEvent;->updatedFolders:Ljava/util/Set;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryUpdatedEvent;->updatedItems:Ljava/util/Set;

    iput-boolean p3, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryUpdatedEvent;->needsReload:Z

    return-void
.end method


# virtual methods
.method public isFolderUpdated(J)Z
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryUpdatedEvent;->updatedFolders:Ljava/util/Set;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryUpdatedEvent;->updatedFolders:Ljava/util/Set;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isItemUpdated(J)Z
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryUpdatedEvent;->updatedItems:Ljava/util/Set;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryUpdatedEvent;->updatedItems:Ljava/util/Set;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isReloadNeeded()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLInventoryUpdatedEvent;->needsReload:Z

    return v0
.end method
