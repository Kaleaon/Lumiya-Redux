.class public Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog$1;
    }
.end annotation


# static fields
.field private static final STALE_CHAT_TIMEOUT:J = 0x1388L


# instance fields
.field private final RemoveStaleChatsTask:Ljava/lang/Runnable;

.field private final chatEventOverlays:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lcom/lumiyaviewer/lumiya/ui/render/ChatEventOverlay;",
            ">;"
        }
    .end annotation
.end field

.field private final chatsOverlayLayout:Landroid/widget/LinearLayout;

.field private final context:Landroid/content/Context;

.field private final logBackgroundColor:I

.field private final logTextColor:I

.field private final mHandler:Landroid/os/Handler;

.field private removeStaleChatsPosted:Z

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;)Ljava/util/Map;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->chatEventOverlays:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;)Landroid/widget/LinearLayout;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->chatsOverlayLayout:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic -set0(Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->removeStaleChatsPosted:Z

    return p1
.end method

.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Landroid/content/Context;Landroid/widget/LinearLayout;II)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->mHandler:Landroid/os/Handler;

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->chatEventOverlays:Ljava/util/Map;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->removeStaleChatsPosted:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->RemoveStaleChatsTask:Ljava/lang/Runnable;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->context:Landroid/content/Context;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->chatsOverlayLayout:Landroid/widget/LinearLayout;

    iput p4, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->logTextColor:I

    iput p5, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->logBackgroundColor:I

    return-void
.end method


# virtual methods
.method clearChatEvents()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->chatsOverlayLayout:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->chatsOverlayLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->chatEventOverlays:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    return-void
.end method

.method handleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$ChatMessageEvent;)V
    .locals 9

    const/4 v8, -0x2

    const/high16 v7, 0x41200000    # 10.0f

    const/high16 v6, 0x40a00000    # 5.0f

    const/4 v5, 0x1

    const/4 v1, 0x0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$ChatMessageEvent;->chatMessage:Lcom/lumiyaviewer/lumiya/dao/ChatMessage;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->loadFromDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->context:Landroid/content/Context;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->getPlainTextMessage(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Z)Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-static {v0}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    iget-boolean v2, p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$ChatMessageEvent;->isPrivate:Z

    if-eqz v2, :cond_4

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "[IM] "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v2, v0

    :goto_1
    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$ChatMessageEvent;->isNewMessage:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    invoke-static {v5, v7, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    float-to-int v1, v1

    invoke-static {v5, v6, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v3

    float-to-int v3, v3

    invoke-static {v5, v7, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v4

    float-to-int v4, v4

    invoke-static {v5, v6, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v0, v0

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v8, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v1, v3, v1, v3}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    new-instance v1, Landroid/widget/TextView;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->context:Landroid/content/Context;

    invoke-direct {v1, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iget v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->logBackgroundColor:I

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setBackgroundColor(I)V

    iget v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->logTextColor:I

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v1, v4, v0, v4, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->chatsOverlayLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->chatEventOverlays:Ljava/util/Map;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$ChatMessageEvent;->chatMessage:Lcom/lumiyaviewer/lumiya/dao/ChatMessage;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getId()Ljava/lang/Long;

    move-result-object v3

    new-instance v4, Lcom/lumiyaviewer/lumiya/ui/render/ChatEventOverlay;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v6

    invoke-direct {v4, v6, v7, v1}, Lcom/lumiyaviewer/lumiya/ui/render/ChatEventOverlay;-><init>(JLandroid/widget/TextView;)V

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->postRemovingStaleChats()V

    :cond_0
    :goto_2
    if-eqz v1, :cond_1

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    return-void

    :cond_2
    move-object v0, v1

    goto/16 :goto_0

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->chatEventOverlays:Ljava/util/Map;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$ChatMessageEvent;->chatMessage:Lcom/lumiyaviewer/lumiya/dao/ChatMessage;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getId()Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/render/ChatEventOverlay;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/ChatEventOverlay;->textView:Landroid/widget/TextView;

    goto :goto_2

    :cond_4
    move-object v2, v0

    goto :goto_1
.end method

.method postRemovingStaleChats()V
    .locals 8

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->removeStaleChatsPosted:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->chatEventOverlays:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->removeStaleChatsPosted:Z

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->RemoveStaleChatsTask:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/render/ChatEventOverlay;

    iget-wide v4, v0, Lcom/lumiyaviewer/lumiya/ui/render/ChatEventOverlay;->timestamp:J

    const-wide/16 v6, 0x1388

    add-long/2addr v4, v6

    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method
