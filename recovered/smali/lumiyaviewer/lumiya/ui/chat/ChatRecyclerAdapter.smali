.class Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$EventListener;
.implements Lcom/lumiyaviewer/lumiya/ui/chat/HasUserPicClickHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter$OnAdapterDataChanged;,
        Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter$OnUserPicClickedListener;
    }
.end annotation


# instance fields
.field private chatMessageLoader:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final inflater:Landroid/view/LayoutInflater;

.field private onAdapterDataChangedListener:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter$OnAdapterDataChanged;",
            ">;"
        }
    .end annotation
.end field

.field private onUserPicClickedListener:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter$OnUserPicClickedListener;",
            ">;"
        }
    .end annotation
.end field

.field private final timestampUpdater:Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final userPicClickListener:Landroid/view/View$OnClickListener;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 2
    .param p2    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v1, 0x0

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->chatMessageLoader:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->onAdapterDataChangedListener:Ljava/lang/ref/WeakReference;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->onUserPicClickedListener:Ljava/lang/ref/WeakReference;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$aLaDwVKcksSTh8O8aNFE_CFHRQc;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/-$Lambda$aLaDwVKcksSTh8O8aNFE_CFHRQc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->userPicClickListener:Landroid/view/View$OnClickListener;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->inflater:Landroid/view/LayoutInflater;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;

    invoke-direct {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->timestampUpdater:Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->setHasStableIds(Z)V

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->chatMessageLoader:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->chatMessageLoader:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;->size()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getItemId(I)J
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->chatMessageLoader:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->chatMessageLoader:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;->get(I)Lcom/lumiyaviewer/lumiya/utils/Identifiable;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getId()Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    :goto_0
    return-wide v0

    :cond_0
    const-wide/16 v0, -0x1

    goto :goto_0
.end method

.method public getItemViewType(I)I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->chatMessageLoader:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->chatMessageLoader:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;->get(I)Lcom/lumiyaviewer/lumiya/utils/Identifiable;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getViewType()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getListEventsExecutor()Ljava/util/concurrent/Executor;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getSerialInstance()Ljava/util/concurrent/Executor;

    move-result-object v0

    return-object v0
.end method

.method public getUserPicClickListener()Landroid/view/View$OnClickListener;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->userPicClickListener:Landroid/view/View$OnClickListener;

    return-object v0
.end method

.method hasMoreItemsAtBottom()Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->chatMessageLoader:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->chatMessageLoader:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;->hasMoreItemsAtBottom()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_ChatRecyclerAdapter_7040(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->onUserPicClickedListener:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter$OnUserPicClickedListener;

    if-eqz v0, :cond_0

    instance-of v1, p1, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    if-eqz v1, :cond_0

    check-cast p1, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->getAttachedMessageSource()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter$OnUserPicClickedListener;->onUserPicClicked(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;)V

    :cond_0
    return-void
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->chatMessageLoader:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->chatMessageLoader:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;->get(I)Lcom/lumiyaviewer/lumiya/utils/Identifiable;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->loadFromDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    move-result-object v0

    if-eqz v0, :cond_0

    instance-of v1, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;

    if-eqz v1, :cond_0

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->timestampUpdater:Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;

    invoke-virtual {v0, p1, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->bindViewHolder(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;)V

    :cond_0
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->inflater:Landroid/view/LayoutInflater;

    invoke-static {v0, p2, p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->createViewHolder(Landroid/view/LayoutInflater;ILandroid/view/ViewGroup;Landroid/support/v7/widget/RecyclerView$Adapter;)Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onListItemAddedAtEnd()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->chatMessageLoader:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->onAdapterDataChangedListener:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter$OnAdapterDataChanged;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter$OnAdapterDataChanged;->onAdapterDataAddedAtEnd()V

    :cond_0
    return-void
.end method

.method public onListItemChanged(I)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->chatMessageLoader:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    if-eqz v0, :cond_0

    const-string/jumbo v0, "ChatView: item changed: position %d"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->notifyItemChanged(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->onAdapterDataChangedListener:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter$OnAdapterDataChanged;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter$OnAdapterDataChanged;->onAdapterDataChanged()V

    :cond_0
    return-void
.end method

.method public onListItemsAdded(II)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->chatMessageLoader:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    if-eqz v0, :cond_0

    const-string/jumbo v0, "ChatView: items added: new size %d, position %d, count %d"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->chatMessageLoader:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->notifyItemRangeInserted(II)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->onAdapterDataChangedListener:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter$OnAdapterDataChanged;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter$OnAdapterDataChanged;->onAdapterDataChanged()V

    :cond_0
    return-void
.end method

.method public onListItemsRemoved(II)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->chatMessageLoader:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    if-eqz v0, :cond_0

    const-string/jumbo v0, "ChatView: items removed: new size %d, position %d, count %d"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->chatMessageLoader:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->notifyItemRangeRemoved(II)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->onAdapterDataChangedListener:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter$OnAdapterDataChanged;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter$OnAdapterDataChanged;->onAdapterDataChanged()V

    :cond_0
    return-void
.end method

.method public onListReloaded()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->chatMessageLoader:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    if-eqz v0, :cond_0

    const-string/jumbo v0, "ChatView: list cleared"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->notifyDataSetChanged()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->onAdapterDataChangedListener:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter$OnAdapterDataChanged;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter$OnAdapterDataChanged;->onAdapterDataReloaded()V

    :cond_0
    return-void
.end method

.method public onViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 1

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->timestampUpdater:Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;->removeViewHolder(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;)V

    :cond_0
    return-void
.end method

.method restartAtBottom()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->chatMessageLoader:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->chatMessageLoader:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;->reload()V

    :cond_0
    return-void
.end method

.method setOnUserPicClickedListener(Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter$OnUserPicClickedListener;)V
    .locals 1

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->onUserPicClickedListener:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method setVisibleRange(II)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->chatMessageLoader:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    if-eqz v0, :cond_0

    const-string/jumbo v0, "ChatView: visible range from %d to %d"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->chatMessageLoader:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    invoke-virtual {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;->setVisibleRange(II)V

    :cond_0
    return-void
.end method

.method startLoading(Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter$OnAdapterDataChanged;)V
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter$OnAdapterDataChanged;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->onAdapterDataChangedListener:Ljava/lang/ref/WeakReference;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->getMessageLoader(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$EventListener;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->chatMessageLoader:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method stopLoading()V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->chatMessageLoader:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->releaseMessageLoader(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->chatMessageLoader:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->onAdapterDataChangedListener:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatRecyclerAdapter;->notifyDataSetChanged()V

    return-void
.end method
