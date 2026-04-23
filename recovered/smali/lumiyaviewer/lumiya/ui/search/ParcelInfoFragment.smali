.class public Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;
.super Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/common/ReloadableFragment;
.implements Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor$OnLoadableDataChangedListener;
.implements Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;


# static fields
.field private static final PARCEL_UUID_KEY:Ljava/lang/String; = "parcelUUID"


# instance fields
.field private final loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

.field private ownerGroupNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

.field private ownerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

.field parcelDetailsDescription:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f10024f
    .end annotation
.end field

.field parcelDetailsName:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f10024e
    .end annotation
.end field

.field parcelImageView:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100252
    .end annotation
.end field

.field private final parcelInfoReply:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;",
            ">;"
        }
    .end annotation
.end field

.field parcelLocation:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100255
    .end annotation
.end field

.field parcelOwnerName:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100256
    .end annotation
.end field

.field parcelOwnerPic:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100257
    .end annotation
.end field

.field parcelSimName:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100254
    .end annotation
.end field

.field private unbinder:Lbutterknife/Unbinder;


# direct methods
.method public constructor <init>()V
    .locals 5

    const/4 v4, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelInfoReply:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelInfoReply:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;-><init>([Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;)V

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->withDataChangedListener(Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor$OnLoadableDataChangedListener;)Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->ownerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->ownerGroupNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_search_ParcelInfoFragment_9648(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method public static makeSelection(Ljava/util/UUID;Ljava/util/UUID;)Landroid/os/Bundle;
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    invoke-static {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->setActiveAgentID(Landroid/os/Bundle;Ljava/util/UUID;)V

    const-string/jumbo v1, "parcelUUID"

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method private showParcelInfo(Ljava/util/UUID;)V
    .locals 4

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    const-string/jumbo v1, "ParcelInfo: subscribing for UUID %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelInfoReply:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->parcelInfoData()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    invoke-virtual {v1, v0, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method


# virtual methods
.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_search_ParcelInfoFragment_9137(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Landroid/content/DialogInterface;I)V
    .locals 4

    invoke-interface {p3}, Landroid/content/DialogInterface;->dismiss()V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f090350

    invoke-direct {v1, v2, p1, v3}, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;-><init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;I)V

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->show()V

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->TeleportToGlobalPosition(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    :cond_0
    return-void
.end method

.method public onChatterNameUpdated(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->ownerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eq p1, v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->ownerGroupNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-ne p1, v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->unbinder:Lbutterknife/Unbinder;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->ownerGroupNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->ownerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->ownerGroupNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->ownerGroupNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    :goto_0
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelOwnerName:Landroid/widget/TextView;

    if-eqz v2, :cond_3

    move-object v1, v2

    :goto_1
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelOwnerPic:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setVisibility(I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelOwnerPic:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    :cond_1
    return-void

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->ownerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    goto :goto_0

    :cond_3
    const v1, 0x7f0901c8

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_1
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 6

    const/4 v5, 0x1

    invoke-super {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    const v0, 0x7f040080

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-static {p0, v1}, Lbutterknife/ButterKnife;->bind(Ljava/lang/Object;Landroid/view/View;)Lbutterknife/Unbinder;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->unbinder:Lbutterknife/Unbinder;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    const v0, 0x7f1000bd

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    const v3, 0x7f0901ed

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f09011d

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v0, v3, v4}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->setLoadingLayout(Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    const v0, 0x7f1000bb

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->setSwipeRefreshLayout(Landroid/support/v4/widget/SwipeRefreshLayout;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelImageView:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    invoke-virtual {v0, v5}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->setAlignTop(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelImageView:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    invoke-virtual {v0, v5}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->setVerticalFit(Z)V

    return-object v1
.end method

.method public onDestroyView()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->unbinder:Lbutterknife/Unbinder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->unbinder:Lbutterknife/Unbinder;

    invoke-interface {v0}, Lbutterknife/Unbinder;->unbind()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->unbinder:Lbutterknife/Unbinder;

    :cond_0
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onDestroyView()V

    return-void
.end method

.method public onLoadableDataChanged()V
    .locals 8

    const/high16 v7, 0x43800000    # 256.0f

    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelInfoReply:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;

    const-string/jumbo v1, "ParcelInfo: loadable data %s"

    new-array v2, v6, [Ljava/lang/Object;

    aput-object v0, v2, v5

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getActiveAgentID(Landroid/os/Bundle;)Ljava/util/UUID;

    move-result-object v2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->unbinder:Lbutterknife/Unbinder;

    if-eqz v1, :cond_2

    if-eqz v0, :cond_2

    if-eqz v2, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->ownerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->ownerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->ownerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->ownerGroupNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->ownerGroupNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->ownerGroupNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    :cond_1
    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->Name:[B

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v3}, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->setTitle(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelDetailsName:Landroid/widget/TextView;

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->Desc:[B

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelDetailsDescription:Landroid/widget/TextView;

    invoke-static {v1}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    :goto_0
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const-string/jumbo v1, "ParcelInfo: ownerID = %s"

    new-array v3, v6, [Ljava/lang/Object;

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->OwnerID:Ljava/util/UUID;

    aput-object v4, v3, v5

    invoke-static {v1, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    sget-object v1, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->OwnerID:Ljava/util/UUID;

    invoke-virtual {v1, v3}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelOwnerName:Landroid/widget/TextView;

    const v2, 0x7f09014f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelOwnerPic:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setVisibility(I)V

    :goto_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelImageView:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->SnapshotID:Ljava/util/UUID;

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->setAssetID(Ljava/util/UUID;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelSimName:Landroid/widget/TextView;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->SimName:[B

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelLocation:Landroid/widget/TextView;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->GlobalX:F

    rem-float/2addr v3, v7

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v2, v5

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->GlobalY:F

    rem-float/2addr v3, v7

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v2, v6

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->GlobalZ:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const/4 v3, 0x2

    aput-object v0, v2, v3

    const v0, 0x7f09025a

    invoke-virtual {p0, v0, v2}, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_2
    return-void

    :cond_3
    const v1, 0x7f09005b

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_4
    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->OwnerID:Ljava/util/UUID;

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v3

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getSerialInstance()Ljava/util/concurrent/Executor;

    move-result-object v4

    invoke-direct {v1, v3, p0, v4}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;Ljava/util/concurrent/Executor;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->ownerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->OwnerID:Ljava/util/UUID;

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getGroupChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getSerialInstance()Ljava/util/concurrent/Executor;

    move-result-object v3

    invoke-direct {v1, v2, p0, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;Ljava/util/concurrent/Executor;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->ownerGroupNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    goto :goto_1
.end method

.method public onParcelOwnerProfileClick()V
    .locals 4
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f100258
        }
    .end annotation

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getActiveAgentID(Landroid/os/Bundle;)Ljava/util/UUID;

    move-result-object v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelInfoReply:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->ownerGroupNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->ownerGroupNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->ownerGroupNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->ownerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->ownerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->ownerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const-class v3, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->OwnerID:Ljava/util/UUID;

    invoke-static {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    goto :goto_0
.end method

.method public onParcelTeleportButton()V
    .locals 6
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f100250
        }
    .end annotation

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelInfoReply:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->GlobalX:F

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget v4, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->GlobalY:F

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply$Data;->GlobalZ:F

    invoke-direct {v2, v3, v4, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-direct {v0, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    const v4, 0x7f09034a

    invoke-virtual {v3, v4}, Landroid/support/v4/app/FragmentActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const-string/jumbo v4, "Yes"

    new-instance v5, Lcom/lumiyaviewer/lumiya/ui/search/-$Lambda$5Jqy4HmgAu6T9fnroWh-Zqm3eJE$1;

    invoke-direct {v5, p0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/search/-$Lambda$5Jqy4HmgAu6T9fnroWh-Zqm3eJE$1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string/jumbo v2, "No"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/search/-$Lambda$5Jqy4HmgAu6T9fnroWh-Zqm3eJE;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/ui/search/-$Lambda$5Jqy4HmgAu6T9fnroWh-Zqm3eJE;-><init>()V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 2

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onStart()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "parcelUUID"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->showParcelInfo(Ljava/util/UUID;)V

    return-void
.end method

.method public onStop()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->unsubscribeAll()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->ownerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->ownerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->ownerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->ownerGroupNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->ownerGroupNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->ownerGroupNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->unbinder:Lbutterknife/Unbinder;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelOwnerPic:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    invoke-virtual {v0, v1, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelImageView:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->setAssetID(Ljava/util/UUID;)V

    :cond_2
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onStop()V

    return-void
.end method

.method public setFragmentArgs(Landroid/content/Intent;Landroid/os/Bundle;)V
    .locals 1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->isFragmentStarted()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "parcelUUID"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->showParcelInfo(Ljava/util/UUID;)V

    :cond_0
    return-void
.end method
