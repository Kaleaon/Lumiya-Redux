.class public interface abstract Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;
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


# virtual methods
.method public abstract getList()Lcom/lumiyaviewer/lumiya/utils/InlineList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/utils/InlineList",
            "<TT;>;"
        }
    .end annotation
.end method

.method public abstract getNext()Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method public abstract getPrev()Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method public abstract requestEntryRemoval()V
.end method

.method public abstract setList(Lcom/lumiyaviewer/lumiya/utils/InlineList;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/utils/InlineList",
            "<TT;>;)V"
        }
    .end annotation
.end method

.method public abstract setNext(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method

.method public abstract setPrev(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method
