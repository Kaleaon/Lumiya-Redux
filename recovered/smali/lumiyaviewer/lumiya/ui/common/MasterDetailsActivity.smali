.class public abstract Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;
.super Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;


# static fields
.field protected static final FROM_SAME_ACTIVITY:Ljava/lang/String; = "fromSameActivity"

.field private static final IMPLICIT_DETAILS_TAG:Ljava/lang/String; = "MasterDetailsActivityIsImplicitDetails"

.field public static final INTENT_SELECTION_KEY:Ljava/lang/String; = "selection"

.field public static final WEAK_SELECTION_KEY:Ljava/lang/String; = "weakSelection"


# instance fields
.field private isSplitScreen:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->isSplitScreen:Z

    return-void
.end method


# virtual methods
.method protected abstract getDetailsFragmentFactory()Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;
.end method

.method protected getNewDetailsFragmentArguments(Landroid/os/Bundle;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 0
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    return-object p2
.end method

.method protected isAlwaysImplicitFragment(Ljava/lang/Class;)Z
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

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->getDetailsFragmentFactory()Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;

    move-result-object v0

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;->getFragmentClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    return v0
.end method

.method public isSplitScreen()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->isSplitScreen:Z

    return v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 14
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    const v13, 0x7f100286

    const v10, 0x7f100114

    const/4 v3, 0x0

    const/4 v6, 0x0

    const/4 v2, 0x1

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-static {p0}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->isSplitScreenNeeded(Landroid/content/Context;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->isSplitScreen:Z

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->isSplitScreen:Z

    if-eqz v1, :cond_4

    const v1, 0x7f0400a4

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->setContentView(I)V

    :goto_0
    const-string/jumbo v4, "MasterDetailsActivity: hasSelectorView = %b, sel fragment %b, hasDetailsView = %b, details fragment %b"

    const/4 v1, 0x4

    new-array v5, v1, [Ljava/lang/Object;

    invoke-virtual {p0, v13}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_5

    move v1, v2

    :goto_1
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    aput-object v1, v5, v3

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1, v13}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v1

    if-eqz v1, :cond_6

    move v1, v2

    :goto_2
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    aput-object v1, v5, v2

    invoke-virtual {p0, v10}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_7

    move v1, v2

    :goto_3
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const/4 v7, 0x2

    aput-object v1, v5, v7

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1, v10}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v1

    if-eqz v1, :cond_8

    move v1, v2

    :goto_4
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const/4 v7, 0x3

    aput-object v1, v5, v7

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const-string/jumbo v1, "MasterDetailsActivity: intent = %s"

    new-array v4, v2, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    aput-object v5, v4, v3

    invoke-static {v1, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v8

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1, v13}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v9

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1, v10}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v10

    if-eqz v10, :cond_17

    invoke-virtual {v10}, Landroid/support/v4/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_17

    const-string/jumbo v4, "MasterDetailsActivity: implicit details tag = %b"

    new-array v5, v2, [Ljava/lang/Object;

    const-string/jumbo v7, "MasterDetailsActivityIsImplicitDetails"

    invoke-virtual {v1, v7, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v7

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v5, v3

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const-string/jumbo v4, "MasterDetailsActivityIsImplicitDetails"

    invoke-virtual {v1, v4, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_17

    move v1, v2

    :goto_5
    const-string/jumbo v4, "MasterDetailsActivity: hasExplicitDetails = %b"

    new-array v5, v2, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v5, v3

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-nez v1, :cond_16

    if-nez p1, :cond_16

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string/jumbo v5, "selection"

    invoke-virtual {v4, v5}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v5

    if-eqz v5, :cond_16

    move v1, v2

    :goto_6
    if-nez v1, :cond_9

    if-nez p1, :cond_9

    iget-boolean v4, p0, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->isSplitScreen:Z

    if-eqz v4, :cond_15

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string/jumbo v7, "weakSelection"

    invoke-virtual {v4, v7}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v4

    if-eqz v4, :cond_15

    move-object v1, v4

    move v4, v2

    :goto_7
    iget-boolean v5, p0, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->isSplitScreen:Z

    if-nez v5, :cond_a

    xor-int/lit8 v5, v4, 0x1

    move v7, v5

    :goto_8
    if-eqz v7, :cond_f

    const-string/jumbo v11, "MasterDetailsActivity: existing fragment %s"

    new-array v12, v2, [Ljava/lang/Object;

    if-eqz v9, :cond_b

    invoke-virtual {v9}, Landroid/support/v4/app/Fragment;->toString()Ljava/lang/String;

    move-result-object v5

    :goto_9
    aput-object v5, v12, v3

    invoke-static {v11, v12}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz v9, :cond_e

    const-string/jumbo v11, "MasterDetailsActivity: existing fragment is %s"

    new-array v12, v2, [Ljava/lang/Object;

    invoke-virtual {v9}, Landroid/support/v4/app/Fragment;->isVisible()Z

    move-result v5

    if-eqz v5, :cond_c

    const-string/jumbo v5, "visible"

    :goto_a
    aput-object v5, v12, v3

    invoke-static {v11, v12}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v9}, Landroid/support/v4/app/Fragment;->isDetached()Z

    move-result v5

    if-eqz v5, :cond_d

    invoke-virtual {v8, v9}, Landroid/support/v4/app/FragmentTransaction;->attach(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    :cond_0
    :goto_b
    iget-boolean v5, p0, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->isSplitScreen:Z

    if-nez v5, :cond_10

    move v5, v4

    :goto_c
    const-string/jumbo v11, "MasterDetailsActivity: selectorVisible %b, detailsVisible %b, hasExplicitDetails %b"

    const/4 v12, 0x3

    new-array v12, v12, [Ljava/lang/Object;

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v12, v3

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v12, v2

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    const/4 v13, 0x2

    aput-object v7, v12, v13

    invoke-static {v11, v12}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz v5, :cond_14

    if-nez v10, :cond_13

    const-string/jumbo v2, "MasterDetailsActivity: creating new details fragment"

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz v9, :cond_11

    :try_start_0
    invoke-virtual {v9}, Landroid/support/v4/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    :goto_d
    invoke-virtual {p0, v2, v1}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->getNewDetailsFragmentArguments(Landroid/os/Bundle;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->getDetailsFragmentFactory()Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;

    move-result-object v1

    invoke-interface {v1}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;->getFragmentClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/app/Fragment;

    instance-of v2, v1, Lcom/lumiyaviewer/lumiya/ui/common/ReloadableFragment;

    if-eqz v2, :cond_12

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {v1, v2}, Landroid/support/v4/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    move-object v0, v1

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/ReloadableFragment;

    move-object v2, v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    invoke-interface {v2, v5, v3}, Lcom/lumiyaviewer/lumiya/ui/common/ReloadableFragment;->setFragmentArgs(Landroid/content/Intent;Landroid/os/Bundle;)V

    :goto_e
    if-nez v4, :cond_1

    invoke-virtual {v1}, Landroid/support/v4/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    if-eqz v2, :cond_1

    const-string/jumbo v3, "MasterDetailsActivityIsImplicitDetails"

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    :cond_1
    const-string/jumbo v2, "MasterDetailsActivity: adding new details fragment: %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const-string/jumbo v2, "defaultDetails"

    const v3, 0x7f100114

    invoke-virtual {v8, v3, v1, v2}, Landroid/support/v4/app/FragmentTransaction;->add(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    :goto_f
    invoke-virtual {v8}, Landroid/support/v4/app/FragmentTransaction;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    invoke-virtual {v8}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    :cond_3
    return-void

    :cond_4
    const v1, 0x7f0400a1

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->setContentView(I)V

    goto/16 :goto_0

    :cond_5
    move v1, v3

    goto/16 :goto_1

    :cond_6
    move v1, v3

    goto/16 :goto_2

    :cond_7
    move v1, v3

    goto/16 :goto_3

    :cond_8
    move v1, v3

    goto/16 :goto_4

    :cond_9
    move v4, v1

    move-object v1, v5

    goto/16 :goto_7

    :cond_a
    move v7, v2

    goto/16 :goto_8

    :cond_b
    const-string/jumbo v5, "null"

    goto/16 :goto_9

    :cond_c
    const-string/jumbo v5, "not visible"

    goto/16 :goto_a

    :cond_d
    invoke-virtual {v9}, Landroid/support/v4/app/Fragment;->isHidden()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {v8, v9}, Landroid/support/v4/app/FragmentTransaction;->show(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    goto/16 :goto_b

    :cond_e
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    invoke-virtual {p0, v5, v1}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->onCreateMasterFragment(Landroid/content/Intent;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    move-result-object v5

    invoke-virtual {v8, v13, v5}, Landroid/support/v4/app/FragmentTransaction;->add(ILandroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    goto/16 :goto_b

    :cond_f
    if-eqz v9, :cond_0

    invoke-virtual {v9}, Landroid/support/v4/app/Fragment;->isDetached()Z

    move-result v5

    if-nez v5, :cond_0

    invoke-virtual {v8, v9}, Landroid/support/v4/app/FragmentTransaction;->detach(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    goto/16 :goto_b

    :cond_10
    move v5, v2

    goto/16 :goto_c

    :cond_11
    move-object v2, v6

    goto/16 :goto_d

    :cond_12
    :try_start_1
    invoke-virtual {v1, v3}, Landroid/support/v4/app/Fragment;->setArguments(Landroid/os/Bundle;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_e

    :catch_0
    move-exception v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_f

    :cond_13
    const-string/jumbo v1, "MasterDetailsActivity: not creating new details fragment. existing is detached: %b (%s)"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v10}, Landroid/support/v4/app/Fragment;->isDetached()Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v4, v3

    aput-object v10, v4, v2

    invoke-static {v1, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v10}, Landroid/support/v4/app/Fragment;->isDetached()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {v8, v10}, Landroid/support/v4/app/FragmentTransaction;->attach(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    goto/16 :goto_f

    :cond_14
    if-eqz v10, :cond_2

    invoke-virtual {v10}, Landroid/support/v4/app/Fragment;->isDetached()Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {v8, v10}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    goto/16 :goto_f

    :cond_15
    move v4, v1

    move-object v1, v5

    goto/16 :goto_7

    :cond_16
    move-object v5, v6

    goto/16 :goto_6

    :cond_17
    move v1, v3

    goto/16 :goto_5
.end method

.method protected abstract onCreateMasterFragment(Landroid/content/Intent;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
.end method

.method protected onDetailsStackEmpty()Z
    .locals 11

    const v10, 0x7f100286

    const/4 v9, 0x2

    const/4 v1, 0x1

    const/4 v8, 0x0

    const/4 v2, 0x0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->isSplitScreen:Z

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const v3, 0x7f100114

    invoke-virtual {v0, v3}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v3

    if-eqz v3, :cond_7

    invoke-virtual {v3}, Landroid/support/v4/app/Fragment;->isDetached()Z

    move-result v4

    xor-int/lit8 v4, v4, 0x1

    if-eqz v4, :cond_7

    const-string/jumbo v4, "MasterDetailsFragment: onDetailsStackEmpty has detailsFragment (%s), detached: %b"

    new-array v5, v9, [Ljava/lang/Object;

    aput-object v3, v5, v2

    invoke-virtual {v3}, Landroid/support/v4/app/Fragment;->isDetached()Z

    move-result v6

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    aput-object v6, v5, v1

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v4

    const/high16 v5, 0x10a0000

    const v6, 0x7f050012

    const v7, 0x10a0001

    invoke-virtual {v4, v5, v6, v2, v7}, Landroid/support/v4/app/FragmentTransaction;->setCustomAnimations(IIII)Landroid/support/v4/app/FragmentTransaction;

    invoke-virtual {v4, v3}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    invoke-virtual {v0, v10}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v3

    const-string/jumbo v5, "MasterDetailsFragment: existing selector %b, detached %b, hidden %b"

    const/4 v0, 0x3

    new-array v6, v0, [Ljava/lang/Object;

    if-eqz v3, :cond_2

    move v0, v1

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    aput-object v0, v6, v2

    if-eqz v3, :cond_3

    invoke-virtual {v3}, Landroid/support/v4/app/Fragment;->isDetached()Z

    move-result v0

    :goto_1
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    aput-object v0, v6, v1

    if-eqz v3, :cond_4

    invoke-virtual {v3}, Landroid/support/v4/app/Fragment;->isHidden()Z

    move-result v0

    :goto_2
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    aput-object v0, v6, v9

    invoke-static {v5, v6}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-nez v3, :cond_5

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0, v8}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->onCreateMasterFragment(Landroid/content/Intent;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    invoke-virtual {v4, v10, v0}, Landroid/support/v4/app/FragmentTransaction;->add(ILandroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    :cond_1
    :goto_3
    invoke-virtual {v4}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->updateTitle()V

    return v2

    :cond_2
    move v0, v2

    goto :goto_0

    :cond_3
    move v0, v2

    goto :goto_1

    :cond_4
    move v0, v2

    goto :goto_2

    :cond_5
    invoke-virtual {v3}, Landroid/support/v4/app/Fragment;->isDetached()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {v4, v3}, Landroid/support/v4/app/FragmentTransaction;->attach(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    :cond_6
    invoke-virtual {v3}, Landroid/support/v4/app/Fragment;->isHidden()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {v4, v3}, Landroid/support/v4/app/FragmentTransaction;->show(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    goto :goto_3

    :cond_7
    return v1
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 4

    const/4 v3, 0x0

    const/4 v1, 0x0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onNewIntent(Landroid/content/Intent;)V

    const-string/jumbo v0, "MasterDetailsActivity: onNewIntent, intent = %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v3

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const-string/jumbo v0, "selection"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string/jumbo v0, "selection"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    :goto_0
    const-string/jumbo v2, "weakSelection"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string/jumbo v1, "weakSelection"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    :cond_0
    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->getDetailsFragmentFactory()Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;

    move-result-object v1

    invoke-static {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->showDetails(Landroid/app/Activity;Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;Landroid/os/Bundle;)V

    :cond_1
    :goto_1
    return-void

    :cond_2
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->isSplitScreen:Z

    if-eqz v0, :cond_3

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->getDetailsFragmentFactory()Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;

    move-result-object v0

    invoke-static {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->showDetails(Landroid/app/Activity;Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;Landroid/os/Bundle;)V

    goto :goto_1

    :cond_3
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->isSplitScreen:Z

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const v2, 0x7f100114

    invoke-virtual {v0, v2}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v0

    if-nez v0, :cond_4

    if-eqz v1, :cond_4

    const-string/jumbo v0, "fromSameActivity"

    invoke-virtual {p1, v0, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->getDetailsFragmentFactory()Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;

    move-result-object v0

    invoke-static {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->showDetails(Landroid/app/Activity;Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;Landroid/os/Bundle;)V

    goto :goto_1

    :cond_4
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->clearDetailsStack()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->onDetailsStackEmpty()Z

    goto :goto_1

    :cond_5
    move-object v0, v1

    goto :goto_0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    return-void
.end method

.method protected replaceDetailsFragment(Landroid/support/v4/app/FragmentManager;Landroid/support/v4/app/Fragment;)V
    .locals 4

    const v3, 0x10a0001

    invoke-virtual {p1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    const v1, 0x7f050010

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v3, v2, v3}, Landroid/support/v4/app/FragmentTransaction;->setCustomAnimations(IIII)Landroid/support/v4/app/FragmentTransaction;

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->isSplitScreen:Z

    if-nez v1, :cond_0

    const v1, 0x7f100286

    invoke-virtual {p1, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/support/v4/app/Fragment;->isVisible()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentTransaction;->hide(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    :cond_0
    const v1, 0x7f100114

    invoke-virtual {v0, v1, p2}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->updateTitle()V

    return-void
.end method

.method public showDetailsFragment(Ljava/lang/Class;Landroid/content/Intent;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;
    .locals 4
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

    invoke-super {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showDetailsFragment(Ljava/lang/Class;Landroid/content/Intent;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/v4/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string/jumbo v2, "MasterDetailsActivityIsImplicitDetails"

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->isAlwaysImplicitFragment(Ljava/lang/Class;)Z

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    :cond_0
    return-object v0
.end method

.method protected updateTitleNoDetails()V
    .locals 4

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const v1, 0x7f100286

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v1

    if-eqz v1, :cond_1

    instance-of v0, v1, Lcom/lumiyaviewer/lumiya/ui/common/FragmentHasTitle;

    if-eqz v0, :cond_1

    invoke-virtual {v1}, Landroid/support/v4/app/Fragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {v1}, Landroid/support/v4/app/Fragment;->isDetached()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_2

    move-object v0, v1

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/FragmentHasTitle;

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentHasTitle;->getTitle()Ljava/lang/String;

    move-result-object v3

    check-cast v1, Lcom/lumiyaviewer/lumiya/ui/common/FragmentHasTitle;

    invoke-interface {v1}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentHasTitle;->getSubTitle()Ljava/lang/String;

    move-result-object v1

    if-eqz v3, :cond_2

    const/4 v0, 0x1

    invoke-virtual {p0, v3, v1}, Lcom/lumiyaviewer/lumiya/ui/common/MasterDetailsActivity;->setActivityTitle(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    if-nez v0, :cond_0

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->updateTitleNoDetails()V

    :cond_0
    return-void

    :cond_1
    move v0, v2

    goto :goto_0

    :cond_2
    move v0, v2

    goto :goto_0
.end method
