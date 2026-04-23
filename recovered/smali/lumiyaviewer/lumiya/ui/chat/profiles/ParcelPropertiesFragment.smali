.class public Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;
.super Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment$SetHomeLocationAsyncTask;
    }
.end annotation


# static fields
.field public static final PARCEL_DATA_KEY:Ljava/lang/String; = "parcelData"


# instance fields
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

.field private final isPlayingMedia:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field mediaPlayButton:Landroid/widget/Button;
    .annotation build Lbutterknife/BindView;
        value = 0x7f10025e
    .end annotation
.end field

.field mediaStopButton:Landroid/widget/Button;
    .annotation build Lbutterknife/BindView;
        value = 0x7f10025f
    .end annotation
.end field

.field private final ownerNameDisplayer:Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;

.field parcelArea:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f10025a
    .end annotation
.end field

.field private parcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

.field parcelDescription:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f10024f
    .end annotation
.end field

.field parcelImageView:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100252
    .end annotation
.end field

.field parcelMediaCardView:Landroid/support/v7/widget/CardView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f10025c
    .end annotation
.end field

.field parcelMediaURL:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f10025d
    .end annotation
.end field

.field parcelName:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100259
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

.field simRestartCardView:Landroid/support/v7/widget/CardView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100260
    .end annotation
.end field

.field private unbinder:Lbutterknife/Unbinder;

.field private userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;)Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    return-object v0
.end method

.method public constructor <init>()V
    .locals 3

    const/4 v0, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->unbinder:Lbutterknife/Unbinder;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->ownerNameDisplayer:Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$3KadVkUh82bQPaUr2S81wOMi_ug$3;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$3KadVkUh82bQPaUr2S81wOMi_ug$3;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->isPlayingMedia:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$3KadVkUh82bQPaUr2S81wOMi_ug$4;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$3KadVkUh82bQPaUr2S81wOMi_ug$4;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_ParcelPropertiesFragment_8505(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_ParcelPropertiesFragment_9312(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method public static makeSelection(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;)Landroid/os/Bundle;
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string/jumbo v1, "activeAgentUUID"

    invoke-virtual {p0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v1, "parcelData"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    return-object v0
.end method

.method private onAgentCircuit(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->updateSimOptions()V

    return-void
.end method

.method private onIsPlayingMedia(Ljava/lang/Boolean;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->updatePlayingStatus()V

    return-void
.end method

.method private updatePlayingStatus()V
    .locals 5

    const/16 v3, 0x8

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->unbinder:Lbutterknife/Unbinder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->isPlayingMedia:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    :goto_0
    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->mediaPlayButton:Landroid/widget/Button;

    if-eqz v0, :cond_2

    move v2, v3

    :goto_1
    invoke-virtual {v4, v2}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->mediaStopButton:Landroid/widget/Button;

    if-eqz v0, :cond_3

    :goto_2
    invoke-virtual {v2, v1}, Landroid/widget/Button;->setVisibility(I)V

    :cond_0
    return-void

    :cond_1
    move v0, v1

    goto :goto_0

    :cond_2
    move v2, v1

    goto :goto_1

    :cond_3
    move v1, v3

    goto :goto_2
.end method

.method private updateSimOptions()V
    .locals 3

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->unbinder:Lbutterknife/Unbinder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getIsEstateManager()Z

    move-result v0

    :goto_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->simRestartCardView:Landroid/support/v7/widget/CardView;

    if-eqz v0, :cond_2

    :goto_1
    invoke-virtual {v2, v1}, Landroid/support/v7/widget/CardView;->setVisibility(I)V

    :cond_0
    return-void

    :cond_1
    move v0, v1

    goto :goto_0

    :cond_2
    const/16 v1, 0x8

    goto :goto_1
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_ui_chat_profiles_ParcelPropertiesFragment-mthref-0(Ljava/lang/Boolean;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->onIsPlayingMedia(Ljava/lang/Boolean;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_chat_profiles_ParcelPropertiesFragment-mthref-1(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->onAgentCircuit(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_ParcelPropertiesFragment_8181(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Landroid/content/DialogInterface;I)V
    .locals 3

    const/16 v0, 0x78

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->RestartRegion(I)Z

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f09029f

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    invoke-interface {p2}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_ParcelPropertiesFragment_9097(Landroid/content/DialogInterface;I)V
    .locals 2

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment$SetHomeLocationAsyncTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment$SetHomeLocationAsyncTask;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment$SetHomeLocationAsyncTask;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment$SetHomeLocationAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 5
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    const/4 v4, 0x1

    const v0, 0x7f040081

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-static {p0, v0}, Lbutterknife/ButterKnife;->bind(Ljava/lang/Object;Landroid/view/View;)Lbutterknife/Unbinder;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->unbinder:Lbutterknife/Unbinder;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->ownerNameDisplayer:Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelOwnerName:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelOwnerPic:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    invoke-virtual {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->bindViews(Landroid/widget/TextView;Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelImageView:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    invoke-virtual {v1, v4}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->setVerticalFit(Z)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelImageView:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    invoke-virtual {v1, v4}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->setAlignTop(Z)V

    return-object v0
.end method

.method public onDestroyView()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->unbinder:Lbutterknife/Unbinder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->unbinder:Lbutterknife/Unbinder;

    invoke-interface {v0}, Lbutterknife/Unbinder;->unbind()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->ownerNameDisplayer:Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->unbindViews()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->unbinder:Lbutterknife/Unbinder;

    :cond_0
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onDestroyView()V

    return-void
.end method

.method public onOwnerProfileButton()V
    .locals 3
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f100258
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->isGroupOwned()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->ownerNameDisplayer:Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->getChatterID()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->ownerNameDisplayer:Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->getChatterID()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    goto :goto_0
.end method

.method public onParcelMediaPlay()V
    .locals 3
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f10025e
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getMediaURL()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/lumiyaviewer/lumiya/StreamingMediaService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo v1, "com.lumiyaviewer.lumiya.ACTION_PLAY_MEDIA"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->setActiveAgentID(Landroid/content/Intent;Ljava/util/UUID;)V

    const-string/jumbo v1, "parcelData"

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    const-string/jumbo v1, "media_url"

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getMediaURL()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string/jumbo v1, "location_name"

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    :cond_0
    return-void
.end method

.method public onParcelMediaStop()V
    .locals 3
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f10025f
        }
    .end annotation

    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/lumiyaviewer/lumiya/StreamingMediaService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo v1, "com.lumiyaviewer.lumiya.ACTION_STOP_MEDIA"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method public onSetHomeButton()V
    .locals 3
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f10025b
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    if-eqz v0, :cond_0

    new-instance v0, Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0902fb

    invoke-virtual {v0, v1}, Landroid/support/v7/app/AlertDialog$Builder;->setMessage(I)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/app/AlertDialog$Builder;->setCancelable(Z)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v1, "Yes"

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$3KadVkUh82bQPaUr2S81wOMi_ug$2;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$3KadVkUh82bQPaUr2S81wOMi_ug$2;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v1, "No"

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$3KadVkUh82bQPaUr2S81wOMi_ug;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$3KadVkUh82bQPaUr2S81wOMi_ug;-><init>()V

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog$Builder;->create()Landroid/support/v7/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog;->show()V

    :cond_0
    return-void
.end method

.method public onSimRestartButton()V
    .locals 4
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f100261
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    if-eqz v0, :cond_0

    new-instance v1, Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0902a7

    invoke-virtual {v1, v2}, Landroid/support/v7/app/AlertDialog$Builder;->setMessage(I)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v1

    const-string/jumbo v2, "Yes"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$3KadVkUh82bQPaUr2S81wOMi_ug$5;

    invoke-direct {v3, p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$3KadVkUh82bQPaUr2S81wOMi_ug$5;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v2, v3}, Landroid/support/v7/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v1, "No"

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$3KadVkUh82bQPaUr2S81wOMi_ug$1;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$3KadVkUh82bQPaUr2S81wOMi_ug$1;-><init>()V

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/app/AlertDialog$Builder;->setCancelable(Z)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog$Builder;->create()Landroid/support/v7/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog;->show()V

    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 4

    const/4 v1, 0x0

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onStart()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v2, "activeAgentUUID"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v2, "parcelData"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->isPlayingMedia:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    sget-object v2, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->isPlayingMedia:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    sget-object v3, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v2, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->agentCircuits()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->unbinder:Lbutterknife/Unbinder;

    if-eqz v0, :cond_1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->ownerNameDisplayer:Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->isGroupOwned()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getOwnerID()Ljava/util/UUID;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getGroupChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v0

    :goto_0
    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelImageView:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getSnapshotUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->setAssetID(Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelName:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelArea:Landroid/widget/TextView;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getArea()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v1

    const v3, 0x7f090258

    invoke-virtual {p0, v3, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelDescription:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getDescription()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const v0, 0x7f09005b

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelMediaCardView:Landroid/support/v7/widget/CardView;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getMediaURL()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    const/16 v0, 0x8

    :goto_2
    invoke-virtual {v2, v0}, Landroid/support/v7/widget/CardView;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelMediaURL:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getMediaURL()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->updatePlayingStatus()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->updateSimOptions()V

    :cond_1
    return-void

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getOwnerID()Ljava/util/UUID;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v0

    goto/16 :goto_0

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_4
    move v0, v1

    goto :goto_2
.end method

.method public onStop()V
    .locals 2

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->ownerNameDisplayer:Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelImageView:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->setAssetID(Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->isPlayingMedia:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onStop()V

    return-void
.end method
