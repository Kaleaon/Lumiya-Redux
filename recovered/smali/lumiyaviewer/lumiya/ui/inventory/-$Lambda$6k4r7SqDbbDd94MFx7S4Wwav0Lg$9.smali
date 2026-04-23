.class final synthetic Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$9;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;

.field private final synthetic -$f1:Ljava/lang/Object;

.field private final synthetic -$f2:Ljava/lang/Object;

.field private final synthetic -$f3:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Landroid/content/DialogInterface;I)V
    .locals 6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$9;->-$f0:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Runnable;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$9;->-$f1:Ljava/lang/Object;

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$9;->-$f2:Ljava/lang/Object;

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$9;->-$f3:Ljava/lang/Object;

    check-cast v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-object v4, p1

    move v5, p2

    invoke-static/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryFragmentHelper;->lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragmentHelper_9777(Ljava/lang/Runnable;Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$9;->-$f0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$9;->-$f1:Ljava/lang/Object;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$9;->-$f2:Ljava/lang/Object;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$9;->-$f3:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$6k4r7SqDbbDd94MFx7S4Wwav0Lg$9;->$m$0(Landroid/content/DialogInterface;I)V

    return-void
.end method
