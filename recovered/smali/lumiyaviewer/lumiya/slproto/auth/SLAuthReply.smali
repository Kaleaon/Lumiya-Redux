.class public final Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply$Friend;
    }
.end annotation


# instance fields
.field public final agentAppearanceService:Ljava/lang/String;

.field public final agentID:Ljava/util/UUID;

.field public final circuitCode:I

.field public final friends:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply$Friend;",
            ">;"
        }
    .end annotation
.end field

.field public final fromTeleport:Z

.field public final gridName:Ljava/lang/String;

.field public final inventoryRoot:Ljava/util/UUID;

.field public final isIndeterminate:Z

.field public final isTemporary:Z

.field public final loginURL:Ljava/lang/String;

.field public final message:Ljava/lang/String;

.field public final nextMethod:Ljava/lang/String;

.field public final nextURL:Ljava/lang/String;

.field public final secureSessionID:Ljava/util/UUID;

.field public final seedCapability:Ljava/lang/String;

.field public final sessionID:Ljava/util/UUID;

.field public final simAddress:Ljava/lang/String;

.field public final simPort:I

.field public final success:Z


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;ZZLjava/util/UUID;Ljava/lang/String;ILjava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->gridName:Ljava/lang/String;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->gridName:Ljava/lang/String;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->loginURL:Ljava/lang/String;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->loginURL:Ljava/lang/String;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->sessionID:Ljava/util/UUID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->sessionID:Ljava/util/UUID;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->secureSessionID:Ljava/util/UUID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->secureSessionID:Ljava/util/UUID;

    if-eqz p4, :cond_0

    :goto_0
    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->agentID:Ljava/util/UUID;

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->circuitCode:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->circuitCode:I

    iput-object p5, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->simAddress:Ljava/lang/String;

    iput p6, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->simPort:I

    iput-object p7, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->seedCapability:Ljava/lang/String;

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->success:Z

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->success:Z

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->message:Ljava/lang/String;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->message:Ljava/lang/String;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->agentAppearanceService:Ljava/lang/String;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->agentAppearanceService:Ljava/lang/String;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->inventoryRoot:Ljava/util/UUID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->inventoryRoot:Ljava/util/UUID;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->friends:Lcom/google/common/collect/ImmutableList;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->friends:Lcom/google/common/collect/ImmutableList;

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->isIndeterminate:Z

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->isIndeterminate:Z

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->nextMethod:Ljava/lang/String;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->nextMethod:Ljava/lang/String;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->nextURL:Ljava/lang/String;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->nextURL:Ljava/lang/String;

    iput-boolean p2, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->fromTeleport:Z

    iput-boolean p3, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->isTemporary:Z

    return-void

    :cond_0
    iget-object p4, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->agentID:Ljava/util/UUID;

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 22
    .param p3    # Lorg/xmlpull/v1/XmlPullParser;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->gridName:Ljava/lang/String;

    move-object/from16 v0, p2

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->loginURL:Ljava/lang/String;

    const/16 v18, 0x0

    const/16 v17, 0x0

    const/16 v16, 0x0

    const/4 v15, 0x0

    const/4 v14, 0x0

    const/4 v13, 0x0

    const/4 v12, 0x0

    const/4 v11, 0x0

    const/4 v10, 0x0

    const/4 v9, 0x0

    const/4 v8, 0x0

    const-string/jumbo v7, ""

    const/4 v6, 0x0

    const/4 v5, 0x0

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v4

    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    const-string/jumbo v19, "methodResponse"

    const/16 v20, 0x2

    const/16 v21, 0x0

    move-object/from16 v0, p3

    move/from16 v1, v20

    move-object/from16 v2, v21

    move-object/from16 v3, v19

    invoke-interface {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    const-string/jumbo v19, "params"

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->skipUntilTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_14

    const-string/jumbo v19, "param"

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->skipUntilTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_13

    const-string/jumbo v19, "value"

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->skipUntilTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_12

    const-string/jumbo v19, "struct"

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->skipUntilTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_11

    :goto_0
    const-string/jumbo v19, "member"

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->skipUntilTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_10

    const-string/jumbo v19, "name"

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->skipUntilTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_2

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->getInnerText(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    const-string/jumbo v20, "value"

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->skipUntilTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_1

    const-string/jumbo v20, "session_id"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_3

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->getSimpleValue(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v15

    :cond_0
    :goto_1
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    :cond_1
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_0

    :cond_2
    new-instance v4, Lorg/xmlpull/v1/XmlPullParserException;

    const-string/jumbo v5, "Not found name"

    const/4 v6, 0x0

    move-object/from16 v0, p3

    invoke-direct {v4, v5, v0, v6}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v4

    :cond_3
    const-string/jumbo v20, "secure_session_id"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_4

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->getSimpleValue(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v14

    goto :goto_1

    :cond_4
    const-string/jumbo v20, "agent_id"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_5

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->getSimpleValue(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v13

    goto :goto_1

    :cond_5
    const-string/jumbo v20, "circuit_code"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_6

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->getSimpleValue(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/Integer;->decode(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    goto :goto_1

    :cond_6
    const-string/jumbo v20, "sim_ip"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_7

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->getSimpleValue(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v11

    goto :goto_1

    :cond_7
    const-string/jumbo v20, "sim_port"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_8

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->getSimpleValue(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->decode(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    goto/16 :goto_1

    :cond_8
    const-string/jumbo v20, "seed_capability"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_9

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->getSimpleValue(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v9

    goto/16 :goto_1

    :cond_9
    const-string/jumbo v20, "login"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_a

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->getSimpleValue(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v18

    const-string/jumbo v8, "true"

    move-object/from16 v0, v18

    invoke-virtual {v0, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    const-string/jumbo v19, "indeterminate"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v18

    goto/16 :goto_1

    :cond_a
    const-string/jumbo v20, "next_url"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_b

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->getSimpleValue(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v17

    goto/16 :goto_1

    :cond_b
    const-string/jumbo v20, "next_method"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_c

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->getSimpleValue(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v16

    goto/16 :goto_1

    :cond_c
    const-string/jumbo v20, "message"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_d

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->getSimpleValue(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_1

    :cond_d
    const-string/jumbo v20, "agent_appearance_service"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_e

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->getSimpleValue(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    :cond_e
    const-string/jumbo v20, "inventory-root"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_f

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->getInventoryRootValue(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/UUID;

    move-result-object v5

    goto/16 :goto_1

    :cond_f
    const-string/jumbo v20, "buddy-list"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_0

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->parseBuddyList(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/List;

    move-result-object v4

    goto/16 :goto_1

    :cond_10
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    :cond_11
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    :cond_12
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    :cond_13
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    :cond_14
    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->sessionID:Ljava/util/UUID;

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->secureSessionID:Ljava/util/UUID;

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->agentID:Ljava/util/UUID;

    move-object/from16 v0, p0

    iput v12, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->circuitCode:I

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->simAddress:Ljava/lang/String;

    move-object/from16 v0, p0

    iput v10, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->simPort:I

    move-object/from16 v0, p0

    iput-object v9, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->seedCapability:Ljava/lang/String;

    move-object/from16 v0, p0

    iput-boolean v8, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->success:Z

    move-object/from16 v0, p0

    iput-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->message:Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->agentAppearanceService:Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->inventoryRoot:Ljava/util/UUID;

    invoke-static {v4}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->friends:Lcom/google/common/collect/ImmutableList;

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->fromTeleport:Z

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->isTemporary:Z

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->isIndeterminate:Z

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->nextURL:Ljava/lang/String;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->nextMethod:Ljava/lang/String;

    return-void
.end method

.method private finishTag(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    :goto_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    :cond_0
    return-void

    :cond_1
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->skipTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_0

    :cond_2
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    goto :goto_0
.end method

.method private getInnerText(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method private getInventoryRootValue(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/UUID;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    const-string/jumbo v1, "array"

    invoke-direct {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->skipUntilTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    const-string/jumbo v1, "data"

    invoke-direct {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->skipUntilTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    :goto_0
    const-string/jumbo v1, "value"

    invoke-direct {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->skipUntilTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    const-string/jumbo v1, "struct"

    invoke-direct {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->skipUntilTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    :goto_1
    const-string/jumbo v1, "member"

    invoke-direct {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->skipUntilTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string/jumbo v1, "name"

    invoke-direct {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->skipUntilTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->getInnerText(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    const-string/jumbo v2, "value"

    invoke-direct {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->skipUntilTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string/jumbo v2, "folder_id"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->getSimpleValue(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    :cond_0
    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    :cond_1
    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_1

    :cond_2
    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    :cond_3
    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_0

    :cond_4
    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    :cond_5
    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    :cond_6
    return-object v0
.end method

.method private getSimpleValue(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    :goto_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    const-string/jumbo v1, "got value \'%s\'"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v0
.end method

.method private parseBuddyList(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/xmlpull/v1/XmlPullParser;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply$Friend;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v4, 0x0

    const/4 v1, 0x0

    new-instance v5, Ljava/util/LinkedList;

    invoke-direct {v5}, Ljava/util/LinkedList;-><init>()V

    const-string/jumbo v0, "array"

    invoke-direct {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->skipUntilTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    const-string/jumbo v0, "data"

    invoke-direct {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->skipUntilTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    :goto_0
    const-string/jumbo v0, "value"

    invoke-direct {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->skipUntilTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    const-string/jumbo v0, "struct"

    invoke-direct {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->skipUntilTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    move v0, v1

    move v2, v1

    move-object v3, v4

    :goto_1
    const-string/jumbo v6, "member"

    invoke-direct {p0, p1, v6}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->skipUntilTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4

    const-string/jumbo v6, "name"

    invoke-direct {p0, p1, v6}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->skipUntilTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->getInnerText(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    const-string/jumbo v7, "value"

    invoke-direct {p0, p1, v7}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->skipUntilTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    const-string/jumbo v7, "buddy_id"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->getSimpleValue(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v3

    :cond_0
    :goto_2
    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    :cond_1
    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_1

    :cond_2
    const-string/jumbo v7, "buddy_rights_given"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->getSimpleValue(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    goto :goto_2

    :cond_3
    const-string/jumbo v7, "buddy_rights_has"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->getSimpleValue(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    goto :goto_2

    :cond_4
    if-eqz v3, :cond_5

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply$Friend;

    invoke-direct {v6, v3, v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply$Friend;-><init>(Ljava/util/UUID;II)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_5
    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    :cond_6
    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_0

    :cond_7
    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    :cond_8
    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    :cond_9
    return-object v5
.end method

.method private skipTag(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    :goto_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    return-void

    :pswitch_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :pswitch_2
    if-nez v0, :cond_0

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    return-void

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private skipUntilTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v2, 0x1

    :goto_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_2

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    if-eq v0, v2, :cond_2

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    return v2

    :cond_1
    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->skipTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v3, 0x1

    const/4 v2, 0x0

    if-ne p1, p0, :cond_0

    return v3

    :cond_0
    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

    if-nez v0, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->simAddress:Ljava/lang/String;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->simAddress:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    return v2

    :cond_2
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->simPort:I

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->simPort:I

    if-eq v0, v1, :cond_3

    return v2

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->agentID:Ljava/util/UUID;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->agentID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    return v2

    :cond_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->sessionID:Ljava/util/UUID;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->sessionID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    return v2

    :cond_5
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->circuitCode:I

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->circuitCode:I

    if-eq v0, v1, :cond_6

    return v2

    :cond_6
    return v3
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->simAddress:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    add-int/lit8 v0, v0, 0x0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->simPort:I

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->agentID:Ljava/util/UUID;

    invoke-virtual {v1}, Ljava/util/UUID;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->sessionID:Ljava/util/UUID;

    invoke-virtual {v1}, Ljava/util/UUID;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->circuitCode:I

    add-int/2addr v0, v1

    return v0
.end method
