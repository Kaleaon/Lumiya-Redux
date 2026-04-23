.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/NearbyChattersDisplayDataList;
.super Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$D8uG4BZ932XmwoX97ZE2tEBU1gE;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/-$Lambda$D8uG4BZ932XmwoX97ZE2tEBU1gE;-><init>()V

    invoke-direct {p0, p1, p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayDataList;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/users/manager/OnListUpdated;Ljava/util/Comparator;)V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_NearbyChattersDisplayDataList_807(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;)I
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->distanceToUser:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->distanceToUser:F

    invoke-static {v0, v1}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-eqz v0, :cond_0

    return v0

    :cond_0
    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->compareTo(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;)I

    move-result v0

    return v0
.end method


# virtual methods
.method protected getChatters()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/NearbyChattersDisplayDataList;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->minimap:Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->getNearbyChatterList()Ljava/util/List;

    move-result-object v0

    :cond_0
    if-nez v0, :cond_1

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    :cond_1
    return-object v0
.end method
