.class Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->-set0(Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;Z)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->-get1(Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;)Landroid/widget/LinearLayout;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->-get0(Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/ui/render/ChatEventOverlay;

    iget-wide v6, v1, Lcom/lumiyaviewer/lumiya/ui/render/ChatEventOverlay;->timestamp:J

    const-wide/16 v8, 0x1388

    add-long/2addr v6, v8

    cmp-long v1, v2, v6

    if-ltz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/render/ChatEventOverlay;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/ui/render/ChatEventOverlay;->textView:Landroid/widget/TextView;

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0xe

    if-lt v1, v5, :cond_1

    invoke-virtual {v0}, Landroid/widget/TextView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const/4 v5, 0x0

    invoke-virtual {v1, v5}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const-wide/16 v6, 0x3e8

    invoke-virtual {v1, v6, v7}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    new-instance v5, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog$1$1;

    invoke-direct {v5, p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog$1$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog$1;Landroid/widget/TextView;)V

    invoke-virtual {v1, v5}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->-get1(Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->postRemovingStaleChats()V

    return-void
.end method
