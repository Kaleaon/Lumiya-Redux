.class Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$14;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener$SLMessageBaseEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->UpdateNotecard(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/util/UUID;ZLjava/lang/String;Ljava/lang/String;[BLjava/util/UUID;ILcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnNotecardUpdatedListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

.field final synthetic val$entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

.field final synthetic val$isScript:Z

.field final synthetic val$listener:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnNotecardUpdatedListener;

.field final synthetic val$notecardData:[B

.field final synthetic val$taskLocalID:I

.field final synthetic val$taskUUID:Ljava/util/UUID;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;ILcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/util/UUID;Z[BLcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnNotecardUpdatedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$14;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$14;->val$taskLocalID:I

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$14;->val$entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$14;->val$taskUUID:Ljava/util/UUID;

    iput-boolean p5, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$14;->val$isScript:Z

    iput-object p6, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$14;->val$notecardData:[B

    iput-object p7, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$14;->val$listener:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnNotecardUpdatedListener;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener$SLMessageBaseEventListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onMessageAcknowledged(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V
    .locals 6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$14;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->-get4(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$14;->val$taskLocalID:I

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->requestTaskInventoryUpdate(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$14;->this$0:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$14;->val$entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$14;->val$taskUUID:Ljava/util/UUID;

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$14;->val$isScript:Z

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$14;->val$notecardData:[B

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$14;->val$listener:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnNotecardUpdatedListener;

    invoke-static/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->-wrap1(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/util/UUID;Z[BLcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnNotecardUpdatedListener;)V

    return-void
.end method
