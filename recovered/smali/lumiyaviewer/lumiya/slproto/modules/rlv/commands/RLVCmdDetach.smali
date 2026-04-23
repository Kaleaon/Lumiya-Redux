.class public Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdDetach;
.super Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdGenericRestriction;


# direct methods
.method public constructor <init>()V
    .locals 2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->detach:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdGenericRestriction;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Z)V

    return-void
.end method


# virtual methods
.method protected HandleForce(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;Ljava/util/UUID;Ljava/lang/String;)V
    .locals 6

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    const/4 v0, 0x0

    :goto_0
    const/16 v2, 0x38

    if-ge v0, v2, :cond_2

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    aget-object v2, v2, v0

    if-eqz v2, :cond_1

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    aget-object v2, v2, v0

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->name:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, ""

    invoke-virtual {p3, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {v2, p3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    :cond_0
    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->getAttachmentUUID(I)Ljava/util/UUID;

    move-result-object v3

    if-eqz v3, :cond_1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->getRestrictions()Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;

    move-result-object v4

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->detach:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    invoke-virtual {v4, v5, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictions;->isAllowed(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Ljava/lang/String;Ljava/util/UUID;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->DetachItemFromPoint(I)V

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method
