.class public Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;
.super Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/common/ReloadableFragment;
.implements Landroid/view/View$OnClickListener;
.implements Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor$OnLoadableDataChangedListener;


# static fields
.field private static final LOCAL_ID_KEY:Ljava/lang/String; = "localID"

.field private static final objectPayButtons:[I


# instance fields
.field private final balanceSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
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

.field private final chatEventListener:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/OnChatEventListener;

.field private final loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

.field private menuItemObjectBlock:Landroid/view/MenuItem;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private menuItemObjectDelete:Landroid/view/MenuItem;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private menuItemObjectTake:Landroid/view/MenuItem;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private menuItemObjectTakeCopy:Landroid/view/MenuItem;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final myAvatarState:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;",
            ">;"
        }
    .end annotation
.end field

.field private objectLocalID:I

.field private final objectProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;",
            ">;"
        }
    .end annotation
.end field

.field private objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final ownerNameDisplayer:Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const v0, 0x7f100224

    const v1, 0x7f100225

    const v2, 0x7f100226

    const v3, 0x7f100227

    filled-new-array {v0, v1, v2, v3}, [I

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectPayButtons:[I

    return-void
.end method

.method public constructor <init>()V
    .locals 5

    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v0, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->menuItemObjectTake:Landroid/view/MenuItem;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->menuItemObjectTakeCopy:Landroid/view/MenuItem;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->menuItemObjectDelete:Landroid/view/MenuItem;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->menuItemObjectBlock:Landroid/view/MenuItem;

    iput v3, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectLocalID:I

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->balanceSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->myAvatarState:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    new-array v1, v4, [Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    aput-object v2, v1, v3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;-><init>([Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;)V

    const/4 v1, 0x2

    new-array v1, v1, [Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->balanceSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->myAvatarState:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    aput-object v2, v1, v4

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->withOptionalLoadables([Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;)Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->withDataChangedListener(Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor$OnLoadableDataChangedListener;)Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->ownerNameDisplayer:Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$IbcMrpWxKnmu4WU7ZN8rETVfqs8$3;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$IbcMrpWxKnmu4WU7ZN8rETVfqs8$3;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->chatEventListener:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/OnChatEventListener;

    return-void
.end method

.method private buyObject()V
    .locals 9

    const/4 v8, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectLocalID:I

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    new-instance v3, Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v4, 0x7f090213

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->name()Lcom/google/common/base/Optional;

    move-result-object v6

    const v7, 0x7f090239

    invoke-virtual {p0, v7}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/common/base/Optional;->or(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->salePrice()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x1

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/support/v7/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v4

    invoke-virtual {v4, v8}, Landroid/support/v7/app/AlertDialog$Builder;->setCancelable(Z)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v4

    const-string/jumbo v5, "Yes"

    new-instance v6, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$IbcMrpWxKnmu4WU7ZN8rETVfqs8$5;

    invoke-direct {v6, v2, v1, v0}, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$IbcMrpWxKnmu4WU7ZN8rETVfqs8$5;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v4, v5, v6}, Landroid/support/v7/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v1, "No"

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$IbcMrpWxKnmu4WU7ZN8rETVfqs8;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$IbcMrpWxKnmu4WU7ZN8rETVfqs8;-><init>()V

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {v3}, Landroid/support/v7/app/AlertDialog$Builder;->show()Landroid/support/v7/app/AlertDialog;

    :cond_0
    return-void
.end method

.method private getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_objects_ObjectDetailsFragment_11291(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .locals 5

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->muteList:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->OBJECT:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->objectUUID()Ljava/util/UUID;

    move-result-object v3

    const/16 v4, 0xf

    invoke-direct {v1, v2, v3, p2, v4}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;Ljava/util/UUID;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;->Block(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;)V

    invoke-interface {p3}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_objects_ObjectDetailsFragment_11639(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_objects_ObjectDetailsFragment_24012(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;ILcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;Landroid/content/DialogInterface;I)V
    .locals 3

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->saleType()B

    move-result v1

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->salePrice()I

    move-result v2

    invoke-virtual {v0, p1, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->BuyObject(IBI)V

    :cond_0
    invoke-interface {p3}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_objects_ObjectDetailsFragment_24413(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_objects_ObjectDetailsFragment_25106(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;ILandroid/content/DialogInterface;I)V
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->financialInfo:Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->objectUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->DoPayObject(Ljava/util/UUID;I)V

    :cond_0
    invoke-interface {p3}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_objects_ObjectDetailsFragment_25649(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method public static makeSelection(Ljava/util/UUID;I)Landroid/os/Bundle;
    .locals 2

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    invoke-static {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->setActiveAgentID(Landroid/os/Bundle;Ljava/util/UUID;)V

    const-string/jumbo v1, "localID"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    return-object v0
.end method

.method private openObjectContents()V
    .locals 5

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectLocalID:I

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->objectUUID()Ljava/util/UUID;

    move-result-object v3

    iget v4, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectLocalID:I

    invoke-static {v0, v3, v4}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->makeSelection(Ljava/util/UUID;Ljava/util/UUID;I)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    :cond_0
    return-void
.end method

.method private payObject(I)V
    .locals 8

    const/4 v7, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    new-instance v2, Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x7f090240

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->name()Lcom/google/common/base/Optional;

    move-result-object v5

    const v6, 0x7f090239

    invoke-virtual {p0, v6}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/google/common/base/Optional;->or(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x1

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/support/v7/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3, v7}, Landroid/support/v7/app/AlertDialog$Builder;->setCancelable(Z)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v3

    const-string/jumbo v4, "Yes"

    new-instance v5, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$IbcMrpWxKnmu4WU7ZN8rETVfqs8$6;

    invoke-direct {v5, p1, v1, v0}, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$IbcMrpWxKnmu4WU7ZN8rETVfqs8$6;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v3, v4, v5}, Landroid/support/v7/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v1, "No"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$IbcMrpWxKnmu4WU7ZN8rETVfqs8$2;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$IbcMrpWxKnmu4WU7ZN8rETVfqs8$2;-><init>()V

    invoke-virtual {v0, v1, v3}, Landroid/support/v7/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {v2}, Landroid/support/v7/app/AlertDialog$Builder;->show()Landroid/support/v7/app/AlertDialog;

    :cond_0
    return-void
.end method

.method private payObjectQuick(I)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->payInfo()Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;->payPrices()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    if-eqz v0, :cond_0

    if-ltz p1, :cond_0

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v1

    if-ge p1, v1, :cond_0

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->payObject(I)V

    :cond_0
    return-void
.end method

.method private showDeadObject()V
    .locals 5

    const v4, 0x7f10020d

    const/16 v3, 0x8

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getView()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_0

    const v0, 0x7f10020c

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v2, 0x7f09021e

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    const v0, 0x7f10020e

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method private showObject(I)V
    .locals 4

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectLocalID:I

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->getObjectProfile()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->myAvatarState:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->myAvatarState()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->balanceSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getBalanceManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->getBalance()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    sget-object v2, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private showObjectNotLoaded()V
    .locals 5

    const v4, 0x7f10020d

    const/16 v3, 0x8

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getView()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_0

    const v0, 0x7f10020c

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v2, 0x7f090242

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    const v0, 0x7f10020e

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method private showObjectOwnerInfo()V
    .locals 3

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->ownerUUID()Ljava/util/UUID;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    :cond_0
    return-void
.end method

.method private showObjectProfile(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;)V
    .locals 14

    const v1, 0x7f10020d

    const/4 v4, 0x1

    const/16 v3, 0x8

    const/4 v5, 0x0

    const/4 v2, 0x0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getView()Landroid/view/View;

    move-result-object v8

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v9

    if-eqz v8, :cond_0

    const v0, 0x7f10020c

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->isDead()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {v8, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f10020e

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v8, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f09021e

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    :cond_0
    :goto_0
    if-eqz v9, :cond_2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->isDead()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->isPayable()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->payInfo()Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;

    move-result-object v0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->objectUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v9}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v1

    if-eqz v1, :cond_1

    if-eqz v0, :cond_1

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->DoRequestPayPrice(Ljava/util/UUID;)V

    :cond_1
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->ownerUUID()Ljava/util/UUID;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v9}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->ownerNameDisplayer:Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    :cond_2
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->updateOptionsMenu()V

    return-void

    :cond_3
    const v0, 0x7f10020e

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v8, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f100104

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->isTouchable()Z

    move-result v0

    if-eqz v0, :cond_4

    move v0, v2

    :goto_1
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f100104

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->touchName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    const v1, 0x7f09024a

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    :goto_2
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    if-eqz v9, :cond_18

    invoke-virtual {v9}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_18

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    if-eqz v0, :cond_18

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canSit()Z

    move-result v0

    move v1, v0

    :goto_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->myAvatarState:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;

    if-eqz v0, :cond_17

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;->isSitting()Z

    move-result v6

    if-eqz v6, :cond_6

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;->sittingOn()I

    move-result v0

    iget v6, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectLocalID:I

    if-ne v0, v6, :cond_6

    move v0, v4

    move v1, v2

    :goto_4
    const v6, 0x7f100105

    invoke-virtual {v8, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    if-eqz v1, :cond_7

    move v1, v2

    :goto_5
    invoke-virtual {v6, v1}, Landroid/view/View;->setVisibility(I)V

    const v1, 0x7f100212

    invoke-virtual {v8, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v0, :cond_8

    move v0, v2

    :goto_6
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f100210

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->name()Lcom/google/common/base/Optional;

    move-result-object v1

    const v6, 0x7f090239

    invoke-virtual {p0, v6}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Lcom/google/common/base/Optional;->or(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f100211

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->description()Lcom/google/common/base/Optional;

    move-result-object v1

    const-string/jumbo v6, ""

    invoke-virtual {v1, v6}, Lcom/google/common/base/Optional;->or(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f100214

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->ownerUUID()Ljava/util/UUID;

    move-result-object v0

    if-eqz v0, :cond_9

    move v0, v2

    :goto_7
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f100217

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->floatingText()Lcom/google/common/base/Optional;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/base/Optional;->isPresent()Z

    move-result v0

    if-eqz v0, :cond_a

    move v0, v2

    :goto_8
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f100218

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->floatingText()Lcom/google/common/base/Optional;

    move-result-object v1

    const-string/jumbo v6, ""

    invoke-virtual {v1, v6}, Lcom/google/common/base/Optional;->or(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f100219

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->saleType()B

    move-result v0

    if-eqz v0, :cond_b

    move v0, v2

    :goto_9
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f10021a

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    new-array v1, v4, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->salePrice()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v1, v2

    const v6, 0x7f090215

    invoke-virtual {p0, v6, v1}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->balanceSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_c

    const v1, 0x7f10021c

    invoke-virtual {v8, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    new-array v6, v4, [Ljava/lang/Object;

    aput-object v0, v6, v2

    const v0, 0x7f09020f

    invoke-virtual {p0, v0, v6}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_a
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->isPayable()Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->payInfo()Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;

    move-result-object v0

    move-object v7, v0

    :goto_b
    if-eqz v7, :cond_15

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;->payPrices()Lcom/google/common/collect/ImmutableList;

    move-result-object v10

    if-eqz v10, :cond_12

    move v1, v2

    move v5, v2

    :goto_c
    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectPayButtons:[I

    array-length v0, v0

    if-ge v1, v0, :cond_f

    invoke-virtual {v10}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    if-ge v1, v0, :cond_f

    invoke-virtual {v10, v1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v6, -0x2

    if-ne v0, v6, :cond_16

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;->defaultPayPrice()I

    move-result v0

    move v6, v0

    :goto_d
    if-gtz v6, :cond_e

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectPayButtons:[I

    aget v0, v0, v1

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectPayButtons:[I

    aget v0, v0, v1

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const v11, 0x7f100020

    invoke-virtual {v0, v11, v6}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    :goto_e
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_c

    :cond_4
    move v0, v3

    goto/16 :goto_1

    :cond_5
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->touchName()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_2

    :cond_6
    move v0, v2

    goto/16 :goto_4

    :cond_7
    move v1, v3

    goto/16 :goto_5

    :cond_8
    move v0, v3

    goto/16 :goto_6

    :cond_9
    move v0, v3

    goto/16 :goto_7

    :cond_a
    move v0, v3

    goto/16 :goto_8

    :cond_b
    move v0, v3

    goto/16 :goto_9

    :cond_c
    const v0, 0x7f10021c

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_a

    :cond_d
    move-object v7, v5

    goto :goto_b

    :cond_e
    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectPayButtons:[I

    aget v0, v0, v1

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    const v11, 0x7f090263

    invoke-virtual {p0, v11}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getString(I)Ljava/lang/String;

    move-result-object v11

    new-array v12, v4, [Ljava/lang/Object;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v12, v2

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v0, v11}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectPayButtons:[I

    aget v0, v0, v1

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectPayButtons:[I

    aget v0, v0, v1

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const v11, 0x7f100020

    invoke-virtual {v0, v11, v6}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_e

    :cond_f
    const v0, 0x7f100223

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v5, :cond_11

    move v0, v2

    :goto_f
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    :goto_10
    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;->defaultPayPrice()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_14

    const v0, 0x7f100221

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;->defaultPayPrice()I

    move-result v0

    if-lez v0, :cond_13

    const v0, 0x7f100221

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    new-array v1, v4, [Ljava/lang/Object;

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;->defaultPayPrice()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const v3, 0x7f09023d

    invoke-virtual {p0, v3, v1}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    :cond_10
    :goto_11
    const v0, 0x7f10021f

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    :goto_12
    const v0, 0x7f10021d

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_0

    :cond_11
    move v0, v3

    goto :goto_f

    :cond_12
    const v0, 0x7f100223

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_10

    :cond_13
    const v0, 0x7f100221

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_11

    :cond_14
    const v0, 0x7f10021f

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_12

    :cond_15
    const v0, 0x7f10021d

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_0

    :cond_16
    move v6, v0

    goto/16 :goto_d

    :cond_17
    move v0, v2

    goto/16 :goto_4

    :cond_18
    move v1, v2

    goto/16 :goto_3
.end method

.method private sitOnObject()V
    .locals 2

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->objectUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->SitOnObject(Ljava/util/UUID;)V

    :cond_0
    return-void
.end method

.method private standUp()V
    .locals 2

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->Stand()V

    :cond_0
    return-void
.end method

.method private touchObject()V
    .locals 2

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectLocalID:I

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectLocalID:I

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->TouchObject(I)V

    :cond_0
    return-void
.end method

.method private updateOptionsMenu()V
    .locals 6

    const/4 v0, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    if-eqz v1, :cond_5

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    if-eqz v2, :cond_5

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->isDead()Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_6

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->ownerUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v3

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v2

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->ownerUUID()Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->isCopyable()Z

    move-result v0

    :cond_0
    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->ownerUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v1, 0x1

    move v5, v1

    move v1, v2

    move v2, v0

    move v0, v5

    :goto_0
    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->menuItemObjectTake:Landroid/view/MenuItem;

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->menuItemObjectTake:Landroid/view/MenuItem;

    invoke-interface {v4, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_1
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->menuItemObjectTakeCopy:Landroid/view/MenuItem;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->menuItemObjectTakeCopy:Landroid/view/MenuItem;

    invoke-interface {v3, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_2
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->menuItemObjectDelete:Landroid/view/MenuItem;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->menuItemObjectDelete:Landroid/view/MenuItem;

    invoke-interface {v2, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_3
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->menuItemObjectBlock:Landroid/view/MenuItem;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->menuItemObjectBlock:Landroid/view/MenuItem;

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_4
    return-void

    :cond_5
    move v1, v0

    move v2, v0

    move v3, v0

    goto :goto_0

    :cond_6
    move v1, v0

    move v2, v0

    move v3, v0

    goto :goto_0
.end method


# virtual methods
.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_objects_ObjectDetailsFragment_6633(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V
    .locals 4

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->isFragmentVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->getSource()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    move-result-object v1

    instance-of v2, v1, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceObject;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    if-eqz v2, :cond_0

    if-eqz v0, :cond_0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceUUID()Ljava/util/UUID;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->objectUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->getPlainTextMessage(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Z)Ljava/lang/CharSequence;

    move-result-object v0

    const/4 v2, 0x1

    invoke-static {v1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    const/4 v0, 0x0

    :goto_0
    sget-object v2, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectPayButtons:[I

    array-length v2, v2

    if-ge v0, v2, :cond_1

    sget-object v2, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectPayButtons:[I

    aget v2, v2, v0

    if-ne v2, v1, :cond_0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->payObjectQuick(I)V

    return-void

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    sparse-switch v1, :sswitch_data_0

    :cond_2
    :goto_1
    return-void

    :sswitch_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->touchObject()V

    goto :goto_1

    :sswitch_1
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->sitOnObject()V

    goto :goto_1

    :sswitch_2
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->standUp()V

    goto :goto_1

    :sswitch_3
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->showObjectOwnerInfo()V

    goto :goto_1

    :sswitch_4
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->buyObject()V

    goto :goto_1

    :sswitch_5
    :try_start_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_2

    const v1, 0x7f100221

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->payObject(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    :sswitch_6
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->openObjectContents()V

    goto :goto_1

    nop

    :sswitch_data_0
    .sparse-switch
        0x7f100104 -> :sswitch_0
        0x7f100105 -> :sswitch_1
        0x7f100212 -> :sswitch_2
        0x7f100213 -> :sswitch_6
        0x7f100216 -> :sswitch_3
        0x7f10021b -> :sswitch_4
        0x7f100222 -> :sswitch_5
    .end sparse-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onCreate(Landroid/os/Bundle;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->setHasOptionsMenu(Z)V

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    const v0, 0x7f120015

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    const v0, 0x7f100333

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->menuItemObjectTake:Landroid/view/MenuItem;

    const v0, 0x7f100334

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->menuItemObjectTakeCopy:Landroid/view/MenuItem;

    const v0, 0x7f100335

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->menuItemObjectDelete:Landroid/view/MenuItem;

    const v0, 0x7f100336

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->menuItemObjectBlock:Landroid/view/MenuItem;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->updateOptionsMenu()V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 7

    const v6, 0x7f100222

    const/16 v5, 0x8

    const/4 v2, 0x0

    invoke-super {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    const-string/jumbo v0, "ObjectDetailsFragment: onCreateView called"

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    const v0, 0x7f040075

    invoke-virtual {p1, v0, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->ownerNameDisplayer:Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;

    const v0, 0x7f100215

    invoke-virtual {v3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f10013f

    invoke-virtual {v3, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    invoke-virtual {v4, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->bindViews(Landroid/widget/TextView;Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;)V

    const v0, 0x7f10020c

    invoke-virtual {v3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f10020d

    invoke-virtual {v3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f10020e

    invoke-virtual {v3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f100104

    invoke-virtual {v3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f100105

    invoke-virtual {v3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f100212

    invoke-virtual {v3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f100216

    invoke-virtual {v3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f10021b

    invoke-virtual {v3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v3, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f100213

    invoke-virtual {v3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectPayButtons:[I

    array-length v4, v1

    move v0, v2

    :goto_0
    if-ge v0, v4, :cond_0

    aget v2, v1, v0

    invoke-virtual {v3, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {v3, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    const v1, 0x7f100221

    invoke-virtual {v3, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment$1;

    invoke-direct {v2, p0, v0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;Landroid/widget/Button;)V

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    return-object v3
.end method

.method public onDestroyView()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->ownerNameDisplayer:Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->unbindViews()V

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onDestroyView()V

    return-void
.end method

.method public onLoadableDataChanged()V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getError()Ljava/lang/Throwable;

    move-result-object v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    instance-of v2, v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDoesNotExistException;

    if-eqz v2, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->showDeadObject()V

    :goto_0
    return-void

    :cond_0
    if-nez v1, :cond_1

    if-nez v0, :cond_2

    :cond_1
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->showObjectNotLoaded()V

    goto :goto_0

    :cond_2
    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->showObjectProfile(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;)V

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 7

    const/4 v6, 0x1

    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "localID"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    if-eqz v0, :cond_0

    iget v3, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectLocalID:I

    if-eqz v3, :cond_0

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    :cond_0
    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0

    :pswitch_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v3, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;->Take:Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {v1, v3, v0, v2}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog;->askForObjectDerez(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;Ljava/util/UUID;I)V

    return v6

    :pswitch_1
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v3, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;->TakeCopy:Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {v1, v3, v0, v2}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog;->askForObjectDerez(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;Ljava/util/UUID;I)V

    return v6

    :pswitch_2
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v3, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;->Delete:Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {v1, v3, v0, v2}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog;->askForObjectDerez(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDerezDialog$DerezAction;Ljava/util/UUID;I)V

    return v6

    :pswitch_3
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->objectProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->name()Lcom/google/common/base/Optional;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/common/base/Optional;->orNull()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    :cond_1
    if-eqz v2, :cond_2

    if-eqz v0, :cond_2

    if-eqz v1, :cond_2

    new-instance v3, Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v4, 0x7f090210

    invoke-virtual {v3, v4}, Landroid/support/v7/app/AlertDialog$Builder;->setMessage(I)Landroid/support/v7/app/AlertDialog$Builder;

    const-string/jumbo v4, "Yes"

    new-instance v5, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$IbcMrpWxKnmu4WU7ZN8rETVfqs8$4;

    invoke-direct {v5, v2, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$IbcMrpWxKnmu4WU7ZN8rETVfqs8$4;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v3, v4, v5}, Landroid/support/v7/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    const-string/jumbo v0, "No"

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$IbcMrpWxKnmu4WU7ZN8rETVfqs8$1;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$IbcMrpWxKnmu4WU7ZN8rETVfqs8$1;-><init>()V

    invoke-virtual {v3, v0, v1}, Landroid/support/v7/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {v3, v6}, Landroid/support/v7/app/AlertDialog$Builder;->setCancelable(Z)Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {v3}, Landroid/support/v7/app/AlertDialog$Builder;->create()Landroid/support/v7/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog;->show()V

    :cond_2
    return v6

    nop

    :pswitch_data_0
    .packed-switch 0x7f100333
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public onPause()V
    .locals 2

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->chatEventListener:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/OnChatEventListener;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->removeObjectMessageListener(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/OnChatEventListener;)V

    :cond_0
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 3

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onResume()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->chatEventListener:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/OnChatEventListener;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->addObjectMessageListener(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/OnChatEventListener;Ljava/util/concurrent/Executor;)V

    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 2

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onStart()V

    const v0, 0x7f090224

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->setTitle(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "localID"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->showObject(I)V

    return-void
.end method

.method public onStop()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->unsubscribeAll()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->ownerNameDisplayer:Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onStop()V

    return-void
.end method

.method public setFragmentArgs(Landroid/content/Intent;Landroid/os/Bundle;)V
    .locals 2

    if-eqz p2, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    const-string/jumbo v0, "localID"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->isFragmentStarted()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->showObject(I)V

    :cond_0
    return-void
.end method
