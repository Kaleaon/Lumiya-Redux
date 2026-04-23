.class Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$4;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$4;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$4;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get2(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Landroid/animation/ValueAnimator;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$4;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get2(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Landroid/animation/ValueAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$4;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->insetsBackground:Landroid/widget/FrameLayout;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setAlpha(F)V

    :cond_1
    return-void
.end method
