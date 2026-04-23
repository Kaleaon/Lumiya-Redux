.class public Lcom/lumiyaviewer/lumiya/render/spatial/SpatialListEntry;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final data:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field next:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialListEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/render/spatial/SpatialListEntry",
            "<TT;>;"
        }
    .end annotation
.end field

.field node:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

.field prev:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialListEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/render/spatial/SpatialListEntry",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialListEntry;->node:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialTreeNode;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialListEntry;->next:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialListEntry;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialListEntry;->prev:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialListEntry;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialListEntry;->data:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final getNext()Lcom/lumiyaviewer/lumiya/render/spatial/SpatialListEntry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/render/spatial/SpatialListEntry",
            "<TT;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialListEntry;->next:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialListEntry;

    return-object v0
.end method
