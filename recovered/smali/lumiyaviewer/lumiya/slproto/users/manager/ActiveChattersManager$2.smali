.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$2;
.super Lcom/lumiyaviewer/lumiya/react/RequestFinalProcessor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/dao/DaoSession;Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/react/RequestFinalProcessor",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;",
        "Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

.field final synthetic val$userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;Lcom/lumiyaviewer/lumiya/react/RequestSource;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$2;->val$userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-direct {p0, p2, p3}, Lcom/lumiyaviewer/lumiya/react/RequestFinalProcessor;-><init>(Lcom/lumiyaviewer/lumiya/react/RequestSource;Ljava/util/concurrent/Executor;)V

    return-void
.end method


# virtual methods
.method protected processRequest(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;
    .locals 4
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->getChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Lcom/lumiyaviewer/lumiya/dao/Chatter;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getLastMessageID()Ljava/lang/Long;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->-get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;)Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    move-result-object v0

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getLastMessageID()Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$2;->val$userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->loadFromDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    move-result-object v0

    :goto_0
    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getUnreadCount()I

    move-result v1

    invoke-static {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;->create(ILcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;->create(ILcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;

    move-result-object v0

    return-object v0

    :cond_1
    move-object v0, v1

    goto :goto_0
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

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$2;->processRequest(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;

    move-result-object v0

    return-object v0
.end method
