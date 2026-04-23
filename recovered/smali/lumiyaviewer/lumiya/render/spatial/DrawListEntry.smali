.class public abstract Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/lumiyaviewer/lumiya/utils/InlineListEntry",
        "<",
        "Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;",
        ">;"
    }
.end annotation


# instance fields
.field final boundingBox:[F
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private volatile list:Lcom/lumiyaviewer/lumiya/utils/InlineList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/utils/InlineList",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;",
            ">;"
        }
    .end annotation
.end field

.field private next:Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;

.field private prev:Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x6

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;->boundingBox:[F

    return-void
.end method


# virtual methods
.method public abstract addToDrawList(Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;)V
    .param p1    # Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
.end method

.method public getList()Lcom/lumiyaviewer/lumiya/utils/InlineList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/utils/InlineList",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;->list:Lcom/lumiyaviewer/lumiya/utils/InlineList;

    return-object v0
.end method

.method public getNext()Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;->next:Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;

    return-object v0
.end method

.method public bridge synthetic getNext()Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;
    .locals 1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;->getNext()Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;

    move-result-object v0

    return-object v0
.end method

.method public getPrev()Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;->prev:Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;

    return-object v0
.end method

.method public bridge synthetic getPrev()Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;
    .locals 1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;->getPrev()Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;

    move-result-object v0

    return-object v0
.end method

.method public requestEntryRemoval()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;->list:Lcom/lumiyaviewer/lumiya/utils/InlineList;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/utils/InlineList;->requestEntryRemoval(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V

    :cond_0
    return-void
.end method

.method public setList(Lcom/lumiyaviewer/lumiya/utils/InlineList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/utils/InlineList",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;->list:Lcom/lumiyaviewer/lumiya/utils/InlineList;

    return-void
.end method

.method public setNext(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;->next:Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;

    return-void
.end method

.method public bridge synthetic setNext(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V
    .locals 0

    check-cast p1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;->setNext(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;)V

    return-void
.end method

.method public setPrev(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;->prev:Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;

    return-void
.end method

.method public bridge synthetic setPrev(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V
    .locals 0

    check-cast p1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;->setPrev(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;)V

    return-void
.end method
