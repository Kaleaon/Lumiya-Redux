.class Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;->getGroupView(IZLandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;

.field final synthetic val$expandableListView:Landroid/widget/ExpandableListView;

.field final synthetic val$groupPosition:I


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;Landroid/widget/ExpandableListView;I)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter$1;->val$expandableListView:Landroid/widget/ExpandableListView;

    iput p3, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter$1;->val$groupPosition:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter$1;->val$expandableListView:Landroid/widget/ExpandableListView;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter$1;->val$groupPosition:I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/widget/ExpandableListView;->expandGroup(IZ)Z

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter$1;->val$expandableListView:Landroid/widget/ExpandableListView;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter$1;->val$groupPosition:I

    invoke-virtual {v0, v1}, Landroid/widget/ExpandableListView;->expandGroup(I)Z

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter$1;->val$expandableListView:Landroid/widget/ExpandableListView;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter$1;->val$groupPosition:I

    invoke-virtual {v0, v1}, Landroid/widget/ExpandableListView;->collapseGroup(I)Z

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x7f100235
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
