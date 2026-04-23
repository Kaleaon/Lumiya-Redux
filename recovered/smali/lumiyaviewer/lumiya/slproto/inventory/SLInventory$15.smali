.class Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$15;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/common/base/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->lambda$-com_lumiyaviewer_lumiya_slproto_inventory_SLInventory_53068(Ljava/lang/String;Lcom/google/common/collect/ImmutableSet;ILcom/google/common/base/Function;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/common/base/Function",
        "<",
        "Ljava/util/UUID;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

.field final synthetic val$immutableEntries:Lcom/google/common/collect/ImmutableSet;

.field final synthetic val$onResult:Lcom/google/common/base/Function;

.field final synthetic val$taskLocalID:I


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;Lcom/google/common/collect/ImmutableSet;ILcom/google/common/base/Function;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$15;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$15;->val$immutableEntries:Lcom/google/common/collect/ImmutableSet;

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$15;->val$taskLocalID:I

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$15;->val$onResult:Lcom/google/common/base/Function;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    check-cast p1, Ljava/util/UUID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$15;->apply(Ljava/util/UUID;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public apply(Ljava/util/UUID;)Ljava/lang/Void;
    .locals 5
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v4, 0x0

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$15;->val$immutableEntries:Lcom/google/common/collect/ImmutableSet;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$15;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$15;->val$taskLocalID:I

    invoke-static {v2, p1, v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->-wrap0(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;Ljava/util/UUID;ILjava/util/UUID;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$15;->val$onResult:Lcom/google/common/base/Function;

    invoke-interface {v0, p1}, Lcom/google/common/base/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    return-object v4
.end method
