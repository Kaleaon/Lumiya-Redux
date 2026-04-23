.class public abstract Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadHandler;,
        Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadable;
    }
.end annotation


# instance fields
.field final loadQueue:Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;->loadQueue:Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;

    return-void
.end method


# virtual methods
.method public abstract RunLoadQueue(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .param p1    # Lcom/lumiyaviewer/lumiya/render/RenderContext;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
.end method

.method public StopLoadQueue()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;->loadQueue:Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;->clear()V

    return-void
.end method

.method public add(Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadable;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadable;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;->loadQueue:Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;->offer(Ljava/lang/Object;)Z

    return-void
.end method

.method public remove(Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadable;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadable;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;->loadQueue:Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;->remove(Ljava/lang/Object;)Z

    return-void
.end method
