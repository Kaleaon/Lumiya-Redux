.class final synthetic Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$3;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnInventoryCallbackListener;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;

.field private final synthetic -$f1:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$3;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$3;->-$f1:Ljava/lang/Object;

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-virtual {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->lambda$-com_lumiyaviewer_lumiya_slproto_inventory_SLInventory_27010(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$3;->-$f0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$3;->-$f1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onInventoryCallback(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$3;->$m$0(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    return-void
.end method
