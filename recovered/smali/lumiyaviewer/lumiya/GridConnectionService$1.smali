.class Lcom/lumiyaviewer/lumiya/GridConnectionService$1;
.super Landroid/os/Handler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/GridConnectionService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/GridConnectionService;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/GridConnectionService;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService$1;->this$0:Lcom/lumiyaviewer/lumiya/GridConnectionService;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7

    const/4 v6, 0x0

    const/4 v5, 0x0

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    const-string/jumbo v0, "License: License check ok."

    new-array v1, v5, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService$1;->this$0:Lcom/lumiyaviewer/lumiya/GridConnectionService;

    invoke-static {v1, v0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->-wrap0(Lcom/lumiyaviewer/lumiya/GridConnectionService;Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;)V

    goto :goto_0

    :pswitch_1
    const-string/jumbo v0, "License: License check failed."

    new-array v1, v5, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService$1;->this$0:Lcom/lumiyaviewer/lumiya/GridConnectionService;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->-get0(Lcom/lumiyaviewer/lumiya/GridConnectionService;)Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/events/SLLoginResultEvent;

    const-string/jumbo v2, "You don\'t have valid license to use this application."

    invoke-direct {v1, v5, v2, v6}, Lcom/lumiyaviewer/lumiya/slproto/events/SLLoginResultEvent;-><init>(ZLjava/lang/String;Ljava/util/UUID;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    goto :goto_0

    :pswitch_2
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    :goto_1
    const-string/jumbo v1, "License: License check app error: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v0, v2, v5

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService$1;->this$0:Lcom/lumiyaviewer/lumiya/GridConnectionService;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->-get0(Lcom/lumiyaviewer/lumiya/GridConnectionService;)Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/events/SLLoginResultEvent;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "License check failed: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v3, "."

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v5, v0, v6}, Lcom/lumiyaviewer/lumiya/slproto/events/SLLoginResultEvent;-><init>(ZLjava/lang/String;Ljava/util/UUID;)V

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    const-string/jumbo v0, "Internal application error"

    goto :goto_1

    nop

    :pswitch_data_0
    .packed-switch 0x7f100019
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
