.class Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$3;
.super Landroid/os/Handler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$3;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6

    const/4 v3, 0x2

    const/4 v5, 0x1

    const/4 v1, 0x0

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

    const-string/jumbo v2, "Cardboard: PICKED OBJECT isAvatar %b localID %d"

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAvatar()Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v3, v1

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget v4, v4, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    instance-of v2, v2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    if-eqz v2, :cond_1

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->isMyAvatar()Z

    move-result v1

    :cond_1
    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$3;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-wrap2(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;)V

    goto :goto_0

    :pswitch_1
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    const-string/jumbo v2, "Cardboard: touched object isAvatar %b localID %d"

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAvatar()Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v3, v1

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v5

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
