.class public Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdGetAttach;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommand;


# static fields
.field private static final NUM_ATTACHMENT_POINTS_LSL:I = 0x29


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVCommands;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    :try_start_0
    invoke-static {p4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    const-string/jumbo v1, ""

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    const/4 v0, 0x0

    move v2, v0

    move-object v0, v1

    :goto_0
    const/16 v1, 0x29

    if-ge v2, v1, :cond_4

    const-string/jumbo v1, "nonexistent"

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    aget-object v5, v5, v2

    if-eqz v5, :cond_0

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    aget-object v1, v1, v2

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->name:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    :cond_0
    const-string/jumbo v5, ""

    invoke-virtual {p5, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    invoke-virtual {v1, p5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_1
    invoke-virtual {v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;->getAttachmentUUID(I)Ljava/util/UUID;

    move-result-object v1

    if-eqz v1, :cond_3

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "1"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_2
    :goto_1
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    goto :goto_0

    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_4
    invoke-virtual {p1, v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->sayOnChannel(ILjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_2
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_2
.end method
