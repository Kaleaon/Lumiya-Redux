.class public Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;
.super Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnKeyListener;
.implements Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter$OnAdapterDataChanged;
.implements Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter$OnUserPicClickedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$1;,
        Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$2;,
        Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$3;,
        Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$4;
    }
.end annotation


# static fields
.field private static final PERMISSION_REQUEST_CODE:I = 0x1f4

.field private static final typingTimeout:J = 0x1388L


# instance fields
.field private adapter:Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

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

.field private clearChatHistoryMenuItem:Landroid/view/MenuItem;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private exportChatHistoryMenuItem:Landroid/view/MenuItem;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private hasMoreItems:Z

.field private lastTypingEventSent:J

.field private layoutManager:Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final mHandler:Landroid/os/Handler;

.field private markDisplayedChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final scrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

.field private scrollToBottomForceDown:Z

.field private scrollToBottomNeeded:Z

.field private final scrollToBottomRunnable:Ljava/lang/Runnable;

.field private scrollToBottomRunnablePosted:Z

.field private final textWatcher:Landroid/text/TextWatcher;

.field private typingNotifiedChatter:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private updateRunnablePosted:Z

.field private final updateVisibleRangeRunnable:Ljava/lang/Runnable;

.field private final voiceActiveChatter:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;",
            ">;"
        }
    .end annotation
.end field

.field private final voiceChatInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;",
            "Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;",
            ">;"
        }
    .end annotation
.end field

.field private vrMode:Z


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;)Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;)Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->layoutManager:Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;

    return-object v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic -get3(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->scrollToBottomForceDown:Z

    return v0
.end method

.method static synthetic -get4(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->scrollToBottomNeeded:Z

    return v0
.end method

.method static synthetic -get5(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;)Ljava/lang/Runnable;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->scrollToBottomRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic -get6(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;)Ljava/lang/Runnable;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->updateVisibleRangeRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic -set0(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->scrollToBottomForceDown:Z

    return p1
.end method

.method static synthetic -set1(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->scrollToBottomNeeded:Z

    return p1
.end method

.method static synthetic -set2(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->scrollToBottomRunnablePosted:Z

    return p1
.end method

.method static synthetic -set3(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->updateRunnablePosted:Z

    return p1
.end method

.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->setTypingNotify(Z)V

    return-void
.end method

.method static synthetic -wrap1(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->updateHasMoreItems()V

    return-void
.end method

.method static synthetic -wrap2(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->updateVisibleRange()V

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    const/4 v0, 0x0

    const/4 v3, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;-><init>()V

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->vrMode:Z

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->layoutManager:Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->scrollToBottomNeeded:Z

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->hasMoreItems:Z

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->typingNotifiedChatter:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->markDisplayedChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->exportChatHistoryMenuItem:Landroid/view/MenuItem;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->clearChatHistoryMenuItem:Landroid/view/MenuItem;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$yqEv_Il5ub7IaZ99Gwjf4YWSeKg$2;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$yqEv_Il5ub7IaZ99Gwjf4YWSeKg$2;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$yqEv_Il5ub7IaZ99Gwjf4YWSeKg$3;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$yqEv_Il5ub7IaZ99Gwjf4YWSeKg$3;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->voiceActiveChatter:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$yqEv_Il5ub7IaZ99Gwjf4YWSeKg$4;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$yqEv_Il5ub7IaZ99Gwjf4YWSeKg$4;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->voiceChatInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->scrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->updateRunnablePosted:Z

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$2;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$2;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->updateVisibleRangeRunnable:Ljava/lang/Runnable;

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->scrollToBottomRunnablePosted:Z

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->scrollToBottomForceDown:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$3;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$3;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->scrollToBottomRunnable:Ljava/lang/Runnable;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$4;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$4;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->textWatcher:Landroid/text/TextWatcher;

    return-void
.end method

.method private clearChatHistory()V
    .locals 3

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0900bc

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v1, "Yes"

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$yqEv_Il5ub7IaZ99Gwjf4YWSeKg$1;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$yqEv_Il5ub7IaZ99Gwjf4YWSeKg$1;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v1, "No"

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$yqEv_Il5ub7IaZ99Gwjf4YWSeKg;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$yqEv_Il5ub7IaZ99Gwjf4YWSeKg;-><init>()V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method private exportChatHistory()V
    .locals 4

    const/4 v2, 0x1

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-static {v0, v1}, Landroid/support/v4/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/String;

    const-string/jumbo v2, "android.permission.WRITE_EXTERNAL_STORAGE"

    aput-object v2, v1, v3

    const/16 v2, 0x1f4

    invoke-static {v0, v1, v2}, Landroid/support/v4/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;-><init>(Landroid/content/Context;)V

    new-array v1, v2, [Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_ChatFragment_22748(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method public static makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;
    .locals 2

    invoke-static {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "chatterID"

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    return-object v0
.end method

.method private onAgentCircuit(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 6

    const/16 v2, 0x8

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->getView()Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_0

    const-string/jumbo v4, "agentCircuit is now %s"

    const/4 v0, 0x1

    new-array v5, v0, [Ljava/lang/Object;

    if-eqz p1, :cond_1

    const-string/jumbo v0, "present"

    :goto_0
    aput-object v0, v5, v1

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const v0, 0x7f10011f

    invoke-virtual {v3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    if-eqz p1, :cond_2

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->vrMode:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_2

    move v0, v1

    :goto_1
    invoke-virtual {v4, v0}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f10011c

    invoke-virtual {v3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz p1, :cond_3

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->vrMode:Z

    if-eqz v3, :cond_3

    :goto_2
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void

    :cond_1
    const-string/jumbo v0, "not present"

    goto :goto_0

    :cond_2
    move v0, v2

    goto :goto_1

    :cond_3
    move v1, v2

    goto :goto_2
.end method

.method private onVoiceActiveChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 2

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->vrMode:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->voiceChatInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getVoiceChatInfo()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :goto_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->updateVrModeControls()V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->voiceChatInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    goto :goto_0
.end method

.method private onVoiceChatInfo(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->updateVrModeControls()V

    return-void
.end method

.method private scrollToBottom(Z)V
    .locals 2

    const/4 v1, 0x1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->scrollToBottomRunnablePosted:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->scrollToBottomNeeded:Z

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->scrollToBottomRunnablePosted:Z

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->scrollToBottomForceDown:Z

    or-int/2addr v0, p1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->scrollToBottomForceDown:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->scrollToBottomRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method private sendMessage()V
    .locals 5

    const v4, 0x7f10011e

    const/4 v3, 0x0

    invoke-direct {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->setTypingNotify(Z)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->getView()Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v1, :cond_0

    if-nez v0, :cond_1

    :cond_0
    return-void

    :cond_1
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    return-void

    :cond_2
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v1

    if-eqz v1, :cond_3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendChatMessage(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_3
    invoke-direct {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->scrollToBottom(Z)V

    return-void
.end method

.method private sendTypingNotify(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Z)Z
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->sendTypingNotify(Ljava/util/UUID;Z)V

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private setTypingNotify(Z)V
    .locals 7

    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v4, 0x0

    if-eqz p1, :cond_3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->typingNotifiedChatter:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-static {v2, v3}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->typingNotifiedChatter:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->typingNotifiedChatter:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-direct {p0, v2, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->sendTypingNotify(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Z)Z

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->typingNotifiedChatter:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    :cond_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-direct {p0, v2, v6}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->sendTypingNotify(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Z)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->typingNotifiedChatter:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->lastTypingEventSent:J

    :cond_1
    :goto_0
    return-void

    :cond_2
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->typingNotifiedChatter:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v2, :cond_1

    iget-wide v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->lastTypingEventSent:J

    const-wide/16 v4, 0x1388

    add-long/2addr v2, v4

    cmp-long v2, v0, v2

    if-ltz v2, :cond_1

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->lastTypingEventSent:J

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->typingNotifiedChatter:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-direct {p0, v0, v6}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->sendTypingNotify(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Z)Z

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->typingNotifiedChatter:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->typingNotifiedChatter:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-direct {p0, v0, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->sendTypingNotify(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Z)Z

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->typingNotifiedChatter:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    goto :goto_0
.end method

.method private updateChatHistoryExists()V
    .locals 5

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->getItemCount()I

    move-result v0

    if-eqz v0, :cond_2

    move v0, v1

    :goto_0
    const-string/jumbo v3, "ChatHistory: chat history exists %b"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v1, v2

    invoke-static {v3, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->clearChatHistoryMenuItem:Landroid/view/MenuItem;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->clearChatHistoryMenuItem:Landroid/view/MenuItem;

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->exportChatHistoryMenuItem:Landroid/view/MenuItem;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->exportChatHistoryMenuItem:Landroid/view/MenuItem;

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_1
    return-void

    :cond_2
    move v0, v2

    goto :goto_0

    :cond_3
    move v0, v2

    goto :goto_0
.end method

.method private updateHasMoreItems()V
    .locals 6

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->getView()Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_3

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->hasMoreItems:Z

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->layoutManager:Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->getItemCount()I

    move-result v4

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->layoutManager:Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;->findLastVisibleItemPosition()I

    move-result v2

    iget-boolean v5, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->scrollToBottomNeeded:Z

    if-eqz v5, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->getItemCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    :cond_0
    if-le v4, v0, :cond_2

    const/4 v5, -0x1

    if-eq v2, v5, :cond_2

    add-int/lit8 v4, v4, -0x2

    if-lt v2, v4, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->hasMoreItemsAtBottom()Z

    move-result v0

    :cond_1
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->hasMoreItems:Z

    :cond_2
    const v0, 0x7f10011a

    invoke-virtual {v3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->hasMoreItems:Z

    if-eqz v0, :cond_4

    move v0, v1

    :goto_0
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_3
    return-void

    :cond_4
    const/16 v0, 0x8

    goto :goto_0
.end method

.method private updateVisibleRange()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->layoutManager:Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->updateRunnablePosted:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->updateRunnablePosted:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->updateVisibleRangeRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method private updateVrModeControls()V
    .locals 6

    const v5, 0x7f10011b

    const/16 v3, 0x8

    const/4 v2, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->getView()Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->vrMode:Z

    if-eqz v0, :cond_7

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->isVoiceLoggedIn()Z

    move-result v0

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->voiceActiveChatter:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->voiceChatInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;

    if-eqz v0, :cond_2

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->state:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    sget-object v5, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->None:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    if-eq v0, v5, :cond_2

    move v0, v2

    :goto_0
    if-nez v0, :cond_8

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v5, :cond_3

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v5, :cond_3

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v5, v5, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDLocal;

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getCurrentLocationInfoSnapshot()Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;

    move-result-object v5

    if-eqz v5, :cond_4

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->parcelVoiceChannel()Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    move-result-object v5

    if-eqz v5, :cond_4

    :cond_0
    :goto_1
    const v5, 0x7f10011c

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    if-eqz v0, :cond_5

    move v0, v3

    :goto_2
    invoke-virtual {v5, v0}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f10011d

    invoke-virtual {v4, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v2, :cond_6

    :goto_3
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    :goto_4
    return-void

    :cond_2
    move v0, v1

    goto :goto_0

    :cond_3
    move v2, v1

    goto :goto_1

    :cond_4
    move v2, v1

    goto :goto_1

    :cond_5
    move v0, v1

    goto :goto_2

    :cond_6
    move v1, v3

    goto :goto_3

    :cond_7
    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_4

    :cond_8
    move v2, v1

    goto :goto_1

    :cond_9
    move v0, v1

    goto :goto_0

    :cond_a
    move v0, v1

    move v2, v1

    goto :goto_1
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_ui_chat_ChatFragment-mthref-0(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->onAgentCircuit(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_chat_ChatFragment-mthref-1(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->onVoiceActiveChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_chat_ChatFragment-mthref-2(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->onVoiceChatInfo(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_ChatFragment_22290(Landroid/content/DialogInterface;I)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->clearChatHistory(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    :cond_0
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    :cond_1
    return-void
.end method

.method public onAdapterDataAddedAtEnd()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->layoutManager:Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->hasMoreItems:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->layoutManager:Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;->isSmoothScrolling()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->scrollToBottomNeeded:Z

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->scrollToBottom(Z)V

    :cond_1
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->updateChatHistoryExists()V

    return-void
.end method

.method public onAdapterDataChanged()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->updateVisibleRange()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->updateChatHistoryExists()V

    return-void
.end method

.method public onAdapterDataReloaded()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->scrollToBottomNeeded:Z

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->updateVisibleRange()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->updateChatHistoryExists()V

    return-void
.end method

.method public onChatterNameUpdated(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V
    .locals 4

    const/4 v2, 0x0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->onChatterNameUpdated(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->getView()Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDLocal;

    if-eqz v0, :cond_1

    const-string/jumbo v0, "local chat"

    move-object v1, v0

    :goto_0
    const v0, 0x7f10011e

    invoke-virtual {v3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    if-eqz v1, :cond_2

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    const v1, 0x7f0900ac

    invoke-virtual {p0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    :cond_0
    return-void

    :cond_1
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    goto :goto_0

    :cond_2
    move-object v1, v2

    goto :goto_1
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    :pswitch_0
    return-void

    :pswitch_1
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->sendMessage()V

    goto :goto_0

    :pswitch_2
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->scrollToBottom(Z)V

    goto :goto_0

    :pswitch_3
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->startDictation(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    goto :goto_0

    :pswitch_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->handleStartVoice(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x7f10011a
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_4
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1    # Landroid/os/Bundle;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v2, 0x1

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->setHasOptionsMenu(Z)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string/jumbo v1, "vrMode"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->vrMode:Z

    :cond_0
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    const v0, 0x7f120001

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    const v0, 0x7f1002f9

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->exportChatHistoryMenuItem:Landroid/view/MenuItem;

    const v0, 0x7f1002fa

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->clearChatHistoryMenuItem:Landroid/view/MenuItem;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->updateChatHistoryExists()V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 7

    const v6, 0x7f10011f

    const/16 v2, 0x8

    const/4 v5, 0x1

    const/4 v3, 0x0

    invoke-super {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    const v0, 0x7f040024

    invoke-virtual {p1, v0, p2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    const v0, 0x7f10011a

    invoke-virtual {v4, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, v5, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;-><init>(Landroid/content/Context;IZ)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->layoutManager:Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->layoutManager:Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;

    invoke-virtual {v0, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;->setStackFromEnd(Z)V

    const v0, 0x7f100118

    invoke-virtual {v4, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, v5}, Landroid/support/v7/widget/RecyclerView;->setHasFixedSize(Z)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->scrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->layoutManager:Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f10011c

    invoke-virtual {v4, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f10011d

    invoke-virtual {v4, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f10011e

    invoke-virtual {v4, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0, p0}, Landroid/widget/EditText;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->textWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->vrMode:Z

    if-eqz v1, :cond_0

    move v1, v2

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setVisibility(I)V

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->vrMode:Z

    if-eqz v0, :cond_1

    move v0, v2

    :goto_1
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f10011b

    invoke-virtual {v4, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->vrMode:Z

    if-eqz v1, :cond_2

    :goto_2
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    return-object v4

    :cond_0
    move v1, v3

    goto :goto_0

    :cond_1
    move v0, v3

    goto :goto_1

    :cond_2
    move v3, v2

    goto :goto_2
.end method

.method protected onCurrentLocationChanged(Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->onCurrentLocationChanged(Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->updateVrModeControls()V

    return-void
.end method

.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 3

    const/4 v2, 0x1

    const/4 v1, 0x0

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_0

    const/16 v0, 0x42

    if-ne p2, v0, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->sendMessage()V

    return v2

    :cond_0
    instance-of v0, p1, Landroid/widget/TextView;

    if-eqz v0, :cond_1

    check-cast p1, Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-eqz v0, :cond_2

    invoke-direct {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->setTypingNotify(Z)V

    :cond_1
    :goto_0
    return v1

    :cond_2
    invoke-direct {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->setTypingNotify(Z)V

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2

    const/4 v1, 0x1

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0

    :pswitch_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->exportChatHistory()V

    return v1

    :pswitch_1
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->clearChatHistory()V

    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x7f1002f9
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onPause()V
    .locals 3

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->markDisplayedChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->markDisplayedChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->markDisplayedChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->removeDisplayedChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    :cond_0
    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->markDisplayedChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    :cond_1
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->setTypingNotify(Z)V

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->onPause()V

    return-void
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->onPrepareOptionsMenu(Landroid/view/Menu;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->updateChatHistoryExists()V

    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 4
    .param p2    # [Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # [I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v3, 0x0

    const/16 v0, 0x1f4

    if-ne p1, v0, :cond_0

    array-length v0, p3

    if-lez v0, :cond_0

    aget v0, p3, v3

    if-nez v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ExportChatHistoryTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 2

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->onResume()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->markDisplayedChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->markDisplayedChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->markDisplayedChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->markDisplayedChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->addDisplayedChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    :cond_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->updateVisibleRange()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->updateChatHistoryExists()V

    return-void
.end method

.method protected onShowUser(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 6
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v3, 0x1

    const/4 v5, 0x0

    const/4 v2, 0x0

    const-string/jumbo v0, "ChatFragment: displaying for user %s"

    new-array v1, v3, [Ljava/lang/Object;

    aput-object p1, v1, v5

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->markDisplayedChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-static {v0, p1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->isFragmentVisible()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->markDisplayedChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->markDisplayedChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->markDisplayedChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->removeDisplayedChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    :cond_0
    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->markDisplayedChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->markDisplayedChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->markDisplayedChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->markDisplayedChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->addDisplayedChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->stopLoading()V

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;

    :cond_2
    if-eqz p1, :cond_8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->agentCircuits()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v1

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->agentUUID:Ljava/util/UUID;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-direct {v0, v1, v2, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;-><init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->setOnUserPicClickedListener(Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter$OnUserPicClickedListener;)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->vrMode:Z

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->voiceActiveChatter:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getVoiceActiveChatter()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :goto_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->getView()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_6

    const v0, 0x7f100118

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    const-string/jumbo v2, "ChatFragment: setting adapter to %s"

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->adapter:Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->startLoading(Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter$OnAdapterDataChanged;)V

    :cond_3
    const v0, 0x7f100120

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/TypingIndicatorView;

    if-eqz v0, :cond_4

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/TypingIndicatorView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    :cond_4
    const v0, 0x7f100119

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    if-eqz v0, :cond_5

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    :cond_5
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->updateVisibleRange()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->updateChatHistoryExists()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->updateVrModeControls()V

    :cond_6
    invoke-direct {p0, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->setTypingNotify(Z)V

    return-void

    :cond_7
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->voiceActiveChatter:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    goto :goto_0

    :cond_8
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->voiceActiveChatter:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->voiceChatInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    goto :goto_0
.end method

.method public onUserPicClicked(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceType()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->User:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    if-eq v0, v1, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceType()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->Group:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    if-ne v0, v1, :cond_2

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getDefaultChatter(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->handleUserViewProfile(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    :cond_1
    :goto_0
    return-void

    :cond_2
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceType()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->Object:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    if-ne v0, v1, :cond_1

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceObject;

    if-eqz v0, :cond_1

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceObject;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getGridConnection()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceObject;->uuid:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->getObjectLocalID(Ljava/util/UUID;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v3

    invoke-static {v3, v0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->makeSelection(Ljava/util/UUID;I)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    goto :goto_0
.end method

.method protected onVoiceLoginStatusChanged(Ljava/lang/Boolean;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment;->onVoiceLoginStatusChanged(Ljava/lang/Boolean;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->updateVrModeControls()V

    return-void
.end method
