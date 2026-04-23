.class public Lcom/lumiyaviewer/lumiya/ui/settings/SettingsSelectionFragment;
.super Landroid/support/v4/app/Fragment;

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/settings/SettingsSelectionFragment$SettingPagesAdapter;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    const v0, 0x7f04009f

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    const v0, 0x7f100281

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsSelectionFragment$SettingPagesAdapter;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsSelectionFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsSelectionFragment$SettingPagesAdapter;-><init>(Lcom/lumiyaviewer/lumiya/ui/settings/SettingsSelectionFragment;Landroid/content/Context;)V

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    return-object v1
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;->values()[Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;

    move-result-object v0

    if-ltz p3, :cond_0

    array-length v1, v0

    if-ge p3, v1, :cond_0

    aget-object v0, v0, p3

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsSelectionFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsPage;->getPageResourceId()I

    move-result v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsFragment;->makeSelection(I)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    :cond_0
    return-void
.end method
