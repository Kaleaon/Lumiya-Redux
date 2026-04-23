.class final synthetic Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$17;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;

.field private final synthetic -$f1:Ljava/lang/Object;

.field private final synthetic -$f2:Ljava/lang/Object;

.field private final synthetic -$f3:Ljava/lang/Object;

.field private final synthetic -$f4:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Landroid/content/DialogInterface;I)V
    .locals 7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$17;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$17;->-$f1:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$17;->-$f2:Ljava/lang/Object;

    check-cast v2, Landroid/graphics/Bitmap;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$17;->-$f3:Ljava/lang/Object;

    check-cast v3, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$17;->-$f4:Ljava/lang/Object;

    check-cast v4, Ljava/util/UUID;

    move-object v5, p1

    move v6, p2

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragment;->lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragment_29313(Ljava/lang/String;Landroid/graphics/Bitmap;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Ljava/util/UUID;Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$17;->-$f0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$17;->-$f1:Ljava/lang/Object;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$17;->-$f2:Ljava/lang/Object;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$17;->-$f3:Ljava/lang/Object;

    iput-object p5, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$17;->-$f4:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$MXulZZBv5zNDEqgJzTmU0EFG-10$17;->$m$0(Landroid/content/DialogInterface;I)V

    return-void
.end method
