.class public Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;
.super Lcom/lumiyaviewer/lumiya/ui/common/ChatterReloadableFragment;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor$OnLoadableDataChangedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab$PicksAdapter;
    }
.end annotation


# instance fields
.field private final avatarPicks:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply;",
            ">;"
        }
    .end annotation
.end field

.field private final loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

.field private picksAdapter:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab$PicksAdapter;


# direct methods
.method public constructor <init>()V
    .locals 4

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterReloadableFragment;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->avatarPicks:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->avatarPicks:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;-><init>([Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;)V

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->withDataChangedListener(Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor$OnLoadableDataChangedListener;)Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_UserPicksProfileTab_5724(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method private onAddNewPick(Landroid/view/View;)V
    .locals 9

    const/4 v7, 0x1

    const/4 v0, 0x0

    const/4 v5, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v1, v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getCurrentLocationInfoSnapshot()Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->parcelData()Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    move-result-object v5

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v3

    if-eqz v5, :cond_1

    if-eqz v3, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->picksAdapter:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab$PicksAdapter;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->picksAdapter:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab$PicksAdapter;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab$PicksAdapter;->getCount()I

    move-result v1

    :goto_0
    new-instance v6, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v6, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/common/base/Strings;->emptyToNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/common/base/Optional;->fromNullable(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    move-result-object v2

    const v4, 0x7f0901c8

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/google/common/base/Optional;->or(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    new-array v2, v7, [Ljava/lang/Object;

    aput-object v4, v2, v0

    const v0, 0x7f0900d3

    invoke-virtual {p0, v0, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v7}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    const-string/jumbo v8, "Yes"

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$0JruYUVxhc8cYQ6nJZD1LVnQE5A$3;

    move-object v2, p0

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$0JruYUVxhc8cYQ6nJZD1LVnQE5A$3;-><init>(ILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v7, v8, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v1, "No"

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$0JruYUVxhc8cYQ6nJZD1LVnQE5A;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$0JruYUVxhc8cYQ6nJZD1LVnQE5A;-><init>()V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v6}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    :cond_1
    return-void

    :cond_2
    move v1, v0

    goto :goto_0
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_ui_chat_profiles_UserPicksProfileTab-mthref-0(Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->onAddNewPick(Landroid/view/View;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_UserPicksProfileTab_2539(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 7

    invoke-virtual {p1}, Landroid/widget/AdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v0

    invoke-interface {v0, p3}, Landroid/widget/Adapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply$Data;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const-class v3, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->agentUUID:Ljava/util/UUID;

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v6

    move-object v0, v1

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply$Data;->PickID:Ljava/util/UUID;

    invoke-direct {v5, v6, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;-><init>(Ljava/util/UUID;Ljava/util/UUID;)V

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->makeSelection(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    :cond_0
    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_UserPicksProfileTab_4543(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;ILandroid/content/DialogInterface;I)V
    .locals 10

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->userProfiles:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getDescription()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/google/common/base/Strings;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getSnapshotUUID()Ljava/util/UUID;

    move-result-object v4

    invoke-static {v4}, Lcom/google/common/base/Optional;->fromNullable(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    move-result-object v4

    sget-object v6, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    invoke-virtual {v4, v6}, Lcom/google/common/base/Optional;->or(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/UUID;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getAgentGlobalPosition()Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    move-result-object v7

    const/4 v9, 0x1

    move-object v4, p2

    move v8, p4

    invoke-virtual/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->UpdatePickInfo(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;IZ)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const-class v3, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->agentUUID:Ljava/util/UUID;

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-direct {v5, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;-><init>(Ljava/util/UUID;Ljava/util/UUID;)V

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->makeSelection(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    invoke-interface {p5}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 7
    .param p2    # Landroid/view/ViewGroup;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/os/Bundle;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const v6, 0x7f1002cd

    const v4, 0x7f1000bd

    const v5, 0x7f1000bb

    const v0, 0x7f0400b9

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab$PicksAdapter;

    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab$PicksAdapter;-><init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab$PicksAdapter;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->picksAdapter:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab$PicksAdapter;

    const v0, 0x7f1002ce

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$0JruYUVxhc8cYQ6nJZD1LVnQE5A$1;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$0JruYUVxhc8cYQ6nJZD1LVnQE5A$1;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->picksAdapter:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab$PicksAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$0JruYUVxhc8cYQ6nJZD1LVnQE5A$2;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$0JruYUVxhc8cYQ6nJZD1LVnQE5A$2;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->setSwipeRefreshLayout(Landroid/support/v4/widget/SwipeRefreshLayout;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    const v3, 0x7f0901f1

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f090370

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v0, v3, v4}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->setLoadingLayout(Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->setSwipeRefreshLayout(Landroid/support/v4/widget/SwipeRefreshLayout;)V

    return-object v2
.end method

.method public onLoadableDataChanged()V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->picksAdapter:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab$PicksAdapter;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->picksAdapter:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab$PicksAdapter;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->avatarPicks:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab$PicksAdapter;->setData(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply;)V

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->avatarPicks:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply;->Data_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    const v2, 0x7f0901ee

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->setEmptyMessage(ZLjava/lang/String;)V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method protected onShowUser(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 5
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->unsubscribeAll()V

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v3

    move-object v0, p1

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->avatarPicks:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getAvatarPicks()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v2

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :goto_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;->getView()Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_0

    const v3, 0x7f1002ce

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    if-eqz v0, :cond_1

    :goto_1
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void

    :cond_1
    const/16 v1, 0x8

    goto :goto_1

    :cond_2
    move v0, v1

    goto :goto_0
.end method
