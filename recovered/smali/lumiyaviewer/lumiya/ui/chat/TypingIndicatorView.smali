.class public Lcom/lumiyaviewer/lumiya/ui/chat/TypingIndicatorView;
.super Landroid/widget/ImageView;


# instance fields
.field private chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<",
            "Ljava/util/UUID;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/TypingIndicatorView;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/TypingIndicatorView;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/TypingIndicatorView;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/TypingIndicatorView;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/TypingIndicatorView;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/TypingIndicatorView;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/TypingIndicatorView;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/TypingIndicatorView;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    return-void
.end method

.method private onUserTypingStatus(Ljava/lang/Boolean;)V
    .locals 2

    const/4 v1, 0x0

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/TypingIndicatorView;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/TypingIndicatorView;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/TypingIndicatorView;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/TypingIndicatorView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    :cond_0
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_3

    move v0, v1

    :goto_1
    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/TypingIndicatorView;->setVisibility(I)V

    :cond_1
    return-void

    :cond_2
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/TypingIndicatorView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/TypingIndicatorView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/AnimationDrawable;->stop()V

    goto :goto_0

    :cond_3
    const/4 v0, 0x4

    goto :goto_1
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_ui_chat_TypingIndicatorView-mthref-0(Ljava/lang/Boolean;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/TypingIndicatorView;->onUserTypingStatus(Ljava/lang/Boolean;)V

    return-void
.end method

.method public setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 4
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/TypingIndicatorView;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-static {p1, v0}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/TypingIndicatorView;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/TypingIndicatorView;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/TypingIndicatorView;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->unsubscribe()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/TypingIndicatorView;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    :cond_0
    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getUserTypingStatus()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v2

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$XDRgkFjV-FoS0WpW8v6lPNgts7Q;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$XDRgkFjV-FoS0WpW8v6lPNgts7Q;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/TypingIndicatorView;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/TypingIndicatorView;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    if-nez v0, :cond_2

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/TypingIndicatorView;->setVisibility(I)V

    :cond_2
    return-void
.end method
