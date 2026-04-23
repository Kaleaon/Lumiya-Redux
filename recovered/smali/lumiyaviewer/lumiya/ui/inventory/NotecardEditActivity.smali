.class public Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;
.super Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$OnAttachmentClickListener;
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final INVENTORY_ENTRY_KEY:Ljava/lang/String; = "inventoryEntry"

.field private static final IS_SCRIPT_KEY:Ljava/lang/String; = "isScript"

.field private static final ITEM_FOR_ATTACHMENT_REQUEST:I = 0x1

.field private static final PARENT_FOLDER_KEY:Ljava/lang/String; = "parentFolderUUID"

.field private static final TASK_LOCAL_ID_KEY:Ljava/lang/String; = "taskLocalID"

.field private static final TASK_UUID_KEY:Ljava/lang/String; = "taskUUID"


# instance fields
.field private final agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;",
            ">;"
        }
    .end annotation
.end field

.field private editMode:Z

.field private isEditingScript:Z

.field private isSaving:Z

.field private lastErrorMessage:Ljava/lang/String;

.field private menuItemNewAttachment:Landroid/view/MenuItem;

.field private noteEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

.field private notecard:Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;

.field private final notecardAssetSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;",
            ">;"
        }
    .end annotation
.end field

.field private notecardDescription:Ljava/lang/String;

.field private notecardTitle:Ljava/lang/String;

.field private parentFolderUUID:Ljava/util/UUID;

.field private taskLocalID:I

.field private taskUUID:Ljava/util/UUID;

.field private userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;


# direct methods
.method public constructor <init>()V
    .locals 5

    const/4 v4, 0x0

    const/4 v3, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;-><init>()V

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->parentFolderUUID:Ljava/util/UUID;

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->noteEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iput-boolean v4, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->isEditingScript:Z

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->taskUUID:Ljava/util/UUID;

    iput v4, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->taskLocalID:I

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$srzsajEQjSwYc3yok0XsNFeAjNk;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$srzsajEQjSwYc3yok0XsNFeAjNk;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->notecardAssetSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$srzsajEQjSwYc3yok0XsNFeAjNk$1;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$srzsajEQjSwYc3yok0XsNFeAjNk$1;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->notecard:Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;

    iput-boolean v4, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->editMode:Z

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->lastErrorMessage:Ljava/lang/String;

    iput-boolean v4, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->isSaving:Z

    return-void
.end method

.method private copyAttachmentToInventory(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 9

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->noteEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->noteEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getByType(I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    move-result-object v5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v8

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;->NotecardItem:Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->noteEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    const-wide/16 v6, 0x0

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;-><init>(Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;Ljava/util/UUID;Ljava/lang/String;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;J)V

    invoke-static {p0, v8, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->makeSaveItemIntent(Landroid/content/Context;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->startActivity(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public static createIntent(Landroid/content/Context;Ljava/util/UUID;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;ZLjava/util/UUID;I)Landroid/content/Intent;
    .locals 3
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo v1, "activeAgentUUID"

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    if-eqz p2, :cond_0

    const-string/jumbo v1, "parentFolderUUID"

    invoke-virtual {p2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_0
    if-eqz p3, :cond_1

    const-string/jumbo v1, "inventoryEntry"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    :cond_1
    if-eqz p5, :cond_2

    const-string/jumbo v1, "taskUUID"

    invoke-virtual {p5}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_2
    const-string/jumbo v1, "taskLocalID"

    invoke-virtual {v0, v1, p6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string/jumbo v1, "isScript"

    invoke-virtual {v0, v1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    return-object v0
.end method

.method private createNewAttachment()V
    .locals 2

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->editMode:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->makeSelectIntent(Landroid/content/Context;Ljava/util/UUID;)Landroid/content/Intent;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->startActivityForResult(Landroid/content/Intent;I)V

    :cond_0
    return-void
.end method

.method private discardChanges()V
    .locals 6

    const/4 v5, 0x0

    const v4, 0x7f1001f0

    const v3, 0x7f1001ef

    const v2, 0x7f1001ee

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->editMode:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->notecard:Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;

    if-eqz v0, :cond_0

    iput-boolean v5, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->editMode:Z

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->clearComposingText()V

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->clearComposingText()V

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->clearComposingText()V

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->updateButtonsForMode()V

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->notecard:Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;

    invoke-virtual {v1, v5, p0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->toSpannableString(ZLcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$OnAttachmentClickListener;)Landroid/text/SpannableStringBuilder;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->notecardTitle:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->notecardDescription:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method private onAgentCircuit(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canViewNotecard()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->finish()V

    :cond_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->updateButtonsForMode()V

    return-void
.end method

.method private onNotecardLoaded(Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;)V
    .locals 3

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;->getStatus()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    :try_start_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;->getData()[B

    move-result-object v1

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->isEditingScript:Z

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;-><init>([BZ)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->notecard:Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;

    const v0, 0x7f1001f0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->notecard:Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, p0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->toSpannableString(ZLcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$OnAttachmentClickListener;)Landroid/text/SpannableStringBuilder;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f1001f0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->updateButtonsForMode()V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException;->printStackTrace()V

    goto :goto_0
.end method

.method private saveChanges()V
    .locals 12

    const/4 v1, 0x1

    const/4 v6, 0x0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->editMode:Z

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->notecard:Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;

    if-eqz v0, :cond_5

    const v0, 0x7f1001ee

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v4

    const v0, 0x7f1001ef

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->noteEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->noteEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    invoke-static {v4, v0}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->noteEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->description:Ljava/lang/String;

    invoke-static {v5, v0}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    :goto_0
    xor-int/lit8 v0, v0, 0x1

    move v1, v0

    :cond_0
    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;

    const v0, 0x7f1001f0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->isEditingScript:Z

    invoke-direct {v2, v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;-><init>(Landroid/text/Spanned;Z)V

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->toLindenText()[B

    move-result-object v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->notecard:Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->toLindenText()[B

    move-result-object v3

    invoke-static {v0, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->noteEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    if-nez v3, :cond_7

    :cond_1
    :goto_1
    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->notecard:Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;

    move-object v6, v0

    :cond_2
    if-nez v6, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->noteEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    if-nez v0, :cond_8

    :cond_3
    :goto_2
    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->notecardTitle:Ljava/lang/String;

    iput-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->notecardDescription:Ljava/lang/String;

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->inventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->isSaving:Z

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->updateButtonsForMode()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->noteEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->parentFolderUUID:Ljava/util/UUID;

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->isEditingScript:Z

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->taskUUID:Ljava/util/UUID;

    iget v8, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->taskLocalID:I

    new-instance v9, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$srzsajEQjSwYc3yok0XsNFeAjNk$2;

    invoke-direct {v9, p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$srzsajEQjSwYc3yok0XsNFeAjNk$2;-><init>(Ljava/lang/Object;)V

    invoke-virtual/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->UpdateNotecard(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/util/UUID;ZLjava/lang/String;Ljava/lang/String;[BLjava/util/UUID;ILcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory$OnNotecardUpdatedListener;)V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_4
    :goto_3
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->discardChanges()V

    :cond_5
    return-void

    :cond_6
    const/4 v0, 0x0

    goto :goto_0

    :cond_7
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->noteEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getId()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v3, v8, v10

    if-nez v3, :cond_2

    goto :goto_1

    :cond_8
    if-eqz v1, :cond_4

    goto :goto_2

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_3
.end method

.method private startEditing()V
    .locals 6

    const/4 v5, 0x1

    const v4, 0x7f1001f0

    const v3, 0x7f1001ef

    const v2, 0x7f1001ee

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->editMode:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->notecard:Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;

    if-eqz v0, :cond_0

    iput-boolean v5, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->editMode:Z

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->clearComposingText()V

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->clearComposingText()V

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->clearComposingText()V

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->updateButtonsForMode()V

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->notecardTitle:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->notecardDescription:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->notecard:Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;

    invoke-virtual {v1, v5, p0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->toSpannableString(ZLcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$OnAttachmentClickListener;)Landroid/text/SpannableStringBuilder;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method private updateButtonsForMode()V
    .locals 8

    const/4 v6, -0x1

    const/4 v0, 0x1

    const/16 v3, 0x8

    const/4 v4, 0x0

    const/4 v2, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->notecardAssetSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getLoadableStatus()Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    move-result-object v1

    sget-object v5, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->Loading:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    if-ne v1, v5, :cond_5

    move v1, v0

    :goto_0
    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->noteEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->noteEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget v5, v5, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerMask:I

    and-int/lit16 v5, v5, 0x4000

    if-eqz v5, :cond_14

    :cond_0
    :goto_1
    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->menuItemNewAttachment:Landroid/view/MenuItem;

    if-eqz v5, :cond_1

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->menuItemNewAttachment:Landroid/view/MenuItem;

    iget-boolean v7, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->editMode:Z

    invoke-interface {v5, v7}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_1
    if-eqz v0, :cond_9

    xor-int/lit8 v0, v1, 0x1

    if-eqz v0, :cond_9

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->isSaving:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_9

    const v0, 0x7f1001f6

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->editMode:Z

    if-eqz v0, :cond_6

    move v0, v2

    :goto_2
    invoke-virtual {v5, v0}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f1001f7

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->editMode:Z

    if-eqz v0, :cond_7

    move v0, v2

    :goto_3
    invoke-virtual {v5, v0}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f1001f8

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->editMode:Z

    if-nez v0, :cond_8

    move v0, v2

    :goto_4
    invoke-virtual {v5, v0}, Landroid/view/View;->setVisibility(I)V

    move v5, v6

    :goto_5
    if-eq v5, v6, :cond_c

    const v0, 0x7f1001f5

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(I)V

    :goto_6
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->lastErrorMessage:Ljava/lang/String;

    if-eqz v0, :cond_d

    const v0, 0x7f1001f1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f1001f2

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->lastErrorMessage:Ljava/lang/String;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_7
    const v0, 0x7f1001f4

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-nez v1, :cond_2

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->isSaving:Z

    if-eqz v1, :cond_3

    :cond_2
    move v3, v2

    :cond_3
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f1001f0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->editMode:Z

    if-eqz v1, :cond_e

    invoke-static {}, Landroid/text/method/TextKeyListener;->getInstance()Landroid/text/method/TextKeyListener;

    move-result-object v1

    :goto_8
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setKeyListener(Landroid/text/method/KeyListener;)V

    const v0, 0x7f1001ee

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->editMode:Z

    if-eqz v1, :cond_f

    invoke-static {}, Landroid/text/method/TextKeyListener;->getInstance()Landroid/text/method/TextKeyListener;

    move-result-object v1

    :goto_9
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setKeyListener(Landroid/text/method/KeyListener;)V

    const v0, 0x7f1001ef

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->editMode:Z

    if-eqz v1, :cond_4

    invoke-static {}, Landroid/text/method/TextKeyListener;->getInstance()Landroid/text/method/TextKeyListener;

    move-result-object v4

    :cond_4
    invoke-virtual {v0, v4}, Landroid/widget/EditText;->setKeyListener(Landroid/text/method/KeyListener;)V

    const v0, 0x7f1001f0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->editMode:Z

    if-eqz v1, :cond_10

    invoke-static {}, Landroid/text/method/ArrowKeyMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v1

    :goto_a
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    const v0, 0x7f1001ee

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->editMode:Z

    if-eqz v1, :cond_11

    invoke-static {}, Landroid/text/method/ArrowKeyMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v1

    :goto_b
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    const v0, 0x7f1001ef

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->editMode:Z

    if-eqz v1, :cond_12

    invoke-static {}, Landroid/text/method/ArrowKeyMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v1

    :goto_c
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    return-void

    :cond_5
    move v1, v2

    goto/16 :goto_0

    :cond_6
    move v0, v3

    goto/16 :goto_2

    :cond_7
    move v0, v3

    goto/16 :goto_3

    :cond_8
    move v0, v3

    goto/16 :goto_4

    :cond_9
    const v0, 0x7f1001f6

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f1001f7

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f1001f8

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v5, 0x4

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    if-eqz v1, :cond_a

    const v0, 0x7f0901f9

    move v5, v0

    goto/16 :goto_5

    :cond_a
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->isSaving:Z

    if-eqz v0, :cond_b

    const v0, 0x7f0901fc

    move v5, v0

    goto/16 :goto_5

    :cond_b
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->noteEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    if-eqz v0, :cond_13

    const v0, 0x7f0901fa

    move v5, v0

    goto/16 :goto_5

    :cond_c
    const v0, 0x7f1001f5

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_6

    :cond_d
    const v0, 0x7f1001f1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_7

    :cond_e
    move-object v1, v4

    goto/16 :goto_8

    :cond_f
    move-object v1, v4

    goto/16 :goto_9

    :cond_10
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v1

    goto/16 :goto_a

    :cond_11
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v1

    goto/16 :goto_b

    :cond_12
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v1

    goto :goto_c

    :cond_13
    move v5, v6

    goto/16 :goto_5

    :cond_14
    move v0, v2

    goto/16 :goto_1
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_ui_inventory_NotecardEditActivity-mthref-0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->onNotecardLoaded(Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_inventory_NotecardEditActivity-mthref-1(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->onAgentCircuit(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_NotecardEditActivity_14261(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Landroid/content/DialogInterface;I)V
    .locals 3

    packed-switch p3, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetUUID:Ljava/util/UUID;

    const/4 v2, 0x0

    invoke-static {p0, v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->TeleportToLandmark(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Ljava/util/UUID;Z)V

    goto :goto_0

    :pswitch_1
    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->copyAttachmentToInventory(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_NotecardEditActivity_15042(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Landroid/content/DialogInterface;I)V
    .locals 0

    if-nez p3, :cond_0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->copyAttachmentToInventory(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_NotecardEditActivity_19315(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/lang/String;)V
    .locals 2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$srzsajEQjSwYc3yok0XsNFeAjNk$5;

    invoke-direct {v1, p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$srzsajEQjSwYc3yok0XsNFeAjNk$5;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_inventory_NotecardEditActivity_19384(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/lang/String;)V
    .locals 1

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->noteEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->lastErrorMessage:Ljava/lang/String;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->isSaving:Z

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->updateButtonsForMode()V

    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 6

    packed-switch p1, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->editMode:Z

    if-eqz v0, :cond_0

    const-string/jumbo v0, "selectedInventoryEntry"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    if-eqz v0, :cond_0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;->createSingleEditableAttachment(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Landroid/text/Spanned;

    move-result-object v3

    const v0, 0x7f1001f0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v2

    invoke-virtual {v0}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result v4

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v2, v4}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-interface {v3}, Landroid/text/Spanned;->length()I

    move-result v5

    const/4 v4, 0x0

    invoke-interface/range {v0 .. v5}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;II)Landroid/text/Editable;

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public onAttachmentClick(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 6

    const v5, 0x7f09007c

    const v4, 0x7f09007a

    const/4 v3, 0x1

    const/4 v2, 0x0

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->invType:I

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->IT_LANDMARK:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryType;->getTypeCode()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/CharSequence;

    const v1, 0x7f09007b

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v5}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$srzsajEQjSwYc3yok0XsNFeAjNk$3;

    invoke-direct {v2, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$srzsajEQjSwYc3yok0XsNFeAjNk$3;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    :goto_0
    return-void

    :cond_0
    new-array v0, v3, [Ljava/lang/CharSequence;

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v5}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$srzsajEQjSwYc3yok0XsNFeAjNk$4;

    invoke-direct {v2, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/inventory/-$Lambda$srzsajEQjSwYc3yok0XsNFeAjNk$4;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :goto_0
    :pswitch_0
    return-void

    :pswitch_1
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->startEditing()V

    goto :goto_0

    :pswitch_2
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->discardChanges()V

    goto :goto_0

    :pswitch_3
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->saveChanges()V

    goto :goto_0

    :pswitch_4
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->lastErrorMessage:Ljava/lang/String;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->updateButtonsForMode()V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x7f1001f3
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4

    const/4 v2, 0x3

    const/4 v3, 0x0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/content/Intent;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    const-string/jumbo v0, "isScript"

    invoke-virtual {v1, v0, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->isEditingScript:Z

    const-string/jumbo v0, "taskUUID"

    invoke-virtual {v1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->taskUUID:Ljava/util/UUID;

    const-string/jumbo v0, "taskLocalID"

    invoke-virtual {v1, v0, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->taskLocalID:I

    const-string/jumbo v0, "inventoryEntry"

    invoke-virtual {v1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->noteEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    const-string/jumbo v0, "parentFolderUUID"

    invoke-virtual {v1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->parentFolderUUID:Ljava/util/UUID;

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->finish()V

    return-void

    :cond_1
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->isEditingScript:Z

    if-eqz v0, :cond_2

    const v0, 0x7f0902e5

    :goto_0
    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->setTitle(Ljava/lang/CharSequence;)V

    const v0, 0x7f040065

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->setContentView(I)V

    const v0, 0x7f1001f6

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f1001f7

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f1001f8

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f1001f3

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->editMode:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->noteEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->noteEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    :goto_1
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->notecardTitle:Ljava/lang/String;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->noteEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->noteEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->description:Ljava/lang/String;

    :goto_2
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->notecardDescription:Ljava/lang/String;

    const v0, 0x7f1001ee

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->notecardTitle:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f1001ef

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->notecardDescription:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->agentCircuits()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->noteEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    if-nez v0, :cond_5

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->isEditingScript:Z

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->notecard:Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->updateButtonsForMode()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->startEditing()V

    :goto_3
    return-void

    :cond_2
    const v0, 0x7f0901f8

    goto/16 :goto_0

    :cond_3
    const v0, 0x7f0901db

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_4
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {v2, v2}, Ljava/text/DateFormat;->getDateTimeInstance(II)Ljava/text/DateFormat;

    move-result-object v1

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    const v1, 0x7f0901da

    invoke-virtual {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    :cond_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->notecardAssetSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getAssetResponseCacher()Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;->getPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->noteEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->taskUUID:Ljava/util/UUID;

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->createInventoryKey(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->updateButtonsForMode()V

    goto :goto_3
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f120014

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    const v0, 0x7f100332

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->menuItemNewAttachment:Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->menuItemNewAttachment:Landroid/view/MenuItem;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->menuItemNewAttachment:Landroid/view/MenuItem;

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->editMode:Z

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0

    :pswitch_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->createNewAttachment()V

    const/4 v0, 0x1

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x7f100332
        :pswitch_0
    .end packed-switch
.end method
