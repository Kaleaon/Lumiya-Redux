.class Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$DrawListUpdateTask;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;
.implements Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue$LowPriority;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DrawListUpdateTask"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;


# direct methods
.method private constructor <init>(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$DrawListUpdateTask;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$DrawListUpdateTask;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$DrawListUpdateTask;-><init>(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$DrawListUpdateTask;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get6(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$DrawListUpdateTask;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get5(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$DrawListUpdateTask;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get2(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$DrawListUpdateTask;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get10(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->isTreeWalkNeeded()Z

    move-result v0

    :goto_0
    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$DrawListUpdateTask;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get4(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$DrawListUpdateTask;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get3(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;

    move-result-object v1

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$DrawListUpdateTask;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get10(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    move-result-object v2

    iget v1, v1, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->viewDistance:F

    invoke-virtual {v2, v0, v1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->walkTree(Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;F)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$DrawListUpdateTask;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get10(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTree;->isDrawListChanged()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$DrawListUpdateTask;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$DrawListUpdateTask;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex$DrawListUpdateTask;->this$0:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-get0(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;)I

    move-result v2

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-wrap2(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;I)Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->-set0(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;)Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;

    :cond_1
    return-void

    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method
