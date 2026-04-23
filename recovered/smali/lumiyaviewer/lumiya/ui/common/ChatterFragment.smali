.class public abstract Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;
.super Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;


# static fields
.field public static final CHATTER_ID_KEY:Ljava/lang/String; = "chatterID"


# instance fields
.field protected chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected nameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

.field private showChatterTitle:Z

.field protected userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->showChatterTitle:Z

    return-void
.end method

.method private getNameRetriever(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;
    .locals 5

    const/4 v1, 0x0

    const-string/jumbo v2, "UserFunctionsFragment: ChatterNameRetriever: requesting for %s"

    const/4 v0, 0x1

    new-array v3, v0, [Ljava/lang/Object;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz p1, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {v0, p1, p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;Ljava/util/concurrent/Executor;)V

    :goto_1
    return-object v0

    :cond_0
    const-string/jumbo v0, "null"

    goto :goto_0

    :cond_1
    move-object v0, v1

    goto :goto_1
.end method

.method public static makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;
    .locals 2

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string/jumbo v1, "chatterID"

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    return-object v0
.end method

.method private updateFragmentTitle(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V
    .locals 5

    const/4 v4, 0x0

    const-string/jumbo v0, "updateTitle: updating fragment title: retriever = %s, showChatterTitle %b"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->showChatterTitle:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->showChatterTitle:Z

    if-eqz v0, :cond_0

    if-nez p1, :cond_1

    invoke-virtual {p0, v4, v4}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->setTitle(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->decorateFragmentTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v4}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->setTitle(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    const v0, 0x7f0901c8

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v4}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->setTitle(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method protected decorateFragmentTitle(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    return-object p1
.end method

.method public onChatterNameUpdated(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V
    .locals 4

    const/4 v3, 0x0

    const-string/jumbo v1, "updateTitle: ChatterNameRetriever: retrieved for %s"

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/Object;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-static {v0, v1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "UserFunctionsFragment: updating fragment title"

    new-array v1, v3, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->updateFragmentTitle(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {v0}, Landroid/support/v4/app/ActivityCompat;->invalidateOptionsMenu(Landroid/app/Activity;)Z

    :cond_0
    return-void

    :cond_1
    const-string/jumbo v0, "null"

    goto :goto_0
.end method

.method protected abstract onShowUser(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public onStart()V
    .locals 2

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onStart()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "chatterID"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->setNewUser(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    return-void
.end method

.method public onStop()V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->setNewUser(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onStop()V

    return-void
.end method

.method setNewUser(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    :cond_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->nameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->nameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-static {v0, p1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->nameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->getNameRetriever(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->nameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->nameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->updateFragmentTitle(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->onShowUser(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    return-void

    :cond_2
    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->getNameRetriever(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->nameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    goto :goto_0
.end method

.method protected setShowChatterTitle(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->showChatterTitle:Z

    return-void
.end method
