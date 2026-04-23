.class Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$4;
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

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$4;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

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

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$4;->onRequest(Ljava/util/UUID;)V

    return-void
.end method

.method public onRequest(Ljava/util/UUID;)V
    .locals 5
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$4;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    const-string/jumbo v1, "avatarpicksrequest"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendGenericMessage(Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method
