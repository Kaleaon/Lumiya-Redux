.class Lcom/lumiyaviewer/lumiya/react/RequestForwarder$DownstreamSubscription;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;
.implements Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;
.implements Lcom/lumiyaviewer/lumiya/react/UnsubscribableOne;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/react/RequestForwarder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DownstreamSubscription"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/lumiyaviewer/lumiya/react/Subscription$OnData",
        "<TTdown;>;",
        "Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;",
        "Lcom/lumiyaviewer/lumiya/react/UnsubscribableOne;"
    }
.end annotation


# instance fields
.field private final key:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TKup;"
        }
    .end annotation
.end field

.field private final subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<TKdown;TTdown;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/react/RequestForwarder;


# direct methods
.method private constructor <init>(Lcom/lumiyaviewer/lumiya/react/RequestForwarder;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TKup;TKdown;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/react/RequestForwarder$DownstreamSubscription;->this$0:Lcom/lumiyaviewer/lumiya/react/RequestForwarder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/react/RequestForwarder$DownstreamSubscription;->key:Ljava/lang/Object;

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/react/RequestForwarder;->-get2(Lcom/lumiyaviewer/lumiya/react/RequestForwarder;)Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/react/RequestForwarder;->-get0(Lcom/lumiyaviewer/lumiya/react/RequestForwarder;)Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-interface {v0, p3, v1, p0, p0}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestForwarder$DownstreamSubscription;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/react/RequestForwarder;Ljava/lang/Object;Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/react/RequestForwarder$DownstreamSubscription;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/react/RequestForwarder$DownstreamSubscription;-><init>(Lcom/lumiyaviewer/lumiya/react/RequestForwarder;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method synthetic lambda$-com_lumiyaviewer_lumiya_react_RequestForwarder$DownstreamSubscription_827(Ljava/lang/Object;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestForwarder$DownstreamSubscription;->this$0:Lcom/lumiyaviewer/lumiya/react/RequestForwarder;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/RequestForwarder$DownstreamSubscription;->key:Ljava/lang/Object;

    invoke-static {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/react/RequestForwarder;->-wrap0(Lcom/lumiyaviewer/lumiya/react/RequestForwarder;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public onData(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTdown;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestForwarder$DownstreamSubscription;->this$0:Lcom/lumiyaviewer/lumiya/react/RequestForwarder;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/react/RequestForwarder;->-get0(Lcom/lumiyaviewer/lumiya/react/RequestForwarder;)Ljava/util/concurrent/Executor;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestForwarder$DownstreamSubscription;->this$0:Lcom/lumiyaviewer/lumiya/react/RequestForwarder;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/react/RequestForwarder;->-get0(Lcom/lumiyaviewer/lumiya/react/RequestForwarder;)Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/-$Lambda$swF2K5wPKI2_xA-bWP-XwHVnywU;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/react/-$Lambda$swF2K5wPKI2_xA-bWP-XwHVnywU;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestForwarder$DownstreamSubscription;->this$0:Lcom/lumiyaviewer/lumiya/react/RequestForwarder;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/RequestForwarder$DownstreamSubscription;->key:Ljava/lang/Object;

    invoke-static {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/react/RequestForwarder;->-wrap0(Lcom/lumiyaviewer/lumiya/react/RequestForwarder;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestForwarder$DownstreamSubscription;->this$0:Lcom/lumiyaviewer/lumiya/react/RequestForwarder;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/react/RequestForwarder;->-get1(Lcom/lumiyaviewer/lumiya/react/RequestForwarder;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/RequestForwarder$DownstreamSubscription;->key:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultError(Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public unsubscribe()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestForwarder$DownstreamSubscription;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->unsubscribe()V

    return-void
.end method
