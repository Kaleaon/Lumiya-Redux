.class public Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;
.super Ljava/lang/Object;


# annotations
.annotation build Ljavax/annotation/concurrent/ThreadSafe;
.end annotation


# instance fields
.field private isValid:Z

.field private lastAgentDataMillis:J

.field private final lock:Ljava/lang/Object;

.field private final position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field private final velocity:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->lock:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->isValid:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->velocity:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->lastAgentDataMillis:J

    return-void
.end method


# virtual methods
.method public getImmutablePosition()Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;
    .locals 3
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->isValid:Z

    if-eqz v2, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public getInterpolatedPosition(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Z
    .locals 6
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v2, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->isValid:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->velocity:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    cmpl-float v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->velocity:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    cmpl-float v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->velocity:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    cmpl-float v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    const/4 v0, 0x1

    :goto_1
    monitor-exit v1

    return v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->velocity:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->lastAgentDataMillis:J

    sub-long/2addr v2, v4

    long-to-float v2, v2

    const/high16 v3, 0x447a0000    # 1000.0f

    div-float/2addr v2, v3

    invoke-virtual {p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->setMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->add(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public getPosition()Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
    .locals 3
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->isValid:Z

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public getPosition(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Z
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->isValid:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit v1

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public isValid()Z
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->lock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->isValid:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public set(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 4
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->velocity:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    if-eqz p2, :cond_0

    :goto_0
    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->lastAgentDataMillis:J

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->isValid:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :cond_0
    :try_start_1
    sget-object p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->Zero:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method
