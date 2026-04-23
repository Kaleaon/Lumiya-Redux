.class public Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdUnsit;
.super Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdGenericRestriction;


# direct methods
.method public constructor <init>()V
    .locals 2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->unsit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdGenericRestriction;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Z)V

    return-void
.end method


# virtual methods
.method protected HandleForce(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;Ljava/util/UUID;Ljava/lang/String;)V
    .locals 1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->ForceStand()V

    return-void
.end method
