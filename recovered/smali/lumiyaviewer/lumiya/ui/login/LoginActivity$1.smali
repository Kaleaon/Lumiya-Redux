.class Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->-get1(Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;)I

    move-result v0

    if-eq p3, v0, :cond_0

    invoke-virtual {p1}, Landroid/widget/AdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v0

    invoke-interface {v0, p3}, Landroid/widget/Adapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;->getLoginURL()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->-get0(Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;)Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    move-result-object v2

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;-><init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/ui/grids/GridList;Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->setOnGridEditResultListener(Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog$OnGridEditResultListener;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->show()V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;

    invoke-static {v1, p3}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->-set0(Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;I)I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;->getGridUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;->-set1(Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;Ljava/util/UUID;)Ljava/util/UUID;

    goto :goto_0
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    return-void
.end method
