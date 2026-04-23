.class public Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper$DrawerToggle;
    }
.end annotation


# instance fields
.field private final drawerAdapter:Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter;

.field private final drawerLayout:Landroid/support/v4/widget/DrawerLayout;

.field private final drawerToggle:Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper$DrawerToggle;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 6

    const/4 v5, 0x1

    const/4 v4, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0x7f100282

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;->drawerLayout:Landroid/support/v4/widget/DrawerLayout;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;->drawerLayout:Landroid/support/v4/widget/DrawerLayout;

    if-eqz v0, :cond_2

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper$DrawerToggle;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;->drawerLayout:Landroid/support/v4/widget/DrawerLayout;

    const v2, 0x7f090252

    const v3, 0x7f0900c0

    invoke-direct {v0, p1, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper$DrawerToggle;-><init>(Landroid/app/Activity;Landroid/support/v4/widget/DrawerLayout;II)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;->drawerToggle:Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper$DrawerToggle;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;->drawerLayout:Landroid/support/v4/widget/DrawerLayout;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;->drawerToggle:Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper$DrawerToggle;

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->setDrawerListener(Landroid/support/v4/widget/DrawerLayout$DrawerListener;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;->drawerLayout:Landroid/support/v4/widget/DrawerLayout;

    const v1, 0x7f100283

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    if-eqz v0, :cond_1

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter;

    invoke-direct {v1, p1}, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;->drawerAdapter:Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;->drawerAdapter:Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    :goto_0
    instance-of v0, p1, Landroid/support/v7/app/AppCompatActivity;

    if-eqz v0, :cond_0

    check-cast p1, Landroid/support/v7/app/AppCompatActivity;

    invoke-virtual {p1}, Landroid/support/v7/app/AppCompatActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, v5}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    invoke-virtual {v0, v5}, Landroid/support/v7/app/ActionBar;->setHomeButtonEnabled(Z)V

    :cond_0
    :goto_1
    return-void

    :cond_1
    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;->drawerAdapter:Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter;

    goto :goto_0

    :cond_2
    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;->drawerToggle:Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper$DrawerToggle;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;->drawerAdapter:Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter;

    goto :goto_1
.end method


# virtual methods
.method public onBackPressed()Z
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;->drawerLayout:Landroid/support/v4/widget/DrawerLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;->drawerLayout:Landroid/support/v4/widget/DrawerLayout;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;->drawerLayout:Landroid/support/v4/widget/DrawerLayout;

    const v2, 0x7f100283

    invoke-virtual {v1, v2}, Landroid/support/v4/widget/DrawerLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->isDrawerOpen(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;->drawerLayout:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v0}, Landroid/support/v4/widget/DrawerLayout;->closeDrawers()V

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;->drawerToggle:Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper$DrawerToggle;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;->drawerToggle:Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper$DrawerToggle;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper$DrawerToggle;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    :cond_0
    return-void
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;->drawerLayout:Landroid/support/v4/widget/DrawerLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;->drawerLayout:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v0}, Landroid/support/v4/widget/DrawerLayout;->closeDrawers()V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;->drawerAdapter:Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;->drawerAdapter:Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter;

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-wide v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    :cond_1
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;->drawerToggle:Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper$DrawerToggle;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;->drawerToggle:Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper$DrawerToggle;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper$DrawerToggle;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public syncState()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;->drawerToggle:Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper$DrawerToggle;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper;->drawerToggle:Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper$DrawerToggle;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerActivityHelper$DrawerToggle;->syncState()V

    :cond_0
    return-void
.end method
