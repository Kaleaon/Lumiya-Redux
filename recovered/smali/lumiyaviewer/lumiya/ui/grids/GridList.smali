.class public Lcom/lumiyaviewer/lumiya/ui/grids/GridList;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridArrayAdapter;,
        Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private customGrids:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;",
            ">;"
        }
    .end annotation
.end field

.field private predefGrids:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 11

    const/4 v10, 0x1

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->context:Landroid/content/Context;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->predefGrids:Ljava/util/ArrayList;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f0f0009

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    array-length v3, v2

    move v0, v1

    :goto_0
    if-ge v0, v3, :cond_0

    aget-object v4, v2, v0

    const-string/jumbo v5, ";"

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->predefGrids:Ljava/util/ArrayList;

    new-instance v6, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    aget-object v7, v4, v1

    aget-object v8, v4, v10

    const/4 v9, 0x2

    aget-object v4, v4, v9

    invoke-static {v4}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v4

    invoke-direct {v6, v7, v8, v10, v4}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/util/UUID;)V

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->customGrids:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->loadGrids()V

    return-void
.end method


# virtual methods
.method public addNewGrid(Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->customGrids:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->savePreferences()V

    return-void
.end method

.method public deleteGrid(Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->customGrids:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->savePreferences()V

    return-void
.end method

.method public getDefaultGrid()Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->predefGrids:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    return-object v0
.end method

.method public getGridByName(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->predefGrids:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;->getGridName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->customGrids:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;->getGridName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    return-object v0

    :cond_3
    const/4 v0, 0x0

    return-object v0
.end method

.method public getGridByUUID(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->predefGrids:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;->getGridUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->customGrids:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;->getGridUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    return-object v0

    :cond_3
    const/4 v0, 0x0

    return-object v0
.end method

.method public getGridIndex(Ljava/util/UUID;)I
    .locals 4

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->predefGrids:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move v1, v2

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;->getGridUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->customGrids:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;->getGridUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    return v1

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_3
    return v2
.end method

.method public getGridList(Ljava/util/List;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;",
            ">;"
        }
    .end annotation

    if-nez p1, :cond_0

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    :cond_0
    invoke-interface {p1}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->predefGrids:Ljava/util/ArrayList;

    invoke-interface {p1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->customGrids:Ljava/util/ArrayList;

    invoke-interface {p1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    return-object p1
.end method

.method public getGridList(Ljava/util/List;Z)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;",
            ">;Z)",
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;",
            ">;"
        }
    .end annotation

    const/4 v4, 0x0

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->getGridList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    if-eqz p2, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    const-string/jumbo v2, "Add another grid"

    const/4 v3, 0x0

    invoke-direct {v1, v2, v4, v3, v4}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/util/UUID;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    return-object v0
.end method

.method public loadGrids()V
    .locals 7

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->customGrids:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string/jumbo v2, "custom_grid_1_count"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    :goto_0
    if-ge v0, v2, :cond_0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->customGrids:Ljava/util/ArrayList;

    new-instance v4, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "custom_grid_1_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v1, v5}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public savePreferences()V
    .locals 5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v0, "custom_grid_1_count"

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->customGrids:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-interface {v2, v0, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->customGrids:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList;->customGrids:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "custom_grid_1_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/lumiyaviewer/lumiya/ui/grids/GridList$GridInfo;->saveToPreferences(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;)V

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_0
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method
