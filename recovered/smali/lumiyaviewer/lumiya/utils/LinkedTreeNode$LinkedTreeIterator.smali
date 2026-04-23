.class public Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode$LinkedTreeIterator;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LinkedTreeIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private isFirst:Z

.field private node:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode",
            "<TT;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode$LinkedTreeIterator;->node:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode$LinkedTreeIterator;->isFirst:Z

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 3

    const/4 v0, 0x1

    const/4 v1, 0x0

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode$LinkedTreeIterator;->isFirst:Z

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode$LinkedTreeIterator;->node:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->-get1(Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;)Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    move-result-object v2

    if-eqz v2, :cond_0

    :goto_0
    return v0

    :cond_0
    move v0, v1

    goto :goto_0

    :cond_1
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode$LinkedTreeIterator;->node:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->-get2(Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;)Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    move-result-object v2

    if-eqz v2, :cond_2

    :goto_1
    return v0

    :cond_2
    move v0, v1

    goto :goto_1
.end method

.method public next()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode$LinkedTreeIterator;->node:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    :cond_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode$LinkedTreeIterator;->isFirst:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode$LinkedTreeIterator;->node:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->-get1(Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;)Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode$LinkedTreeIterator;->node:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode$LinkedTreeIterator;->isFirst:Z

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode$LinkedTreeIterator;->node:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    if-nez v0, :cond_2

    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode$LinkedTreeIterator;->node:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->-get2(Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;)Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode$LinkedTreeIterator;->node:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode$LinkedTreeIterator;->node:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->-get0(Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 2

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "remove() not supported by LinkedTreeNode"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
