.class public interface abstract Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$EventListener;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "EventListener"
.end annotation


# virtual methods
.method public abstract getListEventsExecutor()Ljava/util/concurrent/Executor;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end method

.method public abstract onListItemAddedAtEnd()V
.end method

.method public abstract onListItemChanged(I)V
.end method

.method public abstract onListItemsAdded(II)V
.end method

.method public abstract onListItemsRemoved(II)V
.end method

.method public abstract onListReloaded()V
.end method
