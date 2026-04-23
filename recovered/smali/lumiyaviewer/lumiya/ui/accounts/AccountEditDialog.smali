.class Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;
.super Landroid/support/v7/app/AppCompatDialog;

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog$OnAccountEditResultListener;
    }
.end annotation


# instance fields
.field private editAccount:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;

.field private gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

.field private onAccountEditResultListener:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog$OnAccountEditResultListener;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1}, Landroid/support/v7/app/AppCompatDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->onAccountEditResultListener:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog$OnAccountEditResultListener;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->editAccount:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    invoke-direct {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->editAccount:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;

    return-void
.end method

.method private prepare()V
    .locals 8

    const/16 v7, 0x81

    const/4 v6, 0x1

    const v5, 0x7f1000b3

    const/4 v4, 0x0

    const v3, 0x7f1000b4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->loadGrids()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->editAccount:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;

    if-eqz v0, :cond_1

    invoke-virtual {p0, v5}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->editAccount:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;->getLoginName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f1000b5

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->editAccount:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;->getGridUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->getGridIndex(Ljava/util/UUID;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setSelection(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->editAccount:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;->getPasswordHash()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const-string/jumbo v1, "(Saved password)"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setInputType(I)V

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-static {}, Landroid/text/method/SingleLineTransformationMethod;->getInstance()Landroid/text/method/SingleLineTransformationMethod;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    :goto_0
    const v0, 0x7f1000b6

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    const v1, 0x7f0902df

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    const v0, 0x7f090106

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->setTitle(I)V

    :goto_1
    invoke-virtual {p0, v5}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->requestFocus()Z

    return-void

    :cond_0
    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setInputType(I)V

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    goto :goto_0

    :cond_1
    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {p0, v5}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setInputType(I)V

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    const v0, 0x7f1000b5

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setSelection(I)V

    const v0, 0x7f1000b6

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    const v1, 0x7f09003c

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    const v0, 0x7f0901d6

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->setTitle(I)V

    goto/16 :goto_1
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0

    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 4

    const/4 v3, 0x0

    const v2, 0x7f1000b4

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    const/16 v1, 0x81

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setInputType(I)V

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 8

    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    const v0, 0x7f1000b3

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6

    const v0, 0x7f1000b4

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v4, ""

    const v0, 0x7f1000b5

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v0

    instance-of v7, v0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    if-eqz v7, :cond_6

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;->getGridUUID()Ljava/util/UUID;

    move-result-object v0

    :goto_1
    const-string/jumbo v1, ""

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    const v3, 0x7f090197

    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_1
    const-string/jumbo v1, "(Saved password)"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string/jumbo v1, ""

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-static {v5}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth;->getPasswordHash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    move-object v4, v1

    move v1, v2

    :goto_2
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->dismiss()V

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->onAccountEditResultListener:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog$OnAccountEditResultListener;

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->editAccount:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;

    if-nez v5, :cond_3

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;

    invoke-direct {v1, v6, v4, v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/UUID;)V

    move v2, v3

    move-object v0, v1

    :goto_3
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->onAccountEditResultListener:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog$OnAccountEditResultListener;

    invoke-interface {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog$OnAccountEditResultListener;->onAccountEdited(Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;Z)V

    goto/16 :goto_0

    :cond_2
    const-string/jumbo v1, ""

    move-object v4, v1

    move v1, v2

    goto :goto_2

    :cond_3
    invoke-virtual {v5, v6}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;->setLoginName(Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;->setGridUUID(Ljava/util/UUID;)V

    if-nez v1, :cond_4

    invoke-virtual {v5, v4}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;->setPasswordHash(Ljava/lang/String;)V

    move-object v0, v5

    goto :goto_3

    :pswitch_1
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->dismiss()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->onAccountEditResultListener:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog$OnAccountEditResultListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->onAccountEditResultListener:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog$OnAccountEditResultListener;

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog$OnAccountEditResultListener;->onAccountEditCancelled()V

    goto/16 :goto_0

    :cond_4
    move-object v0, v5

    goto :goto_3

    :cond_5
    move v1, v3

    goto :goto_2

    :cond_6
    move-object v0, v1

    goto :goto_1

    nop

    :pswitch_data_0
    .packed-switch 0x7f1000b6
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 6

    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatDialog;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f0901d6

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->setTitle(I)V

    const v0, 0x7f04001b

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->setContentView(I)V

    const v0, 0x7f1000b6

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f1000b7

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f1000b4

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    const v0, 0x7f1000b5

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridArrayAdapter;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->getGridList(Ljava/util/List;Z)Ljava/util/List;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridArrayAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->prepare()V

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method setOnAccountEditResultListener(Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog$OnAccountEditResultListener;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog;->onAccountEditResultListener:Lcom/lumiyaviewer/lumiya/ui/accounts/AccountEditDialog$OnAccountEditResultListener;

    return-void
.end method
