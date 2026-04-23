.class final synthetic Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$5;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;

.field private final synthetic -$f1:Ljava/lang/Object;

.field private final synthetic -$f2:Ljava/lang/Object;

.field private final synthetic -$f3:Ljava/lang/Object;

.field private final synthetic -$f4:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0()V
    .locals 5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$5;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$5;->-$f1:Ljava/lang/Object;

    check-cast v1, Ljava/util/UUID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$5;->-$f2:Ljava/lang/Object;

    check-cast v2, Ljava/util/UUID;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$5;->-$f3:Ljava/lang/Object;

    check-cast v3, Ljava/util/UUID;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$5;->-$f4:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Runnable;

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->lambda$-com_lumiyaviewer_lumiya_slproto_inventory_SLInventory_51539(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;Ljava/lang/Runnable;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$5;->-$f0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$5;->-$f1:Ljava/lang/Object;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$5;->-$f2:Ljava/lang/Object;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$5;->-$f3:Ljava/lang/Object;

    iput-object p5, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$5;->-$f4:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/-$Lambda$eCHTl-_kh2tUCaOJ-O9NRHJvhjs$5;->$m$0()V

    return-void
.end method
