.class final synthetic Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$srzsajEQjSwYc3yok0XsNFeAjNk$4;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;

.field private final synthetic -$f1:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Landroid/content/DialogInterface;I)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$srzsajEQjSwYc3yok0XsNFeAjNk$4;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$srzsajEQjSwYc3yok0XsNFeAjNk$4;->-$f1:Ljava/lang/Object;

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-virtual {v0, v1, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->lambda$-com_lumiyaviewer_lumiya_ui_inventory_NotecardEditActivity_15042(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$srzsajEQjSwYc3yok0XsNFeAjNk$4;->-$f0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$srzsajEQjSwYc3yok0XsNFeAjNk$4;->-$f1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$srzsajEQjSwYc3yok0XsNFeAjNk$4;->$m$0(Landroid/content/DialogInterface;I)V

    return-void
.end method
