.class public Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdSit;
.super Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdGenericRestriction;


# direct methods
.method public constructor <init>()V
    .locals 2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->sit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdGenericRestriction;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Z)V

    return-void
.end method


# virtual methods
.method protected HandleForce(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;Ljava/util/UUID;Ljava/lang/String;)V
    .locals 2

    if-eqz p3, :cond_0

    :try_start_0
    invoke-static {p3}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v1

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->ForceSitOnObject(Ljava/util/UUID;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
