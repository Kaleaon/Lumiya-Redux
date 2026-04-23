.class Lcom/lumiyaviewer/lumiya/ui/outfits/CurrentOutfitAdapter;
.super Landroid/widget/BaseAdapter;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/common/DismissableAdapter;


# instance fields
.field private avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private final inflater:Landroid/view/LayoutInflater;

.field private wornItems:Lcom/google/common/collect/ImmutableList;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/CurrentOutfitAdapter;->wornItems:Lcom/google/common/collect/ImmutableList;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/CurrentOutfitAdapter;->inflater:Landroid/view/LayoutInflater;

    return-void
.end method


# virtual methods
.method public canDismiss(I)Z
    .locals 3

    const/4 v0, 0x0

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/outfits/CurrentOutfitAdapter;->getItem(I)Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/CurrentOutfitAdapter;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    if-eqz v2, :cond_2

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;->getWornOn()Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;->getWornOn()Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->isBodyPart()Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/CurrentOutfitAdapter;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;->getWornOn()Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->canTakeItemOff(Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;)Z

    move-result v0

    :cond_0
    return v0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/CurrentOutfitAdapter;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->canDetachItem(Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;)Z

    move-result v0

    return v0

    :cond_2
    return v0
.end method

.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/CurrentOutfitAdapter;->wornItems:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;
    .locals 1

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/CurrentOutfitAdapter;->wornItems:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/CurrentOutfitAdapter;->wornItems:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/outfits/CurrentOutfitAdapter;->getItem(I)Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 8

    const v7, 0x7f10024a

    const v6, 0x7f1001bd

    const/16 v4, 0x8

    const/4 v3, 0x0

    const/4 v0, 0x0

    if-eqz p2, :cond_3

    invoke-virtual {p2}, Landroid/view/View;->getId()I

    move-result v1

    const v2, 0x7f100249

    if-eq v1, v2, :cond_3

    :goto_0
    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/CurrentOutfitAdapter;->inflater:Landroid/view/LayoutInflater;

    const v1, 0x7f04007e

    invoke-virtual {v0, v1, p3, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    move-object v2, v0

    :goto_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/CurrentOutfitAdapter;->wornItems:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;

    const v1, 0x7f1001bf

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;->getWornOn()Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const v1, 0x7f0200bf

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    invoke-virtual {v2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    :goto_2
    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->restoreViewState(Landroid/view/View;)V

    return-object v2

    :cond_0
    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    const v5, 0x7f0200c6

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    invoke-virtual {v2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;->getIsTouchable()Z

    move-result v0

    if-eqz v0, :cond_1

    move v0, v3

    :goto_3
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    goto :goto_2

    :cond_1
    move v0, v4

    goto :goto_3

    :cond_2
    move-object v2, v0

    goto :goto_1

    :cond_3
    move-object v0, p2

    goto :goto_0
.end method

.method public hasStableIds()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/CurrentOutfitAdapter;->wornItems:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public onDismiss(I)V
    .locals 2

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/outfits/CurrentOutfitAdapter;->getItem(I)Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/CurrentOutfitAdapter;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;->getWornOn()Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/CurrentOutfitAdapter;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;->itemID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->TakeItemOff(Ljava/util/UUID;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/CurrentOutfitAdapter;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->DetachItem(Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;)V

    goto :goto_0
.end method

.method public setAvatarAppearance(Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/CurrentOutfitAdapter;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    return-void
.end method

.method public setData(Lcom/google/common/collect/ImmutableList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    :goto_0
    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/outfits/CurrentOutfitAdapter;->wornItems:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/outfits/CurrentOutfitAdapter;->notifyDataSetChanged()V

    return-void

    :cond_0
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object p1

    goto :goto_0
.end method
