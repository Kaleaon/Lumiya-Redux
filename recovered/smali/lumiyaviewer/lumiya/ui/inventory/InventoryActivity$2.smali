.class Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/support/v7/widget/SearchView$OnQueryTextListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onQueryTextChange(Ljava/lang/String;)Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;

    invoke-static {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->-set0(Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;Ljava/lang/String;)Ljava/lang/String;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->-wrap0(Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;)V

    const/4 v0, 0x1

    return v0
.end method

.method public onQueryTextSubmit(Ljava/lang/String;)Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
