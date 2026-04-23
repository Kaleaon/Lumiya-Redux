.class Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MemberListAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter",
        "<",
        "Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private canDeleteMembers:Z

.field private canDeleteMyself:Z

.field private data:Lde/greenrobot/dao/query/LazyList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lde/greenrobot/dao/query/LazyList",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/GroupRoleMember;",
            ">;"
        }
    .end annotation
.end field

.field private final layoutInflater:Landroid/view/LayoutInflater;

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;Landroid/content/Context;)V
    .locals 2

    const/4 v1, 0x0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;->data:Lde/greenrobot/dao/query/LazyList;

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;->canDeleteMembers:Z

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;->canDeleteMyself:Z

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;->layoutInflater:Landroid/view/LayoutInflater;

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;->data:Lde/greenrobot/dao/query/LazyList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;->data:Lde/greenrobot/dao/query/LazyList;

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

    check-cast p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;->onBindViewHolder(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;I)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;->data:Lde/greenrobot/dao/query/LazyList;

    if-eqz v0, :cond_0

    if-ltz p2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;->data:Lde/greenrobot/dao/query/LazyList;

    invoke-virtual {v0}, Lde/greenrobot/dao/query/LazyList;->size()I

    move-result v0

    if-ge p2, v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;->data:Lde/greenrobot/dao/query/LazyList;

    invoke-virtual {v0, p2}, Lde/greenrobot/dao/query/LazyList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMember;

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;->canDeleteMembers:Z

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;->canDeleteMyself:Z

    invoke-virtual {p1, v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->bindToData(Lcom/lumiyaviewer/lumiya/dao/GroupRoleMember;ZZ)V

    :cond_0
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;->layoutInflater:Landroid/view/LayoutInflater;

    const v1, 0x7f04004d

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->-get0(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v3

    invoke-direct {v1, v2, v0, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;Landroid/view/View;Ljava/util/UUID;)V

    return-object v1
.end method

.method public bridge synthetic onViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 0

    check-cast p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;->onViewRecycled(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;)V

    return-void
.end method

.method public onViewRecycled(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;)V
    .locals 0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->recycle()V

    return-void
.end method

.method public setData(Lde/greenrobot/dao/query/LazyList;ZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/greenrobot/dao/query/LazyList",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/GroupRoleMember;",
            ">;ZZ)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;->data:Lde/greenrobot/dao/query/LazyList;

    iput-boolean p2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;->canDeleteMembers:Z

    iput-boolean p3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;->canDeleteMyself:Z

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberListAdapter;->notifyDataSetChanged()V

    return-void
.end method
