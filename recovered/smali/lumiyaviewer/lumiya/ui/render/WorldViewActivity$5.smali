.class Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$5;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnTouchListener;


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

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$5;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 5

    const/4 v2, 0x0

    const/4 v1, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$5;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get11(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Z

    move-result v3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    move v0, v2

    :goto_0
    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$5;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get11(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Z

    move-result v4

    if-eqz v4, :cond_0

    xor-int/lit8 v4, v3, 0x1

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$5;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get14(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    move-result-object v4

    invoke-virtual {v4, v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->setIsInteracting(Z)V

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$5;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$5;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get10(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Z

    move-result v4

    invoke-static {v1, v4}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-set9(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;Z)Z

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$5;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get19(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Landroid/view/ScaleGestureDetector;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    or-int/2addr v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$5;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get5(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Landroid/support/v4/view/GestureDetectorCompat;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/support/v4/view/GestureDetectorCompat;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    or-int/2addr v0, v1

    if-eqz v3, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$5;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get11(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$5;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get14(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    move-result-object v1

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->setIsInteracting(Z)V

    :cond_1
    return v0

    :pswitch_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$5;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-set5(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;Z)Z

    move v0, v1

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$5;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-set5(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;Z)Z

    move v0, v1

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
