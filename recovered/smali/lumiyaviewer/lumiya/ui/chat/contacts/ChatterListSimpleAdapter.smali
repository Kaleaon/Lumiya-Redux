.class Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSimpleAdapter;
.super Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListAdapter;


# instance fields
.field private data:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<+",
            "Lcom/lumiyaviewer/lumiya/ui/chat/ChatterDisplayInfo;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 1

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListAdapter;-><init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSimpleAdapter;->data:Lcom/google/common/collect/ImmutableList;

    return-void
.end method


# virtual methods
.method public areAllItemsEnabled()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSimpleAdapter;->data:Lcom/google/common/collect/ImmutableList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSimpleAdapter;->data:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSimpleAdapter;->data:Lcom/google/common/collect/ImmutableList;

    if-eqz v0, :cond_0

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSimpleAdapter;->data:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSimpleAdapter;->data:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_0
    return-object v1
.end method

.method public getItemId(I)J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public hasStableIds()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSimpleAdapter;->data:Lcom/google/common/collect/ImmutableList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSimpleAdapter;->data:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->isEmpty()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public isEnabled(I)Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method protected setData(Lcom/google/common/collect/ImmutableList;)V
    .locals 0
    .param p1    # Lcom/google/common/collect/ImmutableList;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableList",
            "<+",
            "Lcom/lumiyaviewer/lumiya/ui/chat/ChatterDisplayInfo;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSimpleAdapter;->data:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSimpleAdapter;->notifyDataSetChanged()V

    return-void
.end method
