.class public Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdAddOutfit;
.super Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdGenericRestriction;


# direct methods
.method public constructor <init>()V
    .locals 2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;->addoutfit:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdGenericRestriction;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVRestrictionType;Z)V

    return-void
.end method
