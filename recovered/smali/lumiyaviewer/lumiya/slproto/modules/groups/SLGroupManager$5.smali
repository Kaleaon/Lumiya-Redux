.class Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$5;
.super Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;
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
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$5;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;

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

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$5;->onRequest(Ljava/util/UUID;)V

    return-void
.end method

.method public onRequest(Ljava/util/UUID;)V
    .locals 5
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v4, 0x1

    const-string/jumbo v0, "GroupMemberList: [%s] network requesting for group %s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersRequest;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$5;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->-get0(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;)Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    move-result-object v2

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$5;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->-get0(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;)Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    move-result-object v2

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersRequest;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersRequest$GroupData;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersRequest$GroupData;->GroupID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersRequest;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersRequest$GroupData;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersRequest$GroupData;->RequestID:Ljava/util/UUID;

    iput-boolean v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersRequest;->isReliable:Z

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$5;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method
