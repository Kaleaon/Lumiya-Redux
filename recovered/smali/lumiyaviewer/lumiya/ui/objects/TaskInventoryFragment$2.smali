.class Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/common/base/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->copyAllToInventory(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/common/base/Function",
        "<",
        "Ljava/util/UUID;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;

.field final synthetic val$progressDialog:Landroid/app/ProgressDialog;

.field final synthetic val$taskID:I

.field final synthetic val$userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;ILandroid/app/ProgressDialog;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment$2;->val$userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iput p3, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment$2;->val$taskID:I

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment$2;->val$progressDialog:Landroid/app/ProgressDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    check-cast p1, Ljava/util/UUID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment$2;->apply(Ljava/util/UUID;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public apply(Ljava/util/UUID;)Ljava/lang/Void;
    .locals 7
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v6

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$2R1p9WuPUwPagPVBm9YiYK9KyJ0$4;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment$2;->val$taskID:I

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment$2;->val$userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment$2;->val$progressDialog:Landroid/app/ProgressDialog;

    move-object v2, p0

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$2R1p9WuPUwPagPVBm9YiYK9KyJ0$4;-><init>(ILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v6, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_objects_TaskInventoryFragment$2_10938(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;ILandroid/app/ProgressDialog;Ljava/util/UUID;)V
    .locals 3

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->requestTaskInventoryUpdate(I)V

    invoke-virtual {p3}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p3}, Landroid/app/ProgressDialog;->dismiss()V

    if-eqz p4, :cond_0

    const-string/jumbo v0, "TaskInventory: going to display target folder: %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p4, v1, v2

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v1, v2, p4}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->makeFolderIntent(Landroid/content/Context;Ljava/util/UUID;Ljava/util/UUID;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->startActivity(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method
