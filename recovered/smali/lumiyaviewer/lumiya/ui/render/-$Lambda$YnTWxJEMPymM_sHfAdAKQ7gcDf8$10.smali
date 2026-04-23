.class final synthetic Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$10;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;

.field private final synthetic -$f1:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Landroid/content/DialogInterface;I)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$10;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$10;->-$f1:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    invoke-virtual {v0, v1, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->lambda$-com_lumiyaviewer_lumiya_ui_render_WorldViewActivity_48476(Ljava/util/List;Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$10;->-$f0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$10;->-$f1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$10;->$m$0(Landroid/content/DialogInterface;I)V

    return-void
.end method
