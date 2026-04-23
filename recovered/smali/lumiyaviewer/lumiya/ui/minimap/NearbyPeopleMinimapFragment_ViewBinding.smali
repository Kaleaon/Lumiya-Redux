.class public Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment_ViewBinding;
.super Ljava/lang/Object;

# interfaces
.implements Lbutterknife/Unbinder;


# instance fields
.field private target:Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;Landroid/view/View;)V
    .locals 3
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;

    const-string/jumbo v0, "field \'emptyView\'"

    const v1, 0x1020004

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;->emptyView:Landroid/view/View;

    const-string/jumbo v0, "field \'userListView\'"

    const-class v1, Landroid/support/v7/widget/RecyclerView;

    const v2, 0x7f1001e2

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;->userListView:Landroid/support/v7/widget/RecyclerView;

    return-void
.end method


# virtual methods
.method public unbind()V
    .locals 2
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Bindings already cleared."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;->emptyView:Landroid/view/View;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/minimap/NearbyPeopleMinimapFragment;->userListView:Landroid/support/v7/widget/RecyclerView;

    return-void
.end method
