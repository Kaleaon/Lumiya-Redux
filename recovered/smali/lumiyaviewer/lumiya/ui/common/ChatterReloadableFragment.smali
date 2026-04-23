.class public abstract Lcom/lumiyaviewer/lumiya/ui/common/ChatterReloadableFragment;
.super Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/common/ReloadableFragment;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public setFragmentArgs(Landroid/content/Intent;Landroid/os/Bundle;)V
    .locals 2

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    const-string/jumbo v0, "chatterID"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    :cond_0
    if-nez v0, :cond_1

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getActiveAgentID(Landroid/content/Intent;)Ljava/util/UUID;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getLocalChatterID(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v0

    :cond_1
    if-eqz p2, :cond_2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterReloadableFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    :cond_2
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterReloadableFragment;->isFragmentStarted()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterReloadableFragment;->setNewUser(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    :cond_3
    return-void
.end method
