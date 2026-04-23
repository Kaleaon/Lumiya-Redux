.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersDisplayDataList;
.super Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;Ljava/util/Comparator;)V

    return-void
.end method


# virtual methods
.method protected getChatters()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;",
            ">;"
        }
    .end annotation

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersDisplayDataList;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDaoSession()Lcom/lumiyaviewer/lumiya/dao/DaoSession;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->getChatterDao()Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/ChatterDao;->queryBuilder()Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/dao/ChatterDao$Properties;->Active:Lde/greenrobot/dao/Property;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v2}, Lde/greenrobot/dao/Property;->notEq(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v1

    new-array v2, v3, [Lde/greenrobot/dao/query/WhereCondition;

    invoke-virtual {v0, v1, v2}, Lde/greenrobot/dao/query/QueryBuilder;->where(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lde/greenrobot/dao/query/QueryBuilder;->list()Ljava/util/List;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/Chatter;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersDisplayDataList;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v3

    invoke-static {v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->fromDatabaseObject(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/dao/Chatter;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v1
.end method
