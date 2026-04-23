.class Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NearbyUserRecyclerAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter",
        "<",
        "Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private chatters:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final context:Landroid/content/Context;

.field private final layoutInflater:Landroid/view/LayoutInflater;

.field private nextStableId:J

.field private selectedPosition:I

.field private selectedUUID:Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final stableIds:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 2

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->stableIds:Ljava/util/Map;

    const-wide/16 v0, 0x1

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->nextStableId:J

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->chatters:Lcom/google/common/collect/ImmutableList;

    const/4 v0, -0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->selectedPosition:I

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->context:Landroid/content/Context;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->layoutInflater:Landroid/view/LayoutInflater;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->setHasStableIds(Z)V

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->chatters:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    return v0
.end method

.method public getItemId(I)J
    .locals 2

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->chatters:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->chatters:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getOptionalChatterUUID()Ljava/util/UUID;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->stableIds:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0

    :cond_0
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    check-cast p1, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->onBindViewHolder(Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;I)V
    .locals 6

    const/4 v5, 0x0

    if-ltz p2, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->chatters:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    if-ge p2, v0, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->layoutInflater:Landroid/view/LayoutInflater;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->chatters:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0, p2}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->selectedPosition:I

    if-ne p2, v0, :cond_0

    const/4 v5, 0x1

    :cond_0
    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;->bindToData(Landroid/content/Context;Landroid/view/LayoutInflater;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;Z)V

    :cond_1
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->layoutInflater:Landroid/view/LayoutInflater;

    const v1, 0x7f04005f

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;

    invoke-direct {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserViewHolder;-><init>(Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;Landroid/view/View;)V

    return-object v1
.end method

.method public setChatters(Lcom/google/common/collect/ImmutableList;)V
    .locals 8
    .param p1    # Lcom/google/common/collect/ImmutableList;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_2

    :goto_0
    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->chatters:Lcom/google/common/collect/ImmutableList;

    const/4 v0, -0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->selectedPosition:I

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    const/4 v0, 0x0

    move v1, v0

    :goto_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->chatters:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    if-ge v1, v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->chatters:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getOptionalChatterUUID()Ljava/util/UUID;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->stableIds:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->stableIds:Ljava/util/Map;

    iget-wide v4, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->nextStableId:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {v3, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-wide v4, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->nextStableId:J

    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->nextStableId:J

    :cond_0
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->selectedUUID:Ljava/util/UUID;

    invoke-static {v0, v3}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->selectedPosition:I

    :cond_1
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1

    :cond_2
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object p1

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->stableIds:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0, v2}, Ljava/util/Set;->retainAll(Ljava/util/Collection;)Z

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public setSelected(Ljava/util/UUID;)V
    .locals 3

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->selectedUUID:Ljava/util/UUID;

    const/4 v2, -0x1

    if-eqz p1, :cond_2

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->chatters:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    if-ge v1, v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->chatters:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getOptionalChatterUUID()Ljava/util/UUID;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-static {p1, v0}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :goto_1
    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->selectedPosition:I

    if-eq v1, v0, :cond_0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->selectedPosition:I

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->selectedPosition:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->selectedPosition:I

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->notifyItemChanged(I)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment$NearbyUserRecyclerAdapter;->notifyItemChanged(I)V

    :cond_0
    return-void

    :cond_1
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_2
    move v1, v2

    goto :goto_1
.end method
