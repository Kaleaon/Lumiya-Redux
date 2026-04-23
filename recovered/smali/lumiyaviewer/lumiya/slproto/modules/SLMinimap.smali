.class public Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;
.super Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$1;,
        Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;,
        Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocation;,
        Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocations;
    }
.end annotation


# static fields
.field public static final CHAT_RANGE:F = 20.0f

.field private static final parcelBitmapSize:I = 0x100

.field public static final parcelDataSize:I = 0x40

.field private static final parcelOverlayFlagBorderSouth:B = -0x80t

.field private static final parcelOverlayFlagBorderWest:B = 0x40t

.field private static final parcelOverlayFlagPrivate:B = 0x20t

.field private static final parcelOverlayTypeAuction:B = 0x5t

.field private static final parcelOverlayTypeForSale:B = 0x4t

.field private static final parcelOverlayTypeMask:B = 0xft

.field private static final parcelOverlayTypeOwnedByGroup:B = 0x2t

.field private static final parcelOverlayTypeOwnedByOther:B = 0x1t

.field private static final parcelOverlayTypeOwnedBySelf:B = 0x3t

.field private static final parcelOverlayTypePublic:B = 0x0t

.field private static final parcelUpsampleFactor:I = 0x4


# instance fields
.field private afterTeleport:Z

.field private chatRangeUsersCount:I

.field private volatile minimapBitmap:Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private myAvatarParcelDataIndex:I

.field private myAvatarPosition:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private nearbyUsersCount:I

.field private final parcelIDs:[I

.field private final parcels:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;",
            ">;"
        }
    .end annotation
.end field

.field private final userLocationRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            ">;"
        }
    .end annotation
.end field

.field private final userLocationsResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocations;",
            ">;"
        }
    .end annotation
.end field

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

.field private final userPositions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocation;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;)Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->myAvatarPosition:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userLocationsResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    return-object v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;)Ljava/util/Map;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userPositions:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;)F
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->getMyAvatarHeading()F

    move-result v0

    return v0
.end method

.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 6

    const/16 v2, 0x100

    const/4 v5, 0x0

    const/4 v0, 0x0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;

    invoke-direct {v1, v2, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;-><init>(II)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->minimapBitmap:Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;

    const/16 v1, 0x1000

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->parcelIDs:[I

    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->parcels:Ljava/util/Map;

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->nearbyUsersCount:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->chatRangeUsersCount:I

    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    const/4 v2, 0x1

    const/high16 v3, 0x3f400000    # 0.75f

    const/4 v4, 0x2

    invoke-direct {v1, v2, v3, v4}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(IFI)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userPositions:Ljava/util/Map;

    iput-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->myAvatarPosition:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->afterTeleport:Z

    const/4 v1, -0x1

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->myAvatarParcelDataIndex:I

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$1;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userLocationRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserLocationsPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userLocationRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userLocationsResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    :goto_0
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getAuthReply()Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

    move-result-object v1

    iget-boolean v1, v1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->fromTeleport:Z

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getAuthReply()Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

    move-result-object v0

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->isTemporary:Z

    xor-int/lit8 v0, v0, 0x1

    :cond_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->afterTeleport:Z

    return-void

    :cond_1
    iput-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userLocationsResultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    goto :goto_0
.end method

.method private getMyAvatarHeading()F
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->getAgentHeading()F

    move-result v0

    const v1, 0x40490fdb    # (float)Math.PI

    mul-float/2addr v0, v1

    const/high16 v1, 0x43340000    # 180.0f

    div-float/2addr v0, v1

    return v0
.end method

.method private getParcelDataIndex(Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;)I
    .locals 7

    const/16 v6, 0x40

    const/16 v1, 0x3f

    const/high16 v5, 0x43800000    # 256.0f

    const/high16 v4, 0x42800000    # 64.0f

    const/4 v0, 0x0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->getX()F

    move-result v2

    mul-float/2addr v2, v4

    div-float/2addr v2, v5

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    double-to-int v3, v2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->getY()F

    move-result v2

    mul-float/2addr v2, v4

    div-float/2addr v2, v5

    float-to-double v4, v2

    invoke-static {v4, v5}, Ljava/lang/Math;->floor(D)D

    move-result-wide v4

    double-to-int v2, v4

    if-gez v3, :cond_1

    move v3, v0

    :cond_0
    :goto_0
    if-gez v2, :cond_2

    :goto_1
    mul-int/lit8 v0, v0, 0x40

    add-int/2addr v0, v3

    return v0

    :cond_1
    if-lt v3, v6, :cond_0

    move v3, v1

    goto :goto_0

    :cond_2
    if-lt v2, v6, :cond_3

    move v0, v1

    goto :goto_1

    :cond_3
    move v0, v2

    goto :goto_1
.end method

.method private updateAvatarParcelData()V
    .locals 4

    const/4 v3, 0x0

    const/4 v0, 0x0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->myAvatarParcelDataIndex:I

    if-ltz v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->parcels:Ljava/util/Map;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->parcelIDs:[I

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->myAvatarParcelDataIndex:I

    aget v1, v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    :cond_0
    if-eqz v0, :cond_1

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->afterTeleport:Z

    if-eqz v1, :cond_1

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->afterTeleport:Z

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->notifyTeleportComplete(Ljava/lang/String;)V

    :cond_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v1

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->voice:Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getParcelID()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->setCurrentParcel(I)V

    :cond_2
    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->nearbyUsersCount:I

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->chatRangeUsersCount:I

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->getCurrentParcelVoiceChannel()Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    move-result-object v1

    invoke-static {v0, v2, v3, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->create(Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;IILcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->setCurrentLocationInfo(Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;)V

    return-void
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_slproto_modules_SLMinimap-mthref-0()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->updateAvatarParcelData()V

    return-void
.end method

.method public HandleCloseCircuit()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserLocationsPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userLocationRequestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->detachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V

    :cond_0
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;->HandleCloseCircuit()V

    return-void
.end method

.method public HandleCoarseLocationUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;)V
    .locals 13
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    const/4 v3, 0x0

    const/4 v8, 0x1

    const/4 v2, 0x0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->myAvatarParcelDataIndex:I

    if-ltz v0, :cond_1c

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->parcels:Ljava/util/Map;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->parcelIDs:[I

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->myAvatarParcelDataIndex:I

    aget v1, v1, v4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    move-object v1, v0

    :goto_0
    new-instance v9, Ljava/util/HashSet;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->Location_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-direct {v9, v0}, Ljava/util/HashSet;-><init>(I)V

    move-object v4, v1

    move-object v5, v2

    move v6, v3

    move v7, v3

    move v2, v3

    :goto_1
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->Location_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v2, v0, :cond_5

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->AgentData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v2, v0, :cond_5

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->Location_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$Location;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    iget v11, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$Location;->X:I

    int-to-float v11, v11

    iget v12, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$Location;->Y:I

    int-to-float v12, v12

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$Location;->Z:I

    mul-int/lit8 v0, v0, 0x4

    int-to-float v0, v0

    invoke-direct {v10, v11, v12, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;-><init>(FFF)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->Index_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$Index;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$Index;->You:I

    if-ne v2, v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->myAvatarPosition:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    invoke-static {v10, v0}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iput-object v10, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->myAvatarPosition:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->myAvatarPosition:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->getParcelDataIndex(Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;)I

    move-result v0

    iget v6, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->myAvatarParcelDataIndex:I

    if-eq v0, v6, :cond_1b

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->myAvatarParcelDataIndex:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->parcels:Ljava/util/Map;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->parcelIDs:[I

    iget v6, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->myAvatarParcelDataIndex:I

    aget v4, v4, v6

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    move-object v4, v0

    move v6, v8

    :cond_0
    :goto_2
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_1

    :cond_1
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;->AgentData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$AgentData;

    iget-object v11, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate$AgentData;->AgentID:Ljava/util/UUID;

    sget-object v0, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    invoke-virtual {v0, v11}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userPositions:Ljava/util/Map;

    invoke-interface {v0, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocation;

    if-eqz v0, :cond_4

    iget-object v12, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocation;->location:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    invoke-virtual {v10, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_1a

    iput-object v10, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocation;->location:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    move v0, v8

    :goto_3
    if-eqz v0, :cond_3

    if-nez v5, :cond_2

    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    :cond_2
    invoke-interface {v5, v11}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_3
    invoke-interface {v9, v11}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userPositions:Ljava/util/Map;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocation;

    iget-object v12, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v12}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v12

    invoke-static {v12, v11}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v12

    invoke-direct {v7, v12, v10}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocation;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;)V

    invoke-interface {v0, v11, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move v0, v8

    move v7, v8

    goto :goto_3

    :cond_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userPositions:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_6
    :goto_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    invoke-interface {v9, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    if-nez v5, :cond_7

    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    :cond_7
    invoke-interface {v5, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move v7, v8

    goto :goto_4

    :cond_8
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->myAvatarPosition:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    if-eqz v0, :cond_19

    if-eqz v6, :cond_b

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userPositions:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocation;

    iget-object v9, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->myAvatarPosition:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    iget-object v10, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocation;->location:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    invoke-virtual {v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->distanceTo(Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;)F

    move-result v9

    iput v9, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocation;->distance:F

    goto :goto_5

    :cond_9
    move v0, v8

    :goto_6
    if-nez v0, :cond_a

    if-eqz v7, :cond_10

    :cond_a
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userPositions:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    move v2, v3

    :goto_7
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocation;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocation;->distance:F

    const/high16 v10, 0x41a00000    # 20.0f

    cmpg-float v0, v0, v10

    if-gtz v0, :cond_18

    add-int/lit8 v0, v2, 0x1

    :goto_8
    move v2, v0

    goto :goto_7

    :cond_b
    if-eqz v5, :cond_19

    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_c
    :goto_9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    iget-object v9, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userPositions:Ljava/util/Map;

    invoke-interface {v9, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocation;

    if-eqz v0, :cond_c

    iget-object v9, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->myAvatarPosition:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    iget-object v10, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocation;->location:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    invoke-virtual {v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->distanceTo(Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;)F

    move-result v9

    iput v9, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocation;->distance:F

    goto :goto_9

    :cond_d
    move v0, v8

    goto :goto_6

    :cond_e
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->chatRangeUsersCount:I

    if-eq v2, v0, :cond_f

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->chatRangeUsersCount:I

    move v3, v8

    :cond_f
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->nearbyUsersCount:I

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userPositions:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    if-eq v0, v2, :cond_10

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userPositions:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->nearbyUsersCount:I

    move v3, v8

    :cond_10
    if-ne v4, v1, :cond_11

    if-eqz v3, :cond_12

    :cond_11
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->requestUpdateAvatarParcelData()V

    :cond_12
    if-eqz v7, :cond_13

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->Nearby:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->updateList(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;)V

    :cond_13
    if-eqz v6, :cond_17

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->updateDistanceToAllUsers()V

    :cond_14
    if-nez v6, :cond_15

    if-eqz v5, :cond_16

    :cond_15
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserLocationsPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    :cond_16
    return-void

    :cond_17
    if-eqz v5, :cond_14

    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_14

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->updateDistanceToUser(Ljava/util/UUID;)V

    goto :goto_a

    :cond_18
    move v0, v2

    goto/16 :goto_8

    :cond_19
    move v0, v3

    goto/16 :goto_6

    :cond_1a
    move v0, v3

    goto/16 :goto_3

    :cond_1b
    move v6, v8

    goto/16 :goto_2

    :cond_1c
    move-object v1, v2

    goto/16 :goto_0
.end method

.method public HandleParcelOverlay(Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay;)V
    .locals 13
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "ParcelOverlay: SequenceID = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay$ParcelData;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay$ParcelData;->SequenceID:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay$ParcelData;

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay$ParcelData;->Data:[B

    array-length v0, v7

    div-int/lit8 v8, v0, 0x40

    mul-int/lit8 v0, v8, 0x4

    mul-int/lit8 v0, v0, 0x40

    mul-int/lit8 v0, v0, 0x4

    new-array v9, v0, [I

    const/4 v1, 0x0

    const/4 v0, 0x0

    move v6, v0

    :goto_0
    if-ge v6, v8, :cond_9

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay$ParcelData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay$ParcelData;->SequenceID:I

    mul-int/lit8 v0, v0, 0x10

    add-int v10, v6, v0

    const/4 v0, 0x0

    move v4, v0

    move v5, v1

    :goto_1
    const/16 v0, 0x40

    if-ge v4, v0, :cond_8

    aget-byte v0, v7, v5

    and-int/lit8 v0, v0, 0xf

    int-to-byte v1, v0

    const/4 v0, 0x0

    packed-switch v1, :pswitch_data_0

    :goto_2
    aget-byte v1, v7, v5

    and-int/lit8 v1, v1, 0x20

    if-eqz v1, :cond_2

    invoke-static {v0}, Landroid/graphics/Color;->red(I)I

    move-result v2

    invoke-static {v0}, Landroid/graphics/Color;->green(I)I

    move-result v1

    invoke-static {v0}, Landroid/graphics/Color;->blue(I)I

    move-result v0

    add-int/lit8 v2, v2, 0x40

    const/16 v3, 0xff

    if-lt v2, v3, :cond_1

    add-int/lit16 v3, v2, -0xff

    sub-int/2addr v2, v3

    sub-int/2addr v1, v3

    sub-int/2addr v0, v3

    if-gez v1, :cond_0

    const/4 v1, 0x0

    :cond_0
    if-gez v0, :cond_1

    const/4 v0, 0x0

    :cond_1
    invoke-static {v2, v1, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    :cond_2
    const/4 v1, 0x0

    move v3, v1

    :goto_3
    const/4 v1, 0x4

    if-ge v3, v1, :cond_7

    mul-int/lit8 v1, v8, 0x4

    add-int/lit8 v1, v1, -0x1

    mul-int/lit8 v2, v6, 0x4

    add-int/2addr v2, v3

    sub-int/2addr v1, v2

    mul-int/lit16 v1, v1, 0x100

    mul-int/lit8 v2, v4, 0x4

    add-int v11, v1, v2

    const/4 v1, 0x0

    move v2, v1

    :goto_4
    const/4 v1, 0x4

    if-ge v2, v1, :cond_6

    if-nez v3, :cond_4

    if-eqz v10, :cond_4

    aget-byte v1, v7, v5

    and-int/lit8 v1, v1, -0x80

    if-eqz v1, :cond_4

    :cond_3
    const/4 v1, -0x1

    :goto_5
    add-int v12, v11, v2

    aput v1, v9, v12

    add-int/lit8 v1, v2, 0x1

    move v2, v1

    goto :goto_4

    :pswitch_0
    const/4 v0, 0x0

    const/16 v1, 0xc0

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    goto :goto_2

    :pswitch_1
    const/16 v0, 0x20

    const/16 v1, 0x80

    const/16 v2, 0x20

    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    goto :goto_2

    :pswitch_2
    const/4 v0, 0x0

    const/16 v1, 0x80

    const/16 v2, 0x80

    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    goto :goto_2

    :pswitch_3
    const/4 v0, 0x0

    const/16 v1, 0xff

    const/16 v2, 0xff

    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    goto :goto_2

    :pswitch_4
    const/16 v0, 0x80

    const/16 v1, 0x80

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    goto/16 :goto_2

    :pswitch_5
    const/16 v0, 0xff

    const/16 v1, 0xff

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    goto/16 :goto_2

    :cond_4
    if-nez v2, :cond_5

    if-eqz v4, :cond_5

    aget-byte v1, v7, v5

    and-int/lit8 v1, v1, 0x40

    if-nez v1, :cond_3

    :cond_5
    move v1, v0

    goto :goto_5

    :cond_6
    add-int/lit8 v1, v3, 0x1

    move v3, v1

    goto :goto_3

    :cond_7
    add-int/lit8 v1, v5, 0x1

    add-int/lit8 v0, v4, 0x1

    move v4, v0

    move v5, v1

    goto/16 :goto_1

    :cond_8
    add-int/lit8 v0, v6, 0x1

    move v6, v0

    move v1, v5

    goto/16 :goto_0

    :cond_9
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->minimapBitmap:Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay;->ParcelData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay$ParcelData;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay$ParcelData;->SequenceID:I

    rsub-int/lit8 v2, v2, 0x3

    mul-int/lit8 v2, v2, 0x40

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2, v9}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;II[I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->minimapBitmap:Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getMinimapBitmapPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->minimapBitmap:Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->setData(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_a
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method public HandleParcelProperties(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 9
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLEventQueueMessageHandler;
        eventName = .enum Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;->ParcelProperties:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;
    .end annotation

    const/4 v2, 0x0

    :try_start_0
    const-string/jumbo v0, "ParcelData"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v4

    move v3, v2

    move v1, v2

    :goto_0
    :try_start_1
    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->getCount()I

    move-result v0

    if-ge v3, v0, :cond_2

    invoke-virtual {v4, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;
    :try_end_1
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_1 .. :try_end_1} :catch_2

    move-result-object v0

    :try_start_2
    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    invoke-direct {v5, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;-><init>(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getParcelID()I

    move-result v6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->parcels:Ljava/util/Map;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v0, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getParcelBitmap()[Z
    :try_end_2
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v5

    move v0, v1

    move v1, v2

    :goto_1
    const/16 v7, 0x1000

    if-ge v1, v7, :cond_1

    :try_start_3
    aget-boolean v7, v5, v1

    if-eqz v7, :cond_0

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->parcelIDs:[I

    aput v6, v7, v1

    iget v7, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->myAvatarParcelDataIndex:I
    :try_end_3
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_3 .. :try_end_3} :catch_3

    if-ne v1, v7, :cond_0

    const/4 v0, 0x1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :catch_0
    move-exception v0

    :goto_2
    :try_start_4
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V
    :try_end_4
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_4 .. :try_end_4} :catch_2

    move v0, v1

    :cond_1
    add-int/lit8 v1, v3, 0x1

    move v3, v1

    move v1, v0

    goto :goto_0

    :catch_1
    move-exception v0

    move v1, v2

    :goto_3
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException;->printStackTrace()V

    :cond_2
    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->requestUpdateAvatarParcelData()V

    :cond_3
    return-void

    :catch_2
    move-exception v0

    goto :goto_3

    :catch_3
    move-exception v1

    move-object v8, v1

    move v1, v0

    move-object v0, v8

    goto :goto_2
.end method

.method public getDistanceToUser(Ljava/util/UUID;)Ljava/lang/Float;
    .locals 1
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userPositions:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocation;

    if-eqz v0, :cond_0

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocation;->distance:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    return-object v0

    :cond_0
    const/high16 v0, 0x7fc00000    # Float.NaN

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    return-object v0

    :cond_1
    return-object v0
.end method

.method public getNearbyAgentLocation(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
    .locals 4
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->gridConn:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->getAvatarObject(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getAbsolutePosition()Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    invoke-static {p1, v0}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->myAvatarPosition:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    if-eqz v0, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->myAvatarPosition:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->getX()F

    move-result v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->myAvatarPosition:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->getY()F

    move-result v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->myAvatarPosition:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->getZ()F

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    return-object v0

    :cond_1
    return-object v1
.end method

.method public getNearbyChatterList()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;",
            ">;"
        }
    .end annotation

    new-instance v1, Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userPositions:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->userPositions:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocation;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocation;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v1
.end method

.method public requestUpdateAvatarParcelData()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/-$Lambda$eaDiotW55nmaHN5_b1ikeJpLLsk;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/-$Lambda$eaDiotW55nmaHN5_b1ikeJpLLsk;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
