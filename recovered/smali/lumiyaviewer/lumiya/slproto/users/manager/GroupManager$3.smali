.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$3;
.super Lcom/lumiyaviewer/lumiya/react/RequestProcessor;


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
        "Lcom/lumiyaviewer/lumiya/react/RequestProcessor",
        "<",
        "Ljava/util/UUID;",
        "Ljava/util/UUID;",
        "Ljava/util/UUID;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;Lcom/lumiyaviewer/lumiya/react/RequestSource;Ljava/util/concurrent/Executor;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$3;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;

    invoke-direct {p0, p2, p3}, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;-><init>(Lcom/lumiyaviewer/lumiya/react/RequestSource;Ljava/util/concurrent/Executor;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic isRequestComplete(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Ljava/util/UUID;

    check-cast p2, Ljava/util/UUID;

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$3;->isRequestComplete(Ljava/util/UUID;Ljava/util/UUID;)Z

    move-result v0

    return v0
.end method

.method protected isRequestComplete(Ljava/util/UUID;Ljava/util/UUID;)Z
    .locals 1
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$3;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->-get6(Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;)Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberList;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberList;->getMustRevalidate()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected bridge synthetic processRequest(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    check-cast p1, Ljava/util/UUID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$3;->processRequest(Ljava/util/UUID;)Ljava/util/UUID;

    move-result-object v0

    return-object v0
.end method

.method protected processRequest(Ljava/util/UUID;)Ljava/util/UUID;
    .locals 2
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$3;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->-get6(Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;)Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberList;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberList;->getRequestID()Ljava/util/UUID;

    move-result-object v0

    return-object v0

    :cond_0
    return-object v1
.end method

.method protected bridge synthetic processResult(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Ljava/util/UUID;

    check-cast p2, Ljava/util/UUID;

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$3;->processResult(Ljava/util/UUID;Ljava/util/UUID;)Ljava/util/UUID;

    move-result-object v0

    return-object v0
.end method

.method protected processResult(Ljava/util/UUID;Ljava/util/UUID;)Ljava/util/UUID;
    .locals 2
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    new-instance v0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberList;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1}, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberList;-><init>(Ljava/util/UUID;Ljava/util/UUID;Z)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$3;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->-get6(Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;)Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao;->insertOrReplace(Ljava/lang/Object;)J

    return-object p2
.end method
