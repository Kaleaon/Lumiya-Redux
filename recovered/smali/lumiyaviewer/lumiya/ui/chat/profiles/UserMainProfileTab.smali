.class public Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;
.super Lcom/lumiyaviewer/lumiya/ui/common/ChatterReloadableFragment;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor$OnLoadableDataChangedListener;


# instance fields
.field aboutEditButton:Landroid/widget/Button;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002ba
    .end annotation
.end field

.field private final avatarNotes:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;",
            ">;"
        }
    .end annotation
.end field

.field private final avatarProperties:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;",
            ">;"
        }
    .end annotation
.end field

.field changePicButton:Landroid/widget/Button;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002b2
    .end annotation
.end field

.field private final loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

.field loadingLayout:Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1000bd
    .end annotation
.end field

.field private final onPartnerNameReady:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;

.field private final onlineStatus:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Ljava/util/UUID;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private partnerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

.field swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1000bb
    .end annotation
.end field

.field textProfileAge:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002bf
    .end annotation
.end field

.field textProfileAgentKey:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002c7
    .end annotation
.end field

.field textProfileNotesText:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002cb
    .end annotation
.end field

.field textProfileOnline:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002be
    .end annotation
.end field

.field textProfilePrimaryName:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002bc
    .end annotation
.end field

.field textProfileSecondaryName:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002bd
    .end annotation
.end field

.field private unbinder:Lbutterknife/Unbinder;

.field userPartnerCardView:Landroid/view/View;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002c0
    .end annotation
.end field

.field userPicView:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002b6
    .end annotation
.end field

.field userProfileAboutText:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002b9
    .end annotation
.end field

.field userProfileNotesCaption:Landroid/view/View;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002ca
    .end annotation
.end field

.field userProfilePartnerName:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002c1
    .end annotation
.end field

.field userProfilePartnerPic:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002c2
    .end annotation
.end field

.field userWebProfileCardView:Landroid/view/View;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002c4
    .end annotation
.end field

.field userWebProfileLink:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002c5
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 4

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterReloadableFragment;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->avatarProperties:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->avatarNotes:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->onlineStatus:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    const/4 v1, 0x3

    new-array v1, v1, [Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->avatarProperties:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->avatarNotes:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    const/4 v3, 0x1

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->onlineStatus:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    const/4 v3, 0x2

    aput-object v2, v1, v3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;-><init>([Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;)V

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->withDataChangedListener(Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor$OnLoadableDataChangedListener;)Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->partnerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$wqoLfTfjESd1OUBLJEQMKRim4S0;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$wqoLfTfjESd1OUBLJEQMKRim4S0;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->onPartnerNameReady:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;

    return-void
.end method

.method private getAge(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;)Ljava/lang/String;
    .locals 8

    const/4 v2, 0x1

    const/4 v3, 0x0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->BornOn:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v0, ""

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const v0, 0x7f090086

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v1, v2, v3

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :try_start_0
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string/jumbo v3, "MM/dd/yyyy"

    invoke-direct {v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    const v2, 0x7f090042

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    new-instance v4, Ljava/util/Date;

    invoke-direct {v4}, Ljava/util/Date;-><init>()V

    invoke-virtual {v4}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    sub-long/2addr v4, v6

    const-wide/32 v6, 0x5265c00

    div-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v4, 0x0

    aput-object v1, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v1

    goto :goto_0

    :cond_0
    move-object v0, v1

    goto :goto_0
.end method


# virtual methods
.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_UserMainProfileTab_9585(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V
    .locals 3

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userProfilePartnerName:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userProfilePartnerPic:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method protected onAboutEditClicked(Landroid/view/View;)V
    .locals 4
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f1002ba
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserAboutTextEditFragment;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserAboutTextEditFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Z)Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    :cond_0
    return-void
.end method

.method protected onChangePicClicked(Landroid/view/View;)V
    .locals 5
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f1002b2
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->avatarProperties:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string/jumbo v2, "oldProfileData"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->agentUUID:Ljava/util/UUID;

    sget-object v3, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;->applyUserProfile:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_TEXTURE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-static {v0, v2, v3, v1, v4}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->makeSelectActionIntent(Landroid/content/Context;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;Landroid/os/Bundle;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public onChatterNameUpdated(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterReloadableFragment;->onChatterNameUpdated(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->getView()Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v1, :cond_0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-static {v1, v2}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->textProfilePrimaryName:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->textProfileSecondaryName:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedSecondaryName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method protected onCopyAgentKeyClicked(Landroid/view/View;)V
    .locals 3
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f1002c8
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-ge v0, v2, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-string/jumbo v2, "clipboard"

    invoke-virtual {v0, v2}, Landroid/support/v4/app/FragmentActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/ClipboardManager;

    invoke-virtual {v0, v1}, Landroid/text/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-string/jumbo v1, "Agent key copied to clipboard"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :cond_0
    return-void

    :cond_1
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-string/jumbo v2, "clipboard"

    invoke-virtual {v0, v2}, Landroid/support/v4/app/FragmentActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    const-string/jumbo v2, "Agent key"

    invoke-static {v2, v1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    goto :goto_0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 5
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

    const/4 v2, 0x1

    const v0, 0x7f0400b8

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-static {p0, v0}, Lbutterknife/ButterKnife;->bind(Ljava/lang/Object;Landroid/view/View;)Lbutterknife/Unbinder;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->unbinder:Lbutterknife/Unbinder;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userPicView:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->setAlignTop(Z)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userPicView:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->setVerticalFit(Z)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->loadingLayout:Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->setSwipeRefreshLayout(Landroid/support/v4/widget/SwipeRefreshLayout;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->loadingLayout:Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    const v3, 0x7f0901f1

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f090374

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->setLoadingLayout(Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->setSwipeRefreshLayout(Landroid/support/v4/widget/SwipeRefreshLayout;)V

    return-object v0
.end method

.method public onDestroyView()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->unbinder:Lbutterknife/Unbinder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->unbinder:Lbutterknife/Unbinder;

    invoke-interface {v0}, Lbutterknife/Unbinder;->unbind()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->unbinder:Lbutterknife/Unbinder;

    :cond_0
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterReloadableFragment;->onDestroyView()V

    return-void
.end method

.method protected onEditNotesClicked(Landroid/view/View;)V
    .locals 3
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f1002cc
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserNotesEditFragment;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserNotesEditFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    :cond_0
    return-void
.end method

.method public onLoadableDataChanged()V
    .locals 5

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->avatarProperties:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userPicView:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->ImageID:Ljava/util/UUID;

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->setAssetID(Ljava/util/UUID;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userProfileAboutText:Landroid/widget/TextView;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->AboutText:[B

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->textProfileAge:Landroid/widget/TextView;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->getAge(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->partnerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->partnerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->partnerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    :cond_0
    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->PartnerID:Ljava/util/UUID;

    if-eqz v1, :cond_2

    sget-object v2, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    invoke-virtual {v1, v2}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->agentUUID:Ljava/util/UUID;

    invoke-static {v2, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userPartnerCardView:Landroid/view/View;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->onPartnerNameReady:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v4

    invoke-direct {v2, v1, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;Ljava/util/concurrent/Executor;)V

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->partnerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    :goto_0
    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->ProfileURL:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userWebProfileLink:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userWebProfileLink:Landroid/widget/TextView;

    const/16 v1, 0xf

    invoke-static {v0, v1}, Landroid/text/util/Linkify;->addLinks(Landroid/widget/TextView;I)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userWebProfileCardView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :goto_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->avatarNotes:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$Data;->Notes:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->textProfileNotesText:Landroid/widget/TextView;

    const v1, 0x7f09036b

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->textProfileNotesText:Landroid/widget/TextView;

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userProfileNotesCaption:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :goto_2
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->textProfileOnline:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->onlineStatus:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_5

    const v0, 0x7f09029c

    :goto_3
    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    :goto_4
    return-void

    :cond_2
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userPartnerCardView:Landroid/view/View;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userProfilePartnerPic:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_4

    :cond_3
    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userWebProfileCardView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    :cond_4
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->textProfileNotesText:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->textProfileNotesText:Landroid/widget/TextView;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userProfileNotesCaption:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
    :try_end_1
    .catch Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    :cond_5
    const v0, 0x7f09029b

    goto :goto_3
.end method

.method protected onShowUser(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 6
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v1, 0x0

    const/16 v2, 0x8

    const/4 v4, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->getView()Landroid/view/View;

    move-result-object v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->unsubscribeAll()V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->partnerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->partnerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->partnerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    :cond_0
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v3, :cond_4

    instance-of v3, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v3, :cond_4

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v3

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->avatarProperties:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getAvatarProperties()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v5

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v5

    invoke-virtual {v4, v5, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->onlineStatus:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v5

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getFriendManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->getOnlineStatus()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v5

    invoke-virtual {v4, v5, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->avatarNotes:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getAvatarNotes()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v5

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v5

    invoke-virtual {v4, v5, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->textProfileAgentKey:Landroid/widget/TextView;

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v3

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->aboutEditButton:Landroid/widget/Button;

    if-eqz v3, :cond_2

    move v0, v1

    :goto_0
    invoke-virtual {v4, v0}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->changePicButton:Landroid/widget/Button;

    if-eqz v3, :cond_3

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    :cond_1
    :goto_2
    return-void

    :cond_2
    move v0, v2

    goto :goto_0

    :cond_3
    move v1, v2

    goto :goto_1

    :cond_4
    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->textProfileAgentKey:Landroid/widget/TextView;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->aboutEditButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->changePicButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_2
.end method

.method protected onViewProfileClicked(Landroid/view/View;)V
    .locals 3
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f1002c3
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->avatarProperties:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->PartnerID:Ljava/util/UUID;

    if-eqz v0, :cond_0

    sget-object v1, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->agentUUID:Ljava/util/UUID;

    invoke-static {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
