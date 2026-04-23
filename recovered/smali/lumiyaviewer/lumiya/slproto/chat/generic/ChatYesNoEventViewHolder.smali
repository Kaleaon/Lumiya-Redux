.class Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;
.super Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final cardView:Landroid/support/v7/widget/CardView;

.field private cardViewDefaultBackground:I

.field private cardViewDefaultText:I

.field private cardViewDisabledBackground:I

.field private cardViewDisabledText:I

.field private cardViewFaded:Z

.field private fadeAnimatorSet:Landroid/animation/AnimatorSet;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field final noButton:Landroid/widget/Button;

.field final questionMsg:Landroid/widget/TextView;

.field final yesButton:Landroid/widget/Button;

.field private yesNoEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Adapter;)V
    .locals 5

    const/4 v4, 0x0

    const/4 v3, 0x1

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;-><init>(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Adapter;)V

    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/high16 v2, 0x7f010000

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget v1, v0, Landroid/util/TypedValue;->data:I

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->cardViewDefaultBackground:I

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const v2, 0x7f010001

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget v1, v0, Landroid/util/TypedValue;->data:I

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->cardViewDefaultText:I

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const v2, 0x7f010003

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget v1, v0, Landroid/util/TypedValue;->data:I

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->cardViewDisabledBackground:I

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const v2, 0x7f010004

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget v0, v0, Landroid/util/TypedValue;->data:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->cardViewDisabledText:I

    const v0, 0x7f10013c

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->yesButton:Landroid/widget/Button;

    const v0, 0x7f10013d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->noButton:Landroid/widget/Button;

    const v0, 0x7f10013b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->questionMsg:Landroid/widget/TextView;

    const v0, 0x7f100127

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/CardView;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->cardView:Landroid/support/v7/widget/CardView;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->yesNoEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->yesButton:Landroid/widget/Button;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->yesButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->noButton:Landroid/widget/Button;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->noButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_1
    return-void
.end method

.method private fadeCardView()V
    .locals 7

    const/4 v6, 0x1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->cardViewFaded:Z

    if-nez v0, :cond_1

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->fadeAnimatorSet:Landroid/animation/AnimatorSet;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->cardView:Landroid/support/v7/widget/CardView;

    invoke-virtual {v0}, Landroid/support/v7/widget/CardView;->getContext()Landroid/content/Context;

    move-result-object v0

    const/high16 v1, 0x7f060000

    invoke-static {v0, v1}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    move-result-object v0

    check-cast v0, Landroid/animation/ObjectAnimator;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->cardView:Landroid/support/v7/widget/CardView;

    invoke-virtual {v1}, Landroid/support/v7/widget/CardView;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f060001

    invoke-static {v1, v2}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    move-result-object v1

    check-cast v1, Landroid/animation/ObjectAnimator;

    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->clone()Landroid/animation/ObjectAnimator;

    move-result-object v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->cardView:Landroid/support/v7/widget/CardView;

    invoke-virtual {v0, v3}, Landroid/animation/ObjectAnimator;->setTarget(Ljava/lang/Object;)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->textView:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/animation/ObjectAnimator;->setTarget(Ljava/lang/Object;)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->questionMsg:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/animation/ObjectAnimator;->setTarget(Ljava/lang/Object;)V

    new-instance v3, Landroid/animation/AnimatorSet;

    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->fadeAnimatorSet:Landroid/animation/AnimatorSet;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->fadeAnimatorSet:Landroid/animation/AnimatorSet;

    const/4 v4, 0x3

    new-array v4, v4, [Landroid/animation/Animator;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    aput-object v1, v4, v6

    const/4 v0, 0x2

    aput-object v2, v4, v0

    invoke-virtual {v3, v4}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->fadeAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    iput-boolean v6, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->cardViewFaded:Z

    :cond_1
    return-void
.end method


# virtual methods
.method public makeCardViewDisabled()V
    .locals 2

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->cardViewFaded:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->cardView:Landroid/support/v7/widget/CardView;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->cardViewDisabledBackground:I

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/CardView;->setCardBackgroundColor(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->questionMsg:Landroid/widget/TextView;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->cardViewDisabledText:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->textView:Landroid/widget/TextView;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->cardViewDisabledText:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_0
    return-void
.end method

.method public makeCardViewEnabled()V
    .locals 2

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->cardViewFaded:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->cardViewFaded:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->fadeAnimatorSet:Landroid/animation/AnimatorSet;

    if-eqz v0, :cond_0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->fadeAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->cardView:Landroid/support/v7/widget/CardView;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->cardViewDefaultBackground:I

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/CardView;->setCardBackgroundColor(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->questionMsg:Landroid/widget/TextView;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->cardViewDefaultText:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->textView:Landroid/widget/TextView;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->cardViewDefaultText:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->yesNoEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->yesNoEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->getEventState()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;->EventNew:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    if-ne v0, v1, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->fadeCardView()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->yesNoEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->yesNoEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->getAgentUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->onYesAction(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->yesNoEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->yesNoEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->getEventState()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;->EventNew:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    if-ne v0, v1, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->fadeCardView()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->yesNoEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->yesNoEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->getAgentUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->onNoAction(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x7f10013c
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public setEvent(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->yesNoEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;

    return-void
.end method
