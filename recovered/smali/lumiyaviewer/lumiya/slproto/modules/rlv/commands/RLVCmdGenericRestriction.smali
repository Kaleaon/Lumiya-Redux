.class public Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdGenericRestriction;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommand;


# instance fields
.field private canHaveExceptions:Z

.field private restrictionType:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdGenericRestriction;->restrictionType:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    iput-boolean p2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdGenericRestriction;->canHaveExceptions:Z

    return-void
.end method


# virtual methods
.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    if-nez p5, :cond_0

    const-string/jumbo p5, ""

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdGenericRestriction;->restrictionType:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->getRuleMatchType()Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;->TargetSpecifiesAllowance:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType$RLVRuleMatchType;

    if-ne v0, v1, :cond_3

    const-string/jumbo v1, "y"

    const-string/jumbo v0, "n"

    :goto_0
    invoke-virtual {p4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "add"

    invoke-virtual {p4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    :cond_1
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->getRestrictions()Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdGenericRestriction;->restrictionType:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdGenericRestriction;->canHaveExceptions:Z

    if-eqz v2, :cond_4

    :goto_1
    invoke-virtual {v0, v1, p2, p5}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->addRestriction(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Ljava/util/UUID;Ljava/lang/String;)V

    :cond_2
    :goto_2
    return-void

    :cond_3
    const-string/jumbo v1, "n"

    const-string/jumbo v0, "y"

    goto :goto_0

    :cond_4
    const-string/jumbo p5, ""

    goto :goto_1

    :cond_5
    invoke-virtual {p4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    const-string/jumbo v0, "rem"

    invoke-virtual {p4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    :cond_6
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->getRestrictions()Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdGenericRestriction;->restrictionType:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdGenericRestriction;->canHaveExceptions:Z

    if-eqz v2, :cond_7

    :goto_3
    invoke-virtual {v0, v1, p2, p5}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->removeRestriction(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Ljava/util/UUID;Ljava/lang/String;)V

    goto :goto_2

    :cond_7
    const-string/jumbo p5, ""

    goto :goto_3

    :cond_8
    const-string/jumbo v0, "force"

    invoke-virtual {p4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0, p1, p2, p5}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdGenericRestriction;->HandleForce(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;Ljava/util/UUID;Ljava/lang/String;)V

    goto :goto_2
.end method

.method protected HandleForce(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;Ljava/util/UUID;Ljava/lang/String;)V
    .locals 4

    const-string/jumbo v0, "RLV: force option not supported for restriction \'%s\'"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdGenericRestriction;->restrictionType:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method
