.class Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GroupMemberViewHolder"
.end annotation


# instance fields
.field private final agentUUID:Ljava/util/UUID;

.field private boundChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

.field private final cardSelectedColor:I

.field private final cardSelectedElevation:F

.field private final cardView:Landroid/support/v7/widget/CardView;

.field private chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

.field private final groupMemberChatButton:Landroid/widget/Button;

.field private final groupMemberEjectButton:Landroid/widget/Button;

.field private final groupMemberProfileButton:Landroid/widget/Button;

.field private final groupMemberRolesButton:Landroid/widget/Button;

.field private final selectedLayout:Landroid/view/View;

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;

.field private final userNameTextView:Landroid/widget/TextView;

.field private final userOnlineStatusText:Landroid/widget/TextView;

.field private final userPicView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

.field private final userTitleText:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;Landroid/view/View;Ljava/util/UUID;I)V
    .locals 1

    const/4 v0, 0x0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;

    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->boundChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->agentUUID:Ljava/util/UUID;

    const v0, 0x7f10016b

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/CardView;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->cardView:Landroid/support/v7/widget/CardView;

    const v0, 0x7f100140

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->userNameTextView:Landroid/widget/TextView;

    const v0, 0x7f10013f

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->userPicView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    const v0, 0x7f10016c

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->userTitleText:Landroid/widget/TextView;

    const v0, 0x7f10016d

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->userOnlineStatusText:Landroid/widget/TextView;

    const v0, 0x7f10016e

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->selectedLayout:Landroid/view/View;

    const v0, 0x7f10016f

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->groupMemberChatButton:Landroid/widget/Button;

    const v0, 0x7f100170

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->groupMemberProfileButton:Landroid/widget/Button;

    const v0, 0x7f100171

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->groupMemberRolesButton:Landroid/widget/Button;

    const v0, 0x7f100172

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->groupMemberEjectButton:Landroid/widget/Button;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->cardView:Landroid/support/v7/widget/CardView;

    invoke-virtual {v0}, Landroid/support/v7/widget/CardView;->getCardElevation()F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->cardSelectedElevation:F

    iput p4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->cardSelectedColor:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->cardView:Landroid/support/v7/widget/CardView;

    invoke-virtual {v0, p0}, Landroid/support/v7/widget/CardView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->groupMemberChatButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->groupMemberProfileButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->groupMemberRolesButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->groupMemberEjectButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method bindToData(Lcom/lumiyaviewer/lumiya/dao/GroupMember;Z)V
    .locals 8

    const/16 v3, 0x8

    const/4 v2, 0x0

    const/4 v1, 0x0

    if-eqz p1, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->agentUUID:Ljava/util/UUID;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/GroupMember;->getUserID()Ljava/util/UUID;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v0

    :goto_0
    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->boundChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-static {v0, v4}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    :cond_0
    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->userNameTextView:Landroid/widget/TextView;

    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->boundChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v0, :cond_4

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->boundChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v6

    invoke-direct {v4, v5, p0, v6}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;Ljava/util/concurrent/Executor;)V

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->userPicView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v0, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    :cond_1
    :goto_1
    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->userTitleText:Landroid/widget/TextView;

    if-eqz p1, :cond_5

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/GroupMember;->getTitle()Ljava/lang/String;

    move-result-object v0

    :goto_2
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->userOnlineStatusText:Landroid/widget/TextView;

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/GroupMember;->getOnlineStatus()Ljava/lang/String;

    move-result-object v1

    :cond_2
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-eqz p2, :cond_6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->cardView:Landroid/support/v7/widget/CardView;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->cardSelectedElevation:F

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/CardView;->setCardElevation(F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->cardView:Landroid/support/v7/widget/CardView;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->cardSelectedColor:I

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/CardView;->setCardBackgroundColor(I)V

    :goto_3
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->selectedLayout:Landroid/view/View;

    if-eqz p2, :cond_7

    move v0, v2

    :goto_4
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;->-wrap0(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;)Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;

    move-result-object v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;->-get1(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;)Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    move-result-object v0

    if-eqz v0, :cond_8

    if-eqz v1, :cond_8

    iget-wide v4, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->GroupPowers:J

    const-wide/16 v6, 0x4

    and-long/2addr v4, v6

    const-wide/16 v6, 0x0

    cmp-long v0, v4, v6

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_5
    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->groupMemberEjectButton:Landroid/widget/Button;

    if-eqz v0, :cond_9

    move v0, v2

    :goto_6
    invoke-virtual {v4, v0}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->groupMemberRolesButton:Landroid/widget/Button;

    if-eqz v1, :cond_a

    :goto_7
    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    return-void

    :cond_3
    move-object v0, v1

    goto/16 :goto_0

    :cond_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->userPicView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    invoke-virtual {v0, v1, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    goto :goto_1

    :cond_5
    move-object v0, v1

    goto :goto_2

    :cond_6
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->cardView:Landroid/support/v7/widget/CardView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/CardView;->setCardElevation(F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->cardView:Landroid/support/v7/widget/CardView;

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/CardView;->setCardBackgroundColor(I)V

    goto :goto_3

    :cond_7
    move v0, v3

    goto :goto_4

    :cond_8
    move v0, v2

    goto :goto_5

    :cond_9
    move v0, v3

    goto :goto_6

    :cond_a
    move v2, v3

    goto :goto_7
.end method

.method public onChatterNameUpdated(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V
    .locals 3

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->userNameTextView:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->userPicView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    :pswitch_0
    return-void

    :pswitch_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "roleToAdd"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->boundChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->boundChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;->-wrap1(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;->-get0(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;)Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;->-get0(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;)Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->getAdapterPosition()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberListRecyclerAdapter;->setSelectedPosition(I)V

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->boundChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatFragmentActivityFactory;->getInstance()Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatFragmentActivityFactory;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->boundChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showDetails(Landroid/app/Activity;Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;Landroid/os/Bundle;)V

    goto :goto_0

    :pswitch_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->boundChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    goto :goto_0

    :pswitch_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->boundChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;->-get2(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->boundChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/util/UUID;)Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    goto :goto_0

    :pswitch_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->boundChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->boundChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;->-wrap2(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;)V

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x7f10016b
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method recycle()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->chatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    :cond_0
    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->boundChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab$GroupMemberViewHolder;->userPicView:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    invoke-virtual {v0, v1, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    return-void
.end method
