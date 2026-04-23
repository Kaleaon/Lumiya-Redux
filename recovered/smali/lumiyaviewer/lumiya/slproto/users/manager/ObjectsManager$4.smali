.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$4;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$4;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    const/4 v6, 0x0

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$4;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->-get1(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$4;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->-get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;)Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    monitor-exit v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$4;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->-get8(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v1

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->getAgentPosition()Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;

    move-result-object v1

    :goto_0
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/AgentPosition;->getImmutablePosition()Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    move-result-object v0

    move-object v1, v0

    :goto_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$4;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->-get5(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;)Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    const-string/jumbo v3, "ObjectList: updating object list, parcelInfo %s, agentPosVector %s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v0, v4, v6

    const/4 v5, 0x1

    aput-object v1, v4, v5

    invoke-static {v3, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz v0, :cond_2

    if-eqz v1, :cond_2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$4;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->-get2(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;)Lcom/lumiyaviewer/lumiya/slproto/users/MultipleChatterNameRetriever;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->getDisplayObjects(Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;Lcom/lumiyaviewer/lumiya/slproto/users/MultipleChatterNameRetriever;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDisplayList;

    move-result-object v0

    :goto_2
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$4;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->-get3(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_0
    move-object v1, v0

    goto :goto_0

    :cond_1
    move-object v1, v0

    goto :goto_1

    :cond_2
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDisplayList;

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    invoke-direct {v0, v1, v6}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDisplayList;-><init>(Lcom/google/common/collect/ImmutableList;Z)V

    goto :goto_2
.end method
