.class public Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;
.super Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog$OnGridEditResultListener;
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity$GridListAdapter;
    }
.end annotation


# instance fields
.field private adapter:Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity$GridListAdapter;

.field private displayList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;",
            ">;"
        }
    .end annotation
.end field

.field private gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

.field gridListView:Landroid/widget/ListView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1001db
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->displayList:Ljava/util/List;

    return-void
.end method

.method private deleteGrid(Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->deleteGrid(Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->displayList:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->getGridList(Ljava/util/List;)Ljava/util/List;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->adapter:Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity$GridListAdapter;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity$GridListAdapter;->updateList()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_grids_ManageGridsActivity_6231(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method


# virtual methods
.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_grids_ManageGridsActivity_6020(Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p2}, Landroid/content/DialogInterface;->dismiss()V

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->deleteGrid(Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;)V

    return-void
.end method

.method public onAddNewGridButton()V
    .locals 3
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f1001dc
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;-><init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/ui/grids/GridList;Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;)V

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->setOnGridEditResultListener(Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog$OnGridEditResultListener;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->show()V

    return-void
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 6

    const/4 v5, 0x1

    invoke-interface {p1}, Landroid/view/MenuItem;->getMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;

    move-result-object v0

    check-cast v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->adapter:Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity$GridListAdapter;

    iget v0, v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity$GridListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    :cond_0
    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0

    :pswitch_0
    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    invoke-direct {v1, p0, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;-><init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/ui/grids/GridList;Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;)V

    invoke-virtual {v1, p0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->setOnGridEditResultListener(Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog$OnGridEditResultListener;)V

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->show()V

    return v5

    :pswitch_1
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f090130

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v5}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string/jumbo v3, "Yes"

    new-instance v4, Lcom/lumiyaviewer/lumiya/ui/grids/-$Lambda$mB53054QosfH2NBejFMOD8VFF4s$1;

    invoke-direct {v4, p0, v0}, Lcom/lumiyaviewer/lumiya/ui/grids/-$Lambda$mB53054QosfH2NBejFMOD8VFF4s$1;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v2, "No"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/grids/-$Lambda$mB53054QosfH2NBejFMOD8VFF4s;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/ui/grids/-$Lambda$mB53054QosfH2NBejFMOD8VFF4s;-><init>()V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return v5

    :pswitch_data_0
    .packed-switch 0x7f1002fe
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f04005d

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->setContentView(I)V

    invoke-static {p0}, Lbutterknife/ButterKnife;->bind(Landroid/app/Activity;)Lbutterknife/Unbinder;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->displayList:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->getGridList(Ljava/util/List;)Ljava/util/List;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity$GridListAdapter;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->displayList:Ljava/util/List;

    invoke-direct {v0, p0, v1}, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity$GridListAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->adapter:Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity$GridListAdapter;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->gridListView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->adapter:Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity$GridListAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->gridListView:Landroid/widget/ListView;

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->gridListView:Landroid/widget/ListView;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->registerForContextMenu(Landroid/view/View;)V

    return-void
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 2

    invoke-super {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V

    check-cast p3, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->adapter:Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity$GridListAdapter;

    iget v1, p3, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity$GridListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;->isPredefinedGrid()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f120004

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    :cond_0
    return-void
.end method

.method public onGridAdded(Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;Z)V
    .locals 2

    if-eqz p2, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->addNewGrid(Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;)V

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->displayList:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->getGridList(Ljava/util/List;)Ljava/util/List;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->adapter:Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity$GridListAdapter;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity$GridListAdapter;->updateList()V

    const v0, 0x7f1001db

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v1

    invoke-interface {v1}, Landroid/widget/ListAdapter;->getCount()I

    move-result v1

    if-lez v1, :cond_0

    invoke-virtual {v0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v1

    invoke-interface {v1}, Landroid/widget/ListAdapter;->getCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setSelection(I)V

    :cond_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->savePreferences()V

    goto :goto_0
.end method

.method public onGridDeleted(Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->deleteGrid(Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;)V

    return-void
.end method

.method public onGridEditCancelled()V
    .locals 0

    return-void
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

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->adapter:Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity$GridListAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->adapter:Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity$GridListAdapter;

    invoke-virtual {v0, p3}, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity$GridListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;->isPredefinedGrid()Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/grids/ManageGridsActivity;->gridList:Lcom/lumiyaviewer/lumiya/ui/grids/GridList;

    invoke-direct {v1, p0, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;-><init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/ui/grids/GridList;Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;)V

    invoke-virtual {v1, p0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->setOnGridEditResultListener(Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog$OnGridEditResultListener;)V

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/grids/GridEditDialog;->show()V

    :cond_0
    return-void
.end method
