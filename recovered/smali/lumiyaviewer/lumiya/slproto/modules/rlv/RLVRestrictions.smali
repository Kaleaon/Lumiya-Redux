.class public Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;
    }
.end annotation


# instance fields
.field private restrictions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/EnumMap;

    const-class v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->restrictions:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public declared-synchronized addRestriction(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Ljava/util/UUID;Ljava/lang/String;)V
    .locals 4

    monitor-enter p0

    if-nez p3, :cond_0

    :try_start_0
    const-string/jumbo p3, ""

    :cond_0
    const-string/jumbo v0, "RLV: adding restriction \'%s\' for object %s, target \'%s\'"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    aput-object p2, v1, v2

    const/4 v2, 0x2

    aput-object p3, v1, v2

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->restrictions:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;

    if-nez v0, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->restrictions:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    invoke-virtual {p3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->addRestriction(Ljava/util/UUID;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getRestrictionsByObject(Ljava/util/UUID;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/UUID;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->restrictions:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;

    invoke-virtual {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->hasRestrictionsByObject(Ljava/util/UUID;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_1
    monitor-exit p0

    return-object v2
.end method

.method public declared-synchronized getTargetsForRestriction(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;)Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v1, 0x0

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->restrictions:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->getTargets()Ljava/util/Set;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :cond_0
    monitor-exit p0

    return-object v1

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isAllowed(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Ljava/lang/String;Ljava/util/UUID;)Z
    .locals 1

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->isAllowed(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Ljava/lang/String;Ljava/util/UUID;Ljava/util/UUID;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isAllowed(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Ljava/lang/String;Ljava/util/UUID;Ljava/util/UUID;)Z
    .locals 3

    monitor-enter p0

    if-nez p2, :cond_0

    :try_start_0
    const-string/jumbo p2, ""

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->restrictions:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->getRuleMatchType()Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    move-result-object v1

    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2, p3, p4}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->isAllowed(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;Ljava/lang/String;Ljava/util/UUID;Ljava/util/UUID;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :cond_1
    :try_start_1
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->getRuleMatchType()Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetSpecifiesAllowance:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-ne v0, v1, :cond_2

    const/4 v0, 0x0

    monitor-exit p0

    return v0

    :cond_2
    const/4 v0, 0x1

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeRestriction(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Ljava/util/UUID;Ljava/lang/String;)V
    .locals 4

    monitor-enter p0

    if-nez p3, :cond_0

    :try_start_0
    const-string/jumbo p3, ""

    :cond_0
    const-string/jumbo v0, "RLV: removing restriction \'%s\' for object %s, target \'%s\'"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    aput-object p2, v1, v2

    const/4 v2, 0x2

    aput-object p3, v1, v2

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->restrictions:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;

    if-eqz v0, :cond_1

    invoke-virtual {p3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->removeRestriction(Ljava/util/UUID;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->restrictions:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeRestrictions(Ljava/util/UUID;Ljava/util/Set;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/UUID;",
            "Ljava/util/Set",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;",
            ">;)V"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    const-string/jumbo v0, "RLV: removing %d restrictions for object %s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    invoke-interface {p2}, Ljava/util/Set;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->restrictions:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;

    if-eqz v1, :cond_0

    invoke-virtual {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->removeAllForObject(Ljava/util/UUID;)V

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->restrictions:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_1
    monitor-exit p0

    return-void
.end method
