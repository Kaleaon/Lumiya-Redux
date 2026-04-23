.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList$1;
.super Lcom/lumiyaviewer/lumiya/react/RequestFinalProcessor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/react/RequestFinalProcessor",
        "<",
        "Ljava/util/UUID;",
        "Ljava/lang/Float;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

.field final synthetic val$userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;Lcom/lumiyaviewer/lumiya/react/RequestSource;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList$1;->val$userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-direct {p0, p2, p3}, Lcom/lumiyaviewer/lumiya/react/RequestFinalProcessor;-><init>(Lcom/lumiyaviewer/lumiya/react/RequestSource;Ljava/util/concurrent/Executor;)V

    return-void
.end method


# virtual methods
.method protected processRequest(Ljava/util/UUID;)Ljava/lang/Float;
    .locals 2
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList$1;->val$userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->minimap:Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->getDistanceToUser(Ljava/util/UUID;)Ljava/lang/Float;

    move-result-object v0

    return-object v0

    :cond_0
    return-object v1
.end method

.method protected bridge synthetic processRequest(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    check-cast p1, Ljava/util/UUID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList$1;->processRequest(Ljava/util/UUID;)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method
