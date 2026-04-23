.class public Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdRedirChat;
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
    .locals 3

    if-nez p5, :cond_0

    const-string/jumbo p5, ""

    :cond_0
    const-string/jumbo v0, ""

    invoke-virtual {p5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    :try_start_0
    invoke-static {p5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    const-string/jumbo v1, "n"

    invoke-virtual {p4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string/jumbo v1, "add"

    invoke-virtual {p4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    :cond_2
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->getRestrictions()Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->redirchat:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->addRestriction(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Ljava/util/UUID;Ljava/lang/String;)V

    :cond_3
    :goto_0
    return-void

    :cond_4
    const-string/jumbo v1, "y"

    invoke-virtual {p4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string/jumbo v1, "rem"

    invoke-virtual {p4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    :cond_5
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->getRestrictions()Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->redirchat:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->removeRestriction(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Ljava/util/UUID;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
