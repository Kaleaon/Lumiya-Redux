.class public Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;
.super Ljava/lang/Object;


# instance fields
.field public final avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final displayNameFetcher:Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final drawDistance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final financialInfo:Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final gridSearch:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final groupManager:Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final inventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final minimap:Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final modules:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;",
            ">;"
        }
    .end annotation
.end field

.field public final muteList:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final taskInventories:Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final textureFetcher:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final textureUploader:Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploader;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final transferManager:Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final userNameFetcher:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final userProfiles:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final voice:Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final worldMap:Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final xferManager:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXferManager;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->modules:Ljava/util/List;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->modules:Ljava/util/List;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;

    invoke-direct {v1, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->userNameFetcher:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserNameFetcher;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->modules:Ljava/util/List;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;

    invoke-direct {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->gridSearch:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->modules:Ljava/util/List;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;

    invoke-direct {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->minimap:Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->modules:Ljava/util/List;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-direct {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->modules:Ljava/util/List;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;

    invoke-direct {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->drawDistance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->modules:Ljava/util/List;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    invoke-direct {v1, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->inventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->modules:Ljava/util/List;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;

    invoke-direct {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->worldMap:Lcom/lumiyaviewer/lumiya/slproto/modules/SLWorldMap;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->modules:Ljava/util/List;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;

    invoke-direct {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->transferManager:Lcom/lumiyaviewer/lumiya/slproto/modules/transfer/SLTransferManager;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->modules:Ljava/util/List;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;

    iget-object v2, p3, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->authReply:Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->agentAppearanceService:Ljava/lang/String;

    invoke-direct {v1, p1, p2, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->textureFetcher:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->modules:Ljava/util/List;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploader;

    invoke-direct {v1, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploader;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->textureUploader:Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploader;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->modules:Ljava/util/List;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->inventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    invoke-direct {v1, p1, v2, p2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarAppearance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->modules:Ljava/util/List;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-direct {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->modules:Ljava/util/List;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXferManager;

    invoke-direct {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXferManager;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->xferManager:Lcom/lumiyaviewer/lumiya/slproto/modules/xfer/SLXferManager;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->modules:Ljava/util/List;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;

    invoke-direct {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->taskInventories:Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->modules:Ljava/util/List;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;

    invoke-direct {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->muteList:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/SLMuteList;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->modules:Ljava/util/List;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;

    invoke-direct {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->financialInfo:Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->modules:Ljava/util/List;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;

    invoke-direct {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->groupManager:Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->modules:Ljava/util/List;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    invoke-direct {v1, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->userProfiles:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->modules:Ljava/util/List;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;

    invoke-direct {v1, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->displayNameFetcher:Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->modules:Ljava/util/List;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;

    invoke-direct {v1, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->voice:Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public HandleCircuitReady()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->modules:Ljava/util/List;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;->HandleCircuitReady()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public HandleCloseCircuit()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->modules:Ljava/util/List;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;->HandleCloseCircuit()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public HandleGlobalOptionsChange()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->modules:Ljava/util/List;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;->HandleGlobalOptionsChange()V

    goto :goto_0

    :cond_0
    return-void
.end method
