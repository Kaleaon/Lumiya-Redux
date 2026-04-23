.class public Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode$LinkedTreeIterator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private dataObject:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private firstChild:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode",
            "<TT;>;"
        }
    .end annotation
.end field

.field private nextChild:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode",
            "<TT;>;"
        }
    .end annotation
.end field

.field private parentObject:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode",
            "<TT;>;"
        }
    .end annotation
.end field

.field private prevChild:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->dataObject:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;)Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->firstChild:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    return-object v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;)Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->nextChild:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    return-object v0
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->dataObject:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public declared-synchronized addChild(Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode",
            "<TT;>;)V"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->parentObject:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    if-eq v0, p0, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->unlinkFromParent()V

    iput-object p0, p1, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->parentObject:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    const/4 v0, 0x0

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->prevChild:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->firstChild:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->nextChild:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->firstChild:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->nextChild:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->nextChild:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    iput-object p1, v0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->prevChild:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getDataObject()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->dataObject:Ljava/lang/Object;

    return-object v0
.end method

.method public declared-synchronized getFirstChild()Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode",
            "<TT;>;"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->firstChild:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getNextChild()Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode",
            "<TT;>;"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->nextChild:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getParent()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    const/4 v1, 0x0

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->parentObject:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->parentObject:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->getDataObject()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :cond_0
    monitor-exit p0

    return-object v1

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized hasChild(Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode",
            "<*>;)Z"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->parentObject:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v0, p0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized hasChildren()Z
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->firstChild:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TT;>;"
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode$LinkedTreeIterator;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode$LinkedTreeIterator;-><init>(Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;)V

    return-object v0
.end method

.method public declared-synchronized removeChild(Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode",
            "<TT;>;)V"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->parentObject:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    if-ne v0, p0, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->unlinkFromParent()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized unlinkFromParent()V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->parentObject:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->prevChild:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->prevChild:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->nextChild:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->nextChild:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->nextChild:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->nextChild:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->prevChild:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->prevChild:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->parentObject:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    monitor-exit p0

    return-void

    :cond_2
    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->parentObject:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->nextChild:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->firstChild:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
