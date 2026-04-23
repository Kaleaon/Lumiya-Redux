.class final synthetic Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$OIe5MtmKyVPF26gruCQoZkxXroQ$3;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;

.field private final synthetic -$f1:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$OIe5MtmKyVPF26gruCQoZkxXroQ$3;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$OIe5MtmKyVPF26gruCQoZkxXroQ$3;->-$f1:Ljava/lang/Object;

    check-cast v1, Landroid/app/Dialog;

    invoke-virtual {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/AssetInfoFragment;->lambda$-com_lumiyaviewer_lumiya_ui_inventory_AssetInfoFragment_26713(Landroid/app/Dialog;Landroid/view/View;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$OIe5MtmKyVPF26gruCQoZkxXroQ$3;->-$f0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$OIe5MtmKyVPF26gruCQoZkxXroQ$3;->-$f1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$OIe5MtmKyVPF26gruCQoZkxXroQ$3;->$m$0(Landroid/view/View;)V

    return-void
.end method
