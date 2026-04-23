.class Lcom/lumiyaviewer/lumiya/ui/outfits/CurrentOutfitFragment$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$DismissCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/ui/outfits/CurrentOutfitFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/outfits/CurrentOutfitFragment;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/outfits/CurrentOutfitFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/CurrentOutfitFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/outfits/CurrentOutfitFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public canDismiss(Landroid/widget/ListView;I)Z
    .locals 2

    invoke-virtual {p1}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/common/DismissableAdapter;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/DismissableAdapter;

    invoke-interface {v0, p2}, Lcom/lumiyaviewer/lumiya/ui/common/DismissableAdapter;->canDismiss(I)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onDismiss(Landroid/widget/ListView;I)V
    .locals 2

    invoke-virtual {p1}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/common/DismissableAdapter;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/DismissableAdapter;

    invoke-interface {v0, p2}, Lcom/lumiyaviewer/lumiya/ui/common/DismissableAdapter;->onDismiss(I)V

    :cond_0
    return-void
.end method
