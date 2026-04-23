.class Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView$1;
.super Landroid/os/Handler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "UI!!! PICKED OBJECT isAvatar "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAvatar()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " local ID "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    instance-of v1, v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    if-eqz v1, :cond_1

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->isMyAvatar()Z

    move-result v1

    :goto_1
    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->-get0(Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;)Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->handlePickedObject(Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;)V

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    goto :goto_1

    :pswitch_1
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->-get0(Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;)Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->setTouchedObject(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->-get0(Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;)Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->rendererSurfaceCreated()V

    goto :goto_0

    :pswitch_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->-get0(Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;)Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->rendererShaderCompileError()V

    goto/16 :goto_0

    :pswitch_4
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->-get0(Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;)Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    move-result-object v1

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/Bitmap;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->processScreenshot(Landroid/graphics/Bitmap;)V

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
