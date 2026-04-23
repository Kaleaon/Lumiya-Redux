.class public Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;
.super Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;


# instance fields
.field private adapter:Lcom/lumiyaviewer/lumiya/ui/myava/MuteListAdapter;

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

.field muteList:Landroid/widget/ListView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1001e3
    .end annotation
.end field

.field private final muteListData:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;",
            ">;>;"
        }
    .end annotation
.end field

.field private unbinder:Lbutterknife/Unbinder;


# direct methods
.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->doUnblock(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/myava/-$Lambda$dntbaqhB2OOLQW5t89NMwUjCLX4$2;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/myava/-$Lambda$dntbaqhB2OOLQW5t89NMwUjCLX4$2;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->muteListData:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    return-void
.end method

.method private askForUnblock(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;)V
    .locals 6

    const/4 v5, 0x1

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f090360

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-array v2, v5, [Ljava/lang/Object;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;->name:Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string/jumbo v2, "Yes"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/myava/-$Lambda$dntbaqhB2OOLQW5t89NMwUjCLX4$3;

    invoke-direct {v3, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/myava/-$Lambda$dntbaqhB2OOLQW5t89NMwUjCLX4$3;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string/jumbo v2, "No"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/myava/-$Lambda$dntbaqhB2OOLQW5t89NMwUjCLX4;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/ui/myava/-$Lambda$dntbaqhB2OOLQW5t89NMwUjCLX4;-><init>()V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method private doUnblock(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;)V
    .locals 1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->muteList:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->Unblock(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;)V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_myava_MuteListFragment_6021(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method public static makeSelection(Ljava/util/UUID;)Landroid/os/Bundle;
    .locals 1

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    invoke-static {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->setActiveAgentID(Landroid/os/Bundle;Ljava/util/UUID;)V

    return-object v0
.end method

.method private onMuteList(Lcom/google/common/collect/ImmutableList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/myava/MuteListAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/myava/MuteListAdapter;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListAdapter;->setData(Ljava/util/List;)V

    :cond_0
    return-void
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_ui_myava_MuteListFragment-mthref-0(Lcom/google/common/collect/ImmutableList;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->onMuteList(Lcom/google/common/collect/ImmutableList;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_myava_MuteListFragment_3737(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 3

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0901c0

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_myava_MuteListFragment_5870(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p2}, Landroid/content/DialogInterface;->dismiss()V

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->doUnblock(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;)V

    return-void
.end method

.method public onAddMuteListButtonClick()V
    .locals 3
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f1001e4
        }
    .end annotation

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/myava/AvatarPickerForMute;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/myava/AvatarPickerForMute;->makeArguments(Ljava/util/UUID;)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    :cond_0
    return-void
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 2

    invoke-interface {p1}, Landroid/view/MenuItem;->getMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;

    move-result-object v0

    check-cast v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/myava/MuteListAdapter;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/myava/MuteListAdapter;

    iget v0, v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListAdapter;->getItem(I)Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    :cond_0
    const/4 v0, 0x0

    return v0

    :pswitch_0
    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->askForUnblock(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;)V

    const/4 v0, 0x1

    return v0

    :pswitch_data_0
    .packed-switch 0x7f100331
        :pswitch_0
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4

    invoke-super {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    const v0, 0x7f040061

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-static {p0, v0}, Lbutterknife/ButterKnife;->bind(Ljava/lang/Object;Landroid/view/View;)Lbutterknife/Unbinder;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->unbinder:Lbutterknife/Unbinder;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListAdapter;

    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListAdapter;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/myava/MuteListAdapter;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->muteList:Landroid/widget/ListView;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/myava/MuteListAdapter;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->muteList:Landroid/widget/ListView;

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment$1;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;)V

    invoke-direct {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;-><init>(Landroid/widget/ListView;Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$DismissCallbacks;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->muteList:Landroid/widget/ListView;

    invoke-virtual {v2, v1}, Landroid/widget/ListView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->muteList:Landroid/widget/ListView;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->makeScrollListener()Landroid/widget/AbsListView$OnScrollListener;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->muteList:Landroid/widget/ListView;

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/myava/-$Lambda$dntbaqhB2OOLQW5t89NMwUjCLX4$1;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/myava/-$Lambda$dntbaqhB2OOLQW5t89NMwUjCLX4$1;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->muteList:Landroid/widget/ListView;

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->registerForContextMenu(Landroid/view/View;)V

    return-object v0
.end method

.method public onDestroyView()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->unbinder:Lbutterknife/Unbinder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->unbinder:Lbutterknife/Unbinder;

    invoke-interface {v0}, Lbutterknife/Unbinder;->unbind()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->unbinder:Lbutterknife/Unbinder;

    :cond_0
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onDestroyView()V

    return-void
.end method

.method public onStart()V
    .locals 4

    const/4 v1, 0x0

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onStart()V

    const v0, 0x7f0901c1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->setTitle(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->muteListData:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->muteListPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->agentCircuits()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v2

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->muteListData:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onStop()V

    return-void
.end method
