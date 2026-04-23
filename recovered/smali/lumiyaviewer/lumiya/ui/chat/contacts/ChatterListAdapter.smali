.class abstract Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListAdapter;
.super Landroid/widget/BaseAdapter;

# interfaces
.implements Landroid/widget/ListAdapter;


# instance fields
.field protected final context:Landroid/content/Context;

.field private final inflater:Landroid/view/LayoutInflater;

.field private userDistanceInline:Z

.field protected final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

.field private final viewBuilder:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 1

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListAdapter;->viewBuilder:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListAdapter;->userDistanceInline:Z

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListAdapter;->context:Landroid/content/Context;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListAdapter;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListAdapter;->inflater:Landroid/view/LayoutInflater;

    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterDisplayInfo;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListAdapter;->viewBuilder:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->reset()V

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterDisplayInfo;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListAdapter;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListAdapter;->viewBuilder:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListAdapter;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-interface {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterDisplayInfo;->buildView(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListAdapter;->viewBuilder:Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListAdapter;->inflater:Landroid/view/LayoutInflater;

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListAdapter;->userDistanceInline:Z

    invoke-virtual {v0, v1, p2, p3, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->getView(Landroid/view/LayoutInflater;Landroid/view/View;Landroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method setUserDistanceInline(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListAdapter;->userDistanceInline:Z

    return-void
.end method
