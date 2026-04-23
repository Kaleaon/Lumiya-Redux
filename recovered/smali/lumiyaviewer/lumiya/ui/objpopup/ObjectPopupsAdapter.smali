.class public Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsAdapter;
.super Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;",
        ">;"
    }
.end annotation


# instance fields
.field private final context:Landroid/content/Context;

.field private final layoutInflater:Landroid/view/LayoutInflater;

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;",
            ">;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;",
            ")V"
        }
    .end annotation

    invoke-direct {p0, p2}, Lcom/lumiyaviewer/lumiya/ui/common/RecyclerSubscribableListAdapter;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;)V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsAdapter;->context:Landroid/content/Context;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsAdapter;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsAdapter;->layoutInflater:Landroid/view/LayoutInflater;

    return-void
.end method


# virtual methods
.method protected bindObjectViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V
    .locals 2

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsAdapter;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    const/4 v1, 0x0

    invoke-virtual {p2, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->bindViewHolder(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;)V

    :cond_0
    return-void
.end method

.method protected bridge synthetic bindObjectViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;Ljava/lang/Object;)V
    .locals 0

    check-cast p2, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsAdapter;->bindObjectViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V

    return-void
.end method

.method protected createObjectViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsAdapter;->layoutInflater:Landroid/view/LayoutInflater;

    invoke-static {v0, p2, p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->createViewHolder(Landroid/view/LayoutInflater;ILandroid/view/ViewGroup;Landroid/support/v7/widget/RecyclerView$Adapter;)Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;

    move-result-object v0

    return-object v0
.end method

.method protected getObjectViewType(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)I
    .locals 1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->getViewType()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->ordinal()I

    move-result v0

    return v0
.end method

.method protected bridge synthetic getObjectViewType(Ljava/lang/Object;)I
    .locals 1

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsAdapter;->getObjectViewType(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)I

    move-result v0

    return v0
.end method
