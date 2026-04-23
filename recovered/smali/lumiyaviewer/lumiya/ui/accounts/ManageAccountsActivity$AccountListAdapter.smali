.class Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity$AccountListAdapter;
.super Landroid/widget/ArrayAdapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AccountListAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;",
        ">;"
    }
.end annotation


# instance fields
.field private gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;",
            ">;)V"
        }
    .end annotation

    const v0, 0x7f04001c

    invoke-direct {p0, p1, v0, p2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    invoke-direct {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity$AccountListAdapter;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity$AccountListAdapter;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v1, "layout_inflater"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    if-nez p2, :cond_0

    const v1, 0x7f04001c

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    :cond_0
    const v0, 0x7f1000b9

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f1000ba

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity$AccountListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    check-cast v2, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity$AccountListAdapter;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;->getGridUUID()Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->getGridByUUID(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    move-result-object v3

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;->getLoginName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-eqz v3, :cond_2

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;->getGridName()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    return-object p2

    :cond_2
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method updateGridList()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/accounts/ManageAccountsActivity$AccountListAdapter;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->loadGrids()V

    return-void
.end method

.method updateList()V
    .locals 0

    invoke-super {p0}, Landroid/widget/ArrayAdapter;->notifyDataSetChanged()V

    return-void
.end method
