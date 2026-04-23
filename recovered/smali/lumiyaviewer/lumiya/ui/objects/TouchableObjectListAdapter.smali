.class Lcom/lumiyaviewer/lumiya/ui/objects/TouchableObjectListAdapter;
.super Landroid/widget/BaseAdapter;


# instance fields
.field private final context:Landroid/content/Context;

.field private objects:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TouchableObjectListAdapter;->objects:Lcom/google/common/collect/ImmutableList;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TouchableObjectListAdapter;->context:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TouchableObjectListAdapter;->objects:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;
    .locals 1

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TouchableObjectListAdapter;->objects:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TouchableObjectListAdapter;->objects:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/objects/TouchableObjectListAdapter;->getItem(I)Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/objects/TouchableObjectListAdapter;->getItem(I)Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    int-to-long v0, v0

    :goto_0
    return-wide v0

    :cond_0
    const-wide/16 v0, -0x1

    goto :goto_0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5

    const/4 v2, 0x0

    const/4 v0, 0x0

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/objects/TouchableObjectListAdapter;->getItem(I)Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    move-result-object v3

    if-nez v3, :cond_0

    return-object v0

    :cond_0
    if-eqz p2, :cond_3

    invoke-virtual {p2}, Landroid/view/View;->getId()I

    move-result v1

    const v4, 0x7f100299

    if-eq v1, v4, :cond_3

    :goto_0
    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TouchableObjectListAdapter;->context:Landroid/content/Context;

    const-string/jumbo v1, "layout_inflater"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    const v1, 0x7f0400ae

    invoke-virtual {v0, v1, p3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    move-object v1, v0

    :goto_1
    const v0, 0x7f10029a

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f10029b

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isTouchable()Z

    move-result v0

    if-eqz v0, :cond_1

    move v0, v2

    :goto_2
    invoke-virtual {v4, v0}, Landroid/view/View;->setVisibility(I)V

    return-object v1

    :cond_1
    const/4 v0, 0x4

    goto :goto_2

    :cond_2
    move-object v1, v0

    goto :goto_1

    :cond_3
    move-object v0, p2

    goto :goto_0
.end method

.method public hasStableIds()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TouchableObjectListAdapter;->objects:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public setData(Lcom/google/common/collect/ImmutableList;)V
    .locals 0
    .param p1    # Lcom/google/common/collect/ImmutableList;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    :goto_0
    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TouchableObjectListAdapter;->objects:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/TouchableObjectListAdapter;->notifyDataSetChanged()V

    return-void

    :cond_0
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object p1

    goto :goto_0
.end method
