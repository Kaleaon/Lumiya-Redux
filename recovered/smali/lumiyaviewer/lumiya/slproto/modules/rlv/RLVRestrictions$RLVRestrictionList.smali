.class Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RLVRestrictionList"
.end annotation


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-slproto-modules-rlv-RLVRestrictionType$RLVRuleMatchTypeSwitchesValues:[I


# instance fields
.field private restMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/HashSet",
            "<",
            "Ljava/util/UUID;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-slproto-modules-rlv-RLVRestrictionType$RLVRuleMatchTypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->-com-lumiyaviewer-lumiya-slproto-modules-rlv-RLVRestrictionType$RLVRuleMatchTypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->-com-lumiyaviewer-lumiya-slproto-modules-rlv-RLVRestrictionType$RLVRuleMatchTypeSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->values()[Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetNoExceptions:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_3

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetSpecifiesAllowance:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_2

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetSpecifiesException:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_1

    :goto_2
    :try_start_3
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetSpecifiesRestriction:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_0

    :goto_3
    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->-com-lumiyaviewer-lumiya-slproto-modules-rlv-RLVRestrictionType$RLVRuleMatchTypeSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_3

    :catch_1
    move-exception v1

    goto :goto_2

    :catch_2
    move-exception v1

    goto :goto_1

    :catch_3
    move-exception v1

    goto :goto_0
.end method

.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->restMap:Ljava/util/Map;

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;-><init>()V

    return-void
.end method


# virtual methods
.method public addRestriction(Ljava/util/UUID;Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->restMap:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashSet;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->restMap:Ljava/util/Map;

    invoke-interface {v1, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public getTargets()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->restMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public hasRestrictionsByObject(Ljava/util/UUID;)Z
    .locals 2

    if-nez p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->restMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->restMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    return v0

    :cond_2
    const/4 v0, 0x0

    return v0
.end method

.method public isAllowed(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;Ljava/lang/String;Ljava/util/UUID;Ljava/util/UUID;)Z
    .locals 5

    const/4 v4, 0x1

    const/4 v3, 0x0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetSpecifiesAllowance:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    if-ne p1, v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->restMap:Ljava/util/Map;

    const-string/jumbo v1, ""

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return v4

    :cond_0
    const-string/jumbo v0, ""

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->restMap:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    return v4

    :cond_1
    return v3

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->restMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    return v4

    :cond_3
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->-getcom-lumiyaviewer-lumiya-slproto-modules-rlv-RLVRestrictionType$RLVRuleMatchTypeSwitchesValues()[I

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    :cond_4
    return v4

    :pswitch_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->restMap:Ljava/util/Map;

    const-string/jumbo v1, ""

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string/jumbo v0, ""

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->restMap:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    return v4

    :cond_5
    return v3

    :pswitch_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->restMap:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    return v3

    :cond_6
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->restMap:Ljava/util/Map;

    const-string/jumbo v1, ""

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    if-nez p3, :cond_7

    return v3

    :cond_7
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->restMap:Ljava/util/Map;

    const-string/jumbo v1, ""

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashSet;

    invoke-virtual {v0, p3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    return v3

    :pswitch_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->restMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    if-nez p4, :cond_8

    return v3

    :cond_8
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->restMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    move-result v2

    if-ne v2, v4, :cond_a

    invoke-virtual {v0, p4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    :cond_a
    return v3

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->restMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public removeAllForObject(Ljava/util/UUID;)V
    .locals 4

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->restMap:Ljava/util/Map;

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

    check-cast v1, Ljava/util/HashSet;

    invoke-virtual {v1, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashSet;

    invoke-virtual {v1}, Ljava/util/HashSet;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->restMap:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_2
    return-void
.end method

.method public removeRestriction(Ljava/util/UUID;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->restMap:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashSet;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions$RLVRestrictionList;->restMap:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method
