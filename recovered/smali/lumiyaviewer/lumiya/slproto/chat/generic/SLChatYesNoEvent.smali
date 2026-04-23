.class public abstract Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;
.super Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;
    }
.end annotation


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-slproto-chat-generic-SLChatYesNoEvent$EventStateSwitchesValues:[I


# instance fields
.field private eventState:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-slproto-chat-generic-SLChatYesNoEvent$EventStateSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->-com-lumiyaviewer-lumiya-slproto-chat-generic-SLChatYesNoEvent$EventStateSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->-com-lumiyaviewer-lumiya-slproto-chat-generic-SLChatYesNoEvent$EventStateSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;->values()[Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;->EventAccepted:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;->EventCancelled:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;->EventNew:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_0

    :goto_2
    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->-com-lumiyaviewer-lumiya-slproto-chat-generic-SLChatYesNoEvent$EventStateSwitchesValues:[I

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

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V
    .locals 2
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;->EventNew:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->eventState:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;->VALUES:[Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getEventState()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->eventState:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;Ljava/lang/String;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;Ljava/lang/String;)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;->EventNew:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->eventState:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Ljava/lang/String;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Ljava/lang/String;)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;->EventNew:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->eventState:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    return-void
.end method


# virtual methods
.method public bindViewHolder(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;)V
    .locals 7
    .param p3    # Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v6, 0x0

    const/16 v5, 0x8

    invoke-super {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;->bindViewHolder(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;)V

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->setEvent(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->questionMsg:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->yesButton:Landroid/widget/Button;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->noButton:Landroid/widget/Button;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->cardView:Landroid/support/v7/widget/CardView;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->-getcom-lumiyaviewer-lumiya-slproto-chat-generic-SLChatYesNoEvent$EventStateSwitchesValues()[I

    move-result-object v3

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->eventState:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    invoke-virtual {v0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->getQuestion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {v1, v6}, Landroid/widget/Button;->setVisibility(I)V

    invoke-virtual {v2, v6}, Landroid/widget/Button;->setVisibility(I)V

    invoke-virtual {v1}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->getYesButton(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v2}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->getNoButton(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->makeCardViewEnabled()V

    goto :goto_0

    :pswitch_1
    invoke-virtual {v0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->getYesMessage(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v5}, Landroid/widget/Button;->setVisibility(I)V

    invoke-virtual {v2, v5}, Landroid/widget/Button;->setVisibility(I)V

    invoke-virtual {v0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->getYesMessage(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_1
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->makeCardViewDisabled()V

    goto :goto_0

    :cond_1
    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1

    :pswitch_2
    invoke-virtual {v0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->getNoMessage(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v5}, Landroid/widget/Button;->setVisibility(I)V

    invoke-virtual {v2, v5}, Landroid/widget/Button;->setVisibility(I)V

    invoke-virtual {v0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->getNoMessage(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_2
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatYesNoEventViewHolder;->makeCardViewDisabled()V

    goto/16 :goto_0

    :cond_2
    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_2

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method public getEventState()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->eventState:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    return-object v0
.end method

.method protected abstract getNoButton(Landroid/content/Context;)Ljava/lang/String;
.end method

.method protected abstract getNoMessage(Landroid/content/Context;)Ljava/lang/String;
.end method

.method protected abstract getQuestion(Landroid/content/Context;)Ljava/lang/String;
.end method

.method public getViewType()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->VIEW_TYPE_YESNO:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    return-object v0
.end method

.method protected abstract getYesButton(Landroid/content/Context;)Ljava/lang/String;
.end method

.method protected abstract getYesMessage(Landroid/content/Context;)Ljava/lang/String;
.end method

.method protected onNoAction(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;->EventCancelled:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->eventState:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    invoke-virtual {p0, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->notifyEventUpdated(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    return-void
.end method

.method public onYesAction(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;->EventAccepted:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->eventState:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    invoke-virtual {p0, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->notifyEventUpdated(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    return-void
.end method

.method public serializeToDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/dao/ChatMessage;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatTextEvent;->serializeToDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->eventState:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent$EventState;->ordinal()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setEventState(Ljava/lang/Integer;)V

    return-void
.end method
