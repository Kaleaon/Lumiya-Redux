.class Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NearbyUserViewHolder"
.end annotation


# instance fields
.field private final cardSelectedElevation:F

.field private final cardView:Landroid/support/v7/widget/CardView;

.field private chatterDisplayData:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

.field private final selectedLayout:Landroid/view/View;

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;

.field private final userItemViewHolder:Landroid/widget/FrameLayout;

.field private final viewBuilder:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;Landroid/view/View;)V
    .locals 1

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->this$0:Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;

    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->viewBuilder:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->chatterDisplayData:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    const v0, 0x7f1001df

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->userItemViewHolder:Landroid/widget/FrameLayout;

    const v0, 0x7f1001de

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/CardView;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->cardView:Landroid/support/v7/widget/CardView;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->cardView:Landroid/support/v7/widget/CardView;

    invoke-virtual {v0}, Landroid/support/v7/widget/CardView;->getCardElevation()F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->cardSelectedElevation:F

    const v0, 0x7f1001e0

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->selectedLayout:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->userItemViewHolder:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f1001e1

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public bindToData(Landroid/content/Context;Landroid/view/LayoutInflater;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;Z)V
    .locals 5

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->viewBuilder:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->reset()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->viewBuilder:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;

    invoke-virtual {p4, p1, v0, p3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->buildView(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->userItemViewHolder:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->viewBuilder:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->userItemViewHolder:Landroid/widget/FrameLayout;

    const/4 v3, 0x1

    invoke-virtual {v1, p2, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->getView(Landroid/view/LayoutInflater;Landroid/view/View;Landroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    if-eq v1, v0, :cond_1

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->userItemViewHolder:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->userItemViewHolder:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    :cond_1
    if-eqz p5, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->cardView:Landroid/support/v7/widget/CardView;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->cardSelectedElevation:F

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/CardView;->setCardElevation(F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->cardView:Landroid/support/v7/widget/CardView;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->this$0:Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;->-get0(Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/CardView;->setCardBackgroundColor(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->selectedLayout:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    :goto_0
    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->chatterDisplayData:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    return-void

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->cardView:Landroid/support/v7/widget/CardView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/CardView;->setCardElevation(F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->cardView:Landroid/support/v7/widget/CardView;

    invoke-virtual {v0, v4}, Landroid/support/v7/widget/CardView;->setCardBackgroundColor(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->selectedLayout:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    :pswitch_0
    return-void

    :pswitch_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->this$0:Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    if-eqz v0, :cond_0

    const v1, 0x7f100286

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView$OnUserClickListener;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView$OnUserClickListener;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->chatterDisplayData:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getOptionalChatterUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapView$OnUserClickListener;->onUserClick(Ljava/util/UUID;)V

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->chatterDisplayData:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->this$0:Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatFragmentActivityFactory;->getInstance()Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatFragmentActivityFactory;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->chatterDisplayData:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showDetails(Landroid/app/Activity;Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;Landroid/os/Bundle;)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x7f1001df
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method
