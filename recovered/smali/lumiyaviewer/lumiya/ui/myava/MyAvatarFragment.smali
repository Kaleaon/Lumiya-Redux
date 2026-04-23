.class public Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;
.super Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment$MyAvatarPagesAdapter;
    }
.end annotation


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-ui-myava-MyAvatarDetailsPagesSwitchesValues:[I


# instance fields
.field myAvatarName:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1001e9
    .end annotation
.end field

.field private myAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

.field myAvatarOptionsList:Landroid/widget/ListView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1001eb
    .end annotation
.end field

.field myAvatarPic:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1001ea
    .end annotation
.end field

.field private final myBalance:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private unbinder:Lbutterknife/Unbinder;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;)Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->myBalance:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    return-object v0
.end method

.method private static synthetic -getcom-lumiyaviewer-lumiya-ui-myava-MyAvatarDetailsPagesSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->-com-lumiyaviewer-lumiya-ui-myava-MyAvatarDetailsPagesSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->-com-lumiyaviewer-lumiya-ui-myava-MyAvatarDetailsPagesSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->values()[Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->pageBalance:Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_3

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->pageBlockList:Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_2

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->pageOutfits:Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_1

    :goto_2
    :try_start_3
    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->pageProfile:Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_0

    :goto_3
    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->-com-lumiyaviewer-lumiya-ui-myava-MyAvatarDetailsPagesSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_3

    :catch_1
    move-exception v1

    goto :goto_2

    :catch_2
    move-exception v1

    goto :goto_1

    :catch_3
    move-exception v1

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->myAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/myava/-$Lambda$E97LbIKTNF028fQGuPv0gXqIQrc;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/myava/-$Lambda$E97LbIKTNF028fQGuPv0gXqIQrc;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->myBalance:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    return-void
.end method

.method private getAgentUUID()Ljava/util/UUID;
    .locals 1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getActiveAgentID(Landroid/os/Bundle;)Ljava/util/UUID;

    move-result-object v0

    return-object v0
.end method

.method public static makeSelection(Ljava/util/UUID;)Landroid/os/Bundle;
    .locals 1

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    invoke-static {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->setActiveAgentID(Landroid/os/Bundle;Ljava/util/UUID;)V

    return-object v0
.end method

.method public static newInstance(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;
    .locals 2

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;-><init>()V

    invoke-static {p0}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->makeSelection(Ljava/util/UUID;)Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method private onMyBalance(Ljava/lang/Integer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->unbinder:Lbutterknife/Unbinder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->myAvatarOptionsList:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment$MyAvatarPagesAdapter;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment$MyAvatarPagesAdapter;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment$MyAvatarPagesAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_ui_myava_MyAvatarFragment-mthref-0(Ljava/lang/Integer;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->onMyBalance(Ljava/lang/Integer;)V

    return-void
.end method

.method public onChatterNameUpdated(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V
    .locals 4

    const/4 v3, 0x0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->unbinder:Lbutterknife/Unbinder;

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->myAvatarName:Landroid/widget/TextView;

    if-eqz v1, :cond_1

    move-object v0, v1

    :goto_0
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->myAvatarPic:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v0, v2, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    :cond_0
    invoke-virtual {p0, v1, v3}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->setTitle(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    const v0, 0x7f0901c8

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4

    invoke-super {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    const v0, 0x7f040063

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-static {p0, v0}, Lbutterknife/ButterKnife;->bind(Ljava/lang/Object;Landroid/view/View;)Lbutterknife/Unbinder;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->unbinder:Lbutterknife/Unbinder;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->myAvatarOptionsList:Landroid/widget/ListView;

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment$MyAvatarPagesAdapter;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment$MyAvatarPagesAdapter;-><init>(Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->myAvatarOptionsList:Landroid/widget/ListView;

    invoke-virtual {v1, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    return-object v0
.end method

.method public onDestroyView()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->unbinder:Lbutterknife/Unbinder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->unbinder:Lbutterknife/Unbinder;

    invoke-interface {v0}, Lbutterknife/Unbinder;->unbind()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->unbinder:Lbutterknife/Unbinder;

    :cond_0
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onDestroyView()V

    return-void
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    const/4 v3, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->getAgentUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {p1, p3}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v2, v0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    if-eqz v2, :cond_0

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->-getcom-lumiyaviewer-lumiya-ui-myava-MyAvatarDetailsPagesSwitchesValues()[I

    move-result-object v2

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->ordinal()I

    move-result v0

    aget v0, v2, v0

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/myava/MyProfileFragment;

    invoke-static {v1, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/myava/MyProfileFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v1

    invoke-static {v0, v2, v1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    goto :goto_0

    :pswitch_1
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;

    invoke-static {v1, v3}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->makeSelection(Ljava/util/UUID;Ljava/util/UUID;)Landroid/os/Bundle;

    move-result-object v1

    invoke-static {v0, v2, v1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    goto :goto_0

    :pswitch_2
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->makeSelection(Ljava/util/UUID;)Landroid/os/Bundle;

    move-result-object v1

    invoke-static {v0, v2, v1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    goto :goto_0

    :pswitch_3
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/myava/TransactionLogFragment;->makeSelection(Ljava/util/UUID;)Landroid/os/Bundle;

    move-result-object v1

    invoke-static {v0, v2, v1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onStart()V
    .locals 4

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onStart()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->getAgentUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->myBalance:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getBalanceManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->getBalance()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v1

    sget-object v3, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v2, v1, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :cond_0
    if-eqz v0, :cond_1

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-static {v0, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getSerialInstance()Ljava/util/concurrent/Executor;

    move-result-object v2

    invoke-direct {v1, v0, p0, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;Ljava/util/concurrent/Executor;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->myAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    :cond_1
    return-void
.end method

.method public onStop()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->myAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->myAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->myAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->myBalance:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onStop()V

    return-void
.end method
