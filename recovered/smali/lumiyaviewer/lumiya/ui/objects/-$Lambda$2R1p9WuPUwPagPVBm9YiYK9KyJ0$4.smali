.class final synthetic Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$2R1p9WuPUwPagPVBm9YiYK9KyJ0$4;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic -$f0:I

.field private final synthetic -$f1:Ljava/lang/Object;

.field private final synthetic -$f2:Ljava/lang/Object;

.field private final synthetic -$f3:Ljava/lang/Object;

.field private final synthetic -$f4:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0()V
    .locals 5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$2R1p9WuPUwPagPVBm9YiYK9KyJ0$4;->-$f1:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment$2;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$2R1p9WuPUwPagPVBm9YiYK9KyJ0$4;->-$f2:Ljava/lang/Object;

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget v4, p0, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$2R1p9WuPUwPagPVBm9YiYK9KyJ0$4;->-$f0:I

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$2R1p9WuPUwPagPVBm9YiYK9KyJ0$4;->-$f3:Ljava/lang/Object;

    check-cast v2, Landroid/app/ProgressDialog;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$2R1p9WuPUwPagPVBm9YiYK9KyJ0$4;->-$f4:Ljava/lang/Object;

    check-cast v3, Ljava/util/UUID;

    invoke-virtual {v0, v1, v4, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment$2;->lambda$-com_lumiyaviewer_lumiya_ui_objects_TaskInventoryFragment$2_10938(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;ILandroid/app/ProgressDialog;Ljava/util/UUID;)V

    return-void
.end method

.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$2R1p9WuPUwPagPVBm9YiYK9KyJ0$4;->-$f0:I

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$2R1p9WuPUwPagPVBm9YiYK9KyJ0$4;->-$f1:Ljava/lang/Object;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$2R1p9WuPUwPagPVBm9YiYK9KyJ0$4;->-$f2:Ljava/lang/Object;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$2R1p9WuPUwPagPVBm9YiYK9KyJ0$4;->-$f3:Ljava/lang/Object;

    iput-object p5, p0, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$2R1p9WuPUwPagPVBm9YiYK9KyJ0$4;->-$f4:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$2R1p9WuPUwPagPVBm9YiYK9KyJ0$4;->$m$0()V

    return-void
.end method
