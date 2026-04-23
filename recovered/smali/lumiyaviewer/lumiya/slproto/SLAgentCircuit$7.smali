.class Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$7;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendLogoutRequest()V
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

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$7;->this$0:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMessageAcknowledged(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V
    .locals 3

    const-string/jumbo v0, "Logout: Logout request acknowledged."

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$7;->this$0:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    const-string/jumbo v1, "Logged out."

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->processDisconnect(ZLjava/lang/String;)V

    return-void
.end method

.method public onMessageTimeout(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V
    .locals 3

    const-string/jumbo v0, "Logout: LogoutRequest timed out!"

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$7;->this$0:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    const-string/jumbo v1, "Logout request has timed out."

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->processDisconnect(ZLjava/lang/String;)V

    return-void
.end method
