.class Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GroupMemberListRecyclerAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter",
        "<",
        "Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private final cardSelectedColor:I

.field private data:Lde/greenrobot/dao/query/LazyList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lde/greenrobot/dao/query/LazyList",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/GroupMember;",
            ">;"
        }
    .end annotation
.end field

.field private final layoutInflater:Landroid/view/LayoutInflater;

.field private selectedPosition:I

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;Landroid/content/Context;)V
    .locals 4

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;->data:Lde/greenrobot/dao/query/LazyList;

    const/4 v0, -0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;->selectedPosition:I

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;->layoutInflater:Landroid/view/LayoutInflater;

    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p2}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const v2, 0x7f010002

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget v0, v0, Landroid/util/TypedValue;->data:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;->cardSelectedColor:I

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;->data:Lde/greenrobot/dao/query/LazyList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;->data:Lde/greenrobot/dao/query/LazyList;

    invoke-virtual {v0}, Lde/greenrobot/dao/query/LazyList;->size()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    check-cast p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;->onBindViewHolder(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;I)V
    .locals 3

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;->data:Lde/greenrobot/dao/query/LazyList;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;->data:Lde/greenrobot/dao/query/LazyList;

    invoke-virtual {v0}, Lde/greenrobot/dao/query/LazyList;->isClosed()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    if-ltz p2, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;->data:Lde/greenrobot/dao/query/LazyList;

    invoke-virtual {v0}, Lde/greenrobot/dao/query/LazyList;->size()I

    move-result v0

    if-ge p2, v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;->data:Lde/greenrobot/dao/query/LazyList;

    invoke-virtual {v0, p2}, Lde/greenrobot/dao/query/LazyList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/GroupMember;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;->selectedPosition:I

    if-ne p2, v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    invoke-virtual {p1, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->bindToData(Lcom/lumiyaviewer/lumiya/dao/GroupMember;Z)V

    :cond_1
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;
    .locals 5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;->layoutInflater:Landroid/view/LayoutInflater;

    const v1, 0x7f040042

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;->-get3(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v3

    iget v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;->cardSelectedColor:I

    invoke-direct {v1, v2, v0, v3, v4}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;Landroid/view/View;Ljava/util/UUID;I)V

    return-object v1
.end method

.method public bridge synthetic onViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 0

    check-cast p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;->onViewRecycled(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;)V

    return-void
.end method

.method public onViewRecycled(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;)V
    .locals 0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->recycle()V

    return-void
.end method

.method public setData(Lde/greenrobot/dao/query/LazyList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/greenrobot/dao/query/LazyList",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/GroupMember;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;->data:Lde/greenrobot/dao/query/LazyList;

    const/4 v0, -0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;->selectedPosition:I

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public setSelectedPosition(I)V
    .locals 2

    const/4 v1, -0x1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;->selectedPosition:I

    if-eq p1, v0, :cond_1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;->selectedPosition:I

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;->selectedPosition:I

    if-eq v0, v1, :cond_0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;->notifyItemChanged(I)V

    :cond_0
    if-eq p1, v1, :cond_1

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;->notifyItemChanged(I)V

    :cond_1
    return-void
.end method
