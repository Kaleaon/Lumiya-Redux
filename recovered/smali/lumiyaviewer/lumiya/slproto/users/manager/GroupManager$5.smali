.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$5;
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
        "Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$GroupMembersQuery;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$5;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public onRequest(Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$GroupMembersQuery;)V
    .locals 6
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$GroupMembersQuery;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$5;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->-get4(Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$5;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->-get1(Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;)Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;->queryBuilder()Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao$Properties;->GroupID:Lde/greenrobot/dao/Property;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$GroupMembersQuery;->groupID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v2, v3}, Lde/greenrobot/dao/Property;->eq(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Lde/greenrobot/dao/query/WhereCondition;

    sget-object v4, Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao$Properties;->RequestID:Lde/greenrobot/dao/Property;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$GroupMembersQuery;->requestID()Ljava/util/UUID;

    move-result-object v5

    invoke-virtual {v4, v5}, Lde/greenrobot/dao/Property;->eq(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v1, v2, v3}, Lde/greenrobot/dao/query/QueryBuilder;->where(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lde/greenrobot/dao/query/QueryBuilder;->listLazyUncached()Lde/greenrobot/dao/query/LazyList;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic onRequest(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$GroupMembersQuery;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$5;->onRequest(Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$GroupMembersQuery;)V

    return-void
.end method
