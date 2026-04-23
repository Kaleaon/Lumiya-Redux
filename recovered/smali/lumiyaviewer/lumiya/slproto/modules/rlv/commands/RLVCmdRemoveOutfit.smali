.class public Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdRemoveOutfit;
.super Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdGenericRestriction;


# direct methods
.method public constructor <init>()V
    .locals 2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->remoutfit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdGenericRestriction;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Z)V

    return-void
.end method


# virtual methods
.method protected HandleForce(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;Ljava/util/UUID;Ljava/lang/String;)V
    .locals 7

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->values()[Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    move-result-object v2

    const/4 v0, 0x0

    array-length v3, v2

    :goto_0
    if-ge v0, v3, :cond_2

    aget-object v4, v2, v0

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->isBodyPart()Z

    move-result v5

    if-nez v5, :cond_1

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->getName()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, ""

    invoke-virtual {p3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-virtual {v5, p3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    :cond_0
    invoke-virtual {v1, v4}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->ForceTakeItemOff(Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;)V

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method
