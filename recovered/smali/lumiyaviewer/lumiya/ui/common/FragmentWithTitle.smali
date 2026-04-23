.class public Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;
.super Lcom/lumiyaviewer/lumiya/ui/common/StateAwareFragment;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/common/FragmentHasTitle;


# static fields
.field private static final FRAGMENT_SUBTITLE_TAG:Ljava/lang/String; = "FragmentWithTitle:fragmentSubTitle"

.field private static final FRAGMENT_TITLE_TAG:Ljava/lang/String; = "FragmentWithTitle:fragmentTitle"


# instance fields
.field private fragmentSubTitle:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private fragmentTitle:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/StateAwareFragment;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->fragmentTitle:Ljava/lang/String;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->fragmentSubTitle:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getSubTitle()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->fragmentSubTitle:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->fragmentTitle:Ljava/lang/String;

    return-object v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/StateAwareFragment;->onCreate(Landroid/os/Bundle;)V

    if-eqz p1, :cond_0

    const-string/jumbo v0, "FragmentWithTitle:fragmentTitle"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->fragmentTitle:Ljava/lang/String;

    const-string/jumbo v0, "FragmentWithTitle:fragmentSubTitle"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->fragmentSubTitle:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method public onDetach()V
    .locals 2

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/StateAwareFragment;->onDetach()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onFragmentTitleUpdated()V

    :cond_0
    return-void
.end method

.method public onHiddenChanged(Z)V
    .locals 2

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/StateAwareFragment;->onHiddenChanged(Z)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onFragmentTitleUpdated()V

    :cond_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/StateAwareFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    const-string/jumbo v0, "FragmentWithTitle:fragmentTitle"

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->fragmentTitle:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v0, "FragmentWithTitle:fragmentSubTitle"

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->fragmentSubTitle:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onStart()V
    .locals 2

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/StateAwareFragment;->onStart()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onFragmentTitleUpdated()V

    :cond_0
    return-void
.end method

.method public setTitle(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->fragmentTitle:Ljava/lang/String;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->fragmentSubTitle:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-string/jumbo v1, "updateTitle: title \'%s\', subTitle \'%s\', activity %s, fragment %s"

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object p2, v2, v3

    const/4 v3, 0x2

    aput-object v0, v2, v3

    const/4 v3, 0x3

    aput-object p0, v2, v3

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onFragmentTitleUpdated()V

    :cond_0
    return-void
.end method
