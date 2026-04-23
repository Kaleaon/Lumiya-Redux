.class public Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;
.super Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor$OnLoadableDataChangedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;,
        Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;
    }
.end annotation


# static fields
.field private static final ROLE_ID_KEY:Ljava/lang/String; = "role_id"


# instance fields
.field private RoleID:Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private adapter:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;

.field private final agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;",
            ">;"
        }
    .end annotation
.end field

.field private canAddMembers:Z

.field private final groupProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;",
            ">;"
        }
    .end annotation
.end field

.field private final groupRoleMemberList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Ljava/util/UUID;",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private final groupTitles:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply;",
            ">;"
        }
    .end annotation
.end field

.field private final loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

.field private final myGroupList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;",
            ">;"
        }
    .end annotation
.end field

.field private final roleMembers:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$GroupRoleMembersQuery;",
            "Lde/greenrobot/dao/query/LazyList",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/GroupRoleMember;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    return-object v0
.end method

.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->removeMemberFromRole(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 7

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->groupProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->myGroupList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->groupTitles:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$TbI0imFFmZKCR9nUgEGSvi-_8Q0$2;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$TbI0imFFmZKCR9nUgEGSvi-_8Q0$2;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->groupRoleMemberList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->roleMembers:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    const/4 v1, 0x4

    new-array v1, v1, [Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->groupRoleMemberList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    aput-object v2, v1, v4

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->myGroupList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    aput-object v2, v1, v5

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->groupProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    aput-object v2, v1, v6

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->roleMembers:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    const/4 v3, 0x3

    aput-object v2, v1, v3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;-><init>([Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;)V

    new-array v1, v6, [Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    aput-object v2, v1, v4

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->groupTitles:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    aput-object v2, v1, v5

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->withOptionalLoadables([Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;)Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->withDataChangedListener(Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor$OnLoadableDataChangedListener;)Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    iput-boolean v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->canAddMembers:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;

    return-void
.end method

.method private getMyGroupEntry()Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;
    .locals 3
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->myGroupList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;->Groups:Lcom/google/common/collect/ImmutableMap;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;->getChatterUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    return-object v2

    :cond_0
    return-object v2
.end method

.method private getMyGroupPowers()J
    .locals 2

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->getMyGroupEntry()Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->GroupPowers:J

    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_GroupRoleMembersFragment_11957(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method public static makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/util/UUID;)Landroid/os/Bundle;
    .locals 3
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-static {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v0

    if-eqz p1, :cond_0

    const-string/jumbo v1, "role_id"

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-object v0
.end method

.method private onGroupRoleMemberList(Ljava/util/UUID;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->RoleID:Ljava/util/UUID;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->roleMembers:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getGroupManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->getGroupRoleMemberList()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;->getChatterUUID()Ljava/util/UUID;

    move-result-object v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->RoleID:Ljava/util/UUID;

    invoke-static {v0, v3, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$GroupRoleMembersQuery;->create(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$GroupRoleMembersQuery;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private removeMemberFromRole(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;)V
    .locals 3

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0902a2

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$TbI0imFFmZKCR9nUgEGSvi-_8Q0$3;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$TbI0imFFmZKCR9nUgEGSvi-_8Q0$3;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    const v2, 0x7f090390

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$TbI0imFFmZKCR9nUgEGSvi-_8Q0;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$TbI0imFFmZKCR9nUgEGSvi-_8Q0;-><init>()V

    const v2, 0x7f0900a8

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_ui_chat_profiles_GroupRoleMembersFragment-mthref-0(Ljava/util/UUID;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->onGroupRoleMemberList(Ljava/util/UUID;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_GroupRoleMembersFragment_11502(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;Landroid/content/DialogInterface;I)V
    .locals 4

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->groupManager:Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->groupProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;->GroupID:Ljava/util/UUID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->RoleID:Ljava/util/UUID;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v1, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->RemoveMemberFromRole(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;)V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    invoke-interface {p2}, Landroid/content/DialogInterface;->dismiss()V

    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_GroupRoleMembersFragment_4418(Landroid/view/View;)V
    .locals 4

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->canAddMembers:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->RoleID:Ljava/util/UUID;

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/util/UUID;)Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    :cond_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 6
    .param p2    # Landroid/view/ViewGroup;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/os/Bundle;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const v3, 0x7f1000bd

    const v5, 0x7f1000bb

    const v0, 0x7f040048

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->setSwipeRefreshLayout(Landroid/support/v4/widget/SwipeRefreshLayout;)V

    const v0, 0x7f100180

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$TbI0imFFmZKCR9nUgEGSvi-_8Q0$1;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$TbI0imFFmZKCR9nUgEGSvi-_8Q0$1;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;

    const v0, 0x7f10017f

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    const v3, 0x7f0901e0

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f090151

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v0, v3, v4}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->setLoadingLayout(Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->setSwipeRefreshLayout(Landroid/support/v4/widget/SwipeRefreshLayout;)V

    return-object v2
.end method

.method public onLoadableDataChanged()V
    .locals 10

    const-wide/16 v8, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->getMyGroupEntry()Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->groupTitles:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->isSubscribed()Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->groupTitles:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getGroupTitles()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v4

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v4

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->GroupID:Ljava/util/UUID;

    invoke-virtual {v3, v4, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :cond_0
    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->canAddMembers:Z

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->getMyGroupPowers()J

    move-result-wide v4

    const-wide/16 v6, 0x100

    and-long/2addr v6, v4

    cmp-long v0, v6, v8

    if-eqz v0, :cond_4

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->canAddMembers:Z

    :cond_1
    :goto_0
    const-wide/16 v6, 0x200

    and-long/2addr v4, v6

    cmp-long v0, v4, v8

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->groupProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;

    if-eqz v0, :cond_6

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->RoleID:Ljava/util/UUID;

    if-eqz v3, :cond_6

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->RoleID:Ljava/util/UUID;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;->OwnerRole:Ljava/util/UUID;

    invoke-virtual {v3, v0}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_1
    if-eqz v0, :cond_7

    move v3, v2

    :goto_2
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_2

    const v4, 0x7f100180

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-boolean v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->canAddMembers:Z

    if-eqz v4, :cond_8

    :goto_3
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;

    if-eqz v0, :cond_3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->roleMembers:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/greenrobot/dao/query/LazyList;

    invoke-virtual {v2, v0, v3, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;->setData(Lde/greenrobot/dao/query/LazyList;ZZ)V

    :cond_3
    return-void

    :cond_4
    const-wide/16 v6, 0x80

    and-long/2addr v6, v4

    cmp-long v0, v6, v8

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->groupTitles:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply;

    if-eqz v0, :cond_1

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply;->GroupData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_5
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply$GroupData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply$GroupData;->RoleID:Ljava/util/UUID;

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->RoleID:Ljava/util/UUID;

    invoke-virtual {v0, v6}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    move v0, v1

    :goto_4
    if-eqz v0, :cond_1

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->canAddMembers:Z

    goto :goto_0

    :cond_6
    move v0, v2

    goto :goto_1

    :cond_7
    move v3, v1

    move v1, v2

    goto :goto_2

    :cond_8
    const/16 v2, 0x8

    goto :goto_3

    :cond_9
    move v1, v2

    move v3, v2

    goto :goto_2

    :cond_a
    move v0, v2

    goto :goto_4
.end method

.method protected onShowUser(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 4
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->unsubscribeAll()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "role_id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->RoleID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;->getChatterUUID()Ljava/util/UUID;

    move-result-object v0

    const-string/jumbo v1, "GroupRoleMemberList: subscribing for group %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->agentCircuits()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v2

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->agentUUID:Ljava/util/UUID;

    invoke-virtual {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->groupProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getCachedGroupProfiles()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->myGroupList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getAvatarGroupLists()Lcom/lumiyaviewer/lumiya/slproto/users/SerializableResponseCacher;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/SerializableResponseCacher;->getPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v2

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->agentUUID:Ljava/util/UUID;

    invoke-virtual {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->groupRoleMemberList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getGroupManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->getGroupRoleMembers()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method
