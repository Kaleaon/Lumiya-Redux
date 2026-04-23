.class Lcom/lumiyaviewer/lumiya/eventbus/EventBus$EventInvocation;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/eventbus/EventBus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "EventInvocation"
.end annotation


# instance fields
.field private final activity:Landroid/app/Activity;

.field private final event:Ljava/lang/Object;

.field private final handler:Landroid/os/Handler;

.field private final method:Ljava/lang/reflect/Method;

.field private final subscriber:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/reflect/Method;Landroid/os/Handler;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$EventInvocation;->event:Ljava/lang/Object;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$EventInvocation;->activity:Landroid/app/Activity;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$EventInvocation;->subscriber:Ljava/lang/Object;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$EventInvocation;->method:Ljava/lang/reflect/Method;

    iput-object p5, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$EventInvocation;->handler:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$EventInvocation;->method:Ljava/lang/reflect/Method;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$EventInvocation;->subscriber:Ljava/lang/Object;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$EventInvocation;->event:Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public runOnUIThread()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$EventInvocation;->activity:Landroid/app/Activity;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$EventInvocation;->activity:Landroid/app/Activity;

    invoke-virtual {v0, p0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$EventInvocation;->handler:Landroid/os/Handler;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$EventInvocation;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$EventInvocation;->run()V

    goto :goto_0
.end method
