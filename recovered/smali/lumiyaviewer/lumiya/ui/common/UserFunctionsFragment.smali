.class public abstract Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;
.super Lcom/lumiyaviewer/lumiya/ui/common/ChatterReloadableFragment;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/common/ReloadableFragment;


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-slproto-users-ChatterID$ChatterTypeSwitchesValues:[I


# instance fields
.field protected final currentLocationInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final voiceLoggedIn:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
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


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-slproto-users-ChatterID$ChatterTypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->-com-lumiyaviewer-lumiya-slproto-users-ChatterID$ChatterTypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->-com-lumiyaviewer-lumiya-slproto-users-ChatterID$ChatterTypeSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->values()[Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Group:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Local:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->User:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_0

    :goto_2
    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->-com-lumiyaviewer-lumiya-slproto-users-ChatterID$ChatterTypeSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_2

    :catch_1
    move-exception v1

    goto :goto_1

    :catch_2
    move-exception v1

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterReloadableFragment;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$9;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$9;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->voiceLoggedIn:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$10;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$10;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->currentLocationInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    return-void
.end method

.method private handleEnableVoice()V
    .locals 6

    const/4 v5, 0x1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->checkPluginInstalled(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f090113

    invoke-virtual {v0, v1}, Landroid/support/v7/app/AlertDialog$Builder;->setTitle(I)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    new-array v2, v5, [Ljava/lang/Object;

    const-string/jumbo v3, "Google Play"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const v3, 0x7f090114

    invoke-virtual {v1, v3, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v1, "Yes"

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$7;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v1, "No"

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks;-><init>()V

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/support/v7/app/AlertDialog$Builder;->setCancelable(Z)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog$Builder;->create()Landroid/support/v7/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog;->show()V

    :goto_0
    return-void

    :cond_0
    new-instance v0, Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f090115

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v1, "Yes"

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$1;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$1;-><init>()V

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v1, "No"

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$2;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$2;-><init>()V

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/support/v7/app/AlertDialog$Builder;->setCancelable(Z)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog$Builder;->create()Landroid/support/v7/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog;->show()V

    goto :goto_0
.end method

.method private handlePlayParcelMedia()V
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->startStreamingMediaService(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    return-void
.end method

.method private handleTeleportTo(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;)V
    .locals 4

    if-eqz p1, :cond_0

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f09034d

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string/jumbo v2, "Yes"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$15;

    invoke-direct {v3, p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$15;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string/jumbo v2, "No"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$3;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$3;-><init>()V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    :cond_0
    return-void
.end method

.method private handleUserAddFriend(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;)V
    .locals 2

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f09024e

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->setTitle(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;

    const v1, 0x7f0900d8

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->setDefaultText(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$12;

    invoke-direct {v1, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$12;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->setOnTextEnteredListener(Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder$OnTextEnteredListener;)Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->show()V

    return-void
.end method

.method private handleUserCloseChat(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Z)V
    .locals 5

    const/4 v0, 0x1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v1

    if-nez p2, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v3

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Group:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    if-ne v3, v4, :cond_2

    :cond_0
    :goto_0
    invoke-virtual {v1, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->markChatterInactive(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Z)V

    instance-of v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    instance-of v0, v1, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    if-eqz v0, :cond_1

    move-object v0, v1

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->closeDetailsFragment(Landroid/support/v4/app/Fragment;)Z

    move-result v0

    if-nez v0, :cond_1

    instance-of v0, v1, Lcom/lumiyaviewer/lumiya/ui/chat/ChatNewActivity;

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatFragmentActivityFactory;->getInstance()Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatFragmentActivityFactory;

    move-result-object v0

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getLocalChatterID(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showDetails(Landroid/app/Activity;Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;Landroid/os/Bundle;)V

    :cond_1
    return-void

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private handleUserMute(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 8

    const v7, 0x7f0901bf

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v5, 0x0

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz p1, :cond_1

    if-eqz v4, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->nameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->nameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v5

    :cond_0
    if-eqz v5, :cond_2

    :goto_0
    new-instance v6, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v6, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-array v0, v2, [Ljava/lang/Object;

    aput-object v5, v0, v3

    const v1, 0x7f09007f

    invoke-virtual {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_3

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/CharSequence;

    invoke-virtual {p0, v7}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    const v1, 0x7f09007e

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    :goto_1
    new-instance v2, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v2, v3}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$8;

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$8;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v6, v0, v3, v1}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const-string/jumbo v7, "OK"

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$17;

    move-object v1, p0

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$17;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v6, v7, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const-string/jumbo v0, "Cancel"

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$4;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$4;-><init>()V

    invoke-virtual {v6, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v6}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    :cond_1
    return-void

    :cond_2
    const v0, 0x7f0901c8

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    :cond_3
    new-array v0, v2, [Ljava/lang/CharSequence;

    invoke-virtual {p0, v7}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    goto :goto_1
.end method

.method private handleUserOfferTeleport(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;)V
    .locals 4

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getCurrentLocationInfoSnapshot()Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;

    move-result-object v1

    const-string/jumbo v0, ""

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->parcelData()Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/base/Strings;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_0
    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f09024f

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->setTitle(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Join me in "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->setDefaultText(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$13;

    invoke-direct {v0, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$13;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->setOnTextEnteredListener(Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder$OnTextEnteredListener;)Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->show()V

    return-void
.end method

.method private handleUserOpenChat(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 3

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatFragmentActivityFactory;->getInstance()Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatFragmentActivityFactory;

    move-result-object v1

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showDetails(Landroid/app/Activity;Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;Landroid/os/Bundle;)V

    return-void
.end method

.method private handleUserPayUser(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;)V
    .locals 3

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    return-void
.end method

.method private handleUserRemoveFriend(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;)V
    .locals 6

    const/4 v5, 0x1

    const/4 v0, 0x0

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->nameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->nameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v0

    :cond_0
    if-eqz v0, :cond_1

    :goto_0
    const v2, 0x7f0900dc

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-array v3, v5, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v2, "Yes"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$11;

    invoke-direct {v3, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$11;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v2, "No"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$5;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$5;-><init>()V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void

    :cond_1
    const v0, 0x7f0901c8

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private handleUserRequestTeleport(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;)V
    .locals 2

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0902a5

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->setTitle(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$14;

    invoke-direct {v1, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$14;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->setOnTextEnteredListener(Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder$OnTextEnteredListener;)Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->show()V

    return-void
.end method

.method private handleUserShareObject(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;)V
    .locals 4

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->nameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->nameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->agentUUID:Ljava/util/UUID;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-static {v1, v2, v3, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->makeTransferIntent(Landroid/content/Context;Ljava/util/UUID;Ljava/util/UUID;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private handleUserUnblock(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 6

    const/4 v5, 0x1

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz p1, :cond_1

    if-eqz v1, :cond_1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->nameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->nameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v0

    :cond_0
    if-eqz v0, :cond_2

    :goto_0
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-array v3, v5, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const v4, 0x7f090360

    invoke-virtual {p0, v4, v3}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v5}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string/jumbo v3, "Yes"

    new-instance v4, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$16;

    invoke-direct {v4, v1, p1, v0}, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$16;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v1, "No"

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$6;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/ui/common/-$Lambda$EGu4GUNsisO_OSWWZeAugrk47Ks$6;-><init>()V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    :cond_1
    return-void

    :cond_2
    const v0, 0x7f0901c8

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private handleUserUnmute(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz p1, :cond_0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->unmuteChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    :cond_0
    return-void
.end method

.method private handleViewLocationDetails()V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getCurrentLocationInfoSnapshot()Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->parcelData()Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v3

    invoke-static {v3, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->makeSelection(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    :cond_0
    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_common_UserFunctionsFragment_19926(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_common_UserFunctionsFragment_20370(Landroid/content/DialogInterface;I)V
    .locals 1

    invoke-interface {p0}, Landroid/content/DialogInterface;->dismiss()V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->enableVoice()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_common_UserFunctionsFragment_20590(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_common_UserFunctionsFragment_23327(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .locals 5

    const/16 v4, 0xf

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->unmuteChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    instance-of v1, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->muteList:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->AGENT:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-direct {v1, v2, v3, p2, v4}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;Ljava/util/UUID;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->Unblock(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    instance-of v1, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->muteList:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->GROUP:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;->getChatterUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-direct {v1, v2, v3, p2, v4}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;Ljava/util/UUID;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->Unblock(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;)V

    goto :goto_0
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_common_UserFunctionsFragment_24282(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_common_UserFunctionsFragment_25645(Ljava/util/concurrent/atomic/AtomicInteger;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-virtual {p0, p2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_common_UserFunctionsFragment_26799(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_common_UserFunctionsFragment_28847(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;Ljava/lang/String;)V
    .locals 1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->AddFriend(Ljava/util/UUID;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_common_UserFunctionsFragment_29514(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;Landroid/content/DialogInterface;I)V
    .locals 1

    invoke-interface {p2}, Landroid/content/DialogInterface;->dismiss()V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->RemoveFriend(Ljava/util/UUID;)V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_common_UserFunctionsFragment_29707(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_common_UserFunctionsFragment_30583(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;Ljava/lang/String;)V
    .locals 1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->OfferTeleport(Ljava/util/UUID;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_common_UserFunctionsFragment_31028(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;Ljava/lang/String;)V
    .locals 1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->RequestTeleport(Ljava/util/UUID;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_common_UserFunctionsFragment_31740(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method private performTeleportTo(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;)V
    .locals 4

    const v3, 0x7f090350

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->minimap:Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->getNearbyAgentLocation(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->TeleportToLocalPosition(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;-><init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;I)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->show()V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->worldMap:Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;->TeleportToAgent(Ljava/util/UUID;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;-><init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;I)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->show()V

    goto :goto_0
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_ui_common_UserFunctionsFragment-mthref-0(Ljava/lang/Boolean;)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->onVoiceLoginStatusChanged(Ljava/lang/Boolean;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_common_UserFunctionsFragment-mthref-1(Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->onCurrentLocationChanged(Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;)V

    return-void
.end method

.method protected handleStartVoice(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 4

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    :goto_0
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    :cond_0
    if-eqz p1, :cond_1

    if-eqz v1, :cond_1

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->User:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    if-ne v2, v3, :cond_3

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->voice:Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getOptionalChatterUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->userVoiceChatRequest(Ljava/util/UUID;)Z

    :cond_1
    :goto_1
    return-void

    :cond_2
    move-object v1, v0

    goto :goto_0

    :cond_3
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Group:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    if-ne v2, v3, :cond_4

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->voice:Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getOptionalChatterUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->groupVoiceChatRequest(Ljava/util/UUID;)Z

    goto :goto_1

    :cond_4
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Local:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    if-ne v2, v3, :cond_1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getCurrentLocationInfoSnapshot()Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->parcelVoiceChannel()Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->voice:Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->nearbyVoiceChatRequest(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;)V

    goto :goto_1
.end method

.method protected handleUserViewProfile(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 3

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->isValidUUID()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->-getcom-lumiyaviewer-lumiya-slproto-users-ChatterID$ChatterTypeSwitchesValues()[I

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    goto :goto_0

    :pswitch_1
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected isVoiceLoggedIn()Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->voiceLoggedIn:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_common_UserFunctionsFragment_19348(Landroid/content/DialogInterface;I)V
    .locals 3

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    const/4 v0, 0x1

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->setInstallOfferDisplayed(Z)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->enableVoice()V

    const-string/jumbo v0, "https://play.google.com/store/apps/details?id=com.lumiyaviewer.lumiya.voice"

    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_common_UserFunctionsFragment_25742(Ljava/util/concurrent/atomic/AtomicInteger;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .locals 6

    const/16 v5, 0xf

    const/4 v4, 0x1

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0, p2, v4}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->handleUserCloseChat(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Z)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-ne v0, v4, :cond_0

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_2

    instance-of v1, p2, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v1, :cond_3

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->muteList:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->AGENT:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    move-object v0, p2

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-direct {v2, v3, v0, p4, v5}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;Ljava/util/UUID;Ljava/lang/String;I)V

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->Block(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;)V

    :cond_2
    :goto_1
    invoke-direct {p0, p2, v4}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->handleUserCloseChat(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Z)V

    goto :goto_0

    :cond_3
    instance-of v1, p2, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    if-eqz v1, :cond_2

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->muteList:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->GROUP:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    move-object v0, p2

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;->getChatterUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-direct {v2, v3, v0, p4, v5}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;Ljava/util/UUID;Ljava/lang/String;I)V

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->Block(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;)V

    goto :goto_1
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_common_UserFunctionsFragment_31539(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p3}, Landroid/content/DialogInterface;->dismiss()V

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->performTeleportTo(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterReloadableFragment;->onCreate(Landroid/os/Bundle;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->setHasOptionsMenu(Z)V

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterReloadableFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    const v0, 0x7f120022

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    return-void
.end method

.method protected onCurrentLocationChanged(Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;)V
    .locals 1
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->supportInvalidateOptionsMenu()V

    :cond_0
    return-void
.end method

.method public onGlobalOptionsChanged(Lcom/lumiyaviewer/lumiya/GlobalOptions$GlobalOptionsChangedEvent;)V
    .locals 1
    .annotation runtime Lcom/lumiyaviewer/lumiya/eventbus/EventHandler;
    .end annotation

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->supportInvalidateOptionsMenu()V

    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 4

    const/4 v0, 0x0

    const/4 v3, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    move-object v1, v0

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v2

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    :cond_0
    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterReloadableFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0

    :cond_1
    move-object v1, v0

    goto :goto_0

    :sswitch_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->handleUserOpenChat(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    return v3

    :sswitch_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->handleUserViewProfile(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    return v3

    :sswitch_2
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->handleViewLocationDetails()V

    return v3

    :sswitch_3
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->handlePlayParcelMedia()V

    return v3

    :sswitch_4
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    return v3

    :sswitch_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v0, :cond_2

    if-eqz v2, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-direct {p0, v1, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->handleUserOfferTeleport(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;)V

    :cond_2
    return v3

    :sswitch_6
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v0, :cond_3

    if-eqz v2, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-direct {p0, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->handleUserRequestTeleport(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;)V

    :cond_3
    return v3

    :sswitch_7
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v0, :cond_4

    if-eqz v2, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-direct {p0, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->handleTeleportTo(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;)V

    :cond_4
    return v3

    :sswitch_8
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v0, :cond_5

    if-eqz v2, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->handleUserPayUser(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;)V

    :cond_5
    return v3

    :sswitch_9
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v0, :cond_6

    if-eqz v2, :cond_6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->handleUserShareObject(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;)V

    :cond_6
    return v3

    :sswitch_a
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v0, :cond_7

    if-eqz v2, :cond_7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-direct {p0, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->handleUserAddFriend(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;)V

    :cond_7
    return v3

    :sswitch_b
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v0, :cond_8

    if-eqz v2, :cond_8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-direct {p0, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->handleUserRemoveFriend(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;)V

    :cond_8
    return v3

    :sswitch_c
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-nez v0, :cond_9

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    if-eqz v0, :cond_a

    :cond_9
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->handleUserCloseChat(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Z)V

    :cond_a
    return v3

    :sswitch_d
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-nez v0, :cond_b

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    if-eqz v0, :cond_c

    :cond_b
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->handleUserMute(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    :cond_c
    return v3

    :sswitch_e
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-nez v0, :cond_d

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    if-eqz v0, :cond_e

    :cond_d
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->handleUserUnmute(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    :cond_e
    return v3

    :sswitch_f
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-nez v0, :cond_f

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    if-eqz v0, :cond_10

    :cond_f
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->handleUserUnblock(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    :cond_10
    return v3

    :sswitch_10
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->handleStartVoice(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    return v3

    :sswitch_11
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->handleEnableVoice()V

    return v3

    :sswitch_data_0
    .sparse-switch
        0x7f100303 -> :sswitch_c
        0x7f100305 -> :sswitch_e
        0x7f100346 -> :sswitch_d
        0x7f100354 -> :sswitch_0
        0x7f100355 -> :sswitch_1
        0x7f100356 -> :sswitch_10
        0x7f100357 -> :sswitch_2
        0x7f100358 -> :sswitch_3
        0x7f100359 -> :sswitch_4
        0x7f10035a -> :sswitch_5
        0x7f10035b -> :sswitch_6
        0x7f10035c -> :sswitch_7
        0x7f10035d -> :sswitch_8
        0x7f10035e -> :sswitch_9
        0x7f10035f -> :sswitch_a
        0x7f100360 -> :sswitch_b
        0x7f100361 -> :sswitch_11
        0x7f100362 -> :sswitch_f
    .end sparse-switch
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)V
    .locals 26

    invoke-super/range {p0 .. p1}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterReloadableFragment;->onPrepareOptionsMenu(Landroid/view/Menu;)V

    const/16 v2, 0x12

    new-array v0, v2, [I

    move-object/from16 v18, v0

    fill-array-data v18, :array_0

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v2, :cond_6

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v2

    move-object v3, v2

    :goto_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v2, :cond_2e

    if-eqz v3, :cond_2e

    const-string/jumbo v2, "UserMenu: item type %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-static {v2, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->currentLocationInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;

    const/4 v9, 0x0

    if-eqz v19, :cond_7

    const/4 v4, 0x1

    :goto_1
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v0, v5, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDLocal;

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v0, v5, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v0, v5, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    move/from16 v22, v0

    const/4 v5, 0x0

    const/4 v11, 0x0

    const/4 v6, 0x0

    const/4 v13, 0x0

    const/4 v8, 0x0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v7

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getVoiceEnabled()Z

    move-result v14

    invoke-virtual/range {p0 .. p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->isVoiceLoggedIn()Z

    move-result v10

    const/4 v12, 0x0

    if-nez v14, :cond_8

    invoke-static {}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->isPluginSupported()Z

    move-result v7

    :goto_2
    if-eqz v20, :cond_35

    if-eqz v2, :cond_35

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->parcelData()Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    move-result-object v12

    if-eqz v12, :cond_0

    const/4 v13, 0x1

    invoke-virtual {v12}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getMediaURL()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v8

    xor-int/lit8 v8, v8, 0x1

    :cond_0
    if-eqz v14, :cond_9

    if-eqz v10, :cond_9

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->parcelVoiceChannel()Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    move-result-object v12

    if-eqz v12, :cond_9

    const/4 v12, 0x1

    :goto_3
    if-eqz v7, :cond_a

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->parcelVoiceChannel()Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    move-result-object v2

    if-eqz v2, :cond_a

    const/4 v2, 0x1

    move/from16 v17, v2

    move v7, v13

    :goto_4
    if-nez v22, :cond_1

    if-eqz v21, :cond_2

    :cond_1
    if-eqz v14, :cond_b

    move v12, v10

    :cond_2
    :goto_5
    if-eqz v21, :cond_34

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getFriendManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v9}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getOptionalChatterUUID()Ljava/util/UUID;

    move-result-object v9

    invoke-virtual {v2, v9}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->getFriend(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/dao/Friend;

    move-result-object v2

    move-object/from16 v16, v2

    :goto_6
    const/4 v10, 0x0

    if-nez v21, :cond_3

    if-eqz v22, :cond_33

    :cond_3
    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->getChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Lcom/lumiyaviewer/lumiya/dao/Chatter;

    move-result-object v2

    if-eqz v2, :cond_c

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getActive()Z

    move-result v10

    :goto_7
    if-eqz v2, :cond_d

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getMuted()Z

    move-result v5

    :goto_8
    if-eqz v19, :cond_f

    invoke-virtual/range {v19 .. v19}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v2

    iget-object v9, v2, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->muteList:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getOptionalChatterUUID()Ljava/util/UUID;

    move-result-object v11

    if-eqz v22, :cond_e

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->GROUP:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    :goto_9
    invoke-virtual {v9, v11, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->isMuted(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;)Z

    move-result v11

    move v15, v5

    :goto_a
    if-eqz v21, :cond_10

    if-eqz v16, :cond_10

    const/4 v2, 0x1

    move v5, v2

    :goto_b
    const-class v2, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;

    move-object/from16 v0, p0

    invoke-virtual {v2, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v23

    const/4 v2, 0x0

    if-eqz v21, :cond_11

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;

    move-object/from16 v0, p0

    invoke-virtual {v2, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v2

    move v14, v2

    :goto_c
    if-eqz v21, :cond_12

    if-eqz v4, :cond_12

    invoke-virtual/range {v19 .. v19}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v2

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canTeleportToLocation()Z

    move-result v2

    move v13, v2

    :goto_d
    const/4 v9, 0x0

    if-eqz v21, :cond_4

    if-eqz v4, :cond_4

    if-eqz v13, :cond_4

    invoke-virtual/range {v19 .. v19}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v2

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->minimap:Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v9}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getOptionalChatterUUID()Ljava/util/UUID;

    move-result-object v9

    invoke-virtual {v2, v9}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->getNearbyAgentLocation(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v2

    if-eqz v2, :cond_13

    const/4 v9, 0x1

    :goto_e
    if-eqz v16, :cond_4

    invoke-virtual/range {v16 .. v16}, Lcom/lumiyaviewer/lumiya/dao/Friend;->getRightsHas()I

    move-result v2

    and-int/lit8 v2, v2, 0x2

    if-eqz v2, :cond_14

    const/4 v2, 0x1

    :goto_f
    or-int/2addr v9, v2

    :cond_4
    if-eqz v22, :cond_15

    if-eqz v4, :cond_31

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getGroupManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->getAvatarGroupList()Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;

    move-result-object v2

    if-eqz v2, :cond_31

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;->Groups:Lcom/google/common/collect/ImmutableMap;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getOptionalChatterUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;

    if-eqz v2, :cond_31

    iget-wide v2, v2, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->GroupPowers:J

    const-wide v24, 0x40000000000L

    and-long v2, v2, v24

    const-wide/16 v24, 0x0

    cmp-long v2, v2, v24

    if-eqz v2, :cond_31

    const/4 v2, 0x1

    :goto_10
    const/4 v3, 0x0

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v16, v0

    move v6, v3

    :goto_11
    move/from16 v0, v16

    if-ge v6, v0, :cond_30

    aget v3, v18, v6

    move-object/from16 v0, p1

    invoke-interface {v0, v3}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v19

    if-eqz v19, :cond_5

    sparse-switch v3, :sswitch_data_0

    :cond_5
    :goto_12
    add-int/lit8 v3, v6, 0x1

    move v6, v3

    goto :goto_11

    :cond_6
    const/4 v2, 0x0

    move-object v3, v2

    goto/16 :goto_0

    :cond_7
    const/4 v4, 0x0

    goto/16 :goto_1

    :cond_8
    const/4 v7, 0x0

    goto/16 :goto_2

    :cond_9
    const/4 v12, 0x0

    goto/16 :goto_3

    :cond_a
    const/4 v2, 0x0

    move/from16 v17, v2

    move v7, v13

    goto/16 :goto_4

    :cond_b
    const/4 v12, 0x0

    goto/16 :goto_5

    :cond_c
    const/4 v10, 0x0

    goto/16 :goto_7

    :cond_d
    const/4 v5, 0x0

    goto/16 :goto_8

    :cond_e
    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->AGENT:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    goto/16 :goto_9

    :cond_f
    const/4 v11, 0x0

    move v15, v5

    goto/16 :goto_a

    :cond_10
    const/4 v2, 0x0

    move v5, v2

    goto/16 :goto_b

    :cond_11
    if-eqz v22, :cond_32

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;

    move-object/from16 v0, p0

    invoke-virtual {v2, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v2

    move v14, v2

    goto/16 :goto_c

    :cond_12
    const/4 v2, 0x0

    move v13, v2

    goto/16 :goto_d

    :cond_13
    const/4 v9, 0x0

    goto/16 :goto_e

    :cond_14
    const/4 v2, 0x0

    goto/16 :goto_f

    :cond_15
    move v2, v6

    goto :goto_10

    :sswitch_0
    if-nez v21, :cond_16

    if-eqz v22, :cond_17

    :cond_16
    xor-int/lit8 v3, v23, 0x1

    :goto_13
    move-object/from16 v0, v19

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_12

    :cond_17
    const/4 v3, 0x0

    goto :goto_13

    :sswitch_1
    if-nez v21, :cond_18

    if-eqz v22, :cond_19

    :cond_18
    xor-int/lit8 v3, v14, 0x1

    :goto_14
    move-object/from16 v0, v19

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_12

    :cond_19
    const/4 v3, 0x0

    goto :goto_14

    :sswitch_2
    if-eqz v20, :cond_1a

    move v3, v7

    :goto_15
    move-object/from16 v0, v19

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_12

    :cond_1a
    const/4 v3, 0x0

    goto :goto_15

    :sswitch_3
    if-eqz v20, :cond_1b

    if-eqz v7, :cond_1b

    move v3, v8

    :goto_16
    move-object/from16 v0, v19

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_12

    :cond_1b
    const/4 v3, 0x0

    goto :goto_16

    :sswitch_4
    if-eqz v22, :cond_1c

    if-eqz v4, :cond_1c

    move v3, v2

    :goto_17
    move-object/from16 v0, v19

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto/16 :goto_12

    :cond_1c
    const/4 v3, 0x0

    goto :goto_17

    :sswitch_5
    if-eqz v21, :cond_1d

    move v3, v4

    :goto_18
    move-object/from16 v0, v19

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto/16 :goto_12

    :cond_1d
    const/4 v3, 0x0

    goto :goto_18

    :sswitch_6
    if-eqz v21, :cond_1e

    move v3, v4

    :goto_19
    move-object/from16 v0, v19

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto/16 :goto_12

    :cond_1e
    const/4 v3, 0x0

    goto :goto_19

    :sswitch_7
    if-eqz v21, :cond_1f

    if-eqz v4, :cond_1f

    if-eqz v13, :cond_1f

    move v3, v9

    :goto_1a
    move-object/from16 v0, v19

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto/16 :goto_12

    :cond_1f
    const/4 v3, 0x0

    goto :goto_1a

    :sswitch_8
    if-eqz v21, :cond_20

    move v3, v4

    :goto_1b
    move-object/from16 v0, v19

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto/16 :goto_12

    :cond_20
    const/4 v3, 0x0

    goto :goto_1b

    :sswitch_9
    if-eqz v21, :cond_21

    move v3, v4

    :goto_1c
    move-object/from16 v0, v19

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto/16 :goto_12

    :cond_21
    const/4 v3, 0x0

    goto :goto_1c

    :sswitch_a
    if-eqz v21, :cond_22

    if-eqz v4, :cond_22

    xor-int/lit8 v3, v5, 0x1

    :goto_1d
    move-object/from16 v0, v19

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto/16 :goto_12

    :cond_22
    const/4 v3, 0x0

    goto :goto_1d

    :sswitch_b
    if-eqz v21, :cond_23

    if-eqz v4, :cond_23

    move v3, v5

    :goto_1e
    move-object/from16 v0, v19

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto/16 :goto_12

    :cond_23
    const/4 v3, 0x0

    goto :goto_1e

    :sswitch_c
    if-nez v21, :cond_24

    if-eqz v22, :cond_25

    :cond_24
    if-eqz v23, :cond_25

    move v3, v10

    :goto_1f
    move-object/from16 v0, v19

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto/16 :goto_12

    :cond_25
    const/4 v3, 0x0

    goto :goto_1f

    :sswitch_d
    if-nez v21, :cond_26

    if-eqz v22, :cond_28

    :cond_26
    if-eqz v23, :cond_28

    if-eqz v10, :cond_28

    if-eqz v15, :cond_27

    move v3, v11

    :goto_20
    xor-int/lit8 v3, v3, 0x1

    :goto_21
    move-object/from16 v0, v19

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto/16 :goto_12

    :cond_27
    const/4 v3, 0x0

    goto :goto_20

    :cond_28
    const/4 v3, 0x0

    goto :goto_21

    :sswitch_e
    if-nez v21, :cond_29

    if-eqz v22, :cond_2a

    :cond_29
    if-eqz v15, :cond_2a

    xor-int/lit8 v3, v11, 0x1

    :goto_22
    move-object/from16 v0, v19

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto/16 :goto_12

    :cond_2a
    const/4 v3, 0x0

    goto :goto_22

    :sswitch_f
    if-nez v21, :cond_2b

    if-eqz v22, :cond_2c

    :cond_2b
    if-eqz v11, :cond_2c

    move v3, v4

    :goto_23
    move-object/from16 v0, v19

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto/16 :goto_12

    :cond_2c
    const/4 v3, 0x0

    goto :goto_23

    :sswitch_10
    if-eqz v4, :cond_2d

    move v3, v12

    :goto_24
    move-object/from16 v0, v19

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto/16 :goto_12

    :cond_2d
    const/4 v3, 0x0

    goto :goto_24

    :sswitch_11
    move-object/from16 v0, v19

    move/from16 v1, v17

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto/16 :goto_12

    :cond_2e
    const/4 v2, 0x0

    move-object/from16 v0, v18

    array-length v3, v0

    :goto_25
    if-ge v2, v3, :cond_30

    aget v4, v18, v2

    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v4

    if-eqz v4, :cond_2f

    const/4 v5, 0x0

    invoke-interface {v4, v5}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_2f
    add-int/lit8 v2, v2, 0x1

    goto :goto_25

    :cond_30
    return-void

    :cond_31
    move v2, v6

    goto/16 :goto_10

    :cond_32
    move v14, v2

    goto/16 :goto_c

    :cond_33
    move v15, v5

    goto/16 :goto_a

    :cond_34
    move-object/from16 v16, v9

    goto/16 :goto_6

    :cond_35
    move/from16 v17, v7

    move v7, v13

    goto/16 :goto_4

    nop

    :array_0
    .array-data 4
        0x7f100354
        0x7f100355
        0x7f100357
        0x7f100358
        0x7f100359
        0x7f10035a
        0x7f10035b
        0x7f10035c
        0x7f10035d
        0x7f10035e
        0x7f10035f
        0x7f100360
        0x7f100303
        0x7f100346
        0x7f100305
        0x7f100362
        0x7f100356
        0x7f100361
    .end array-data

    :sswitch_data_0
    .sparse-switch
        0x7f100303 -> :sswitch_c
        0x7f100305 -> :sswitch_e
        0x7f100346 -> :sswitch_d
        0x7f100354 -> :sswitch_0
        0x7f100355 -> :sswitch_1
        0x7f100356 -> :sswitch_10
        0x7f100357 -> :sswitch_2
        0x7f100358 -> :sswitch_3
        0x7f100359 -> :sswitch_4
        0x7f10035a -> :sswitch_5
        0x7f10035b -> :sswitch_6
        0x7f10035c -> :sswitch_7
        0x7f10035d -> :sswitch_8
        0x7f10035e -> :sswitch_9
        0x7f10035f -> :sswitch_a
        0x7f100360 -> :sswitch_b
        0x7f100361 -> :sswitch_11
        0x7f100362 -> :sswitch_f
    .end sparse-switch
.end method

.method public onStart()V
    .locals 4

    const/4 v0, 0x0

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterReloadableFragment;->onStart()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    :cond_0
    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->voiceLoggedIn:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getVoiceLoggedIn()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->currentLocationInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getCurrentLocationInfo()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    sget-object v2, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :goto_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->getInstance()Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->subscribe(Ljava/lang/Object;)V

    return-void

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->voiceLoggedIn:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->currentLocationInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    goto :goto_0
.end method

.method public onStop()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->voiceLoggedIn:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->currentLocationInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->getInstance()Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->unsubscribe(Ljava/lang/Object;)V

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterReloadableFragment;->onStop()V

    return-void
.end method

.method protected onVoiceLoginStatusChanged(Ljava/lang/Boolean;)V
    .locals 1
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->supportInvalidateOptionsMenu()V

    :cond_0
    return-void
.end method
