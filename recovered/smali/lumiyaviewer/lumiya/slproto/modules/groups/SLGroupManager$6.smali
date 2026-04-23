.class Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$6;
.super Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler",
        "<",
        "Ljava/util/UUID;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$6;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onRequest(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Ljava/util/UUID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$6;->onRequest(Ljava/util/UUID;)V

    return-void
.end method

.method public onRequest(Ljava/util/UUID;)V
    .locals 17
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const-string/jumbo v2, "GroupMemberList: [%s] network requesting for group %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual/range {p1 .. p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :try_start_0
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v4

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;-><init>()V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$6;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->-get2(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;)Ljava/lang/String;

    move-result-object v3

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;

    const/4 v6, 0x1

    new-array v6, v6, [Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    const-string/jumbo v8, "group_id"

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;

    move-object/from16 v0, p1

    invoke-direct {v9, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;-><init>(Ljava/util/UUID;)V

    invoke-direct {v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    const/4 v8, 0x0

    aput-object v7, v6, v8

    invoke-direct {v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;-><init>([Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;)V

    invoke-virtual {v2, v3, v5}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;->PerformRequest(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    const/4 v5, 0x0

    if-eqz v2, :cond_b

    const-string/jumbo v3, "titles"

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v13

    const-string/jumbo v3, "defaults"

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v3

    const-string/jumbo v6, "members"

    invoke-virtual {v2, v6}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    const-wide/16 v14, 0x0

    const-string/jumbo v6, "default_powers"

    invoke-virtual {v3, v6}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    if-eqz v6, :cond_0

    :try_start_1
    const-string/jumbo v6, "default_powers"

    invoke-virtual {v3, v6}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v6, "0x"

    invoke-virtual {v3, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-static {v3}, Ljava/lang/Long;->decode(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-wide v6

    :goto_0
    move-wide v14, v6

    :cond_0
    :goto_1
    :try_start_2
    instance-of v3, v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;

    if-eqz v3, :cond_c

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v16

    move v12, v5

    :cond_1
    :goto_2
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_a

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v5

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    const/4 v11, 0x0

    const-string/jumbo v3, "title"

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    const-string/jumbo v3, "title"

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v3

    invoke-virtual {v13, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v10

    :goto_3
    const-string/jumbo v3, "powers"

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_6

    const-string/jumbo v3, "powers"

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v3

    const/16 v6, 0x10

    invoke-static {v3, v6}, Lcom/google/common/primitives/UnsignedLong;->valueOf(Ljava/lang/String;I)Lcom/google/common/primitives/UnsignedLong;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/common/primitives/UnsignedLong;->longValue()J

    move-result-wide v8

    :goto_4
    const-string/jumbo v3, "last_login"

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7

    const-string/jumbo v3, "last_login"

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v7

    :goto_5
    const-string/jumbo v3, "donated_square_meters"

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_8

    const-string/jumbo v3, "donated_square_meters"

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v6

    :goto_6
    const-string/jumbo v3, "owner"

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    const-string/jumbo v3, "owner"

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->isString()Z

    move-result v3

    if-eqz v3, :cond_9

    const-string/jumbo v3, "owner"

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "y"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string/jumbo v3, "yes"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string/jumbo v3, "true"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string/jumbo v3, "1"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    const/4 v11, 0x1

    :cond_3
    :goto_7
    add-int/lit8 v12, v12, 0x1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$6;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->-get1(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;)Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;

    move-result-object v2

    if-eqz v2, :cond_1

    new-instance v2, Lcom/lumiyaviewer/lumiya/dao/GroupMember;

    move-object/from16 v3, p1

    invoke-direct/range {v2 .. v11}, Lcom/lumiyaviewer/lumiya/dao/GroupMember;-><init>(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;ILjava/lang/String;JLjava/lang/String;Z)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$6;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->-get1(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;)Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/lumiyaviewer/lumiya/dao/GroupMemberDao;->insert(Ljava/lang/Object;)J
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_2

    :catch_0
    move-exception v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$6;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->-get3(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-interface {v3, v0, v2}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultError(Ljava/lang/Object;Ljava/lang/Throwable;)V

    :goto_8
    return-void

    :cond_4
    const/16 v6, 0x10

    :try_start_3
    invoke-static {v3, v6}, Lcom/google/common/primitives/UnsignedLong;->valueOf(Ljava/lang/String;I)Lcom/google/common/primitives/UnsignedLong;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/common/primitives/UnsignedLong;->longValue()J
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    move-result-wide v6

    goto/16 :goto_0

    :catch_1
    move-exception v3

    :try_start_4
    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto/16 :goto_1

    :cond_5
    const/4 v3, 0x0

    invoke-virtual {v13, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v10

    goto/16 :goto_3

    :cond_6
    move-wide v8, v14

    goto/16 :goto_4

    :cond_7
    const-string/jumbo v7, "Unknown"

    goto/16 :goto_5

    :cond_8
    const/4 v6, 0x0

    goto/16 :goto_6

    :cond_9
    const-string/jumbo v3, "owner"

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->isBoolean()Z

    move-result v3

    if-eqz v3, :cond_3

    const-string/jumbo v3, "owner"

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asBoolean()Z

    move-result v11

    goto :goto_7

    :cond_a
    move v2, v12

    :goto_9
    const-string/jumbo v3, "GroupMemberList: parsed list for group: %s requestID %s memberCount %d"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object v4, v5, v6

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v6, 0x2

    aput-object v2, v5, v6

    invoke-static {v3, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$6;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->-get3(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-interface {v2, v0, v4}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_8

    :cond_b
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$6;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->-get3(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v2

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException;

    const-string/jumbo v4, "No data"

    invoke-direct {v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p1

    invoke-interface {v2, v0, v3}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultError(Ljava/lang/Object;Ljava/lang/Throwable;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_8

    :cond_c
    move v2, v5

    goto :goto_9
.end method
