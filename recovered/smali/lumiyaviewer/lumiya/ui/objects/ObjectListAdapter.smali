.class Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;
.super Landroid/widget/BaseExpandableListAdapter;


# static fields
.field private static final HIERARCHY_PADDING_DP:I = 0xa


# instance fields
.field private final context:Landroid/content/Context;

.field private objects:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Landroid/widget/BaseExpandableListAdapter;-><init>()V

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;->objects:Lcom/google/common/collect/ImmutableList;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;->context:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public getChild(II)Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;->objects:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo$HasChildrenObjects;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo$HasChildrenObjects;

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo$HasChildrenObjects;->getChildren()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic getChild(II)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;->getChild(II)Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;

    move-result-object v0

    return-object v0
.end method

.method public getChildId(II)J
    .locals 2

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;->getChild(II)Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;

    move-result-object v0

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;->localID:I

    int-to-long v0, v0

    return-wide v0
.end method

.method public getChildView(IIZLandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 6

    const/4 v5, 0x0

    const v4, 0x7f100236

    const v3, 0x7f100235

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;->getChild(II)Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;

    move-result-object v0

    invoke-virtual {p0, v0, p4, p5}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;->getView(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method public getChildrenCount(I)I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;->objects:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo$HasChildrenObjects;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo$HasChildrenObjects;

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo$HasChildrenObjects;->getChildren()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getData()Lcom/google/common/collect/ImmutableList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;->objects:Lcom/google/common/collect/ImmutableList;

    return-object v0
.end method

.method public getGroup(I)Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;->objects:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;

    return-object v0
.end method

.method public bridge synthetic getGroup(I)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;->getGroup(I)Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;

    move-result-object v0

    return-object v0
.end method

.method public getGroupCount()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;->objects:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    return v0
.end method

.method public getGroupId(I)J
    .locals 2

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;->getGroup(I)Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;

    move-result-object v0

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;->localID:I

    int-to-long v0, v0

    return-wide v0
.end method

.method public getGroupView(IZLandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 7

    const/4 v6, 0x0

    const/16 v5, 0x8

    const/4 v2, 0x0

    const v4, 0x7f100236

    const v3, 0x7f100235

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;->getGroup(I)Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;

    move-result-object v0

    invoke-virtual {p0, v0, p3, p4}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;->getView(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;->getChildrenCount(I)I

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    :goto_0
    instance-of v1, p4, Landroid/widget/ExpandableListView;

    if-eqz v1, :cond_2

    check-cast p4, Landroid/widget/ExpandableListView;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter$1;

    invoke-direct {v1, p0, p4, p1}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;Landroid/widget/ExpandableListView;I)V

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :goto_1
    return-object v0

    :cond_0
    if-eqz p2, :cond_1

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_1
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_2
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_1
.end method

.method public getView(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 9

    const v8, 0x7f100239

    const/4 v7, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x4

    const/4 v1, 0x0

    if-nez p2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;->context:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v4, 0x7f040077

    invoke-virtual {v0, v4, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    :cond_0
    const/high16 v0, 0x41200000    # 10.0f

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    invoke-static {v7, v0, v4}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    iget v4, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;->hierarchyLevel:I

    int-to-float v4, v4

    mul-float/2addr v0, v4

    const v4, 0x7f100237

    invoke-virtual {p2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    float-to-int v0, v0

    const/4 v6, -0x1

    invoke-direct {v5, v0, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const v0, 0x7f100238

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLAvatarObjectDisplayInfo;

    if-eqz v0, :cond_2

    move v0, v1

    :goto_0
    invoke-virtual {v4, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;->name:Ljava/lang/String;

    if-eqz v0, :cond_3

    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;->name:Ljava/lang/String;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_1
    const v0, 0x7f10023a

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget v4, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;->distance:F

    invoke-static {v4}, Ljava/lang/Float;->isNaN(F)Z

    move-result v4

    if-nez v4, :cond_1

    const-string/jumbo v2, "%d m"

    new-array v4, v7, [Ljava/lang/Object;

    iget v5, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;->distance:F

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v1

    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    :cond_1
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLPrimObjectDisplayInfo;

    if-eqz v0, :cond_6

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLPrimObjectDisplayInfo;

    const v0, 0x7f10023c

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLPrimObjectDisplayInfo;->touchable:Z

    if-eqz v0, :cond_4

    move v0, v1

    :goto_2
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f10023b

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-boolean v2, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLPrimObjectDisplayInfo;->payable:Z

    if-eqz v2, :cond_5

    :goto_3
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :goto_4
    return-object p2

    :cond_2
    const/16 v0, 0x8

    goto :goto_0

    :cond_3
    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v4, 0x7f090239

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(I)V

    goto :goto_1

    :cond_4
    move v0, v3

    goto :goto_2

    :cond_5
    move v1, v3

    goto :goto_3

    :cond_6
    const v0, 0x7f10023c

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f10023b

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_4
.end method

.method public hasStableIds()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isChildSelectable(II)Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public setData(Lcom/google/common/collect/ImmutableList;)V
    .locals 0
    .param p1    # Lcom/google/common/collect/ImmutableList;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;->objects:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;->notifyDataSetChanged()V

    return-void
.end method
