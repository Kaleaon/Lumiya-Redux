.class final synthetic Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$8;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnInventoryCallbackListener;


# instance fields
.field private final synthetic -$f0:Z

.field private final synthetic -$f1:Ljava/lang/Object;

.field private final synthetic -$f2:Ljava/lang/Object;

.field private final synthetic -$f3:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$8;->-$f1:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$8;->-$f0:Z

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$8;->-$f2:Ljava/lang/Object;

    check-cast v1, [B

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$8;->-$f3:Ljava/lang/Object;

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnNotecardUpdatedListener;

    invoke-virtual {v0, v3, v1, v2, p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->lambda$-com_lumiyaviewer_lumiya_slproto_inventory_SLInventory_50229(Z[BLcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnNotecardUpdatedListener;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    return-void
.end method

.method public synthetic constructor <init>(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$8;->-$f0:Z

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$8;->-$f1:Ljava/lang/Object;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$8;->-$f2:Ljava/lang/Object;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$8;->-$f3:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onInventoryCallback(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$8;->$m$0(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    return-void
.end method
