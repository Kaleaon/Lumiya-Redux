.class public Lcom/lumiyaviewer/lumiya/GlobalOptions;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/GlobalOptions$GlobalOptionsChangedEvent;,
        Lcom/lumiyaviewer/lumiya/GlobalOptions$InstanceHolder;,
        Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;
    }
.end annotation


# instance fields
.field private RLVEnabled:Z

.field private advancedRendering:Z

.field private autoReconnect:Z

.field private final availableCacheDirs:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Ljava/io/File;",
            ">;>;"
        }
    .end annotation
.end field

.field private final baseCacheDir:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field private final cacheDirUsed:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private cloudSyncEnabled:Z

.field private compressedTextures:Z

.field private forceDaylightHour:F

.field private forceDaylightTime:Z

.field private highQualityTextures:Z

.field private hoverTextEnableHUDs:Z

.field private hoverTextEnableObjects:Z

.field private keepWifiOn:Z

.field private legacyUserNames:Z

.field private maxReconnectAttempts:I

.field private maxTextureDownloads:I

.field private meshRendering:Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

.field private renderClouds:Z

.field private showTimestamps:Z

.field private terrainTextures:Z

.field private themeResourceId:I

.field private useFXAA:Z

.field private voiceEnabled:Z


# direct methods
.method public constructor <init>()V
    .locals 4

    const/4 v3, 0x1

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0x7f0b002c

    iput v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->themeResourceId:I

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->legacyUserNames:Z

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->showTimestamps:Z

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->highQualityTextures:Z

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->compressedTextures:Z

    const/4 v0, 0x2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->maxTextureDownloads:I

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->terrainTextures:Z

    sget-object v0, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;->medium:Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->meshRendering:Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->RLVEnabled:Z

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->keepWifiOn:Z

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->baseCacheDir:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->availableCacheDirs:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->cacheDirUsed:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->autoReconnect:Z

    const/16 v0, 0xa

    iput v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->maxReconnectAttempts:I

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->hoverTextEnableHUDs:Z

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->hoverTextEnableObjects:Z

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->advancedRendering:Z

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->useFXAA:Z

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->renderClouds:Z

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->forceDaylightTime:Z

    const/high16 v0, 0x3f000000    # 0.5f

    iput v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->forceDaylightHour:F

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->cloudSyncEnabled:Z

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->voiceEnabled:Z

    return-void
.end method

.method public static getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions$InstanceHolder;->-get0()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    return-object v0
.end method

.method private static getTotalMemory()J
    .locals 7

    const-wide/16 v0, 0x0

    :try_start_0
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/FileReader;

    const-string/jumbo v4, "/proc/meminfo"

    invoke-direct {v2, v4}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    const/16 v4, 0x2000

    invoke-direct {v3, v2, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    :cond_0
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    const-string/jumbo v4, "MemTotal:"

    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    const-string/jumbo v4, "\\s+"

    invoke-virtual {v2, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    array-length v2, v4

    const/4 v5, 0x2

    if-lt v2, v5, :cond_1

    const/4 v2, 0x1

    aget-object v2, v4, v2

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    array-length v5, v4

    if-ge v2, v5, :cond_2

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Memory "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, v4, v2

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    return-wide v0

    :catch_0
    move-exception v2

    goto :goto_1
.end method

.method private isCacheDirectoryWriteable(Ljava/io/File;)Z
    .locals 3
    .param p1    # Ljava/io/File;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v2, 0x0

    if-nez p1, :cond_0

    return v2

    :cond_0
    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1

    return v2

    :cond_1
    new-instance v0, Ljava/io/File;

    const-string/jumbo v1, ".tmp"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_2

    return v2

    :cond_2
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_3

    return v2

    :cond_3
    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x1

    return v0

    :catch_0
    move-exception v0

    return v2
.end method

.method private updateCacheDir(Landroid/content/Context;Landroid/content/SharedPreferences;)V
    .locals 10

    const/4 v9, 0x1

    const/4 v3, 0x0

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->baseCacheDir:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    const-string/jumbo v2, "cache_location"

    const-string/jumbo v4, ""

    invoke-interface {p2, v2, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v0, :cond_0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->isCacheDirectoryWriteable(Ljava/io/File;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    move-object v1, v0

    :cond_0
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p1}, Landroid/support/v4/content/ContextCompat;->getExternalCacheDirs(Landroid/content/Context;)[Ljava/io/File;

    move-result-object v6

    if-eqz v6, :cond_2

    array-length v7, v6

    move v2, v3

    :goto_0
    if-ge v2, v7, :cond_2

    aget-object v8, v6, v2

    if-eqz v8, :cond_1

    invoke-interface {v5, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v2

    if-eqz v2, :cond_3

    invoke-interface {v5, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v6

    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    move-object v2, v1

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    const-string/jumbo v7, "Cache: checking cache location %s"

    new-array v8, v9, [Ljava/lang/Object;

    aput-object v1, v8, v3

    invoke-static {v7, v8}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-direct {p0, v1}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->isCacheDirectoryWriteable(Ljava/io/File;)Z

    move-result v7

    if-eqz v7, :cond_a

    invoke-virtual {v6, v1}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    if-eqz v2, :cond_4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_5

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_a

    :cond_4
    :goto_2
    move-object v2, v1

    goto :goto_1

    :cond_5
    move-object v1, v2

    goto :goto_2

    :cond_6
    if-nez v2, :cond_7

    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v2

    :cond_7
    const-string/jumbo v1, "Cache: cache location set to %s"

    new-array v4, v9, [Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v3

    invoke-static {v1, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->availableCacheDirs:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v6}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->baseCacheDir:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    :try_start_0
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_8

    new-instance v1, Ljava/io/File;

    const-string/jumbo v4, ".nomedia"

    invoke-direct {v1, v2, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_8
    :goto_3
    if-eqz v0, :cond_9

    invoke-virtual {v0, v2}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    const-string/jumbo v0, "Cache: Cache location has been changed."

    new-array v1, v3, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getInstance()Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->onCacheDirChanged()V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;->onCacheDirChanged()V

    :cond_9
    return-void

    :catch_0
    move-exception v1

    goto :goto_3

    :cond_a
    move-object v1, v2

    goto :goto_2
.end method

.method private updateNotificationSoundDefault(Landroid/content/SharedPreferences;Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;)V
    .locals 5

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->getRingtoneKey()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;->defaultSounds:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v0, p2}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;->getUri()Landroid/net/Uri;

    move-result-object v0

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->getRingtoneKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    const-string/jumbo v1, "NotificationSounds: Updated %s preference to %s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->getRingtoneKey()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x1

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public enableVoice()V
    .locals 3

    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getDefaultSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "enableVoice"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public getAdvancedRendering()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->advancedRendering:Z

    return v0
.end method

.method public final getAutoReconnect()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->autoReconnect:Z

    return v0
.end method

.method public getAvailableCacheDirs()Lcom/google/common/collect/ImmutableList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->availableCacheDirs:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/ImmutableList;

    return-object v0
.end method

.method public getBaseCacheDir()Ljava/io/File;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->baseCacheDir:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    return-object v0
.end method

.method public final getCacheDir(Ljava/lang/String;)Ljava/io/File;
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->cacheDirUsed:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->baseCacheDir:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    :cond_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-object v1

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public final getCompressedTextures()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->compressedTextures:Z

    return v0
.end method

.method public getForceDaylightHour()F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->forceDaylightHour:F

    return v0
.end method

.method public getForceDaylightTime()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->forceDaylightTime:Z

    return v0
.end method

.method public final getHighQualityTextures()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->highQualityTextures:Z

    return v0
.end method

.method public final getHoverTextEnableHUDs()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->hoverTextEnableHUDs:Z

    return v0
.end method

.method public final getHoverTextEnableObjects()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->hoverTextEnableObjects:Z

    return v0
.end method

.method public getKeepWifiOn()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->keepWifiOn:Z

    return v0
.end method

.method public final getMaxReconnectAttempts()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->maxReconnectAttempts:I

    return v0
.end method

.method public final getMaxTextureDownloads()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->maxTextureDownloads:I

    return v0
.end method

.method public final getMeshRendering()Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->meshRendering:Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

    return-object v0
.end method

.method public final getRLVEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->RLVEnabled:Z

    return v0
.end method

.method public getRenderClouds()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->renderClouds:Z

    return v0
.end method

.method public getShowTimestamps()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->showTimestamps:Z

    return v0
.end method

.method public final getTerrainTextures()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->terrainTextures:Z

    return v0
.end method

.method public getThemeResourceId()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->themeResourceId:I

    return v0
.end method

.method public getUseFXAA()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->useFXAA:Z

    return v0
.end method

.method public getVoiceEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->voiceEnabled:Z

    return v0
.end method

.method public initialize()V
    .locals 2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getDefaultSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->updateFromPreferences(Landroid/content/Context;Landroid/content/SharedPreferences;)V

    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    return-void
.end method

.method public isCacheDirUsed()Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->cacheDirUsed:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public isLegacyUserNames()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->legacyUserNames:Z

    return v0
.end method

.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->updateFromPreferences(Landroid/content/Context;Landroid/content/SharedPreferences;)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->getInstance()Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/GlobalOptions$GlobalOptionsChangedEvent;

    invoke-direct {v1, p1}, Lcom/lumiyaviewer/lumiya/GlobalOptions$GlobalOptionsChangedEvent;-><init>(Landroid/content/SharedPreferences;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    return-void
.end method

.method public updateFromPreferences(Landroid/content/Context;Landroid/content/SharedPreferences;)V
    .locals 8

    const-string/jumbo v0, "Updating options from preferences."

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->Private:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-direct {p0, p2, v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->updateNotificationSoundDefault(Landroid/content/SharedPreferences;Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->Group:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-direct {p0, p2, v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->updateNotificationSoundDefault(Landroid/content/SharedPreferences;Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->LocalChat:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-direct {p0, p2, v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->updateNotificationSoundDefault(Landroid/content/SharedPreferences;Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;)V

    const-string/jumbo v0, "system_defaults_set"

    const/4 v1, 0x0

    invoke-interface {p2, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getTotalMemory()J

    move-result-wide v2

    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v4

    const/4 v0, 0x2

    if-lt v4, v0, :cond_6

    const-wide/32 v6, 0x80000

    cmp-long v0, v2, v6

    if-lez v0, :cond_6

    const-string/jumbo v0, "high_quality_textures"

    const/4 v5, 0x1

    invoke-interface {v1, v0, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    :goto_0
    const/16 v0, 0x40

    const-wide/16 v6, 0x0

    cmp-long v5, v2, v6

    if-eqz v5, :cond_0

    const-wide/32 v6, 0x40000

    cmp-long v0, v2, v6

    if-gtz v0, :cond_7

    const/16 v0, 0x20

    :cond_0
    :goto_1
    const-string/jumbo v5, "texture_memory_limit"

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v5, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const/4 v0, 0x2

    const/4 v5, 0x4

    if-lt v4, v5, :cond_9

    const-wide/32 v6, 0x80000

    cmp-long v2, v2, v6

    if-lez v2, :cond_9

    const/16 v0, 0x8

    :cond_1
    :goto_2
    const-string/jumbo v2, "max_texture_downloads"

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string/jumbo v0, "system_defaults_set"

    const/4 v2, 0x1

    invoke-interface {v1, v0, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    :cond_2
    iget v1, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->themeResourceId:I

    const-string/jumbo v0, "theme"

    const-string/jumbo v2, "light"

    invoke-interface {p2, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/base/Strings;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v2, "dark"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    const v0, 0x7f0b002b

    iput v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->themeResourceId:I

    :goto_3
    const-string/jumbo v0, "legacyUserNames"

    const/4 v2, 0x0

    invoke-interface {p2, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->legacyUserNames:Z

    const-string/jumbo v0, "chatTimestamps"

    const/4 v2, 0x1

    invoke-interface {p2, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->showTimestamps:Z

    const-string/jumbo v0, "high_quality_textures"

    const/4 v2, 0x0

    invoke-interface {p2, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->highQualityTextures:Z

    const-string/jumbo v0, "compressed_textures"

    const/4 v2, 0x1

    invoke-interface {p2, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->compressedTextures:Z

    const-string/jumbo v0, "keep_wifi_on"

    const/4 v2, 0x1

    invoke-interface {p2, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->keepWifiOn:Z

    const-string/jumbo v0, "sync_to_gdrive"

    const/4 v2, 0x0

    invoke-interface {p2, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->cloudSyncEnabled:Z

    const-string/jumbo v0, "enableVoice"

    const/4 v2, 0x0

    invoke-interface {p2, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-static {}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->isPluginSupported()Z

    move-result v0

    :goto_4
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->voiceEnabled:Z

    :try_start_0
    const-string/jumbo v0, "max_texture_downloads"

    const-string/jumbo v2, "2"

    invoke-interface {p2, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    const/4 v2, 0x1

    if-ge v0, v2, :cond_3

    const/4 v0, 0x1

    :cond_3
    :goto_5
    iget v2, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->maxTextureDownloads:I

    if-eq v0, v2, :cond_4

    iput v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->maxTextureDownloads:I

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getInstance()Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    move-result-object v0

    iget v2, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->maxTextureDownloads:I

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->setMaxTextureDownloads(I)V

    :cond_4
    const-string/jumbo v0, "terrain_textures"

    const/4 v2, 0x1

    invoke-interface {p2, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->terrainTextures:Z

    const/16 v0, 0x40

    :try_start_1
    const-string/jumbo v2, "texture_memory_limit"

    const-string/jumbo v3, "64"

    invoke-interface {p2, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4

    move-result v0

    :goto_6
    :try_start_2
    const-string/jumbo v2, "mesh_rendering"

    const-string/jumbo v3, "high"

    invoke-interface {p2, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;->valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

    move-result-object v2

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->meshRendering:Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    :goto_7
    mul-int/lit16 v0, v0, 0x400

    mul-int/lit16 v0, v0, 0x400

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->setMemoryLimit(I)V

    const-string/jumbo v0, "rlv_enabled"

    const/4 v2, 0x0

    invoke-interface {p2, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->RLVEnabled:Z

    const-string/jumbo v0, "auto_reconnect"

    const/4 v2, 0x1

    invoke-interface {p2, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->autoReconnect:Z

    :try_start_3
    const-string/jumbo v0, "reconnect_attempts"

    const-string/jumbo v2, "10"

    invoke-interface {p2, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->maxReconnectAttempts:I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    :goto_8
    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->updateCacheDir(Landroid/content/Context;Landroid/content/SharedPreferences;)V

    const-string/jumbo v0, "hover_text"

    const-string/jumbo v2, "huds"

    invoke-interface {p2, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v2, "all"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->hoverTextEnableHUDs:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->hoverTextEnableObjects:Z

    :goto_9
    const-string/jumbo v0, "advanced_rendering"

    const/4 v2, 0x1

    invoke-interface {p2, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->advancedRendering:Z

    const-string/jumbo v0, "fxaa_enable"

    const/4 v2, 0x0

    invoke-interface {p2, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->useFXAA:Z

    const-string/jumbo v0, "clouds_enable"

    const/4 v2, 0x1

    invoke-interface {p2, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->renderClouds:Z

    const-string/jumbo v0, "render_time_of_day"

    const-string/jumbo v2, "sim"

    invoke-interface {p2, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v2, "sim"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_f

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->forceDaylightTime:Z

    const/high16 v0, 0x3f000000    # 0.5f

    iput v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->forceDaylightHour:F

    :goto_a
    iget v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->themeResourceId:I

    if-eq v1, v0, :cond_5

    invoke-static {}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->getInstance()Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/settings/ThemeChangedEvent;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->themeResourceId:I

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/lumiya/ui/settings/ThemeChangedEvent;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    :cond_5
    return-void

    :cond_6
    const-string/jumbo v0, "high_quality_textures"

    const/4 v5, 0x0

    invoke-interface {v1, v0, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    goto/16 :goto_0

    :cond_7
    const-wide/32 v6, 0x80000

    cmp-long v0, v2, v6

    if-gtz v0, :cond_8

    const/16 v0, 0x40

    goto/16 :goto_1

    :cond_8
    const/16 v0, 0x80

    goto/16 :goto_1

    :cond_9
    const/4 v2, 0x2

    if-lt v4, v2, :cond_1

    const/4 v0, 0x4

    goto/16 :goto_2

    :cond_a
    const-string/jumbo v2, "pink"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    const v0, 0x7f0b002f

    iput v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->themeResourceId:I

    goto/16 :goto_3

    :cond_b
    const v0, 0x7f0b002c

    iput v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->themeResourceId:I

    goto/16 :goto_3

    :cond_c
    const/4 v0, 0x0

    goto/16 :goto_4

    :catch_0
    move-exception v0

    const/4 v0, 0x2

    goto/16 :goto_5

    :cond_d
    const-string/jumbo v2, "none"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->hoverTextEnableHUDs:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->hoverTextEnableObjects:Z

    goto/16 :goto_9

    :cond_e
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->hoverTextEnableHUDs:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->hoverTextEnableObjects:Z

    goto/16 :goto_9

    :cond_f
    const/4 v2, 0x1

    :try_start_4
    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->forceDaylightTime:Z

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->forceDaylightHour:F
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_a

    :catch_1
    move-exception v0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->forceDaylightTime:Z

    const/high16 v0, 0x3f000000    # 0.5f

    iput v0, p0, Lcom/lumiyaviewer/lumiya/GlobalOptions;->forceDaylightHour:F

    goto :goto_a

    :catch_2
    move-exception v0

    goto/16 :goto_8

    :catch_3
    move-exception v2

    goto/16 :goto_7

    :catch_4
    move-exception v2

    goto/16 :goto_6
.end method
