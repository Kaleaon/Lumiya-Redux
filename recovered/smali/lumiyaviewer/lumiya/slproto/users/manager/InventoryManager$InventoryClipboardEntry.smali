.class public Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InventoryClipboardEntry"
.end annotation


# instance fields
.field public final inventoryEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final isCut:Z


# direct methods
.method public constructor <init>(ZLcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 0
    .param p2    # Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;->isCut:Z

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager$InventoryClipboardEntry;->inventoryEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    return-void
.end method
