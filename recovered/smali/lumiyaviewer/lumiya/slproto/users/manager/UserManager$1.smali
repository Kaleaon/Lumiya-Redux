.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager$1;
.super Lcom/lumiyaviewer/lumiya/react/RequestProcessor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
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
        "Lcom/lumiyaviewer/lumiya/dao/UserName;",
        "Lcom/lumiyaviewer/lumiya/dao/UserName;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/react/RequestSource;Ljava/util/concurrent/Executor;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

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

    check-cast p2, Lcom/lumiyaviewer/lumiya/dao/UserName;

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager$1;->isRequestComplete(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/dao/UserName;)Z

    move-result v0

    return v0
.end method

.method protected isRequestComplete(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/dao/UserName;)Z
    .locals 3
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/dao/UserName;->getIsBadUUID()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/dao/UserName;->getDisplayName()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/dao/UserName;->getUserName()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method protected processRequest(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/dao/UserName;
    .locals 1
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->-get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Lcom/lumiyaviewer/lumiya/dao/DaoSession;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->getUserNameDao()Lcom/lumiyaviewer/lumiya/dao/UserNameDao;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/dao/UserNameDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/UserName;

    return-object v0
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

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager$1;->processRequest(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/dao/UserName;

    move-result-object v0

    return-object v0
.end method

.method protected processResult(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/dao/UserName;)Lcom/lumiyaviewer/lumiya/dao/UserName;
    .locals 2
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->-get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Lcom/lumiyaviewer/lumiya/dao/DaoSession;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->getUserNameDao()Lcom/lumiyaviewer/lumiya/dao/UserNameDao;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/dao/UserNameDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/UserName;

    if-eqz v0, :cond_1

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/dao/UserName;->mergeWith(Lcom/lumiyaviewer/lumiya/dao/UserName;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->-get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Lcom/lumiyaviewer/lumiya/dao/DaoSession;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->getUserNameDao()Lcom/lumiyaviewer/lumiya/dao/UserNameDao;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/dao/UserNameDao;->update(Ljava/lang/Object;)V

    :cond_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->-get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Lcom/lumiyaviewer/lumiya/dao/DaoSession;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->getUserNameDao()Lcom/lumiyaviewer/lumiya/dao/UserNameDao;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/dao/UserNameDao;->insertOrReplace(Ljava/lang/Object;)J

    return-object p2
.end method

.method protected bridge synthetic processResult(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Ljava/util/UUID;

    check-cast p2, Lcom/lumiyaviewer/lumiya/dao/UserName;

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager$1;->processResult(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/dao/UserName;)Lcom/lumiyaviewer/lumiya/dao/UserName;

    move-result-object v0

    return-object v0
.end method
