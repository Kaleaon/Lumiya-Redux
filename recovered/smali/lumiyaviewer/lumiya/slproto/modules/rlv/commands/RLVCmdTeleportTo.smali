.class public Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/commands/RLVCmdTeleportTo;
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
    .locals 4

    const-string/jumbo v0, "force"

    invoke-virtual {p4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    if-eqz p5, :cond_0

    const-string/jumbo v0, "/"

    invoke-virtual {p5, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x3

    if-lt v1, v2, :cond_0

    const/4 v1, 0x0

    :try_start_0
    aget-object v1, v0, v1

    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1

    const/4 v2, 0x1

    aget-object v2, v0, v2

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    const/4 v3, 0x2

    aget-object v0, v0, v3

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v3, v1, v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {p1, p2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->teleportToGlobalPos(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
