.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$4;
.super Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/dao/DaoSession;Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$GroupRoleMembersQuery;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$4;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public onRequest(Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$GroupRoleMembersQuery;)V
    .locals 5
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$GroupRoleMembersQuery;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$4;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->-get5(Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;)Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao;->queryBuilder()Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao$Properties;->GroupID:Lde/greenrobot/dao/Property;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$GroupRoleMembersQuery;->groupID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v1, v2}, Lde/greenrobot/dao/Property;->eq(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Lde/greenrobot/dao/query/WhereCondition;

    sget-object v3, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao$Properties;->RoleID:Lde/greenrobot/dao/Property;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$GroupRoleMembersQuery;->roleID()Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v3, v4}, Lde/greenrobot/dao/Property;->eq(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    sget-object v3, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao$Properties;->RequestID:Lde/greenrobot/dao/Property;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$GroupRoleMembersQuery;->requestID()Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v3, v4}, Lde/greenrobot/dao/Property;->eq(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Lde/greenrobot/dao/query/QueryBuilder;->where(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lde/greenrobot/dao/query/QueryBuilder;->listLazyUncached()Lde/greenrobot/dao/query/LazyList;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$4;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->-get7(Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v1

    invoke-virtual {v1, p1, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic onRequest(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$GroupRoleMembersQuery;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$4;->onRequest(Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$GroupRoleMembersQuery;)V

    return-void
.end method
