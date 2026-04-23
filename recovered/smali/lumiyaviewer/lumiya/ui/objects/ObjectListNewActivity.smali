.class public Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListNewActivity;
.super Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListNewActivity$ObjectDetailsActivityFactory;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected getDetailsFragmentFactory()Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListNewActivity$ObjectDetailsActivityFactory;->getInstance()Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListNewActivity$ObjectDetailsActivityFactory;

    move-result-object v0

    return-object v0
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

    const-class v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;

    if-eq p1, v0, :cond_0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->isRootDetailsFragment(Ljava/lang/Class;)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f09024b

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListNewActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListNewActivity;->setDefaultTitle(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected onCreateMasterFragment(Landroid/content/Intent;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;
    .locals 2
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getActiveAgentID(Landroid/content/Intent;)Ljava/util/UUID;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->makeFragmentArguments(Ljava/util/UUID;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->newInstance(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;

    move-result-object v0

    return-object v0
.end method
