.class Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$9;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->RezObject(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

.field final synthetic val$folderUUID:Ljava/util/UUID;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Ljava/util/UUID;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$9;->this$0:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$9;->val$folderUUID:Ljava/util/UUID;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMessageAcknowledged(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$9;->this$0:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->-get2(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$9;->this$0:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->-get2(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit$9;->val$folderUUID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;->requestFolderUpdate(Ljava/util/UUID;)V

    :cond_0
    return-void
.end method

.method public onMessageTimeout(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V
    .locals 0

    return-void
.end method
