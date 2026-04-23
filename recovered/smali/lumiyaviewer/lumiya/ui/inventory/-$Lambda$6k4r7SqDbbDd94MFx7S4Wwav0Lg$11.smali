.class final synthetic Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$11;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final synthetic -$f0:Z

.field private final synthetic -$f1:Ljava/lang/Object;

.field private final synthetic -$f2:Ljava/lang/Object;

.field private final synthetic -$f3:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Landroid/content/DialogInterface;I)V
    .locals 6

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$11;->-$f0:Z

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$11;->-$f1:Ljava/lang/Object;

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$11;->-$f2:Ljava/lang/Object;

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$11;->-$f3:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Runnable;

    move-object v4, p1

    move v5, p2

    invoke-static/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragmentHelper_8206(ZLcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/lang/Runnable;Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public synthetic constructor <init>(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$11;->-$f0:Z

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$11;->-$f1:Ljava/lang/Object;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$11;->-$f2:Ljava/lang/Object;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$11;->-$f3:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$11;->$m$0(Landroid/content/DialogInterface;I)V

    return-void
.end method
