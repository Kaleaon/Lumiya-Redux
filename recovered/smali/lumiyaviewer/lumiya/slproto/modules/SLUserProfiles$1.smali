.class Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$1;
.super Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler",
        "<",
        "Ljava/util/UUID;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onRequest(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Ljava/util/UUID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$1;->onRequest(Ljava/util/UUID;)V

    return-void
.end method

.method public onRequest(Ljava/util/UUID;)V
    .locals 5
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v4, 0x1

    const-string/jumbo v0, "AvatarGroupList: Requesting avatar properties for %s"

    new-array v1, v4, [Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequest;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequest$AgentData;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequest$AgentData;->AvatarID:Ljava/util/UUID;

    iput-boolean v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequest;->isReliable:Z

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    invoke-virtual {p1, v0}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->requestAgentDataUpdate()V

    :cond_0
    return-void
.end method
