.class Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/lumiyaviewer/lumiya/react/Subscription$OnData",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onData(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;

    invoke-static {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->-set0(Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->getView()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_1

    const v0, 0x7f10028c

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    instance-of v2, v0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryListAdapter;

    if-eqz v2, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryListAdapter;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryListAdapter;->setData(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;)V

    :cond_0
    const v0, 0x7f10028e

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v2, 0x7f090218

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    const v0, 0x7f10028d

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    return-void
.end method

.method public bridge synthetic onData(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment$1;->onData(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;)V

    return-void
.end method
