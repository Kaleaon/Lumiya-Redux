.class Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;->-set0(Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;Z)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;->-get3(Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;->-get0(Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;->updateTimestamp(Landroid/content/Context;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;->-get3(Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;->-set0(Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;Z)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;->-get1(Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;->-get2(Lcom/lumiyaviewer/lumiya/ui/chat/ChatEventTimestampUpdater;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/32 v2, 0xea60

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_2
    return-void
.end method
