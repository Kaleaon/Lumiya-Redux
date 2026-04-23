.class Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch$2;
.super Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;
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
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;

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

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch$2;->onRequest(Ljava/util/UUID;)V

    return-void
.end method

.method public onRequest(Ljava/util/UUID;)V
    .locals 4
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v3, 0x1

    const-string/jumbo v0, "ParcelInfo: Requesting for %s"

    new-array v1, v3, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoRequest;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->-get0(Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;)Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    move-result-object v2

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->-get0(Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;)Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    move-result-object v2

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoRequest;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoRequest$Data;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoRequest$Data;->ParcelID:Ljava/util/UUID;

    iput-boolean v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoRequest;->isReliable:Z

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method
