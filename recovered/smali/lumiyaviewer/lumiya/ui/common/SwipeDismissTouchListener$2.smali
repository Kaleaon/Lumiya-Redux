.class Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$2;
.super Landroid/animation/AnimatorListenerAdapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->performDismiss()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;

.field final synthetic val$lp:Landroid/view/ViewGroup$LayoutParams;

.field final synthetic val$originalHeight:I


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;Landroid/view/ViewGroup$LayoutParams;I)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$2;->val$lp:Landroid/view/ViewGroup$LayoutParams;

    iput p3, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$2;->val$originalHeight:I

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 4

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->-get0(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;)Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$DismissCallbacks;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->-get2(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;)Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->-get1(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$DismissCallbacks;->onDismiss(Landroid/view/View;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->-get2(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;)Landroid/view/View;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->-get2(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setTranslationX(F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->-get2(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setTranslationY(F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$2;->val$lp:Landroid/view/ViewGroup$LayoutParams;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$2;->val$originalHeight:I

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->-get2(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$2;->val$lp:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method
