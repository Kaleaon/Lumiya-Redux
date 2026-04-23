.class public Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;
.super Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader",
        "<",
        "Lcom/lumiyaviewer/lumiya/dao/ChatMessage;",
        ">;"
    }
.end annotation


# instance fields
.field private final chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private chatter:Lcom/lumiyaviewer/lumiya/dao/Chatter;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;ILjava/util/concurrent/Executor;ZLcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$EventListener;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Ljava/util/concurrent/Executor;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p6    # Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$EventListener;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0, p3, p4, p5, p6}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader;-><init>(ILjava/util/concurrent/Executor;ZLcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$EventListener;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;->chatter:Lcom/lumiyaviewer/lumiya/dao/Chatter;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDaoSession()Lcom/lumiyaviewer/lumiya/dao/DaoSession;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->getChatMessageDao()Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;->chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    return-void
.end method


# virtual methods
.method protected loadInBackground(IJZ)Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJZ)",
            "Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/ChatMessage;",
            ">;"
        }
    .end annotation

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;->chatter:Lcom/lumiyaviewer/lumiya/dao/Chatter;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v0, v3, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->getChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Z)Lcom/lumiyaviewer/lumiya/dao/Chatter;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;->chatter:Lcom/lumiyaviewer/lumiya/dao/Chatter;

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;->chatter:Lcom/lumiyaviewer/lumiya/dao/Chatter;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;->chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;->queryBuilder()Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    sget-object v3, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->ChatterID:Lde/greenrobot/dao/Property;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatMessageLoader;->chatter:Lcom/lumiyaviewer/lumiya/dao/Chatter;

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getId()Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v3, v4}, Lde/greenrobot/dao/Property;->eq(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v3

    new-array v4, v2, [Lde/greenrobot/dao/query/WhereCondition;

    invoke-virtual {v0, v3, v4}, Lde/greenrobot/dao/query/QueryBuilder;->where(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    if-eqz p4, :cond_2

    sget-object v3, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->Id:Lde/greenrobot/dao/Property;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v3, v4}, Lde/greenrobot/dao/Property;->gt(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v3

    new-array v4, v2, [Lde/greenrobot/dao/query/WhereCondition;

    invoke-virtual {v0, v3, v4}, Lde/greenrobot/dao/query/QueryBuilder;->where(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    new-array v3, v1, [Lde/greenrobot/dao/Property;

    sget-object v4, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->Id:Lde/greenrobot/dao/Property;

    aput-object v4, v3, v2

    invoke-virtual {v0, v3}, Lde/greenrobot/dao/query/QueryBuilder;->orderAsc([Lde/greenrobot/dao/Property;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    :goto_0
    add-int/lit8 v3, p1, 0x1

    invoke-virtual {v0, v3}, Lde/greenrobot/dao/query/QueryBuilder;->limit(I)Lde/greenrobot/dao/query/QueryBuilder;

    invoke-virtual {v0}, Lde/greenrobot/dao/query/QueryBuilder;->list()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    if-le v0, p1, :cond_3

    move v0, v1

    :goto_1
    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v3, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    :cond_1
    new-instance v1, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;

    invoke-direct {v1, v3, v0, p2, p3}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;-><init>(Ljava/util/List;ZJ)V

    return-object v1

    :cond_2
    sget-object v3, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->Id:Lde/greenrobot/dao/Property;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v3, v4}, Lde/greenrobot/dao/Property;->lt(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v3

    new-array v4, v2, [Lde/greenrobot/dao/query/WhereCondition;

    invoke-virtual {v0, v3, v4}, Lde/greenrobot/dao/query/QueryBuilder;->where(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    new-array v3, v1, [Lde/greenrobot/dao/Property;

    sget-object v4, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->Id:Lde/greenrobot/dao/Property;

    aput-object v4, v3, v2

    invoke-virtual {v0, v3}, Lde/greenrobot/dao/query/QueryBuilder;->orderDesc([Lde/greenrobot/dao/Property;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    goto :goto_0

    :cond_3
    move v0, v2

    goto :goto_1

    :cond_4
    new-instance v0, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {v0, v1, v2, p2, p3}, Lcom/lumiyaviewer/lumiya/utils/wlist/ChunkedListLoader$LoadResult;-><init>(Ljava/util/List;ZJ)V

    return-object v0
.end method
