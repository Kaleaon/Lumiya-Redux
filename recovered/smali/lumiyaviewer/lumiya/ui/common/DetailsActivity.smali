.class public Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;
.super Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;
    }
.end annotation


# static fields
.field public static final DEFAULT_DETAILS_FRAGMENT_TAG:Ljava/lang/String; = "defaultDetails"

.field private static final DEFAULT_SUBTITLE_TAG:Ljava/lang/String; = "DetailsActivity:defaultSubTitle"

.field private static final DEFAULT_TITLE_TAG:Ljava/lang/String; = "DetailsActivity:defaultTitle"

.field private static final DETAILS_STACK_TAG:Ljava/lang/String; = "DetailsActivity:DetailsStack"


# instance fields
.field private defaultSubTitle:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private defaultTitle:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final detailsStack:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->detailsStack:Ljava/util/ArrayList;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->defaultTitle:Ljava/lang/String;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->defaultSubTitle:Ljava/lang/String;

    return-void
.end method

.method private goBack(Landroid/support/v4/app/FragmentManager;)Z
    .locals 5

    const/4 v3, 0x1

    const/4 v4, 0x0

    const-string/jumbo v0, "DetailsActivity: goBack, detailsStack size %d"

    new-array v1, v3, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->detailsStack:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->detailsStack:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->detailsStack:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->detailsStack:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;

    invoke-virtual {p1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;->getFragment(Landroid/content/Context;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    const v2, 0x7f100114

    invoke-virtual {v1, v2, v0}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->updateTitle()V

    return v3

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onDetailsStackEmpty()Z

    move-result v0

    const-string/jumbo v1, "DetailsActivity: goBack, onDetailsStackEmpty: really empty: %b"

    new-array v2, v3, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static showDetails(Landroid/app/Activity;Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;Landroid/os/Bundle;)V
    .locals 1

    invoke-interface {p1}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;->getFragmentClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {p0, v0, p2}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p1, p0, p2}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;->createIntent(Landroid/content/Context;Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public static showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/Class",
            "<+",
            "Landroid/support/v4/app/Fragment;",
            ">;",
            "Landroid/os/Bundle;",
            ")Z"
        }
    .end annotation

    const/4 v1, 0x0

    instance-of v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->acceptsDetailFragment(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    move-object v0, p0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v0, p1, v2, p2}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showDetailsFragment(Ljava/lang/Class;Landroid/content/Intent;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    move v0, v1

    :goto_0
    return v0

    :cond_0
    move v0, v1

    goto :goto_0
.end method


# virtual methods
.method protected acceptsDetailFragment(Ljava/lang/Class;)Z
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

    const/4 v0, 0x1

    return v0
.end method

.method protected addDetailsToStack(Landroid/support/v4/app/FragmentManager;)V
    .locals 4

    const/4 v3, 0x0

    const v0, 0x7f100114

    invoke-virtual {p1, v0}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->detailsStack:Ljava/util/ArrayList;

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;

    invoke-direct {v2, v0, v3}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;-><init>(Landroid/support/v4/app/Fragment;Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method clearDetailsStack()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->detailsStack:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public closeDetailsFragment(Landroid/support/v4/app/Fragment;)Z
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const v1, 0x7f100114

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v1

    if-ne v1, p1, :cond_0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->goBack(Landroid/support/v4/app/FragmentManager;)Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getCurrentDetailsFragment()Landroid/support/v4/app/Fragment;
    .locals 3
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    if-eqz v0, :cond_0

    const v1, 0x7f100114

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/v4/app/Fragment;->isAdded()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Landroid/support/v4/app/Fragment;->isDetached()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Landroid/support/v4/app/Fragment;->isHidden()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_0

    return-object v0

    :cond_0
    return-object v2
.end method

.method public handleBackPressed()Z
    .locals 4

    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    const v0, 0x7f100114

    invoke-virtual {v1, v0}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v0

    instance-of v2, v0, Lcom/lumiyaviewer/lumiya/ui/common/BackButtonHandler;

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Landroid/support/v4/app/Fragment;->isAdded()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Landroid/support/v4/app/Fragment;->isDetached()Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/BackButtonHandler;

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/ui/common/BackButtonHandler;->onBackButtonPressed()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->getBackStackEntryCount()I

    move-result v0

    if-eqz v0, :cond_1

    return v3

    :cond_1
    invoke-direct {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->goBack(Landroid/support/v4/app/FragmentManager;)Z

    move-result v0

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

    const/4 v0, 0x1

    return v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->onCreate(Landroid/os/Bundle;)V

    if-eqz p1, :cond_1

    const-string/jumbo v0, "DetailsActivity:DetailsStack"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->detailsStack:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_0
    const-string/jumbo v0, "DetailsActivity:defaultTitle"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->defaultTitle:Ljava/lang/String;

    const-string/jumbo v0, "DetailsActivity:defaultSubTitle"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->defaultSubTitle:Ljava/lang/String;

    :cond_1
    return-void
.end method

.method protected onDetailsStackEmpty()Z
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const v1, 0x7f100114

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->updateTitle()V

    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public onFragmentTitleUpdated()V
    .locals 0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->updateTitle()V

    return-void
.end method

.method protected onPostCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->onPostCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->updateTitle()V

    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 2
    .param p2    # [Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # [I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-super {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->getFragments()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/Fragment;

    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v4/app/Fragment;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    const-string/jumbo v0, "DetailsActivity:DetailsStack"

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->detailsStack:Ljava/util/ArrayList;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    const-string/jumbo v0, "DetailsActivity:defaultTitle"

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->defaultTitle:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v0, "DetailsActivity:defaultSubTitle"

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->defaultSubTitle:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    return-void
.end method

.method protected removeAllDetails()V
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const v1, 0x7f100114

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->clearDetailsStack()V

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->goBack(Landroid/support/v4/app/FragmentManager;)Z

    :cond_0
    return-void
.end method

.method protected replaceDetailsFragment(Landroid/support/v4/app/FragmentManager;Landroid/support/v4/app/Fragment;)V
    .locals 4

    const/4 v3, 0x0

    invoke-virtual {p1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    const v1, 0x7f050010

    const v2, 0x7f050012

    invoke-virtual {v0, v1, v3, v3, v2}, Landroid/support/v4/app/FragmentTransaction;->setCustomAnimations(IIII)Landroid/support/v4/app/FragmentTransaction;

    const v1, 0x7f100114

    invoke-virtual {v0, v1, p2}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    const/16 v1, 0x1001

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentTransaction;->setTransition(I)Landroid/support/v4/app/FragmentTransaction;

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->updateTitle()V

    return-void
.end method

.method protected setActivityTitle(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    const-string/jumbo v1, "updateTitle: title \'%s\' actionBar %s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Landroid/support/v7/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, p2}, Landroid/support/v7/app/ActionBar;->setSubtitle(Ljava/lang/CharSequence;)V

    :cond_0
    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setCurrentDetailsArguments(Ljava/lang/Class;Landroid/os/Bundle;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Landroid/support/v4/app/Fragment;",
            ">;",
            "Landroid/os/Bundle;",
            ")Z"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    if-eqz v0, :cond_0

    const v1, 0x7f100114

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/common/ReloadableFragment;

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Landroid/support/v4/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/ReloadableFragment;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Lcom/lumiyaviewer/lumiya/ui/common/ReloadableFragment;->setFragmentArgs(Landroid/content/Intent;Landroid/os/Bundle;)V

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setDefaultTitle(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->defaultTitle:Ljava/lang/String;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->defaultSubTitle:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->updateTitle()V

    return-void
.end method

.method public showDetailsFragment(Ljava/lang/Class;Landroid/content/Intent;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Landroid/support/v4/app/Fragment;",
            ">;",
            "Landroid/content/Intent;",
            "Landroid/os/Bundle;",
            ")",
            "Landroid/support/v4/app/Fragment;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v5, 0x2

    const/4 v4, 0x0

    const/4 v8, 0x1

    const/4 v7, 0x0

    const-string/jumbo v1, "DetailsActivity: fragmentClass %s, intent %s, arguments %s"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v7

    aput-object p2, v2, v8

    aput-object p3, v2, v5

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v3

    if-eqz v3, :cond_4

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->isRootDetailsFragment(Ljava/lang/Class;)Z

    move-result v1

    const v2, 0x7f100114

    invoke-virtual {v3, v2}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v2

    const-string/jumbo v4, "DetailsActivity: isRootFragment %b existing fragment: %s"

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    aput-object v6, v5, v7

    aput-object v2, v5, v8

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz v2, :cond_0

    const-string/jumbo v4, "DetailsActivity: is good instance: %b"

    new-array v5, v8, [Ljava/lang/Object;

    invoke-virtual {p1, v2}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v6

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const-string/jumbo v4, "DetailsActivity: is reloadable: %b"

    new-array v5, v8, [Ljava/lang/Object;

    instance-of v6, v2, Lcom/lumiyaviewer/lumiya/ui/common/ReloadableFragment;

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const-string/jumbo v4, "DetailsActivity: has arguments: %b"

    new-array v5, v8, [Ljava/lang/Object;

    invoke-virtual {v2}, Landroid/support/v4/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Landroid/support/v4/app/Fragment;->isVisible()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {p1, v2}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    instance-of v4, v2, Lcom/lumiyaviewer/lumiya/ui/common/ReloadableFragment;

    if-eqz v4, :cond_1

    invoke-virtual {v2}, Landroid/support/v4/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v4

    if-eqz v4, :cond_1

    move-object v1, v2

    check-cast v1, Lcom/lumiyaviewer/lumiya/ui/common/ReloadableFragment;

    invoke-interface {v1, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/common/ReloadableFragment;->setFragmentArgs(Landroid/content/Intent;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->invalidateOptionsMenu()V

    :goto_0
    return-object v2

    :cond_1
    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->clearDetailsStack()V

    :goto_1
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/app/Fragment;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    instance-of v2, v1, Lcom/lumiyaviewer/lumiya/ui/common/ReloadableFragment;

    if-eqz v2, :cond_3

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {v1, v2}, Landroid/support/v4/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    move-object v0, v1

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/ReloadableFragment;

    move-object v2, v0

    invoke-interface {v2, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/common/ReloadableFragment;->setFragmentArgs(Landroid/content/Intent;Landroid/os/Bundle;)V

    :goto_2
    invoke-virtual {p0, v3, v1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->replaceDetailsFragment(Landroid/support/v4/app/FragmentManager;Landroid/support/v4/app/Fragment;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-object v2, v1

    goto :goto_0

    :cond_2
    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->addDetailsToStack(Landroid/support/v4/app/FragmentManager;)V

    goto :goto_1

    :cond_3
    :try_start_2
    invoke-virtual {v1, p3}, Landroid/support/v4/app/Fragment;->setArguments(Landroid/os/Bundle;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_2

    :catch_0
    move-exception v2

    move-object v9, v2

    move-object v2, v1

    move-object v1, v9

    :goto_3
    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_4
    return-object v4

    :catch_1
    move-exception v1

    goto :goto_3
.end method

.method protected updateTitle()V
    .locals 7

    const/4 v6, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    if-eqz v0, :cond_2

    const v1, 0x7f100114

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v1

    const-string/jumbo v0, "updateTitle: detailsFragment %s"

    new-array v4, v2, [Ljava/lang/Object;

    aput-object v1, v4, v3

    invoke-static {v0, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    instance-of v0, v1, Lcom/lumiyaviewer/lumiya/ui/common/FragmentHasTitle;

    if-eqz v0, :cond_2

    const-string/jumbo v0, "updateTitle: detailsFragment added %b hidden %b detached %b"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v1}, Landroid/support/v4/app/Fragment;->isAdded()Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v4, v3

    invoke-virtual {v1}, Landroid/support/v4/app/Fragment;->isHidden()Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v4, v2

    invoke-virtual {v1}, Landroid/support/v4/app/Fragment;->isDetached()Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v0, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v1}, Landroid/support/v4/app/Fragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {v1}, Landroid/support/v4/app/Fragment;->isHidden()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    invoke-virtual {v1}, Landroid/support/v4/app/Fragment;->isDetached()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_2

    move-object v0, v1

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/FragmentHasTitle;

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentHasTitle;->getTitle()Ljava/lang/String;

    move-result-object v0

    check-cast v1, Lcom/lumiyaviewer/lumiya/ui/common/FragmentHasTitle;

    invoke-interface {v1}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentHasTitle;->getSubTitle()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v4, "updateTitle: got title \'%s\', subtitle \'%s\'"

    new-array v5, v6, [Ljava/lang/Object;

    aput-object v0, v5, v3

    aput-object v1, v5, v2

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz v0, :cond_2

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->setActivityTitle(Ljava/lang/String;Ljava/lang/String;)V

    move v0, v2

    :goto_0
    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->updateTitleNoDetails()V

    :cond_0
    return-void

    :cond_1
    move v0, v3

    goto :goto_0

    :cond_2
    move v0, v3

    goto :goto_0
.end method

.method protected updateTitleNoDetails()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->defaultTitle:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->defaultTitle:Ljava/lang/String;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->defaultSubTitle:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->setActivityTitle(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
