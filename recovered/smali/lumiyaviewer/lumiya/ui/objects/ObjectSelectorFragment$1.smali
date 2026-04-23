.class Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/support/v7/widget/SearchView$OnQueryTextListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onQueryTextChange(Ljava/lang/String;)Z
    .locals 2

    const-string/jumbo v0, "searchview: textchange"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->-wrap0(Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;)V

    const/4 v0, 0x1

    return v0
.end method

.method public onQueryTextSubmit(Ljava/lang/String;)Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
