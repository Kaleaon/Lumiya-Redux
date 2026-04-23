.class public Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment;
.super Landroid/support/v4/app/Fragment;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment$1;
    }
.end annotation


# static fields
.field private static final AGENT_UUID_KEY:Ljava/lang/String; = "agentUUID"


# instance fields
.field private final itemTouchCallback:Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;


# direct methods
.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    return-object v0
.end method

.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment$1;

    const/4 v1, 0x0

    const/16 v2, 0xc

    invoke-direct {v0, p0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment;II)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment;->itemTouchCallback:Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;

    return-void
.end method

.method public static create(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment;
    .locals 4
    .param p0    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string/jumbo v2, "agentUUID"

    invoke-virtual {p0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method private getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .locals 3
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string/jumbo v1, "agentUUID"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v1, "agentUUID"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    return-object v0

    :cond_0
    return-object v2
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 6
    .param p2    # Landroid/view/ViewGroup;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/os/Bundle;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v5, 0x1

    const/4 v4, 0x0

    const v0, 0x7f04007a

    invoke-virtual {p1, v0, p2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    const v0, 0x7f10023f

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, v5}, Landroid/support/v7/widget/RecyclerView;->setHasFixedSize(Z)V

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;

    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3, v5, v4}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    new-instance v2, Landroid/support/v7/widget/helper/ItemTouchHelper;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment;->itemTouchCallback:Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;

    invoke-direct {v2, v3}, Landroid/support/v7/widget/helper/ItemTouchHelper;-><init>(Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;)V

    invoke-virtual {v2, v0}, Landroid/support/v7/widget/helper/ItemTouchHelper;->attachToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    return-object v1
.end method

.method public onStart()V
    .locals 5

    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStart()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    const v2, 0x7f10023f

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    if-eqz v0, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsAdapter;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectPopupsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->getObjectPopups()Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;

    move-result-object v4

    invoke-direct {v2, v3, v4, v1}, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsAdapter;-><init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/SubscribableList;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 3

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objpopup/ObjectPopupsFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    const v1, 0x7f10023f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    if-eqz v0, :cond_0

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    :cond_0
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStop()V

    return-void
.end method
