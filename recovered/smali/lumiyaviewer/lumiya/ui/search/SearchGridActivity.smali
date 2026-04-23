.class public Lcom/lumiyaviewer/lumiya/ui/search/SearchGridActivity;
.super Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected getDetailsFragmentFactory()Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected isRootDetailsFragment(Ljava/lang/Class;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Landroid/support/v4/app/Fragment;",
            ">;)Z"
        }
    .end annotation

    const/4 v0, 0x1

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;

    if-eq p1, v1, :cond_0

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;

    if-ne p1, v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const-class v1, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;

    if-eq p1, v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onCreateMasterFragment(Landroid/content/Intent;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;
    .locals 1
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getActiveAgentID(Landroid/content/Intent;)Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;->newInstance(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/ui/search/SearchGridFragment;

    move-result-object v0

    return-object v0
.end method
