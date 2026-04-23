.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterUserSubscription;
.super Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;


# annotations
.annotation build Ljavax/annotation/concurrent/NotThreadSafe;
.end annotation


# instance fields
.field private final distanceSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<",
            "Ljava/util/UUID;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final nameSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/dao/UserName;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final onlineStatusSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<",
            "Ljava/util/UUID;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 3
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserNames()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$o86h7H3WuAxnvPtFprunJr0Jq8o;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$o86h7H3WuAxnvPtFprunJr0Jq8o;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterUserSubscription;->nameSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getFriendManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->getOnlineStatus()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$o86h7H3WuAxnvPtFprunJr0Jq8o$1;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$o86h7H3WuAxnvPtFprunJr0Jq8o$1;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterUserSubscription;->onlineStatusSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getDistanceToUser()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$o86h7H3WuAxnvPtFprunJr0Jq8o$2;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$o86h7H3WuAxnvPtFprunJr0Jq8o$2;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterUserSubscription;->distanceSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    return-void
.end method

.method private onDistance(Ljava/lang/Float;)V
    .locals 2

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterUserSubscription;->displayData:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->distanceToUser:F

    invoke-static {v0, v1}, Ljava/lang/Float;->compare(FF)I

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterUserSubscription;->displayData:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->withDistanceToUser(F)Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterUserSubscription;->setChatterDisplayData(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;)V

    :cond_0
    return-void
.end method

.method private onOnlineStatus(Ljava/lang/Boolean;)V
    .locals 2

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterUserSubscription;->displayData:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->isOnline:Z

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterUserSubscription;->displayData:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->withOnlineStatus(Z)Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterUserSubscription;->setChatterDisplayData(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;)V

    :cond_0
    return-void
.end method

.method private onUserName(Lcom/lumiyaviewer/lumiya/dao/UserName;)V
    .locals 2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->isLegacyUserNames()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/UserName;->getUserName()Ljava/lang/String;

    move-result-object v0

    :goto_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterUserSubscription;->displayData:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->displayName:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterUserSubscription;->displayData:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->withDisplayName(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterUserSubscription;->setChatterDisplayData(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;)V

    :cond_0
    return-void

    :cond_1
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/UserName;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_slproto_users_manager_ChatterUserSubscription-mthref-0(Lcom/lumiyaviewer/lumiya/dao/UserName;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterUserSubscription;->onUserName(Lcom/lumiyaviewer/lumiya/dao/UserName;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_slproto_users_manager_ChatterUserSubscription-mthref-1(Ljava/lang/Boolean;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterUserSubscription;->onOnlineStatus(Ljava/lang/Boolean;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_slproto_users_manager_ChatterUserSubscription-mthref-2(Ljava/lang/Float;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterUserSubscription;->onDistance(Ljava/lang/Float;)V

    return-void
.end method

.method public unsubscribe()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterUserSubscription;->nameSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterUserSubscription;->onlineStatusSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterUserSubscription;->distanceSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->unsubscribe()V

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->unsubscribe()V

    return-void
.end method
