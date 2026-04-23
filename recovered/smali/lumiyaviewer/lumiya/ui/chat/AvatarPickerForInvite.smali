.class public Lcom/lumiyaviewer/lumiya/ui/chat/AvatarPickerForInvite;
.super Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/chat/AvatarPickerForInvite$RoleEntry;
    }
.end annotation


# static fields
.field private static final GROUP_ID_KEY:Ljava/lang/String; = "groupID"

.field private static final GROUP_LIST_KEY:Ljava/lang/String; = "avatarGroupList"

.field private static final GROUP_PROFILE_KEY:Ljava/lang/String; = "groupProfile"

.field private static final GROUP_ROLES:Ljava/lang/String; = "groupRoles"

.field private static final GROUP_TITLES_KEY:Ljava/lang/String; = "groupTitles"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;-><init>()V

    return-void
.end method

.method private getGroupID()Ljava/util/UUID;
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/AvatarPickerForInvite;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "groupID"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    return-object v0
.end method

.method public static makeArguments(Ljava/util/UUID;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply;Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;)Landroid/os/Bundle;
    .locals 3

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->makeFragmentArguments(Ljava/util/UUID;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "groupID"

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v1, "groupProfile"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string/jumbo v1, "avatarGroupList"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    const-string/jumbo v1, "groupTitles"

    invoke-virtual {v0, v1, p4}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string/jumbo v1, "groupRoles"

    invoke-virtual {v0, v1, p5}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    return-object v0
.end method


# virtual methods
.method protected createExtraView(Landroid/view/LayoutInflater;Landroid/widget/FrameLayout;)V
    .locals 1

    const v0, 0x7f040055

    invoke-virtual {p1, v0, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    return-void
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    const v0, 0x7f09017f

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/AvatarPickerForInvite;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected onAvatarSelected(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V
    .locals 4
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/AvatarPickerForInvite;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    const v1, 0x7f1001c3

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/AvatarPickerForInvite$RoleEntry;

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    if-eqz v1, :cond_0

    instance-of v2, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v1

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->groupManager:Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/AvatarPickerForInvite;->getGroupID()Ljava/util/UUID;

    move-result-object v3

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/AvatarPickerForInvite$RoleEntry;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/ui/chat/AvatarPickerForInvite$RoleEntry;->roleID:Ljava/util/UUID;

    invoke-virtual {v1, v2, v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->SendGroupInvite(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/AvatarPickerForInvite;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f09013d

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/AvatarPickerForInvite;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->closeDetailsFragment(Landroid/support/v4/app/Fragment;)Z

    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 12

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;->onStart()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/AvatarPickerForInvite;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "groupProfile"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/AvatarPickerForInvite;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "groupTitles"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/AvatarPickerForInvite;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "avatarGroupList"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/AvatarPickerForInvite;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string/jumbo v4, "groupRoles"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v3

    check-cast v3, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;

    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v5, 0x0

    new-instance v8, Ljava/util/HashSet;

    invoke-direct {v8}, Ljava/util/HashSet;-><init>()V

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply;->GroupData_Fields:Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_b

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply$GroupData;

    iget-object v9, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply$GroupData;->RoleID:Ljava/util/UUID;

    invoke-interface {v8, v9}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply$GroupData;->RoleID:Ljava/util/UUID;

    iget-object v9, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;

    iget-object v9, v9, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;->OwnerRole:Ljava/util/UUID;

    invoke-virtual {v1, v9}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    const/4 v1, 0x1

    :goto_1
    move v4, v1

    goto :goto_0

    :cond_0
    move v7, v4

    :goto_2
    if-eqz v2, :cond_9

    iget-object v1, v2, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;->Groups:Lcom/google/common/collect/ImmutableMap;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/AvatarPickerForInvite;->getGroupID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;

    if-eqz v1, :cond_9

    iget-wide v4, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->GroupPowers:J

    const-wide/16 v10, 0x100

    and-long/2addr v4, v10

    const-wide/16 v10, 0x0

    cmp-long v2, v4, v10

    if-eqz v2, :cond_3

    const/4 v2, 0x1

    :goto_3
    iget-wide v4, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->GroupPowers:J

    const-wide/16 v10, 0x80

    and-long/2addr v4, v10

    const-wide/16 v10, 0x0

    cmp-long v1, v4, v10

    if-eqz v1, :cond_4

    const/4 v1, 0x1

    move v4, v2

    move v2, v1

    :goto_4
    new-instance v5, Lcom/google/common/collect/ImmutableList$Builder;

    invoke-direct {v5}, Lcom/google/common/collect/ImmutableList$Builder;-><init>()V

    if-eqz v3, :cond_7

    if-eqz v0, :cond_7

    iget-object v1, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;->RoleData_Fields:Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_1
    :goto_5
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;

    if-nez v7, :cond_5

    if-eqz v4, :cond_2

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;->RoleID:Ljava/util/UUID;

    iget-object v9, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;

    iget-object v9, v9, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;->OwnerRole:Ljava/util/UUID;

    invoke-virtual {v3, v9}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v3

    xor-int/lit8 v3, v3, 0x1

    if-nez v3, :cond_5

    :cond_2
    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;->RoleID:Ljava/util/UUID;

    sget-object v9, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    invoke-virtual {v3, v9}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    if-eqz v2, :cond_6

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;->RoleID:Ljava/util/UUID;

    invoke-interface {v8, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    :goto_6
    if-eqz v3, :cond_1

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/chat/AvatarPickerForInvite$RoleEntry;

    iget-object v9, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;->RoleID:Ljava/util/UUID;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;->Title:[B

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v1

    const/4 v10, 0x0

    invoke-direct {v3, v9, v1, v10}, Lcom/lumiyaviewer/lumiya/ui/chat/AvatarPickerForInvite$RoleEntry;-><init>(Ljava/util/UUID;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/ui/chat/AvatarPickerForInvite$RoleEntry;)V

    invoke-virtual {v5, v3}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    goto :goto_5

    :cond_3
    const/4 v2, 0x0

    goto :goto_3

    :cond_4
    const/4 v1, 0x0

    move v4, v2

    move v2, v1

    goto :goto_4

    :cond_5
    const/4 v3, 0x1

    goto :goto_6

    :cond_6
    const/4 v3, 0x0

    goto :goto_6

    :cond_7
    invoke-virtual {v5}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/AvatarPickerForInvite;->getView()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_8

    new-instance v2, Landroid/widget/ArrayAdapter;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/AvatarPickerForInvite;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x1090009

    invoke-direct {v2, v3, v4, v0}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    const v0, 0x7f1001c3

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    invoke-virtual {v0, v2}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    :cond_8
    return-void

    :cond_9
    move v2, v5

    move v4, v6

    goto/16 :goto_4

    :cond_a
    move v1, v4

    goto/16 :goto_1

    :cond_b
    move v7, v4

    goto/16 :goto_2
.end method
