.class public Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerForShare;
.super Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;


# static fields
.field private static final INVENTORY_ENTRY_KEY:Ljava/lang/String; = "inventoryEntry"


# instance fields
.field private final inventoryFragmentHelper:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;-><init>(Landroid/support/v4/app/Fragment;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerForShare;->inventoryFragmentHelper:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;

    return-void
.end method

.method public static makeArguments(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Landroid/os/Bundle;
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string/jumbo v1, "activeAgentUUID"

    invoke-virtual {p0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v1, "inventoryEntry"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    return-object v0
.end method


# virtual methods
.method public getTitle()Ljava/lang/String;
    .locals 1

    const v0, 0x7f090307

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerForShare;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_avapicker_AvatarPickerForShare_1468()V
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerForShare;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->closeDetailsFragment(Landroid/support/v4/app/Fragment;)Z

    :cond_0
    return-void
.end method

.method protected onAvatarSelected(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V
    .locals 3
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerForShare;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string/jumbo v1, "inventoryEntry"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v1, "inventoryEntry"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerForShare;->inventoryFragmentHelper:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/avapicker/-$Lambda$GxFBFkg7vdmipTAXKE3eB-6HqSs;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/avapicker/-$Lambda$GxFBFkg7vdmipTAXKE3eB-6HqSs;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v0, p1, p2, v2}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->ConfirmShareInventoryEntry(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method
