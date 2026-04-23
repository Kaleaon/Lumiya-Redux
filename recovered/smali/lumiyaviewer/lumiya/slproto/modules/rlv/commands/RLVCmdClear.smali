.class public Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdClear;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommand;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->values()[Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    move-result-object v2

    const/4 v0, 0x0

    array-length v3, v2

    :goto_0
    if-ge v0, v3, :cond_2

    aget-object v4, v2, v0

    const-string/jumbo v5, ""

    if-ne p4, v5, :cond_1

    invoke-interface {v1, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v1, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_2
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->getRestrictions()Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;

    move-result-object v0

    invoke-virtual {v0, p2, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->removeRestrictions(Ljava/util/UUID;Ljava/util/Set;)V

    return-void
.end method
