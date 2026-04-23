.class public abstract Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;
.super Ljava/lang/Object;


# instance fields
.field private final bus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

.field private volatile isPending:Z

.field private volatile lastTimeFired:J

.field private final lock:Ljava/lang/Object;

.field private final minInterval:J


# direct methods
.method protected constructor <init>(Lcom/lumiyaviewer/lumiya/eventbus/EventBus;J)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;->lock:Ljava/lang/Object;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;->lastTimeFired:J

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;->isPending:Z

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;->bus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    iput-wide p2, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;->minInterval:J

    return-void
.end method


# virtual methods
.method public fire()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;->lock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;->isPending:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;->firePending()V

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public firePending()V
    .locals 8

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;->isPending:Z

    if-eqz v2, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;->lastTimeFired:J

    iget-wide v6, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;->minInterval:J

    add-long/2addr v4, v6

    cmp-long v4, v2, v4

    if-ltz v4, :cond_0

    const/4 v0, 0x1

    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;->isPending:Z

    iput-wide v2, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;->lastTimeFired:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;->onActualFire()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;->getEventToFire()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;->bus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;->bus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method protected abstract getEventToFire()Ljava/lang/Object;
.end method

.method protected onActualFire()V
    .locals 0

    return-void
.end method
