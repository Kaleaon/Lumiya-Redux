.class Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;
.super Lcom/google/vr/sdk/controller/Controller$EventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private activeMoveControl:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private appButtonPressed:Z

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V
    .locals 1

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-direct {p0}, Lcom/google/vr/sdk/controller/Controller$EventListener;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->appButtonPressed:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->activeMoveControl:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    return-void
.end method


# virtual methods
.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_render_CardboardActivity$7_78808()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-wrap3(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;Z)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_render_CardboardActivity$7_78948()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-wrap3(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;Z)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_render_CardboardActivity$7_80726(Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;F)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-wrap1(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;F)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_render_CardboardActivity$7_80931(Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-wrap1(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;F)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_render_CardboardActivity$7_81145(Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;F)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get21(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->Right:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    if-eq p1, v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->Left:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    if-ne p1, v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-wrap1(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;F)V

    :cond_1
    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_render_CardboardActivity$7_81581(Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-wrap1(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;F)V

    return-void
.end method

.method public onConnectionStateChanged(I)V
    .locals 4

    invoke-super {p0, p1}, Lcom/google/vr/sdk/controller/Controller$EventListener;->onConnectionStateChanged(I)V

    const-string/jumbo v1, "Cardboard: Daydream controller is now %s"

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/Object;

    const/4 v0, 0x3

    if-ne p1, v0, :cond_0

    const-string/jumbo v0, "connected"

    :goto_0
    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get3(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    return-void

    :cond_0
    const-string/jumbo v0, "disconnected"

    goto :goto_0
.end method

.method public onUpdate()V
    .locals 7

    const/high16 v4, 0x3f800000    # 1.0f

    const/high16 v5, 0x3f000000    # 0.5f

    const/high16 v6, 0x40000000    # 2.0f

    const/4 v3, 0x0

    const/4 v1, 0x0

    invoke-super {p0}, Lcom/google/vr/sdk/controller/Controller$EventListener;->onUpdate()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get2(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/google/vr/sdk/controller/Controller;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/vr/sdk/controller/Controller;->update()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get2(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/google/vr/sdk/controller/Controller;

    move-result-object v0

    iget-boolean v0, v0, Lcom/google/vr/sdk/controller/Controller;->appButtonState:Z

    if-eqz v0, :cond_4

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->appButtonPressed:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$20;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$20;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get2(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/google/vr/sdk/controller/Controller;

    move-result-object v0

    iget-boolean v0, v0, Lcom/google/vr/sdk/controller/Controller;->appButtonState:Z

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->appButtonPressed:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get2(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/google/vr/sdk/controller/Controller;

    move-result-object v0

    iget-boolean v0, v0, Lcom/google/vr/sdk/controller/Controller;->isTouching:Z

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get2(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/google/vr/sdk/controller/Controller;

    move-result-object v0

    iget-object v0, v0, Lcom/google/vr/sdk/controller/Controller;->touch:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->x:F

    mul-float/2addr v0, v6

    sub-float/2addr v0, v4

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get2(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/google/vr/sdk/controller/Controller;

    move-result-object v2

    iget-object v2, v2, Lcom/google/vr/sdk/controller/Controller;->touch:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->y:F

    mul-float/2addr v2, v6

    sub-float/2addr v2, v4

    neg-float v2, v2

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v4

    cmpg-float v4, v4, v5

    if-gez v4, :cond_1

    move v0, v1

    :cond_1
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v4

    cmpg-float v4, v4, v5

    if-gez v4, :cond_2

    move v2, v1

    :cond_2
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v4

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpl-float v4, v4, v5

    if-ltz v4, :cond_7

    cmpl-float v2, v0, v1

    if-lez v2, :cond_5

    sget-object v2, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->Right:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    mul-float v1, v0, v6

    move-object v0, v2

    :goto_1
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->activeMoveControl:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    if-eq v0, v2, :cond_b

    if-eqz v0, :cond_a

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->activeMoveControl:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$29;

    invoke-direct {v3, v1, p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$29;-><init>(FLjava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_3
    :goto_2
    return-void

    :cond_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get2(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/google/vr/sdk/controller/Controller;

    move-result-object v0

    iget-boolean v0, v0, Lcom/google/vr/sdk/controller/Controller;->appButtonState:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->appButtonPressed:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$21;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$21;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0

    :cond_5
    cmpg-float v2, v0, v1

    if-gez v2, :cond_6

    sget-object v2, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->Left:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    neg-float v0, v0

    mul-float v1, v0, v6

    move-object v0, v2

    goto :goto_1

    :cond_6
    move-object v0, v3

    goto :goto_1

    :cond_7
    cmpl-float v0, v2, v1

    if-lez v0, :cond_8

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->Forward:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    mul-float v1, v2, v6

    goto :goto_1

    :cond_8
    cmpg-float v0, v2, v1

    if-gez v0, :cond_9

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->Backward:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    neg-float v1, v2

    mul-float/2addr v1, v6

    goto :goto_1

    :cond_9
    move-object v0, v3

    goto :goto_1

    :cond_a
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->activeMoveControl:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$27;

    invoke-direct {v2, p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$27;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->activeMoveControl:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    goto :goto_2

    :cond_b
    if-eqz v0, :cond_3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$30;

    invoke-direct {v3, v1, p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$30;-><init>(FLjava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_2

    :cond_c
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->activeMoveControl:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->activeMoveControl:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$28;

    invoke-direct {v2, p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$28;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;->activeMoveControl:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    goto :goto_2
.end method
