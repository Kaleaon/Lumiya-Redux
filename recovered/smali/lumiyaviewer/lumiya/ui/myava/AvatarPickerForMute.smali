.class public Lcom/lumiyaviewer/lumiya/ui/myava/AvatarPickerForMute;
.super Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;-><init>()V

    return-void
.end method

.method static makeArguments(Ljava/util/UUID;)Landroid/os/Bundle;
    .locals 1

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    invoke-static {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->setActiveAgentID(Landroid/os/Bundle;Ljava/util/UUID;)V

    return-object v0
.end method


# virtual methods
.method public getTitle()Ljava/lang/String;
    .locals 1

    const v0, 0x7f0902f0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/myava/AvatarPickerForMute;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected onAvatarSelected(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V
    .locals 5
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/myava/AvatarPickerForMute;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->muteList:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->AGENT:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getOptionalChatterUUID()Ljava/util/UUID;

    move-result-object v3

    const/16 v4, 0xf

    invoke-direct {v1, v2, v3, p2, v4}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;Ljava/util/UUID;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->Block(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;)V

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/myava/AvatarPickerForMute;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    if-eqz v1, :cond_1

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->closeDetailsFragment(Landroid/support/v4/app/Fragment;)Z

    :cond_1
    return-void
.end method
