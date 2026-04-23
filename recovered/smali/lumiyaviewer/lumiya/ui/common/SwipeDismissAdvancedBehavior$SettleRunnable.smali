.class Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$SettleRunnable;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SettleRunnable"
.end annotation


# instance fields
.field private final mDismiss:Z

.field private final mView:Landroid/view/View;

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;Landroid/view/View;Z)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$SettleRunnable;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$SettleRunnable;->mView:Landroid/view/View;

    iput-boolean p3, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$SettleRunnable;->mDismiss:Z

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$SettleRunnable;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get5(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)Landroid/support/v4/widget/ViewDragHelper;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$SettleRunnable;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get5(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)Landroid/support/v4/widget/ViewDragHelper;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/ViewDragHelper;->continueSettling(Z)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$SettleRunnable;->mView:Landroid/view/View;

    invoke-static {v0, p0}, Landroid/support/v4/view/ViewCompat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$SettleRunnable;->mDismiss:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$SettleRunnable;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get3(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$OnDismissListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$SettleRunnable;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;->-get3(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior;)Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$OnDismissListener;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$SettleRunnable;->mView:Landroid/view/View;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissAdvancedBehavior$OnDismissListener;->onDismiss(Landroid/view/View;)V

    goto :goto_0
.end method
