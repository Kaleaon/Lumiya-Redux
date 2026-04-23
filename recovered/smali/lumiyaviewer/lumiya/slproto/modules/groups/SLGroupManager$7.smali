.class Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$7;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->SetGroupContribution(Ljava/util/UUID;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$7;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMessageAcknowledged(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$7;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->-get0(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;)Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    move-result-object v2

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$7;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->-get0(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;)Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    move-result-object v2

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest$AgentData;->SessionID:Ljava/util/UUID;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest;->isReliable:Z

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$7;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public onMessageTimeout(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V
    .locals 0

    return-void
.end method
