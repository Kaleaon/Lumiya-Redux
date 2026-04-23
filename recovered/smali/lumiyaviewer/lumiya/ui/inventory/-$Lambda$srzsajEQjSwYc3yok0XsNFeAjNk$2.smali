.class final synthetic Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$srzsajEQjSwYc3yok0XsNFeAjNk$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnNotecardUpdatedListener;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$srzsajEQjSwYc3yok0XsNFeAjNk$2;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;

    invoke-virtual {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->lambda$-com_lumiyaviewer_lumiya_ui_inventory_NotecardEditActivity_19315(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/lang/String;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$srzsajEQjSwYc3yok0XsNFeAjNk$2;->-$f0:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onNotecardUpdated(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$srzsajEQjSwYc3yok0XsNFeAjNk$2;->$m$0(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/lang/String;)V

    return-void
.end method
