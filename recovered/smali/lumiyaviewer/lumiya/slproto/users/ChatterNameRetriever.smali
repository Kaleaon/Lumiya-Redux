.class public Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;
    }
.end annotation


# instance fields
.field public final chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

.field private final executor:Ljava/util/concurrent/Executor;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final listener:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;",
            ">;"
        }
    .end annotation
.end field

.field private volatile resolvedName:Ljava/lang/String;

.field private volatile resolvedSecondaryName:Ljava/lang/String;

.field private subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;Ljava/util/concurrent/Executor;)V
    .locals 1
    .param p3    # Ljava/util/concurrent/Executor;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->listener:Ljava/lang/ref/WeakReference;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->executor:Ljava/util/concurrent/Executor;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->subscribe()V

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;Ljava/util/concurrent/Executor;Z)V
    .locals 1
    .param p3    # Ljava/util/concurrent/Executor;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->listener:Ljava/lang/ref/WeakReference;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->executor:Ljava/util/concurrent/Executor;

    if-eqz p4, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->subscribe()V

    :cond_0
    return-void
.end method

.method private onCurrentLocation(Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;)V
    .locals 2

    const/4 v0, 0x0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->parcelData()Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getName()Ljava/lang/String;

    move-result-object v0

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->resolvedName:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->resolvedName:Ljava/lang/String;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->listener:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;

    if-eqz v0, :cond_1

    invoke-interface {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;->onChatterNameUpdated(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V

    :cond_1
    return-void
.end method

.method private onGroupProfile(Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;)V
    .locals 1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;->Name:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->resolvedName:Ljava/lang/String;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;->Name:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->resolvedSecondaryName:Ljava/lang/String;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->listener:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;

    if-eqz v0, :cond_0

    invoke-interface {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;->onChatterNameUpdated(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V

    :cond_0
    return-void
.end method

.method private onUserName(Lcom/lumiyaviewer/lumiya/dao/UserName;)V
    .locals 4

    const-string/jumbo v0, "Resolved name for %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/UserName;->getUuid()Ljava/util/UUID;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->isLegacyUserNames()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/UserName;->getUserName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->resolvedName:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/UserName;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->resolvedSecondaryName:Ljava/lang/String;

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->listener:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;

    if-eqz v0, :cond_0

    invoke-interface {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;->onChatterNameUpdated(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V

    :cond_0
    return-void

    :cond_1
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/UserName;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->resolvedName:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/UserName;->getUserName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->resolvedSecondaryName:Ljava/lang/String;

    goto :goto_0
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_slproto_users_ChatterNameRetriever-mthref-0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->onCurrentLocation(Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_slproto_users_ChatterNameRetriever-mthref-1(Lcom/lumiyaviewer/lumiya/dao/UserName;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->onUserName(Lcom/lumiyaviewer/lumiya/dao/UserName;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_slproto_users_ChatterNameRetriever-mthref-2(Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->onGroupProfile(Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;)V

    return-void
.end method

.method public dispose()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->unsubscribe()V

    :cond_0
    return-void
.end method

.method public getResolvedName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->resolvedName:Ljava/lang/String;

    return-object v0
.end method

.method public getResolvedSecondaryName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->resolvedSecondaryName:Ljava/lang/String;

    return-object v0
.end method

.method public subscribe()V
    .locals 4

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Local:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    if-ne v1, v2, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getCurrentLocationInfo()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->getSingleDataKey()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->executor:Ljava/util/concurrent/Executor;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/users/-$Lambda$Tr7QBnh_GnHDqFtHSpMdsLw3Yfs;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/-$Lambda$Tr7QBnh_GnHDqFtHSpMdsLw3Yfs;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    :goto_0
    return-void

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v1, v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserNames()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->executor:Ljava/util/concurrent/Executor;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/users/-$Lambda$Tr7QBnh_GnHDqFtHSpMdsLw3Yfs$1;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/-$Lambda$Tr7QBnh_GnHDqFtHSpMdsLw3Yfs$1;-><init>(Ljava/lang/Object;)V

    invoke-interface {v1, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v1, v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    if-eqz v1, :cond_2

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getCachedGroupProfiles()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;->getChatterUUID()Ljava/util/UUID;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->executor:Ljava/util/concurrent/Executor;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/users/-$Lambda$Tr7QBnh_GnHDqFtHSpMdsLw3Yfs$2;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/-$Lambda$Tr7QBnh_GnHDqFtHSpMdsLw3Yfs$2;-><init>(Ljava/lang/Object;)V

    invoke-interface {v1, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    goto :goto_0

    :cond_2
    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    goto :goto_0

    :cond_3
    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    goto :goto_0
.end method
