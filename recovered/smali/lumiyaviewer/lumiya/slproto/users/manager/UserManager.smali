.class public Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager$1;
    }
.end annotation


# static fields
.field private static final activeAgentCircuitsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;",
            ">;"
        }
    .end annotation
.end field

.field private static final lock:Ljava/lang/Object;

.field private static final userManagers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final activeAgentCircuit:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;",
            ">;"
        }
    .end annotation
.end field

.field private final activeChattersQuery:Lde/greenrobot/dao/query/Query;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lde/greenrobot/dao/query/Query",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/Chatter;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final agentDataUpdates:Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;",
            ">;"
        }
    .end annotation
.end field

.field private final assetResponseCacher:Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;

.field private final avatarGroupLists:Lcom/lumiyaviewer/lumiya/slproto/users/SerializableResponseCacher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/slproto/users/SerializableResponseCacher",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;",
            ">;"
        }
    .end annotation
.end field

.field private final avatarNotes:Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;",
            ">;"
        }
    .end annotation
.end field

.field private final avatarPickInfos:Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;",
            ">;"
        }
    .end annotation
.end field

.field private final avatarPicks:Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply;",
            ">;"
        }
    .end annotation
.end field

.field private final avatarProperties:Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;",
            ">;"
        }
    .end annotation
.end field

.field private final balanceManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final chatterList:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final chatterUpdateLock:Ljava/lang/Object;

.field private final currentLocationInfoPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final daoSession:Lcom/lumiyaviewer/lumiya/dao/DaoSession;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final dbExecutor:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

.field private final eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

.field private final findChatterQuery:Lde/greenrobot/dao/query/Query;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lde/greenrobot/dao/query/Query",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/Chatter;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final findUserPicQuery:Lde/greenrobot/dao/query/Query;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lde/greenrobot/dao/query/Query",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/UserPic;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final findUserQuery:Lde/greenrobot/dao/query/Query;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lde/greenrobot/dao/query/Query",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/User;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final friendsQuery:Lde/greenrobot/dao/query/Query;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lde/greenrobot/dao/query/Query",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/User;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final groupProfiles:Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;",
            ">;"
        }
    .end annotation
.end field

.field private final groupRoles:Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;",
            ">;"
        }
    .end annotation
.end field

.field private final groupTitles:Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply;",
            ">;"
        }
    .end annotation
.end field

.field private final inventoryManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final loadMessageQuery:Lde/greenrobot/dao/query/Query;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lde/greenrobot/dao/query/Query",
            "<",
            "Lcom/lumiyaviewer/lumiya/dao/ChatMessage;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final minimapBitmapPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;",
            ">;"
        }
    .end annotation
.end field

.field private final muteListPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;",
            ">;>;"
        }
    .end annotation
.end field

.field private final notificationManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final objectPopupsManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final objectsManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final parcelInfoData:Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;",
            ">;"
        }
    .end annotation
.end field

.field private final searchManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/SearchManager;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final syncManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final userDao:Lcom/lumiyaviewer/lumiya/dao/UserDao;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final userID:Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final userLocationsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocations;",
            ">;"
        }
    .end annotation
.end field

.field private final userNameRequests:Lcom/lumiyaviewer/lumiya/utils/reqset/WeakPriorityRequestSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/utils/reqset/WeakPriorityRequestSet",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private final userNamesHandler:Lcom/lumiyaviewer/lumiya/react/RateLimitRequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RateLimitRequestHandler",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/dao/UserName;",
            ">;"
        }
    .end annotation
.end field

.field private final userNamesPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/dao/UserName;",
            ">;"
        }
    .end annotation
.end field

.field private final userPicBitmapCache:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache;

.field private final userPicDao:Lcom/lumiyaviewer/lumiya/dao/UserPicDao;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final userPicUpdateLock:Ljava/lang/Object;

.field private final userUpdateLock:Ljava/lang/Object;

.field private final voiceActiveChatterPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;",
            ">;"
        }
    .end annotation
.end field

.field private final voiceAudioPropertiesPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;",
            ">;"
        }
    .end annotation
.end field

.field private final voiceChatInfoPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;",
            "Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final voiceLoggedInPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final wornAttachmentsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool",
            "<",
            "Lcom/google/common/collect/ImmutableMap",
            "<",
            "Ljava/util/UUID;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private final wornItemsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;",
            ">;>;"
        }
    .end annotation
.end field

.field private final wornOutfitLinkPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private final wornWearablesPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool",
            "<",
            "Lcom/google/common/collect/Table",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Lcom/lumiyaviewer/lumiya/dao/DaoSession;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->daoSession:Lcom/lumiyaviewer/lumiya/dao/DaoSession;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->lock:Ljava/lang/Object;

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userManagers:Ljava/util/Map;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool;-><init>()V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool;->setCanContainNulls(Z)Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->activeAgentCircuitsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool;

    return-void
.end method

.method private constructor <init>(Ljava/util/UUID;)V
    .locals 8
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    const/4 v4, 0x0

    const/4 v7, 0x1

    const/4 v6, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->getInstance()Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    const-string/jumbo v1, "Database"

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->dbExecutor:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userUpdateLock:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userPicUpdateLock:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->chatterUpdateLock:Ljava/lang/Object;

    new-instance v0, Lcom/lumiyaviewer/lumiya/utils/reqset/WeakPriorityRequestSet;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/utils/reqset/WeakPriorityRequestSet;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userNameRequests:Lcom/lumiyaviewer/lumiya/utils/reqset/WeakPriorityRequestSet;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->activeAgentCircuit:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->minimapBitmapPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userLocationsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->wornAttachmentsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->wornWearablesPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->wornItemsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->wornOutfitLinkPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->muteListPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->currentLocationInfoPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->voiceLoggedInPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool;-><init>()V

    invoke-virtual {v0, v7}, Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool;->setCanContainNulls(Z)Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->voiceChatInfoPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->voiceActiveChatterPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->voiceAudioPropertiesPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userNamesPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/RateLimitRequestHandler;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager$1;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userNamesPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->dbExecutor:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    invoke-direct {v1, p0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/react/RequestSource;Ljava/util/concurrent/Executor;)V

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RateLimitRequestHandler;-><init>(Lcom/lumiyaviewer/lumiya/react/RequestSource;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userNamesHandler:Lcom/lumiyaviewer/lumiya/react/RateLimitRequestHandler;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userID:Ljava/util/UUID;

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/dao/DaoManager;->getUserDaoSession(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/dao/DaoSession;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Null DAO session"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->daoSession:Lcom/lumiyaviewer/lumiya/dao/DaoSession;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->getUserDao()Lcom/lumiyaviewer/lumiya/dao/UserDao;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userDao:Lcom/lumiyaviewer/lumiya/dao/UserDao;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->getUserPicDao()Lcom/lumiyaviewer/lumiya/dao/UserPicDao;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userPicDao:Lcom/lumiyaviewer/lumiya/dao/UserPicDao;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->getChatMessageDao()Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->getChatterDao()Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->dbExecutor:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    const-string/jumbo v3, "AvatarPicks"

    invoke-direct {v1, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;-><init>(Lcom/lumiyaviewer/lumiya/dao/DaoSession;Ljava/util/concurrent/Executor;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->avatarPicks:Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->dbExecutor:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    const-string/jumbo v3, "AvatarPickInfos"

    invoke-direct {v1, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;-><init>(Lcom/lumiyaviewer/lumiya/dao/DaoSession;Ljava/util/concurrent/Executor;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->avatarPickInfos:Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/SerializableResponseCacher;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->dbExecutor:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    const-string/jumbo v3, "AvatarGroupLists"

    invoke-direct {v1, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/SerializableResponseCacher;-><init>(Lcom/lumiyaviewer/lumiya/dao/DaoSession;Ljava/util/concurrent/Executor;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->avatarGroupLists:Lcom/lumiyaviewer/lumiya/slproto/users/SerializableResponseCacher;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->dbExecutor:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    const-string/jumbo v3, "GroupProfiles"

    invoke-direct {v1, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;-><init>(Lcom/lumiyaviewer/lumiya/dao/DaoSession;Ljava/util/concurrent/Executor;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->groupProfiles:Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->dbExecutor:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    const-string/jumbo v3, "GroupTitles"

    invoke-direct {v1, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;-><init>(Lcom/lumiyaviewer/lumiya/dao/DaoSession;Ljava/util/concurrent/Executor;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->groupTitles:Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->dbExecutor:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    const-string/jumbo v3, "AgentDataUpdates"

    invoke-direct {v1, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;-><init>(Lcom/lumiyaviewer/lumiya/dao/DaoSession;Ljava/util/concurrent/Executor;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->agentDataUpdates:Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->dbExecutor:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    const-string/jumbo v3, "GroupRoles"

    invoke-direct {v1, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;-><init>(Lcom/lumiyaviewer/lumiya/dao/DaoSession;Ljava/util/concurrent/Executor;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->groupRoles:Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->dbExecutor:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    const-string/jumbo v3, "AvatarNotes"

    invoke-direct {v1, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;-><init>(Lcom/lumiyaviewer/lumiya/dao/DaoSession;Ljava/util/concurrent/Executor;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->avatarNotes:Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->dbExecutor:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    const-string/jumbo v3, "AvatarProperties"

    invoke-direct {v1, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;-><init>(Lcom/lumiyaviewer/lumiya/dao/DaoSession;Ljava/util/concurrent/Executor;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->avatarProperties:Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->dbExecutor:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    const-string/jumbo v3, "ParcelInfoReply"

    invoke-direct {v1, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;-><init>(Lcom/lumiyaviewer/lumiya/dao/DaoSession;Ljava/util/concurrent/Executor;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->parcelInfoData:Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->dbExecutor:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    invoke-direct {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;-><init>(Lcom/lumiyaviewer/lumiya/dao/DaoSession;Ljava/util/concurrent/Executor;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->assetResponseCacher:Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userDao:Lcom/lumiyaviewer/lumiya/dao/UserDao;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/dao/UserDao;->queryBuilder()Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/dao/UserDao$Properties;->Uuid:Lde/greenrobot/dao/Property;

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Lde/greenrobot/dao/Property;->eq(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v2

    new-array v3, v6, [Lde/greenrobot/dao/query/WhereCondition;

    invoke-virtual {v1, v2, v3}, Lde/greenrobot/dao/query/QueryBuilder;->where(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lde/greenrobot/dao/query/QueryBuilder;->build()Lde/greenrobot/dao/query/Query;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->findUserQuery:Lde/greenrobot/dao/query/Query;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userDao:Lcom/lumiyaviewer/lumiya/dao/UserDao;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/dao/UserDao;->queryBuilder()Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/dao/UserDao$Properties;->IsFriend:Lde/greenrobot/dao/Property;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2, v3}, Lde/greenrobot/dao/Property;->eq(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v2

    new-array v3, v6, [Lde/greenrobot/dao/query/WhereCondition;

    invoke-virtual {v1, v2, v3}, Lde/greenrobot/dao/query/QueryBuilder;->where(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lde/greenrobot/dao/query/QueryBuilder;->build()Lde/greenrobot/dao/query/Query;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->friendsQuery:Lde/greenrobot/dao/query/Query;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userPicDao:Lcom/lumiyaviewer/lumiya/dao/UserPicDao;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/dao/UserPicDao;->queryBuilder()Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/dao/UserPicDao$Properties;->Uuid:Lde/greenrobot/dao/Property;

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Lde/greenrobot/dao/Property;->eq(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v2

    new-array v3, v6, [Lde/greenrobot/dao/query/WhereCondition;

    invoke-virtual {v1, v2, v3}, Lde/greenrobot/dao/query/QueryBuilder;->where(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lde/greenrobot/dao/query/QueryBuilder;->build()Lde/greenrobot/dao/query/Query;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->findUserPicQuery:Lde/greenrobot/dao/query/Query;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;->queryBuilder()Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao$Properties;->Id:Lde/greenrobot/dao/Property;

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Lde/greenrobot/dao/Property;->eq(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v2

    new-array v3, v6, [Lde/greenrobot/dao/query/WhereCondition;

    invoke-virtual {v1, v2, v3}, Lde/greenrobot/dao/query/QueryBuilder;->where(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lde/greenrobot/dao/query/QueryBuilder;->build()Lde/greenrobot/dao/query/Query;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->loadMessageQuery:Lde/greenrobot/dao/query/Query;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/dao/ChatterDao;->queryBuilder()Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatterDao$Properties;->Type:Lde/greenrobot/dao/Property;

    invoke-virtual {v2, v4}, Lde/greenrobot/dao/Property;->eq(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v2

    new-array v3, v7, [Lde/greenrobot/dao/query/WhereCondition;

    sget-object v4, Lcom/lumiyaviewer/lumiya/dao/ChatterDao$Properties;->Uuid:Lde/greenrobot/dao/Property;

    const-string/jumbo v5, ""

    invoke-virtual {v4, v5}, Lde/greenrobot/dao/Property;->eq(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-virtual {v1, v2, v3}, Lde/greenrobot/dao/query/QueryBuilder;->where(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lde/greenrobot/dao/query/QueryBuilder;->build()Lde/greenrobot/dao/query/Query;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->findChatterQuery:Lde/greenrobot/dao/query/Query;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/dao/ChatterDao;->queryBuilder()Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatterDao$Properties;->Active:Lde/greenrobot/dao/Property;

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v2, v3}, Lde/greenrobot/dao/Property;->eq(Ljava/lang/Object;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v2

    new-array v3, v6, [Lde/greenrobot/dao/query/WhereCondition;

    invoke-virtual {v1, v2, v3}, Lde/greenrobot/dao/query/QueryBuilder;->where(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lde/greenrobot/dao/query/QueryBuilder;->build()Lde/greenrobot/dao/query/Query;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->activeChattersQuery:Lde/greenrobot/dao/query/Query;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    invoke-direct {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;-><init>(Ljava/util/UUID;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->inventoryManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    invoke-direct {v1, p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/dao/DaoSession;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->notificationManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->objectPopupsManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->objectsManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->balanceManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SearchManager;

    invoke-direct {v1, p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SearchManager;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/dao/DaoSession;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->searchManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/SearchManager;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->chatterList:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userPicBitmapCache:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->syncManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;

    return-void
.end method

.method public static agentCircuits()Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->activeAgentCircuitsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool;

    return-object v0
.end method

.method public static getActiveAgentCircuit(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;
    .locals 2
    .param p0    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v1, 0x0

    if-eqz p0, :cond_0

    invoke-static {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    return-object v0

    :cond_0
    return-object v1
.end method

.method public static getConnectedAgentCircuit(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;
    .locals 1
    .param p0    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$NotConnectedException;
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    invoke-static {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$NotConnectedException;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$NotConnectedException;-><init>()V

    throw v0
.end method

.method private static getInventoryDatabasePath(Ljava/lang/String;)Ljava/io/File;
    .locals 3

    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "db_location"

    const-string/jumbo v2, "internal"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "sd"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    const-string/jumbo v2, "/Android/data/com.lumiyaviewer.lumiya/cache/database"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v1

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    :cond_1
    return-object v0
.end method

.method public static getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .locals 3
    .param p0    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v2, 0x0

    if-nez p0, :cond_0

    return-object v2

    :cond_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userManagers:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_1

    :try_start_1
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;-><init>(Ljava/util/UUID;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userManagers:Ljava/util/Map;

    invoke-interface {v2, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_1
    monitor-exit v1

    return-object v0

    :catch_0
    move-exception v0

    :try_start_3
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit v1

    return-object v2

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public addChatMessage(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/dao/ChatMessage;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;->insert(Ljava/lang/Object;)J

    return-void
.end method

.method public clearActiveAgentCircuit(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 3
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->activeAgentCircuit:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "Active agent circuit cleared."

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->objectPopupsManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->clearObjectPopups()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->objectsManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->requestObjectListUpdate()V

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->activeAgentCircuitsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userID:Ljava/util/UUID;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool;->setData(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->activeAgentCircuit:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    return-object v0
.end method

.method public getAgentDataUpdates()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->agentDataUpdates:Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    return-object v0
.end method

.method public getAssetResponseCacher()Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->assetResponseCacher:Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;

    return-object v0
.end method

.method public getAvatarGroupLists()Lcom/lumiyaviewer/lumiya/slproto/users/SerializableResponseCacher;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/slproto/users/SerializableResponseCacher",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->avatarGroupLists:Lcom/lumiyaviewer/lumiya/slproto/users/SerializableResponseCacher;

    return-object v0
.end method

.method public getAvatarNotes()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->avatarNotes:Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    return-object v0
.end method

.method public getAvatarPickInfos()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->avatarPickInfos:Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    return-object v0
.end method

.method public getAvatarPicks()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->avatarPicks:Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    return-object v0
.end method

.method public getAvatarProperties()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->avatarProperties:Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    return-object v0
.end method

.method public getBalanceManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->balanceManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;

    return-object v0
.end method

.method public getCachedGroupProfiles()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->groupProfiles:Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    return-object v0
.end method

.method public getChatMessage(J)Lcom/lumiyaviewer/lumiya/dao/ChatMessage;
    .locals 3
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->loadMessageQuery:Lde/greenrobot/dao/query/Query;

    invoke-virtual {v0}, Lde/greenrobot/dao/query/Query;->forCurrentThread()Lde/greenrobot/dao/query/Query;

    move-result-object v0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Lde/greenrobot/dao/query/Query;->setParameter(ILjava/lang/Object;)V

    invoke-virtual {v0}, Lde/greenrobot/dao/query/Query;->unique()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;

    return-object v0
.end method

.method public getChatMessageDao()Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->chatMessageDao:Lcom/lumiyaviewer/lumiya/dao/ChatMessageDao;

    return-object v0
.end method

.method public getChatter(Landroid/database/Cursor;)Lcom/lumiyaviewer/lumiya/dao/Chatter;
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/dao/ChatterDao;->readEntity(Landroid/database/Cursor;I)Lcom/lumiyaviewer/lumiya/dao/Chatter;

    move-result-object v0

    return-object v0
.end method

.method public getChatterDao()Lcom/lumiyaviewer/lumiya/dao/ChatterDao;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    return-object v0
.end method

.method public getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->chatterList:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    return-object v0
.end method

.method public getCurrentLocationInfo()Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->currentLocationInfoPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    return-object v0
.end method

.method public getCurrentLocationInfoSnapshot()Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->currentLocationInfoPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;

    return-object v0
.end method

.method public getDaoSession()Lcom/lumiyaviewer/lumiya/dao/DaoSession;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->daoSession:Lcom/lumiyaviewer/lumiya/dao/DaoSession;

    return-object v0
.end method

.method public getDatabaseExecutor()Ljava/util/concurrent/Executor;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->dbExecutor:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    return-object v0
.end method

.method public getDatabaseRunOnceExecutor()Ljava/util/concurrent/Executor;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->dbExecutor:Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->getRunOnceExecutor()Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor$RunOnceExecutor;

    move-result-object v0

    return-object v0
.end method

.method public getEventBus()Lcom/lumiyaviewer/lumiya/eventbus/EventBus;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    return-object v0
.end method

.method public getGroupRoles()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->groupRoles:Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    return-object v0
.end method

.method public getGroupTitles()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->groupTitles:Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    return-object v0
.end method

.method public getInventoryManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->inventoryManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/InventoryManager;

    return-object v0
.end method

.method public getMinimapBitmapPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->minimapBitmapPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    return-object v0
.end method

.method public getObjectPopupsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->objectPopupsManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    return-object v0
.end method

.method public getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->objectsManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    return-object v0
.end method

.method public getSearchManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/SearchManager;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->searchManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/SearchManager;

    return-object v0
.end method

.method public getSyncManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->syncManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;

    return-object v0
.end method

.method public getUnreadNotificationManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->notificationManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    return-object v0
.end method

.method public getUser(Landroid/database/Cursor;)Lcom/lumiyaviewer/lumiya/dao/User;
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userDao:Lcom/lumiyaviewer/lumiya/dao/UserDao;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/dao/UserDao;->readEntity(Landroid/database/Cursor;I)Lcom/lumiyaviewer/lumiya/dao/User;

    move-result-object v0

    return-object v0
.end method

.method public getUser(Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/dao/User;
    .locals 3
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->findUserQuery:Lde/greenrobot/dao/query/Query;

    invoke-virtual {v0}, Lde/greenrobot/dao/query/Query;->forCurrentThread()Lde/greenrobot/dao/query/Query;

    move-result-object v1

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Lde/greenrobot/dao/query/Query;->setParameter(ILjava/lang/Object;)V

    invoke-virtual {v1}, Lde/greenrobot/dao/query/Query;->unique()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/User;

    if-nez v0, :cond_3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userUpdateLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    invoke-virtual {v1}, Lde/greenrobot/dao/query/Query;->unique()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/User;

    if-nez v0, :cond_2

    new-instance v0, Lcom/lumiyaviewer/lumiya/dao/User;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/dao/User;-><init>(Ljava/lang/Long;)V

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/dao/User;->setUuid(Ljava/util/UUID;)V

    if-eqz p2, :cond_0

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/dao/User;->setUserName(Ljava/lang/String;)V

    :cond_0
    if-eqz p3, :cond_1

    invoke-virtual {v0, p3}, Lcom/lumiyaviewer/lumiya/dao/User;->setDisplayName(Ljava/lang/String;)V

    :cond_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userDao:Lcom/lumiyaviewer/lumiya/dao/UserDao;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/dao/UserDao;->insert(Ljava/lang/Object;)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_2
    monitor-exit v2

    :cond_3
    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0
.end method

.method public getUserDao()Lcom/lumiyaviewer/lumiya/dao/UserDao;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userDao:Lcom/lumiyaviewer/lumiya/dao/UserDao;

    return-object v0
.end method

.method public getUserID()Ljava/util/UUID;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userID:Ljava/util/UUID;

    return-object v0
.end method

.method public getUserLocationsPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocations;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userLocationsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method public getUserNameRequestQueue()Lcom/lumiyaviewer/lumiya/react/RequestQueue;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/RequestQueue",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/dao/UserName;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userNamesHandler:Lcom/lumiyaviewer/lumiya/react/RateLimitRequestHandler;

    return-object v0
.end method

.method public getUserNameRequests()Lcom/lumiyaviewer/lumiya/utils/reqset/WeakPriorityRequestSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/utils/reqset/WeakPriorityRequestSet",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userNameRequests:Lcom/lumiyaviewer/lumiya/utils/reqset/WeakPriorityRequestSet;

    return-object v0
.end method

.method public getUserNames()Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/dao/UserName;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userNamesPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method public getUserPic(Ljava/util/UUID;)[B
    .locals 4

    const/4 v3, 0x0

    if-nez p1, :cond_0

    return-object v3

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->findUserPicQuery:Lde/greenrobot/dao/query/Query;

    invoke-virtual {v0}, Lde/greenrobot/dao/query/Query;->forCurrentThread()Lde/greenrobot/dao/query/Query;

    move-result-object v0

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Lde/greenrobot/dao/query/Query;->setParameter(ILjava/lang/Object;)V

    invoke-virtual {v0}, Lde/greenrobot/dao/query/Query;->unique()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/UserPic;

    if-nez v0, :cond_1

    return-object v3

    :cond_1
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/UserPic;->getBitmap()[B

    move-result-object v0

    return-object v0
.end method

.method public getUserPicBitmapCache()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userPicBitmapCache:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache;

    return-object v0
.end method

.method public getVoiceActiveChatter()Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->voiceActiveChatterPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    return-object v0
.end method

.method public getVoiceAudioProperties()Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->voiceAudioPropertiesPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    return-object v0
.end method

.method public getVoiceChatInfo()Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;",
            "Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->voiceChatInfoPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool;

    return-object v0
.end method

.method public getVoiceLoggedIn()Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->voiceLoggedInPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    return-object v0
.end method

.method public getWornAttachmentsPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool",
            "<",
            "Lcom/google/common/collect/ImmutableMap",
            "<",
            "Ljava/util/UUID;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->wornAttachmentsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    return-object v0
.end method

.method public getWornWearablesPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool",
            "<",
            "Lcom/google/common/collect/Table",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->wornWearablesPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    return-object v0
.end method

.method public isChatterActive(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Z
    .locals 5

    const/4 v2, 0x1

    const/4 v4, 0x0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Local:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    if-ne v0, v1, :cond_0

    return v2

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->chatterUpdateLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->findChatterQuery:Lde/greenrobot/dao/query/Query;

    invoke-virtual {v0}, Lde/greenrobot/dao/query/Query;->forCurrentThread()Lde/greenrobot/dao/query/Query;

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v2}, Lde/greenrobot/dao/query/Query;->setParameter(ILjava/lang/Object;)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getOptionalChatterUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/utils/StringUtils;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v0, v3, v2}, Lde/greenrobot/dao/query/Query;->setParameter(ILjava/lang/Object;)V

    invoke-virtual {v0}, Lde/greenrobot/dao/query/Query;->unique()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/Chatter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_1

    monitor-exit v1

    return v4

    :cond_1
    :try_start_1
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getActive()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    monitor-exit v1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public isChatterMuted(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Z
    .locals 5

    const/4 v4, 0x0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Local:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    if-ne v0, v1, :cond_0

    return v4

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->chatterUpdateLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->findChatterQuery:Lde/greenrobot/dao/query/Query;

    invoke-virtual {v0}, Lde/greenrobot/dao/query/Query;->forCurrentThread()Lde/greenrobot/dao/query/Query;

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v2}, Lde/greenrobot/dao/query/Query;->setParameter(ILjava/lang/Object;)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getOptionalChatterUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/utils/StringUtils;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v0, v3, v2}, Lde/greenrobot/dao/query/Query;->setParameter(ILjava/lang/Object;)V

    invoke-virtual {v0}, Lde/greenrobot/dao/query/Query;->unique()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/Chatter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_1

    monitor-exit v1

    return v4

    :cond_1
    :try_start_1
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getMuted()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    monitor-exit v1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public muteListPool()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->muteListPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method public parcelInfoData()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->parcelInfoData:Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    return-object v0
.end method

.method public setActiveAgentCircuit(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->activeAgentCircuit:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    if-nez p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->objectPopupsManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->clearObjectPopups()V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->objectsManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->requestObjectListUpdate()V

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->activeAgentCircuitsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userID:Ljava/util/UUID;

    invoke-virtual {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool;->setData(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public setChatterMuted(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Z)V
    .locals 10

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Local:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    iget-object v9, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->chatterUpdateLock:Ljava/lang/Object;

    monitor-enter v9

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->findChatterQuery:Lde/greenrobot/dao/query/Query;

    invoke-virtual {v0}, Lde/greenrobot/dao/query/Query;->forCurrentThread()Lde/greenrobot/dao/query/Query;

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Lde/greenrobot/dao/query/Query;->setParameter(ILjava/lang/Object;)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getOptionalChatterUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/utils/StringUtils;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Lde/greenrobot/dao/query/Query;->setParameter(ILjava/lang/Object;)V

    invoke-virtual {v0}, Lde/greenrobot/dao/query/Query;->unique()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/Chatter;

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getMuted()Z

    move-result v1

    if-eq v1, p2, :cond_1

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->setMuted(Z)V

    if-nez p2, :cond_2

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getActive()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatterDao;->delete(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    :goto_0
    monitor-exit v9

    return-void

    :cond_2
    :try_start_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatterDao;->update(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v9

    throw v0

    :cond_3
    if-eqz p2, :cond_1

    :try_start_2
    new-instance v0, Lcom/lumiyaviewer/lumiya/dao/Chatter;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getOptionalChatterUUID()Ljava/util/UUID;

    move-result-object v3

    const/4 v1, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-direct/range {v0 .. v8}, Lcom/lumiyaviewer/lumiya/dao/Chatter;-><init>(Ljava/lang/Long;ILjava/util/UUID;ZZILjava/lang/Long;Ljava/util/UUID;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->chatterDao:Lcom/lumiyaviewer/lumiya/dao/ChatterDao;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatterDao;->insert(Ljava/lang/Object;)J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public setCurrentLocationInfo(Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->currentLocationInfoPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->currentLocationInfoPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->getKey()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->setData(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public setUserBadUUID(Ljava/util/UUID;)V
    .locals 2

    const/4 v1, 0x0

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v1, v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->updateUserNames(Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method public setUserPic(Ljava/util/UUID;[B)V
    .locals 3

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->findUserPicQuery:Lde/greenrobot/dao/query/Query;

    invoke-virtual {v0}, Lde/greenrobot/dao/query/Query;->forCurrentThread()Lde/greenrobot/dao/query/Query;

    move-result-object v0

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Lde/greenrobot/dao/query/Query;->setParameter(ILjava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userPicUpdateLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    invoke-virtual {v0}, Lde/greenrobot/dao/query/Query;->unique()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/UserPic;

    if-nez v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/dao/UserPic;

    const/4 v2, 0x0

    invoke-direct {v0, v2}, Lcom/lumiyaviewer/lumiya/dao/UserPic;-><init>(Ljava/lang/Long;)V

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/dao/UserPic;->setUuid(Ljava/lang/String;)V

    :cond_0
    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/dao/UserPic;->setBitmap([B)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userPicDao:Lcom/lumiyaviewer/lumiya/dao/UserPicDao;

    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/dao/UserPicDao;->insertOrReplace(Ljava/lang/Object;)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public setVoiceActiveChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->voiceActiveChatterPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->setData(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public setVoiceAudioProperties(Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->voiceAudioPropertiesPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->setData(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public setVoiceChatInfo(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->voiceChatInfoPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool;

    invoke-virtual {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionDataPool;->setData(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public setVoiceLoggedIn(Z)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->voiceLoggedInPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->setData(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public updateUserNames(Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->updateUserNames(Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method public updateUserNames(Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 4
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->findUserQuery:Lde/greenrobot/dao/query/Query;

    invoke-virtual {v0}, Lde/greenrobot/dao/query/Query;->forCurrentThread()Lde/greenrobot/dao/query/Query;

    move-result-object v0

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Lde/greenrobot/dao/query/Query;->setParameter(ILjava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userUpdateLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    invoke-virtual {v0}, Lde/greenrobot/dao/query/Query;->unique()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/User;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/User;->getUserName()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_0

    if-eqz p2, :cond_0

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/dao/User;->setUserName(Ljava/lang/String;)V

    :cond_0
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/User;->getDisplayName()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_1

    if-eqz p3, :cond_1

    invoke-virtual {v0, p3}, Lcom/lumiyaviewer/lumiya/dao/User;->setDisplayName(Ljava/lang/String;)V

    :cond_1
    invoke-virtual {v0, p4}, Lcom/lumiyaviewer/lumiya/dao/User;->setBadUUID(Z)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userDao:Lcom/lumiyaviewer/lumiya/dao/UserDao;

    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/dao/UserDao;->update(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/events/EventUserInfoChanged;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userID:Ljava/util/UUID;

    const/4 v3, 0x2

    invoke-direct {v1, v2, p1, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/events/EventUserInfoChanged;-><init>(Ljava/util/UUID;Ljava/util/UUID;I)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    return-void

    :cond_2
    :try_start_1
    new-instance v0, Lcom/lumiyaviewer/lumiya/dao/User;

    const/4 v2, 0x0

    invoke-direct {v0, v2}, Lcom/lumiyaviewer/lumiya/dao/User;-><init>(Ljava/lang/Long;)V

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/dao/User;->setUuid(Ljava/util/UUID;)V

    if-eqz p2, :cond_3

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/dao/User;->setUserName(Ljava/lang/String;)V

    :cond_3
    if-eqz p3, :cond_4

    invoke-virtual {v0, p3}, Lcom/lumiyaviewer/lumiya/dao/User;->setDisplayName(Ljava/lang/String;)V

    :cond_4
    invoke-virtual {v0, p4}, Lcom/lumiyaviewer/lumiya/dao/User;->setBadUUID(Z)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->userDao:Lcom/lumiyaviewer/lumiya/dao/UserDao;

    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/dao/UserDao;->insert(Ljava/lang/Object;)J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public wornItems()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarAppearance$WornItem;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->wornItemsPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method public wornOutfitLink()Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->wornOutfitLinkPool:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    return-object v0
.end method
