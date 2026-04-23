.class Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$8;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->TeleportToLocalPosition(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$8;->this$0:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMessageAcknowledged(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V
    .locals 0

    return-void
.end method

.method public onMessageTimeout(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$8;->this$0:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->-get0(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/events/SLTeleportResultEvent;

    const-string/jumbo v2, "Teleport request has timed out."

    const/4 v3, 0x0

    invoke-direct {v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/events/SLTeleportResultEvent;-><init>(ZLjava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    return-void
.end method
