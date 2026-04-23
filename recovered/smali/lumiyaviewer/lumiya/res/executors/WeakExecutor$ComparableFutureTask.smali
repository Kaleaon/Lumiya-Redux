.class Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor$ComparableFutureTask;
.super Ljava/util/concurrent/FutureTask;

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ComparableFutureTask"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor$ComparableFutureTask$WeakCallable;,
        Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor$ComparableFutureTask$WeakRunnable;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/FutureTask",
        "<TT;>;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor$ComparableFutureTask",
        "<TT;>;>;"
    }
.end annotation


# instance fields
.field private final priority:I


# direct methods
.method constructor <init>(Ljava/lang/Runnable;Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Runnable;",
            "TT;)V"
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor$ComparableFutureTask$WeakRunnable;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor$ComparableFutureTask$WeakRunnable;-><init>(Ljava/lang/Runnable;Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor$ComparableFutureTask$WeakRunnable;)V

    invoke-direct {p0, v0, p2}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/lang/Runnable;Ljava/lang/Object;)V

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/utils/HasPriority;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/lumiyaviewer/lumiya/utils/HasPriority;

    invoke-interface {p1}, Lcom/lumiyaviewer/lumiya/utils/HasPriority;->getPriority()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor$ComparableFutureTask;->priority:I

    :goto_0
    return-void

    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor$ComparableFutureTask;->priority:I

    goto :goto_0
.end method

.method constructor <init>(Ljava/util/concurrent/Callable;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable",
            "<TT;>;)V"
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor$ComparableFutureTask$WeakCallable;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor$ComparableFutureTask$WeakCallable;-><init>(Ljava/util/concurrent/Callable;Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor$ComparableFutureTask$WeakCallable;)V

    invoke-direct {p0, v0}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/utils/HasPriority;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/lumiyaviewer/lumiya/utils/HasPriority;

    invoke-interface {p1}, Lcom/lumiyaviewer/lumiya/utils/HasPriority;->getPriority()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor$ComparableFutureTask;->priority:I

    :goto_0
    return-void

    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor$ComparableFutureTask;->priority:I

    goto :goto_0
.end method


# virtual methods
.method public compareTo(Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor$ComparableFutureTask;)I
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor$ComparableFutureTask;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor$ComparableFutureTask",
            "<TT;>;)I"
        }
    .end annotation

    if-ne p1, p0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor$ComparableFutureTask;->priority:I

    iget v1, p1, Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor$ComparableFutureTask;->priority:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor$ComparableFutureTask;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor$ComparableFutureTask;->compareTo(Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor$ComparableFutureTask;)I

    move-result v0

    return v0
.end method
