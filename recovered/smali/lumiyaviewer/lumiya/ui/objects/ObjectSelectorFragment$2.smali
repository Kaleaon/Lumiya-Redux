.class Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMenuItemActionCollapse(Landroid/view/MenuItem;)Z
    .locals 4

    const v3, 0x7f100229

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/animation/Animation;->cancel()V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->-wrap0(Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;)V

    const/4 v0, 0x1

    return v0
.end method

.method public onMenuItemActionExpand(Landroid/view/MenuItem;)Z
    .locals 4

    const v3, 0x7f100229

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f05000f

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->-wrap0(Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;)V

    const/4 v0, 0x1

    return v0
.end method
