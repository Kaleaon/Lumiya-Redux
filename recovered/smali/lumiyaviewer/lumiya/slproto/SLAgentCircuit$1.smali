.class Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$1;
.super Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/eventbus/EventBus;J)V
    .locals 1

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-direct {p0, p2, p3, p4}, Lcom/lumiyaviewer/lumiya/eventbus/EventRateLimiter;-><init>(Lcom/lumiyaviewer/lumiya/eventbus/EventBus;J)V

    return-void
.end method


# virtual methods
.method protected getEventToFire()Ljava/lang/Object;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected onActualFire()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->-wrap1(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    return-void
.end method
