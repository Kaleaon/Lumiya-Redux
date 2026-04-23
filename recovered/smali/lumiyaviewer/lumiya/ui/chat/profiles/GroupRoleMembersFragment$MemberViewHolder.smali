.class Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MemberViewHolder"
.end annotation


# instance fields
.field private final agentUUID:Ljava/util/UUID;

.field private boundChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

.field private canDelete:Z

.field private chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

.field private final roleMemberRemoveButton:Landroid/widget/ImageButton;

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;

.field private final userNameTextView:Landroid/widget/TextView;

.field private final userPicView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;Landroid/view/View;Ljava/util/UUID;)V
    .locals 2

    const/4 v1, 0x0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;

    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->canDelete:Z

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->boundChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->agentUUID:Ljava/util/UUID;

    const v0, 0x7f100140

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->userNameTextView:Landroid/widget/TextView;

    const v0, 0x7f10013f

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->userPicView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    const v0, 0x7f1001ac

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->roleMemberRemoveButton:Landroid/widget/ImageButton;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->roleMemberRemoveButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method bindToData(Lcom/lumiyaviewer/lumiya/dao/GroupRoleMember;ZZ)V
    .locals 5

    const/4 v2, 0x0

    const/4 v1, 0x0

    if-eqz p1, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->agentUUID:Ljava/util/UUID;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMember;->getUserID()Ljava/util/UUID;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v0

    :goto_0
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->boundChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-static {v0, v3}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    :cond_0
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->userNameTextView:Landroid/widget/TextView;

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->boundChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v0, :cond_3

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->boundChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v4

    invoke-direct {v1, v3, p0, v4}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;Ljava/util/concurrent/Executor;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->userPicView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v0, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    :cond_1
    :goto_1
    if-nez p2, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->agentUUID:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->boundChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    :goto_2
    iput-boolean p3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->canDelete:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->roleMemberRemoveButton:Landroid/widget/ImageButton;

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->canDelete:Z

    if-eqz v1, :cond_6

    :goto_3
    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    return-void

    :cond_2
    move-object v0, v1

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->userPicView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    invoke-virtual {v0, v1, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    goto :goto_1

    :cond_4
    const/4 p3, 0x1

    goto :goto_2

    :cond_5
    move p3, v2

    goto :goto_2

    :cond_6
    const/16 v2, 0x8

    goto :goto_3
.end method

.method public onChatterNameUpdated(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V
    .locals 3

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->userNameTextView:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->userPicView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->boundChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->canDelete:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->boundChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->-wrap0(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x7f1001ac
        :pswitch_0
    .end packed-switch
.end method

.method recycle()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    :cond_0
    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->boundChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment$MemberViewHolder;->userPicView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    invoke-virtual {v0, v1, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    return-void
.end method
