.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList$3;
.super Lcom/lumiyaviewer/lumiya/react/RequestFinalProcessor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/react/RequestFinalProcessor",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;",
        "Lcom/google/common/collect/ImmutableList",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;",
        ">;>;"
    }
.end annotation


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-slproto-users-manager-ChatterListTypeSwitchesValues:[I


# instance fields
.field final synthetic $SWITCH_TABLE$com$lumiyaviewer$lumiya$slproto$users$manager$ChatterListType:[I

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

.field final synthetic val$userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-slproto-users-manager-ChatterListTypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList$3;->-com-lumiyaviewer-lumiya-slproto-users-manager-ChatterListTypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList$3;->-com-lumiyaviewer-lumiya-slproto-users-manager-ChatterListTypeSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->values()[Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->Active:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_4

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->Friends:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_3

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->FriendsOnline:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :goto_2
    :try_start_3
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->Groups:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_1

    :goto_3
    :try_start_4
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->Nearby:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_0

    :goto_4
    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList$3;->-com-lumiyaviewer-lumiya-slproto-users-manager-ChatterListTypeSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_4

    :catch_1
    move-exception v1

    goto :goto_3

    :catch_2
    move-exception v1

    goto :goto_2

    :catch_3
    move-exception v1

    goto :goto_1

    :catch_4
    move-exception v1

    goto :goto_0
.end method

.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;Lcom/lumiyaviewer/lumiya/react/RequestSource;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList$3;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList$3;->val$userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-direct {p0, p2, p3}, Lcom/lumiyaviewer/lumiya/react/RequestFinalProcessor;-><init>(Lcom/lumiyaviewer/lumiya/react/RequestSource;Ljava/util/concurrent/Executor;)V

    return-void
.end method


# virtual methods
.method protected cancelRequest(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList$3;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->-get1(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;->dispose()V

    :cond_0
    return-void
.end method

.method protected bridge synthetic cancelRequest(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList$3;->cancelRequest(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;)V

    return-void
.end method

.method protected processRequest(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;)Lcom/google/common/collect/ImmutableList;
    .locals 3
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;",
            ")",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList$3;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->-get1(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList$3;->-getcom-lumiyaviewer-lumiya-slproto-users-manager-ChatterListTypeSwitchesValues()[I

    move-result-object v1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    :goto_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList$3;->val$userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDatabaseExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;->requestRefresh(Ljava/util/concurrent/Executor;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList$3;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->-get1(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;->getChatterList()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    return-object v0

    :pswitch_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList$3;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->-get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->getActiveChattersList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;

    move-result-object v0

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList$3;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->-get2(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->getFriendList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;

    move-result-object v0

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList$3;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->-get2(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/FriendManager;->getFriendsOnlineList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;

    move-result-object v0

    goto :goto_0

    :pswitch_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList$3;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->-get3(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;->getGroupList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;

    move-result-object v0

    goto :goto_0

    :pswitch_4
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/NearbyChattersDisplayDataList;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList$3;->val$userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList$3;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->-get4(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/NearbyChattersDisplayDataList;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method protected bridge synthetic processRequest(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList$3;->processRequest(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    return-object v0
.end method
