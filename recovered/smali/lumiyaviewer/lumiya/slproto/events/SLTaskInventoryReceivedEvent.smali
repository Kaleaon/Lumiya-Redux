.class public Lcom/lumiyaviewer/lumiya/slproto/events/SLTaskInventoryReceivedEvent;
.super Ljava/lang/Object;


# instance fields
.field public final taskID:Ljava/util/UUID;

.field public final taskInventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;


# direct methods
.method public constructor <init>(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLTaskInventoryReceivedEvent;->taskID:Ljava/util/UUID;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLTaskInventoryReceivedEvent;->taskInventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;

    return-void
.end method
