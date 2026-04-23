.class Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/render/OnHoverListenerCompat;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onHoverEnter(Landroid/view/View;)Z
    .locals 4

    const/4 v3, 0x0

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    const-string/jumbo v0, "Cardboard: hovering enter %d"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-set2(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;Landroid/view/View;)Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-wrap5(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    return v3
.end method

.method public onHoverExit(Landroid/view/View;)Z
    .locals 4

    const/4 v3, 0x0

    const/high16 v0, 0x3f000000    # 0.5f

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    const-string/jumbo v0, "Cardboard: hovering exit %d"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get13(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Landroid/view/View;

    move-result-object v0

    if-ne v0, p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-set2(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;Landroid/view/View;)Landroid/view/View;

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-wrap5(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    return v3
.end method
