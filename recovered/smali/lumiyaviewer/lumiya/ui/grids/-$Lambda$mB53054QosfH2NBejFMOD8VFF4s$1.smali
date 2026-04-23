.class final synthetic Lcom/lumiyaviewer/lumiya/ui/grids/-$Lambda$mB53054QosfH2NBejFMOD8VFF4s$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;

.field private final synthetic -$f1:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Landroid/content/DialogInterface;I)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/-$Lambda$mB53054QosfH2NBejFMOD8VFF4s$1;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/grids/-$Lambda$mB53054QosfH2NBejFMOD8VFF4s$1;->-$f1:Ljava/lang/Object;

    check-cast v1, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    invoke-virtual {v0, v1, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->lambda$-com_lumiyaviewer_lumiya_ui_grids_ManageGridsActivity_6020(Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/grids/-$Lambda$mB53054QosfH2NBejFMOD8VFF4s$1;->-$f0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/grids/-$Lambda$mB53054QosfH2NBejFMOD8VFF4s$1;->-$f1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/grids/-$Lambda$mB53054QosfH2NBejFMOD8VFF4s$1;->$m$0(Landroid/content/DialogInterface;I)V

    return-void
.end method
