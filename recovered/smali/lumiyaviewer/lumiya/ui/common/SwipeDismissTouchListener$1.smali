.class Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$1;
.super Landroid/animation/AnimatorListenerAdapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;->-wrap0(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissTouchListener;)V

    return-void
.end method
