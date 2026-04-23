.class public Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;
.super Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/utils/reqset/RequestListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher$1;
    }
.end annotation


# static fields
.field private static final MAX_BATCH_SIZE:I = 0x4

.field private static final REPLY_TIMEOUT:J = 0x2710L


# instance fields
.field private final caps:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;

.field private final hasNamesToFetch:Ljava/util/concurrent/locks/Condition;

.field private isWaitingReply:Z

.field private final lock:Ljava/util/concurrent/locks/Lock;

.field private volatile threadMustExit:Z

.field private final threadRunnable:Ljava/lang/Runnable;

.field private final udpLock:Ljava/lang/Object;

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

.field private final userNameRequests:Lcom/lumiyaviewer/lumiya/utils/reqset/WeakPriorityRequestSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/utils/reqset/WeakPriorityRequestSet",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private waitingReplySince:J

.field private final workingThread:Ljava/lang/Thread;

.field private final xmlReq:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;)Ljava/util/concurrent/locks/Condition;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->hasNamesToFetch:Ljava/util/concurrent/locks/Condition;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;)Ljava/util/concurrent/locks/Lock;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->lock:Ljava/util/concurrent/locks/Lock;

    return-object v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->threadMustExit:Z

    return v0
.end method

.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;)Z
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->FetchSomeNamesOverHTTP()Z

    move-result v0

    return v0
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;)V
    .locals 4

    const/4 v3, 0x0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->lock:Ljava/util/concurrent/locks/Lock;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->hasNamesToFetch:Ljava/util/concurrent/locks/Condition;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->udpLock:Ljava/lang/Object;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->waitingReplySince:J

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->threadRunnable:Ljava/lang/Runnable;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->caps:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->threadMustExit:Z

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->GetDisplayNames:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->getCapability(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->xmlReq:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;

    new-instance v0, Ljava/lang/Thread;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->threadRunnable:Ljava/lang/Runnable;

    const-string/jumbo v2, "DisplayNameFetcher"

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->workingThread:Ljava/lang/Thread;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->workingThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserNameRequests()Lcom/lumiyaviewer/lumiya/utils/reqset/WeakPriorityRequestSet;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->userNameRequests:Lcom/lumiyaviewer/lumiya/utils/reqset/WeakPriorityRequestSet;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->userNameRequests:Lcom/lumiyaviewer/lumiya/utils/reqset/WeakPriorityRequestSet;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/utils/reqset/WeakPriorityRequestSet;->addListener(Lcom/lumiyaviewer/lumiya/utils/reqset/RequestListener;)V

    :goto_1
    return-void

    :cond_0
    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->workingThread:Ljava/lang/Thread;

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->xmlReq:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;

    goto :goto_0

    :cond_1
    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->userNameRequests:Lcom/lumiyaviewer/lumiya/utils/reqset/WeakPriorityRequestSet;

    goto :goto_1
.end method

.method private FetchSomeNamesOverHTTP()Z
    .locals 9

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->getUUIDsToFetch(I)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return v3

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->caps:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->GetDisplayNames:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    invoke-virtual {v4, v6}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->getCapability(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v4, "/"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    move v1, v2

    move-object v4, v0

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v4, "?"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v4, "ids="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move v1, v3

    move-object v4, v0

    goto :goto_0

    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v4, "&"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    :cond_2
    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->xmlReq:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;

    const/4 v1, 0x0

    invoke-virtual {v0, v4, v1}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;->PerformRequest(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    move-object v1, v0

    :goto_2
    if-eqz v1, :cond_6

    :try_start_1
    const-string/jumbo v0, "agents"

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string/jumbo v0, "agents"

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v4

    move v0, v3

    :goto_3
    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->getCount()I

    move-result v5

    if-ge v0, v5, :cond_4

    invoke-virtual {v4, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v5

    const-string/jumbo v6, "id"

    invoke-virtual {v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v6

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asUUID()Ljava/util/UUID;

    move-result-object v6

    const-string/jumbo v7, "display_name"

    invoke-virtual {v5, v7}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v7

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "username"

    invoke-virtual {v5, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v5

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v5

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v8, :cond_3

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v8, v6, v5, v7}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->updateUserNames(Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->userNameRequests:Lcom/lumiyaviewer/lumiya/utils/reqset/WeakPriorityRequestSet;

    invoke-virtual {v5, v6}, Lcom/lumiyaviewer/lumiya/utils/reqset/WeakPriorityRequestSet;->completeRequest(Ljava/lang/Object;)V
    :try_end_1
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_1 .. :try_end_1} :catch_2

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    move-object v1, v5

    goto :goto_2

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;->printStackTrace()V

    move-object v1, v5

    goto :goto_2

    :cond_4
    :try_start_2
    const-string/jumbo v0, "bad_ids"

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string/jumbo v0, "bad_ids"

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    :goto_4
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->getCount()I

    move-result v1

    if-ge v3, v1, :cond_6

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v4, :cond_5

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v4, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->setUserBadUUID(Ljava/util/UUID;)V

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->userNameRequests:Lcom/lumiyaviewer/lumiya/utils/reqset/WeakPriorityRequestSet;

    invoke-virtual {v4, v1}, Lcom/lumiyaviewer/lumiya/utils/reqset/WeakPriorityRequestSet;->completeRequest(Ljava/lang/Object;)V
    :try_end_2
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_2 .. :try_end_2} :catch_2

    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    :catch_2
    move-exception v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException;->printStackTrace()V

    :cond_6
    return v2
.end method

.method private FetchSomeNamesOverUDP()V
    .locals 5

    const/4 v4, 0x1

    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->getUUIDsToFetch(I)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->isWaitingReply:Z

    return-void

    :cond_0
    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameRequest;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameRequest;-><init>()V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameRequest$UUIDNameBlock;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameRequest$UUIDNameBlock;-><init>()V

    iput-object v0, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameRequest$UUIDNameBlock;->ID:Ljava/util/UUID;

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameRequest;->UUIDNameBlock_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    iput-boolean v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->isWaitingReply:Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->waitingReplySince:J

    iput-boolean v4, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameRequest;->isReliable:Z

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method private getUUIDsToFetch(I)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->userNameRequests:Lcom/lumiyaviewer/lumiya/utils/reqset/WeakPriorityRequestSet;

    if-eqz v0, :cond_0

    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    if-ge v0, p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->userNameRequests:Lcom/lumiyaviewer/lumiya/utils/reqset/WeakPriorityRequestSet;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/utils/reqset/WeakPriorityRequestSet;->getRequest()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    if-eqz v0, :cond_0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v1
.end method


# virtual methods
.method public HandleCloseCircuit()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->threadMustExit:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->xmlReq:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->xmlReq:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;->InterruptRequest()V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->workingThread:Ljava/lang/Thread;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->workingThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->userNameRequests:Lcom/lumiyaviewer/lumiya/utils/reqset/WeakPriorityRequestSet;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->userNameRequests:Lcom/lumiyaviewer/lumiya/utils/reqset/WeakPriorityRequestSet;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/utils/reqset/WeakPriorityRequestSet;->removeListener(Lcom/lumiyaviewer/lumiya/utils/reqset/RequestListener;)V

    :cond_2
    return-void
.end method

.method public declared-synchronized HandleUUIDNameReply(Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameReply;)V
    .locals 5
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameReply;->UUIDNameBlock_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameReply$UUIDNameBlock;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameReply$UUIDNameBlock;->ID:Ljava/util/UUID;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameReply$UUIDNameBlock;->FirstName:[B

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameReply$UUIDNameBlock;->LastName:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v3, v2, v0, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->updateUserNames(Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->userNameRequests:Lcom/lumiyaviewer/lumiya/utils/reqset/WeakPriorityRequestSet;

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/utils/reqset/WeakPriorityRequestSet;->completeRequest(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_1
    :try_start_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->udpLock:Ljava/lang/Object;

    monitor-enter v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v0, 0x0

    :try_start_2
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->isWaitingReply:Z

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->FetchSomeNamesOverUDP()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-void

    :catchall_1
    move-exception v0

    :try_start_4
    monitor-exit v1

    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
.end method

.method public onNewRequest()V
    .locals 8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->workingThread:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->hasNamesToFetch:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signal()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    :goto_0
    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->udpLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_1
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->isWaitingReply:Z

    if-eqz v0, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->waitingReplySince:J

    const-wide/16 v6, 0x2710

    add-long/2addr v4, v6

    cmp-long v0, v2, v4

    if-lez v0, :cond_2

    :cond_1
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;->FetchSomeNamesOverUDP()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :cond_2
    monitor-exit v1

    goto :goto_0

    :catchall_1
    move-exception v0

    monitor-exit v1

    throw v0
.end method
