.class Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog$1$1;
.super Landroid/animation/AnimatorListenerAdapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog$1;

.field final synthetic val$textView:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog$1;Landroid/widget/TextView;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog$1$1;->this$1:Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog$1;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog$1$1;->val$textView:Landroid/widget/TextView;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog$1$1;->this$1:Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog$1;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->-get1(Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;)Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog$1$1;->val$textView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    return-void
.end method
