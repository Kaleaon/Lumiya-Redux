.class public Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarActivity;
.super Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarActivity$1;
    }
.end annotation


# instance fields
.field private final detailsFragmentFactory:Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarActivity$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarActivity$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarActivity;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarActivity;->detailsFragmentFactory:Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;

    return-void
.end method


# virtual methods
.method protected getDetailsFragmentFactory()Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarActivity;->detailsFragmentFactory:Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;

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

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getActiveAgentID(Landroid/content/Intent;)Ljava/util/UUID;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {v0, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/myava/MyProfileFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0

    :cond_0
    invoke-super {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->getNewDetailsFragmentArguments(Landroid/os/Bundle;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v0

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

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/myava/MyProfileFragment;

    if-eq p1, v1, :cond_0

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;

    if-ne p1, v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const-class v1, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;

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

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->newInstance(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;

    move-result-object v0

    return-object v0
.end method
