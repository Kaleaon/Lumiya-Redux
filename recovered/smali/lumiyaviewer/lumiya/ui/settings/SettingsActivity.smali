.class public Lcom/lumiyaviewer/lumiya/ui/settings/SettingsActivity;
.super Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/settings/SettingsActivity$1;
    }
.end annotation


# instance fields
.field private final detailsFragmentFactory:Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsActivity$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsActivity$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/settings/SettingsActivity;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsActivity;->detailsFragmentFactory:Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;

    return-void
.end method


# virtual methods
.method protected getDetailsFragmentFactory()Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsActivity;->detailsFragmentFactory:Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;

    return-object v0
.end method

.method protected getNewDetailsFragmentArguments(Landroid/os/Bundle;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 1
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    if-nez p1, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;->PageConnection:Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;->getPageResourceId()I

    move-result v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->makeSelection(I)Landroid/os/Bundle;

    move-result-object v0

    return-object v0

    :cond_0
    invoke-super {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->getNewDetailsFragmentArguments(Landroid/os/Bundle;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method protected handleConnectionEvents()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected isRootDetailsFragment(Ljava/lang/Class;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Landroid/support/v4/app/Fragment;",
            ">;)Z"
        }
    .end annotation

    const-class v0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;

    if-ne p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f090303

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsActivity;->setDefaultTitle(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected onCreateMasterFragment(Landroid/content/Intent;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;
    .locals 1
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsSelectionFragment;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsSelectionFragment;-><init>()V

    return-object v0
.end method
