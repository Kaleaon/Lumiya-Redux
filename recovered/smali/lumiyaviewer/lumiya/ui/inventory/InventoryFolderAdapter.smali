.class public Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;
.super Landroid/widget/BaseAdapter;

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter$OnItemCheckboxClickListener;
    }
.end annotation


# instance fields
.field private avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private data:Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private database:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

.field private final inflater:Landroid/view/LayoutInflater;

.field private onItemCheckboxClickListener:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter$OnItemCheckboxClickListener;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private wornAttachments:Lcom/google/common/collect/ImmutableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableMap",
            "<",
            "Ljava/util/UUID;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final wornCheckboxes:Z

.field private wornOutfitFolder:Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private wornWearables:Lcom/google/common/collect/Table;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/Table",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/view/LayoutInflater;Z)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->data:Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->wornWearables:Lcom/google/common/collect/Table;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->wornAttachments:Lcom/google/common/collect/ImmutableMap;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->onItemCheckboxClickListener:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter$OnItemCheckboxClickListener;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->inflater:Landroid/view/LayoutInflater;

    iput-boolean p2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->wornCheckboxes:Z

    return-void
.end method

.method private isItemWorn(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Z
    .locals 3

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->wornAttachments:Lcom/google/common/collect/ImmutableMap;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->wornWearables:Lcom/google/common/collect/Table;

    invoke-virtual {p1, v1, v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->whatIsItemWornOn(Lcom/google/common/collect/ImmutableMap;Lcom/google/common/collect/Table;Z)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method


# virtual methods
.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->data:Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->data:Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;->get(I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->getItem(I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->getItem(I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getId()J

    move-result-wide v0

    return-wide v0

    :cond_0
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 11

    const/16 v4, 0x8

    const/4 v2, 0x1

    const v10, 0x7f1001c1

    const/4 v3, 0x0

    const/4 v9, 0x0

    if-nez p2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->inflater:Landroid/view/LayoutInflater;

    const v1, 0x7f040053

    invoke-virtual {v0, v1, p3, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    :cond_0
    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->getItem(I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v8

    if-eqz v8, :cond_3

    const v0, 0x7f1001bf

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, v8, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v5, -0x1

    const/4 v1, -0x1

    iget v6, v8, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LINK:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v7

    if-ne v6, v7, :cond_4

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->database:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    if-eqz v6, :cond_4

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->database:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {v6, v8}, Lcom/lumiyaviewer/lumiya/orm/InventoryDB;->resolveLink(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v6

    if-eqz v6, :cond_5

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getDrawableResource()I

    move-result v5

    const v1, 0x7f0200c4

    move-object v7, v6

    :goto_0
    if-gez v5, :cond_11

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getDrawableResource()I

    move-result v5

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getSubtypeDrawableResource()I

    move-result v1

    move v6, v5

    move v5, v1

    :goto_1
    if-ltz v6, :cond_7

    const v1, 0x7f1001bd

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    invoke-virtual {v1, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    if-ltz v5, :cond_6

    const v1, 0x7f1001be

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    :goto_2
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->wornOutfitFolder:Ljava/util/UUID;

    if-eqz v1, :cond_8

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->wornOutfitFolder:Ljava/util/UUID;

    iget-object v5, v8, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-static {v1, v5}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-virtual {v0, v9, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    :goto_3
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->wornCheckboxes:Z

    if-eqz v0, :cond_f

    iget v0, v8, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_OBJECT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v1

    if-eq v0, v1, :cond_1

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isLink()Z

    move-result v0

    if-eqz v0, :cond_9

    iget v0, v8, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_OBJECT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->getTypeCode()I

    move-result v1

    if-ne v0, v1, :cond_9

    :cond_1
    move v0, v2

    :goto_4
    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->wornAttachments:Lcom/google/common/collect/ImmutableMap;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->wornWearables:Lcom/google/common/collect/Table;

    invoke-virtual {v7, v0, v1, v3}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->whatIsItemWornOn(Lcom/google/common/collect/ImmutableMap;Lcom/google/common/collect/Table;Z)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_a

    move v1, v2

    :goto_5
    instance-of v4, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    if-eqz v4, :cond_b

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->isBodyPart()Z

    move-result v0

    :goto_6
    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    if-eqz v4, :cond_c

    if-eqz v1, :cond_2

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isWearable()Z

    move-result v2

    if-eqz v2, :cond_d

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    invoke-virtual {v2, v7}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->canTakeItemOff(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Z

    move-result v2

    if-eqz v2, :cond_c

    xor-int/lit8 v2, v0, 0x1

    :cond_2
    :goto_7
    invoke-virtual {p2, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p2, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const v3, 0x7f10002d

    invoke-virtual {v0, v3, v8}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    invoke-virtual {p2, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    invoke-virtual {p2, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {p2, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_3
    :goto_8
    return-object p2

    :cond_4
    move-object v7, v8

    goto/16 :goto_0

    :cond_5
    move-object v7, v8

    goto/16 :goto_0

    :cond_6
    const v1, 0x7f1001be

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    invoke-virtual {v1, v9}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto/16 :goto_2

    :cond_7
    const v1, 0x7f1001bd

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    invoke-virtual {v1, v9}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    const v1, 0x7f1001be

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    invoke-virtual {v1, v9}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto/16 :goto_2

    :cond_8
    invoke-virtual {v0, v9, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    goto/16 :goto_3

    :cond_9
    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isWearable()Z

    move-result v0

    if-nez v0, :cond_1

    iget v0, v7, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_OBJECT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v1

    if-eq v0, v1, :cond_1

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isWearable()Z

    move-result v0

    goto/16 :goto_4

    :cond_a
    move v1, v3

    goto/16 :goto_5

    :cond_b
    move v0, v3

    goto/16 :goto_6

    :cond_c
    move v2, v3

    goto :goto_7

    :cond_d
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    invoke-virtual {v0, v7}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->canDetachItem(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Z

    move-result v2

    goto :goto_7

    :cond_e
    invoke-virtual {p2, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p2, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f10002d

    invoke-virtual {v0, v1, v9}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    goto :goto_8

    :cond_f
    invoke-virtual {p2, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f1001c0

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, v8}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->isItemWorn(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Z

    move-result v1

    if-eqz v1, :cond_10

    :goto_9
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_8

    :cond_10
    move v3, v4

    goto :goto_9

    :cond_11
    move v6, v5

    move v5, v1

    goto/16 :goto_1
.end method

.method public hasStableIds()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->onItemCheckboxClickListener:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter$OnItemCheckboxClickListener;

    if-eqz v0, :cond_0

    const v0, 0x7f10002d

    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->onItemCheckboxClickListener:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter$OnItemCheckboxClickListener;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-interface {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter$OnItemCheckboxClickListener;->onItemCheckboxClicked(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    :cond_0
    return-void
.end method

.method public setAvatarAppearance(Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public setData(Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    if-eqz p1, :cond_0

    :goto_0
    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->data:Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->notifyDataSetChanged()V

    return-void

    :cond_0
    new-instance p1, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;

    invoke-direct {p1}, Lcom/lumiyaviewer/lumiya/orm/InventoryEntryList;-><init>()V

    goto :goto_0
.end method

.method public setDatabase(Lcom/lumiyaviewer/lumiya/orm/InventoryDB;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->database:Lcom/lumiyaviewer/lumiya/orm/InventoryDB;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public setOnItemCheckboxClickListener(Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter$OnItemCheckboxClickListener;)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter$OnItemCheckboxClickListener;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->onItemCheckboxClickListener:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter$OnItemCheckboxClickListener;

    return-void
.end method

.method public setWornAttachments(Lcom/google/common/collect/ImmutableMap;)V
    .locals 0
    .param p1    # Lcom/google/common/collect/ImmutableMap;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableMap",
            "<",
            "Ljava/util/UUID;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->wornAttachments:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public setWornOutfitFolder(Ljava/util/UUID;)V
    .locals 0
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->wornOutfitFolder:Ljava/util/UUID;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public setWornWearables(Lcom/google/common/collect/Table;)V
    .locals 0
    .param p1    # Lcom/google/common/collect/Table;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/Table",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->wornWearables:Lcom/google/common/collect/Table;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFolderAdapter;->notifyDataSetChanged()V

    return-void
.end method
