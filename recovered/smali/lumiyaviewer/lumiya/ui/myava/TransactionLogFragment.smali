.class public Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;
.super Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor$OnLoadableDataChangedListener;
.implements Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$OnTransactionClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment$1;
    }
.end annotation


# instance fields
.field private adapter:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;

.field private final loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

.field loadingLayout:Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1000bd
    .end annotation
.end field

.field private final mHandler:Landroid/os/Handler;

.field private final moneyTransactions:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lde/greenrobot/dao/query/LazyList",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;",
            ">;>;"
        }
    .end annotation
.end field

.field private final scrollToBottomRunnable:Ljava/lang/Runnable;

.field private scrollToBottomRunnablePosted:Z

.field transactionLogView:Landroid/support/v7/widget/RecyclerView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f10029c
    .end annotation
.end field

.field private unbinder:Lbutterknife/Unbinder;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;)Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;)Ljava/lang/Runnable;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->scrollToBottomRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic -get3(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;)Lbutterknife/Unbinder;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->unbinder:Lbutterknife/Unbinder;

    return-object v0
.end method

.method static synthetic -set0(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->scrollToBottomRunnablePosted:Z

    return p1
.end method

.method public constructor <init>()V
    .locals 4

    const/4 v3, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->moneyTransactions:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->moneyTransactions:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    aput-object v2, v1, v3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;-><init>([Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;)V

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->withDataChangedListener(Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor$OnLoadableDataChangedListener;)Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->scrollToBottomRunnablePosted:Z

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->scrollToBottomRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method private clearTransactionLog()V
    .locals 4

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0900be

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string/jumbo v2, "Yes"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/myava/-$Lambda$N_xrT8AwWQ2OjPw50fSCa4Lhb58$1;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/ui/myava/-$Lambda$N_xrT8AwWQ2OjPw50fSCa4Lhb58$1;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string/jumbo v2, "No"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/myava/-$Lambda$N_xrT8AwWQ2OjPw50fSCa4Lhb58;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/ui/myava/-$Lambda$N_xrT8AwWQ2OjPw50fSCa4Lhb58;-><init>()V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_myava_TransactionLogFragment_4924(Landroid/content/DialogInterface;I)V
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

.method private performClearTransactionLog()V
    .locals 1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getBalanceManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->clearMoneyTransactions()V

    :cond_0
    return-void
.end method

.method private scrollToBottom()V
    .locals 2

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->scrollToBottomRunnablePosted:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->scrollToBottomRunnablePosted:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->scrollToBottomRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method


# virtual methods
.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_myava_TransactionLogFragment_4757(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->performClearTransactionLog()V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onCreate(Landroid/os/Bundle;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->setHasOptionsMenu(Z)V

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    const v0, 0x7f120021

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 5

    invoke-super {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    const v0, 0x7f0400af

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-static {p0, v0}, Lbutterknife/ButterKnife;->bind(Ljava/lang/Object;Landroid/view/View;)Lbutterknife/Unbinder;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->unbinder:Lbutterknife/Unbinder;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getActiveAgentID(Landroid/os/Bundle;)Ljava/util/UUID;

    move-result-object v3

    invoke-direct {v1, v2, v3, p0}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;-><init>(Landroid/content/Context;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter$OnTransactionClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->transactionLogView:Landroid/support/v7/widget/RecyclerView;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->loadingLayout:Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    const v3, 0x7f0900a9

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4, v3}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->setLoadingLayout(Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public onDestroyView()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->unbinder:Lbutterknife/Unbinder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->unbinder:Lbutterknife/Unbinder;

    invoke-interface {v0}, Lbutterknife/Unbinder;->unbind()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->unbinder:Lbutterknife/Unbinder;

    :cond_0
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onDestroyView()V

    return-void
.end method

.method public onLoadableDataChanged()V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->moneyTransactions:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/greenrobot/dao/query/LazyList;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    invoke-virtual {v0}, Lde/greenrobot/dao/query/LazyList;->isEmpty()Z

    move-result v2

    const v3, 0x7f0901f0

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->setEmptyMessage(ZLjava/lang/String;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter;->setData(Lde/greenrobot/dao/query/LazyList;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->scrollToBottom()V

    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0

    :pswitch_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->clearTransactionLog()V

    const/4 v0, 0x1

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x7f100353
        :pswitch_0
    .end packed-switch
.end method

.method public onStart()V
    .locals 3

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onStart()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->moneyTransactions:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getBalanceManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->moneyTransactions()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    sget-object v2, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->unsubscribeAll()V

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onStop()V

    return-void
.end method

.method public onTransactionClicked(Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;)V
    .locals 3

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getActiveAgentID(Landroid/os/Bundle;)Ljava/util/UUID;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;->getAgentUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    :cond_0
    return-void
.end method
