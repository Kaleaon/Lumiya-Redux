.class public Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdGetOutfit;
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
    .locals 10

    const/4 v0, 0x0

    :try_start_0
    invoke-static {p4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    const-string/jumbo v1, ""

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v3

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    const/16 v4, 0xf

    new-array v4, v4, [Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_GLOVES:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_JACKET:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const/4 v6, 0x1

    aput-object v5, v4, v6

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_PANTS:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const/4 v6, 0x2

    aput-object v5, v4, v6

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_SHIRT:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const/4 v6, 0x3

    aput-object v5, v4, v6

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_SHOES:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const/4 v6, 0x4

    aput-object v5, v4, v6

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_SKIRT:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const/4 v6, 0x5

    aput-object v5, v4, v6

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_SOCKS:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const/4 v6, 0x6

    aput-object v5, v4, v6

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_UNDERPANTS:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const/4 v6, 0x7

    aput-object v5, v4, v6

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_UNDERSHIRT:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const/16 v6, 0x8

    aput-object v5, v4, v6

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_SKIN:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const/16 v6, 0x9

    aput-object v5, v4, v6

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_EYES:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const/16 v6, 0xa

    aput-object v5, v4, v6

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_HAIR:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const/16 v6, 0xb

    aput-object v5, v4, v6

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_SHAPE:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const/16 v6, 0xc

    aput-object v5, v4, v6

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_ALPHA:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const/16 v6, 0xd

    aput-object v5, v4, v6

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->WT_TATTOO:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;

    const/16 v6, 0xe

    aput-object v5, v4, v6

    array-length v5, v4

    move v9, v0

    move-object v0, v1

    move v1, v9

    :goto_0
    if-ge v1, v5, :cond_3

    aget-object v6, v4, v1

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->isBodyPart()Z

    move-result v7

    if-nez v7, :cond_1

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->getName()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, ""

    invoke-virtual {p5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    invoke-virtual {v7, p5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    :cond_0
    invoke-virtual {v3, v6}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->hasWornWearable(Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;)Z

    move-result v6

    if-eqz v6, :cond_2

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v6, "1"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v6, "0"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_3
    invoke-virtual {p1, v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->sayOnChannel(ILjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_2
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_2
.end method
