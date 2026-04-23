.class final synthetic Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$13;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;

.field private final synthetic -$f1:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$13;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$13;->-$f1:Ljava/lang/Object;

    check-cast v1, Landroid/app/ProgressDialog;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragment_40889(Landroid/app/ProgressDialog;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$13;->-$f0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$13;->-$f1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$13;->$m$0()V

    return-void
.end method
