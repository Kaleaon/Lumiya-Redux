.class public Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;
.super Landroid/support/v7/app/AppCompatDialog;

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog$OnGridEditResultListener;
    }
.end annotation


# instance fields
.field private editGrid:Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

.field private gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

.field private onGridEditResultListener:Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog$OnGridEditResultListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/ui/grids/GridList;Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1}, Landroid/support/v7/app/AppCompatDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->onGridEditResultListener:Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog$OnGridEditResultListener;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->editGrid:Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->editGrid:Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    return-void
.end method

.method private prepare()V
    .locals 6

    const v5, 0x7f10015f

    const v4, 0x7f10015e

    const v3, 0x7f1000b6

    const v2, 0x7f10015c

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->editGrid:Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    if-eqz v0, :cond_0

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->editGrid:Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;->getGridName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->editGrid:Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;->getLoginURL()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    const v1, 0x7f0902df

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    invoke-virtual {p0, v5}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f090107

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->setTitle(I)V

    :goto_0
    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    return-void

    :cond_0
    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    const v1, 0x7f09003d

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    invoke-virtual {p0, v5}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f0901d8

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->setTitle(I)V

    goto :goto_0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5

    const/4 v1, 0x0

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    :cond_0
    :goto_0
    return-void

    :sswitch_0
    const v0, 0x7f10015c

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    const v0, 0x7f10015e

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v0, ""

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f090134

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_1
    const-string/jumbo v0, ""

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f090139

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->getGridByName(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->editGrid:Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    if-eq v0, v4, :cond_3

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f090133

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    :cond_3
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->dismiss()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->onGridEditResultListener:Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog$OnGridEditResultListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->editGrid:Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    if-nez v0, :cond_4

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v4

    invoke-direct {v0, v2, v3, v1, v4}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/util/UUID;)V

    const/4 v1, 0x1

    :goto_1
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->onGridEditResultListener:Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog$OnGridEditResultListener;

    invoke-interface {v2, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog$OnGridEditResultListener;->onGridAdded(Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;Z)V

    goto/16 :goto_0

    :cond_4
    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;->setGridName(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;->setLoginURL(Ljava/lang/String;)V

    goto :goto_1

    :sswitch_1
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->dismiss()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->onGridEditResultListener:Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog$OnGridEditResultListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->editGrid:Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->onGridEditResultListener:Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog$OnGridEditResultListener;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->editGrid:Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog$OnGridEditResultListener;->onGridDeleted(Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;)V

    goto/16 :goto_0

    :sswitch_2
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->dismiss()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->onGridEditResultListener:Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog$OnGridEditResultListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->onGridEditResultListener:Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog$OnGridEditResultListener;

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog$OnGridEditResultListener;->onGridEditCancelled()V

    goto/16 :goto_0

    :sswitch_data_0
    .sparse-switch
        0x7f1000b6 -> :sswitch_0
        0x7f1000b7 -> :sswitch_2
        0x7f10015f -> :sswitch_1
    .end sparse-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatDialog;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f0901d8

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->setTitle(I)V

    const v0, 0x7f04003f

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->setContentView(I)V

    const v0, 0x7f1000b6

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f10015f

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f1000b7

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->prepare()V

    return-void
.end method

.method public setOnGridEditResultListener(Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog$OnGridEditResultListener;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->onGridEditResultListener:Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog$OnGridEditResultListener;

    return-void
.end method
