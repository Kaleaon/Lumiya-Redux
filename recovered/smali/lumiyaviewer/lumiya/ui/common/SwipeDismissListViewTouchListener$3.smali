.class Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$3;
.super Lcom/nineoldandroids/animation/AnimatorListenerAdapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;

.field final synthetic val$downPosition:I

.field final synthetic val$downView:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;Landroid/view/View;I)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$3;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$3;->val$downView:Landroid/view/View;

    iput p3, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$3;->val$downPosition:I

    invoke-direct {p0}, Lcom/nineoldandroids/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$3;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$3;->val$downView:Landroid/view/View;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$3;->val$downPosition:I

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->-wrap0(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;Landroid/view/View;I)V

    return-void
.end method
