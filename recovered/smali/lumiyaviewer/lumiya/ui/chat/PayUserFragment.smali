.class public Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;
.super Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;


# instance fields
.field private final chatterNameDisplayer:Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;

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

.field payAmount:Landroid/widget/EditText;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100268
    .end annotation
.end field

.field payMessage:Landroid/widget/EditText;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100269
    .end annotation
.end field

.field paymentDetailsBalance:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100267
    .end annotation
.end field

.field receivingUserName:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100264
    .end annotation
.end field

.field receivingUserPic:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100265
    .end annotation
.end field

.field private unbinder:Lbutterknife/Unbinder;


# direct methods
.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->chatterNameDisplayer:Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$4LKDzNIyR_gCoOmHf_6XBk4qMJA$1;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$4LKDzNIyR_gCoOmHf_6XBk4qMJA$1;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->myBalance:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_PayUserFragment_4554(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method private onMyBalance(Ljava/lang/Integer;)V
    .locals 4

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->unbinder:Lbutterknife/Unbinder;

    if-eqz v0, :cond_0

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->paymentDetailsBalance:Landroid/widget/TextView;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v3

    const v2, 0x7f09020f

    invoke-virtual {p0, v2, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->paymentDetailsBalance:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->paymentDetailsBalance:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0
.end method

.method private payUser(ILjava/lang/String;)V
    .locals 7

    const/4 v6, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->chatterNameDisplayer:Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->getResolvedName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x7f09036e

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v1, v4, v6

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v5, 0x1

    aput-object v1, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string/jumbo v3, "Yes"

    new-instance v4, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$4LKDzNIyR_gCoOmHf_6XBk4qMJA$2;

    invoke-direct {v4, p1, p0, v0, p2}, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$4LKDzNIyR_gCoOmHf_6XBk4qMJA$2;-><init>(ILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v1, "No"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$4LKDzNIyR_gCoOmHf_6XBk4qMJA;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$4LKDzNIyR_gCoOmHf_6XBk4qMJA;-><init>()V

    invoke-virtual {v0, v1, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    :cond_0
    return-void
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_ui_chat_PayUserFragment-mthref-0(Ljava/lang/Integer;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->onMyBalance(Ljava/lang/Integer;)V

    return-void
.end method

.method protected decorateFragmentTitle(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const v1, 0x7f090267

    invoke-virtual {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_PayUserFragment_3721(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;ILjava/lang/String;Landroid/content/DialogInterface;I)V
    .locals 2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->financialInfo:Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1, p2, p3}, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->DoPayUser(Ljava/util/UUID;ILjava/lang/String;)V

    :cond_0
    invoke-interface {p4}, Landroid/content/DialogInterface;->dismiss()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    if-eqz v1, :cond_1

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->closeDetailsFragment(Landroid/support/v4/app/Fragment;)Z

    :cond_1
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4

    const v0, 0x7f040082

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-static {p0, v0}, Lbutterknife/ButterKnife;->bind(Ljava/lang/Object;Landroid/view/View;)Lbutterknife/Unbinder;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->unbinder:Lbutterknife/Unbinder;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->chatterNameDisplayer:Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->receivingUserName:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->receivingUserPic:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    invoke-virtual {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->bindViews(Landroid/widget/TextView;Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;)V

    return-object v0
.end method

.method public onDestroyView()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->chatterNameDisplayer:Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->unbindViews()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->unbinder:Lbutterknife/Unbinder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->unbinder:Lbutterknife/Unbinder;

    invoke-interface {v0}, Lbutterknife/Unbinder;->unbind()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->unbinder:Lbutterknife/Unbinder;

    :cond_0
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->onDestroyView()V

    return-void
.end method

.method public onReceivingUserViewProfileClick()V
    .locals 3
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f100266
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    :cond_0
    return-void
.end method

.method protected onShowUser(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 3
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->chatterNameDisplayer:Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterNameDisplayer;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->myBalance:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getBalanceManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->getBalance()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    sget-object v2, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->myBalance:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    goto :goto_0
.end method

.method public onUserPayButton()V
    .locals 2
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f10026a
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->payAmount:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->payMessage:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/PayUserFragment;->payUser(ILjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method
