.class public Lcom/lumiyaviewer/lumiya/ui/objpopup/SingleObjectPopupFragment;
.super Landroid/support/v4/app/Fragment;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/objpopup/SingleObjectPopupFragment$1;
    }
.end annotation


# instance fields
.field private final dismissListener:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$OnDismissListener;

.field private final frameClickListener:Landroid/view/View$OnClickListener;


# direct methods
.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/ui/objpopup/SingleObjectPopupFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objpopup/SingleObjectPopupFragment;->hideAndDismiss()V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/objpopup/-$Lambda$gmgx9kG_frukRCwYiu6KI4GSv6k;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/objpopup/-$Lambda$gmgx9kG_frukRCwYiu6KI4GSv6k;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objpopup/SingleObjectPopupFragment;->frameClickListener:Landroid/view/View$OnClickListener;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/objpopup/SingleObjectPopupFragment$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/objpopup/SingleObjectPopupFragment$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/objpopup/SingleObjectPopupFragment;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objpopup/SingleObjectPopupFragment;->dismissListener:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$OnDismissListener;

    return-void
.end method

.method public static create(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/ui/objpopup/SingleObjectPopupFragment;
    .locals 2
    .param p0    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/objpopup/SingleObjectPopupFragment;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/ui/objpopup/SingleObjectPopupFragment;-><init>()V

    const/4 v1, 0x0

    invoke-static {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->makeFragmentArguments(Ljava/util/UUID;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/objpopup/SingleObjectPopupFragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method private getEvent()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;
    .locals 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objpopup/SingleObjectPopupFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectPopupsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->getDisplayedObjectPopup()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    move-result-object v0

    return-object v0

    :cond_0
    return-object v1
.end method

.method private getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objpopup/SingleObjectPopupFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    return-object v0
.end method

.method private hideAndDismiss()V
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objpopup/SingleObjectPopupFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ConnectedActivity;->dismissSingleObjectPopup()V

    :cond_0
    return-void
.end method


# virtual methods
.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_objpopup_SingleObjectPopupFragment_4170(Landroid/view/View;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objpopup/SingleObjectPopupFragment;->hideAndDismiss()V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 8
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

    const/4 v0, 0x0

    const/4 v3, 0x0

    const v1, 0x7f04007b

    invoke-virtual {p1, v1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objpopup/SingleObjectPopupFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v5

    if-eqz v5, :cond_5

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectPopupsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->getDisplayedObjectPopup()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    move-result-object v1

    if-eqz v1, :cond_4

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectPopupsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->mustAnimatePopup(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)Z

    move-result v0

    move-object v2, v1

    move v1, v0

    :goto_0
    if-nez v2, :cond_2

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objpopup/SingleObjectPopupFragment;->hideAndDismiss()V

    :cond_0
    :goto_1
    const v0, 0x7f100241

    invoke-virtual {v4, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objpopup/SingleObjectPopupFragment;->frameClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_1
    return-object v4

    :cond_2
    const v0, 0x7f100240

    invoke-virtual {v4, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/design/widget/CoordinatorLayout;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objpopup/SingleObjectPopupFragment;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v6

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->getViewType()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    move-result-object v7

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->ordinal()I

    move-result v7

    invoke-static {v6, v7, v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->createViewHolder(Landroid/view/LayoutInflater;ILandroid/view/ViewGroup;Landroid/support/v7/widget/RecyclerView$Adapter;)Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;

    move-result-object v6

    invoke-virtual {v2, v6, v5, v3}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->bindViewHolder(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;)V

    iget-object v2, v6, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/support/design/widget/CoordinatorLayout;->addView(Landroid/view/View;)V

    iget-object v0, v6, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v2, v0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    if-eqz v2, :cond_3

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;-><init>()V

    const/4 v3, 0x7

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->setSwipeDirection(I)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/objpopup/SingleObjectPopupFragment;->dismissListener:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$OnDismissListener;

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->setListener(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$OnDismissListener;)V

    check-cast v0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    invoke-virtual {v0, v2}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->setBehavior(Landroid/support/design/widget/CoordinatorLayout$Behavior;)V

    :cond_3
    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objpopup/SingleObjectPopupFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f05000f

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    iget-object v1, v6, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_1

    :cond_4
    move-object v2, v1

    move v1, v0

    goto :goto_0

    :cond_5
    move v1, v0

    move-object v2, v3

    goto :goto_0
.end method

.method public onResume()V
    .locals 1

    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onResume()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objpopup/SingleObjectPopupFragment;->getEvent()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objpopup/SingleObjectPopupFragment;->hideAndDismiss()V

    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 1

    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStart()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objpopup/SingleObjectPopupFragment;->getEvent()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objpopup/SingleObjectPopupFragment;->hideAndDismiss()V

    :cond_0
    return-void
.end method
