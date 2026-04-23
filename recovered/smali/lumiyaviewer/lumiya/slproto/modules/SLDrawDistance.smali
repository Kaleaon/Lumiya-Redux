.class public Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;
.super Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;


# static fields
.field public static final CHAT_RANGE:F = 20.0f

.field private static final DRAW_RANGE_TIMEOUT:J = 0x2710L

.field public static final MIN_DRAW_RANGE:F = 10.5f


# instance fields
.field private activeDrawDistance:F

.field private defaultDrawDistanceSince:J

.field private defaultTimerSet:Z

.field private volatile keepDrawDistance:Z

.field private keepSelectDistance:F

.field private objectSelectDistance:F

.field private volatile objectSelectionActive:Z

.field private wantedDrawDistance:F

.field private worldDrawDistance:F

.field private volatile worldViewActive:Z


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 3

    const/high16 v0, 0x41a00000    # 20.0f

    const/4 v2, 0x0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->worldViewActive:Z

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->objectSelectionActive:Z

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->keepDrawDistance:Z

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->worldDrawDistance:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->objectSelectDistance:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->keepSelectDistance:F

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->activeDrawDistance:F

    const/high16 v0, 0x41280000    # 10.5f

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->wantedDrawDistance:F

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->defaultDrawDistanceSince:J

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->defaultTimerSet:Z

    return-void
.end method

.method private declared-synchronized updateWantedDrawDistance()V
    .locals 8

    const/4 v1, 0x1

    monitor-enter p0

    const/high16 v0, 0x41280000    # 10.5f

    :try_start_0
    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->worldViewActive:Z

    if-eqz v2, :cond_0

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->worldDrawDistance:F

    invoke-static {v0, v2}, Ljava/lang/Math;->max(FF)F

    move-result v0

    :cond_0
    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->objectSelectionActive:Z

    if-eqz v2, :cond_1

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->objectSelectDistance:F

    invoke-static {v0, v2}, Ljava/lang/Math;->max(FF)F

    move-result v0

    :cond_1
    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->keepDrawDistance:Z

    if-eqz v2, :cond_2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->keepSelectDistance:F

    invoke-static {v0, v2}, Ljava/lang/Math;->max(FF)F

    move-result v0

    :cond_2
    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->worldViewActive:Z

    if-nez v2, :cond_3

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->objectSelectionActive:Z

    if-nez v2, :cond_3

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->keepDrawDistance:Z

    :cond_3
    if-nez v1, :cond_6

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->defaultTimerSet:Z

    if-nez v1, :cond_4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->defaultDrawDistanceSince:J

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->defaultTimerSet:Z

    :cond_4
    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->wantedDrawDistance:F

    cmpl-float v1, v0, v1

    if-eqz v1, :cond_5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->defaultDrawDistanceSince:J

    const-wide/16 v6, 0x2710

    add-long/2addr v4, v6

    cmp-long v1, v2, v4

    if-gez v1, :cond_5

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->wantedDrawDistance:F

    :cond_5
    :goto_0
    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->wantedDrawDistance:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_6
    const/4 v1, 0x0

    :try_start_1
    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->defaultTimerSet:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public declared-synchronized Disable3DView()V
    .locals 1

    monitor-enter p0

    :try_start_0
    const-string/jumbo v0, "DrawDistance: Disable 3D View."

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->worldViewActive:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->worldViewActive:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->DisableFastUpdates()V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->TryWakeUp()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized DisableKeepDistance()V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->keepDrawDistance:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized DisableObjectSelect()V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->objectSelectionActive:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->TryWakeUp()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized Enable3DView(I)V
    .locals 2

    monitor-enter p0

    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Enable3DView: Setting drawDistance to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    int-to-float v0, p1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->worldDrawDistance:F

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->worldViewActive:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->worldViewActive:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->EnableFastUpdates()V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    int-to-float v1, p1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->setDrawDistance(F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->TryWakeUp()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized EnableKeepDistance(F)V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->keepDrawDistance:Z

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->keepSelectDistance:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized EnableObjectSelect()V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->objectSelectionActive:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->TryWakeUp()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getDrawDistanceForUpdate()F
    .locals 1

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->updateWantedDrawDistance()V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->wantedDrawDistance:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->activeDrawDistance:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->activeDrawDistance:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getObjectSelectRange()F
    .locals 1

    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->objectSelectDistance:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized is3DViewEnabled()Z
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->worldViewActive:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isObjectSelectEnabled()Z
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->objectSelectionActive:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized needUpdateDrawDistance()Z
    .locals 2

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->updateWantedDrawDistance()V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->wantedDrawDistance:F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->activeDrawDistance:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setObjectSelectRange(F)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->objectSelectDistance:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->TryWakeUp()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
