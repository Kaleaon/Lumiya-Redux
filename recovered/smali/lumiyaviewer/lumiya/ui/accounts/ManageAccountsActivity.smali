.class public Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;
.super Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog$OnAccountEditResultListener;
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity$AccountListAdapter;
    }
.end annotation


# instance fields
.field private accountList:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;

.field private adapter:Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity$AccountListAdapter;

.field private displayList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->accountList:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->displayList:Ljava/util/List;

    return-void
.end method

.method private deleteAccount(Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->accountList:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;->deleteAccount(Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->accountList:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;->savePreferences()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->accountList:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->displayList:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;->getAccountList(Ljava/util/List;)Ljava/util/List;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->adapter:Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity$AccountListAdapter;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity$AccountListAdapter;->updateList()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_accounts_ManageAccountsActivity_6299(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method private showAccountDeleteDialog(Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;)V
    .locals 4

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f090039

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string/jumbo v2, "Yes"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/accounts/-$Lambda$c901yk_brt0jPczBoAMr-Jn1w74$1;

    invoke-direct {v3, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/accounts/-$Lambda$c901yk_brt0jPczBoAMr-Jn1w74$1;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string/jumbo v2, "No"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/accounts/-$Lambda$c901yk_brt0jPczBoAMr-Jn1w74;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/ui/accounts/-$Lambda$c901yk_brt0jPczBoAMr-Jn1w74;-><init>()V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method


# virtual methods
.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_accounts_ManageAccountsActivity_6140(Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p2}, Landroid/content/DialogInterface;->dismiss()V

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->deleteAccount(Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;)V

    return-void
.end method

.method public onAccountEditCancelled()V
    .locals 0

    return-void
.end method

.method public onAccountEdited(Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;Z)V
    .locals 2

    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->accountList:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;->addNewAccount(Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->accountList:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;->savePreferences()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->accountList:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->displayList:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;->getAccountList(Ljava/util/List;)Ljava/util/List;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->adapter:Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity$AccountListAdapter;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity$AccountListAdapter;->updateList()V

    const v0, 0x7f1001d9

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v1

    invoke-interface {v1}, Landroid/widget/ListAdapter;->getCount()I

    move-result v1

    if-lez v1, :cond_1

    invoke-virtual {v0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v1

    invoke-interface {v1}, Landroid/widget/ListAdapter;->getCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setSelection(I)V

    :cond_1
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;-><init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;)V

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->setOnAccountEditResultListener(Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog$OnAccountEditResultListener;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->show()V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x7f1001da
        :pswitch_0
    .end packed-switch
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 3

    const/4 v2, 0x1

    invoke-interface {p1}, Landroid/view/MenuItem;->getMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;

    move-result-object v0

    check-cast v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->adapter:Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity$AccountListAdapter;

    iget v0, v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity$AccountListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    :cond_0
    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0

    :pswitch_0
    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;

    invoke-direct {v1, p0, v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;-><init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;)V

    invoke-virtual {v1, p0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->setOnAccountEditResultListener(Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog$OnAccountEditResultListener;)V

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->show()V

    return v2

    :pswitch_1
    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->showAccountDeleteDialog(Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;)V

    return v2

    nop

    :pswitch_data_0
    .packed-switch 0x7f1002f7
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f04005c

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->setContentView(I)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->accountList:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->accountList:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->displayList:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList;->getAccountList(Ljava/util/List;)Ljava/util/List;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity$AccountListAdapter;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->displayList:Ljava/util/List;

    invoke-direct {v0, p0, v1}, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity$AccountListAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->adapter:Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity$AccountListAdapter;

    const v0, 0x7f1001d9

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->adapter:Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity$AccountListAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    const v1, 0x7f1001da

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->registerForContextMenu(Landroid/view/View;)V

    return-void
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 2

    invoke-super {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f120000

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f120010

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    const/4 v0, 0x1

    return v0
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    invoke-virtual {p1, p3}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    const-string/jumbo v2, "selected_account"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const/4 v0, -0x1

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->setResult(ILandroid/content/Intent;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->finish()V

    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0

    :pswitch_0
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->startActivity(Landroid/content/Intent;)V

    const/4 v0, 0x1

    return v0

    :pswitch_data_0
    .packed-switch 0x7f10032d
        :pswitch_0
    .end packed-switch
.end method

.method public onResume()V
    .locals 1

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->onResume()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;->adapter:Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity$AccountListAdapter;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity$AccountListAdapter;->updateGridList()V

    return-void
.end method
