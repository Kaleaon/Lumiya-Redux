.class public Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;
.super Ljava/util/AbstractList;

# interfaces
.implements Ljava/util/RandomAccess;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList$ChunkFactory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/AbstractList",
        "<TE;>;",
        "Ljava/util/RandomAccess;"
    }
.end annotation


# instance fields
.field private final chunks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/util/List",
            "<TE;>;>;"
        }
    .end annotation
.end field

.field private count:I

.field private lastChunk:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TE;>;"
        }
    .end annotation
.end field

.field private lastChunkIndex:I

.field private lastChunkSize:I

.field private lastChunkStart:I


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    iput v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->count:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunk:Ljava/util/List;

    iput v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkIndex:I

    iput v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkStart:I

    iput v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkSize:I

    return-void
.end method

.method private checkConsistency()V
    .locals 5

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move v1, v2

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/2addr v0, v1

    move v1, v0

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->count:I

    if-eq v1, v0, :cond_1

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v3, "newCount %d, count %d"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v4, v2

    iget v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->count:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v4, v2

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    return-void
.end method

.method private replaceElementInChunk(Ljava/util/List;Ljava/lang/Object;Ljava/util/Comparator;)I
    .locals 2
    .param p2    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Ljava/util/Comparator;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TE;>;TE;",
            "Ljava/util/Comparator",
            "<TE;>;)I"
        }
    .end annotation

    const/4 v1, -0x1

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p1, p2, p3}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;Ljava/util/Comparator;)I

    move-result v0

    if-ltz v0, :cond_0

    invoke-direct {p0, p1, v0, p2}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->replaceFoundElement(Ljava/util/List;ILjava/lang/Object;)I

    move-result v0

    return v0

    :cond_0
    return v1

    :cond_1
    return v1
.end method

.method private replaceFoundElement(Ljava/util/List;ILjava/lang/Object;)I
    .locals 3
    .param p3    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TE;>;ITE;)I"
        }
    .end annotation

    invoke-interface {p1, p2, p3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-ne v0, p1, :cond_0

    add-int v0, v1, p2

    return v0

    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/2addr v0, v1

    move v1, v0

    goto :goto_0

    :cond_1
    const/4 v0, -0x1

    return v0
.end method

.method private resetLastPosition()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunk:Ljava/util/List;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->checkConsistency()V

    return-void
.end method

.method private setLastChunk(I)V
    .locals 7

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    if-ltz p1, :cond_0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->count:I

    if-lt p1, v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    const-string/jumbo v1, "index %d, count %d"

    new-array v2, v6, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    iget v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->count:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->checkConsistency()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunk:Ljava/util/List;

    if-nez v0, :cond_2

    iput v4, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkIndex:I

    iput v4, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkStart:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunk:Ljava/util/List;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunk:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkSize:I

    :cond_2
    :goto_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkStart:I

    if-ge p1, v0, :cond_4

    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkIndex:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkIndex:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunk:Ljava/util/List;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunk:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkSize:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkStart:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkSize:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkStart:I

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunk:Ljava/util/List;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunk:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkSize:I

    :cond_4
    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkStart:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkSize:I

    add-int/2addr v0, v1

    if-lt p1, v0, :cond_5

    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkIndex:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkIndex:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkStart:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkSize:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkStart:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkIndex:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt v0, v1, :cond_3

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "lastChunkIndex runaway, position %d, count %d, lastChunkStart %d"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    iget v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->count:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v5

    iget v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkStart:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v6

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5
    return-void
.end method


# virtual methods
.method public addChunkAtEnd(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TE;>;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->count:I

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->count:I

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->resetLastPosition()V

    return-void
.end method

.method public addChunkAtStart(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TE;>;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->count:I

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->count:I

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->resetLastPosition()V

    return-void
.end method

.method public addElement(Ljava/lang/Object;ILcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList$ChunkFactory;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;I",
            "Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList$ChunkFactory",
            "<TE;>;)V"
        }
    .end annotation

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    :cond_0
    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-ge v1, p2, :cond_2

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->count:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->count:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunk:Ljava/util/List;

    if-ne v1, v0, :cond_1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkSize:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkSize:I

    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->checkConsistency()V

    return-void

    :cond_2
    invoke-interface {p3}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList$ChunkFactory;->createEmptyChunk()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->count:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->count:I

    goto :goto_0
.end method

.method public clear()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->count:I

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->resetLastPosition()V

    return-void
.end method

.method public get(I)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->setLastChunk(I)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkStart:I

    if-lt p1, v0, :cond_0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkStart:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkSize:I

    add-int/2addr v0, v1

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunk:Ljava/util/List;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkStart:I

    sub-int v1, p1, v1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    const-string/jumbo v1, "index %d, count %d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    iget v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->count:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public removeChunkAtEnd()I
    .locals 3

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v0, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_0
    iget v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->count:I

    sub-int/2addr v1, v0

    iput v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->count:I

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->resetLastPosition()V

    return v0

    :cond_0
    move v0, v1

    goto :goto_0

    :cond_1
    return v1
.end method

.method public removeChunkAtStart()I
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_0
    iget v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->count:I

    sub-int/2addr v1, v0

    iput v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->count:I

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->resetLastPosition()V

    return v0

    :cond_0
    move v0, v1

    goto :goto_0

    :cond_1
    return v1
.end method

.method public removeElementsAfter(I)I
    .locals 4

    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->checkConsistency()V

    if-ltz p1, :cond_2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->count:I

    if-ge p1, v0, :cond_2

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->setLastChunk(I)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkStart:I

    if-lt p1, v0, :cond_1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkStart:I

    iget v2, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkSize:I

    add-int/2addr v0, v2

    if-ge p1, v0, :cond_1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkIndex:I

    add-int/lit8 v3, v0, 0x2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    move v2, v1

    move v1, v0

    :goto_0
    if-lt v1, v3, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/2addr v2, v0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    add-int/lit8 v0, v1, -0x1

    move v1, v0

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->count:I

    sub-int/2addr v0, v2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->count:I

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->checkConsistency()V

    return v2

    :cond_1
    return v1

    :cond_2
    return v1
.end method

.method public removeElementsBefore(I)I
    .locals 4

    const/4 v2, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->checkConsistency()V

    if-ltz p1, :cond_3

    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->count:I

    if-ge p1, v0, :cond_3

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->setLastChunk(I)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkStart:I

    if-lt p1, v0, :cond_2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkStart:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkSize:I

    add-int/2addr v0, v1

    if-ge p1, v0, :cond_2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->lastChunkIndex:I

    add-int/lit8 v0, v0, -0x2

    if-ltz v0, :cond_0

    add-int/lit8 v0, v0, 0x1

    move v1, v0

    move v3, v2

    :goto_0
    if-lez v1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/2addr v3, v0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    add-int/lit8 v0, v1, -0x1

    move v1, v0

    goto :goto_0

    :cond_0
    move v1, v2

    move v3, v2

    goto :goto_0

    :cond_1
    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->count:I

    sub-int/2addr v0, v3

    iput v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->count:I

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->resetLastPosition()V

    return v3

    :cond_2
    return v2

    :cond_3
    return v2
.end method

.method public replaceElement(Ljava/lang/Object;Ljava/util/Comparator;)I
    .locals 7
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/util/Comparator;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Ljava/util/Comparator",
            "<TE;>;)I"
        }
    .end annotation

    const/4 v4, -0x1

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_9

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    move v1, v2

    move v3, v0

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_4

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-interface {p2, p1, v1}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v1

    if-nez v1, :cond_0

    invoke-direct {p0, v0, v2, p1}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->replaceFoundElement(Ljava/util/List;ILjava/lang/Object;)I

    move-result v0

    return v0

    :cond_0
    if-gez v1, :cond_1

    add-int/lit8 v1, v3, -0x1

    if-gez v1, :cond_b

    return v4

    :cond_1
    invoke-interface {p2, p1, v5}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v1

    if-nez v1, :cond_2

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-direct {p0, v0, v1, p1}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->replaceFoundElement(Ljava/util/List;ILjava/lang/Object;)I

    move-result v0

    return v0

    :cond_2
    if-lez v1, :cond_3

    add-int/lit8 v0, v3, 0x1

    const/4 v1, 0x1

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lt v0, v3, :cond_8

    return v4

    :cond_3
    invoke-direct {p0, v0, p1, p2}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->replaceElementInChunk(Ljava/util/List;Ljava/lang/Object;Ljava/util/Comparator;)I

    move-result v0

    return v0

    :cond_4
    if-gez v1, :cond_5

    add-int/lit8 v0, v3, -0x1

    if-gez v0, :cond_8

    return v4

    :cond_5
    if-lez v1, :cond_6

    add-int/lit8 v0, v3, 0x1

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lt v0, v3, :cond_8

    return v4

    :cond_6
    move v3, v2

    :goto_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v3, v0, :cond_a

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->chunks:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_7

    move v0, v3

    :goto_2
    if-ne v0, v4, :cond_8

    return v4

    :cond_7
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto :goto_1

    :cond_8
    move v6, v1

    move v1, v0

    move v0, v6

    :goto_3
    move v3, v1

    move v1, v0

    goto/16 :goto_0

    :cond_9
    return v4

    :cond_a
    move v0, v4

    goto :goto_2

    :cond_b
    move v0, v4

    goto :goto_3
.end method

.method public size()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedList;->count:I

    return v0
.end method
