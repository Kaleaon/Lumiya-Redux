.class public Lcom/lumiyaviewer/lumiya/utils/InlineList;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/lumiyaviewer/lumiya/utils/InlineListEntry",
        "<TT;>;>",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private first:Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/InlineList;->first:Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;

    return-void
.end method


# virtual methods
.method public addEntry(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    const/4 v1, 0x0

    invoke-interface {p1}, Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;->getList()Lcom/lumiyaviewer/lumiya/utils/InlineList;

    move-result-object v0

    if-eq v0, p0, :cond_2

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/utils/InlineList;->removeEntry(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/InlineList;->first:Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;

    invoke-interface {p1, v0}, Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;->setNext(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V

    invoke-interface {p1, v1}, Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;->setPrev(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/InlineList;->first:Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/InlineList;->first:Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;

    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;->setPrev(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V

    :cond_1
    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/utils/InlineList;->first:Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;

    invoke-interface {p1, p0}, Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;->setList(Lcom/lumiyaviewer/lumiya/utils/InlineList;)V

    :cond_2
    return-void
.end method

.method public final getFirst()Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/InlineList;->first:Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;

    return-object v0
.end method

.method public removeEntry(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    const/4 v2, 0x0

    invoke-interface {p1}, Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;->getList()Lcom/lumiyaviewer/lumiya/utils/InlineList;

    move-result-object v0

    if-ne v0, p0, :cond_1

    invoke-interface {p1}, Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;->getNext()Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;

    move-result-object v0

    invoke-interface {p1}, Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;->getPrev()Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-interface {v1, v0}, Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;->setNext(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V

    :goto_0
    if-eqz v0, :cond_0

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;->setPrev(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V

    :cond_0
    invoke-interface {p1, v2}, Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;->setPrev(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V

    invoke-interface {p1, v2}, Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;->setNext(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V

    invoke-interface {p1, v2}, Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;->setList(Lcom/lumiyaviewer/lumiya/utils/InlineList;)V

    :cond_1
    return-void

    :cond_2
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/InlineList;->first:Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;

    goto :goto_0
.end method

.method public requestEntryRemoval(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    return-void
.end method
