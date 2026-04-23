.class Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerList;
.super Ljava/util/LinkedList;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "HandlerList"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/LinkedList",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerInfo;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/util/LinkedList;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerList;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerList;-><init>()V

    return-void
.end method


# virtual methods
.method public deleteAll(Ljava/lang/Object;)V
    .locals 4

    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerInfo;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerInfo;->-get0(Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerInfo;)Ljava/lang/ref/WeakReference;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_1

    if-ne v3, p1, :cond_0

    :cond_1
    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerList;->removeAll(Ljava/util/Collection;)Z

    return-void
.end method

.method public invokeAll(Ljava/lang/Object;)V
    .locals 2

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerInfo;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageRouter$HandlerInfo;->invoke(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-void
.end method
