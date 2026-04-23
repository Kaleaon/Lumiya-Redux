.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterGroupSubscription;
.super Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;


# annotations
.annotation build Ljavax/annotation/concurrent/NotThreadSafe;
.end annotation


# instance fields
.field private final groupProfileSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 3
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/SortedChatterList;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getCachedGroupProfiles()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;->getChatterUUID()Ljava/util/UUID;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$eTv5Cj2a9ssR4ZBNRV1Lgb181AY;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$eTv5Cj2a9ssR4ZBNRV1Lgb181AY;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterGroupSubscription;->groupProfileSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    return-void
.end method

.method private onGroupProfile(Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;)V
    .locals 2

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;->Name:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterGroupSubscription;->displayData:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->displayName:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterGroupSubscription;->displayData:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->withDisplayName(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterGroupSubscription;->setChatterDisplayData(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;)V

    :cond_0
    return-void
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_slproto_users_manager_ChatterGroupSubscription-mthref-0(Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterGroupSubscription;->onGroupProfile(Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;)V

    return-void
.end method

.method public unsubscribe()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterGroupSubscription;->groupProfileSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->unsubscribe()V

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterSubscription;->unsubscribe()V

    return-void
.end method
