.class public Lcom/lumiyaviewer/lumiya/ui/common/StateAwareFragment;
.super Landroid/support/v4/app/Fragment;


# instance fields
.field private fragmentStarted:Z

.field private fragmentVisible:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/StateAwareFragment;->fragmentStarted:Z

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/StateAwareFragment;->fragmentVisible:Z

    return-void
.end method


# virtual methods
.method public isFragmentStarted()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/StateAwareFragment;->fragmentStarted:Z

    return v0
.end method

.method public isFragmentVisible()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/StateAwareFragment;->fragmentVisible:Z

    return v0
.end method

.method public onPause()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/StateAwareFragment;->fragmentVisible:Z

    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 1

    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onResume()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/StateAwareFragment;->fragmentVisible:Z

    return-void
.end method

.method public onStart()V
    .locals 1

    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStart()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/StateAwareFragment;->fragmentStarted:Z

    return-void
.end method

.method public onStop()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/StateAwareFragment;->fragmentStarted:Z

    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStop()V

    return-void
.end method
