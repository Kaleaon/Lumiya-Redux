.class public Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;
.implements Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable$OnWearableStatusChangeListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/lumiyaviewer/lumiya/react/Subscription$OnData",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;",
        ">;",
        "Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;"
    }
.end annotation


# instance fields
.field public final assetID:Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final assetSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;",
            ">;"
        }
    .end annotation
.end field

.field private inventoryName:Ljava/lang/String;

.field private volatile isFailed:Z

.field public final itemID:Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final statusChangeListener:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable$OnWearableStatusChangeListener;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private volatile wearableData:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Ljava/util/concurrent/Executor;Ljava/util/UUID;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable$OnWearableStatusChangeListener;)V
    .locals 4
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/util/concurrent/Executor;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p5    # Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p6    # Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable$OnWearableStatusChangeListener;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v3, 0x0

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->itemID:Ljava/util/UUID;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->assetID:Ljava/util/UUID;

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->isFailed:Z

    iput-object p6, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->statusChangeListener:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable$OnWearableStatusChangeListener;

    const-string/jumbo v0, "Wearable: subscribing for wearable %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p4, v1, v2

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getAssetResponseCacher()Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;->getPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    invoke-virtual {p5}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableType;->getAssetType()Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v1

    invoke-static {v3, v3, p4, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->createAssetKey(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;I)Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;

    move-result-object v1

    invoke-interface {v0, v1, p2, p0, p0}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->assetSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 4

    const-string/jumbo v0, "Wearable: unsubscribing for wearable %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->assetID:Ljava/util/UUID;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->assetSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->unsubscribe()V

    return-void
.end method

.method public getIsFailed()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->isFailed:Z

    return v0
.end method

.method public getIsValid()Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->wearableData:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->inventoryName:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->inventoryName:Ljava/lang/String;

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->wearableData:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData;

    if-eqz v0, :cond_1

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData;->name:Ljava/lang/String;

    return-object v0

    :cond_1
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->isFailed:Z

    if-eqz v0, :cond_2

    const-string/jumbo v0, "(Failed to load)"

    return-object v0

    :cond_2
    const-string/jumbo v0, "(loading)"

    return-object v0
.end method

.method public getWearableData()Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->wearableData:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData;

    return-object v0
.end method

.method public onData(Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;)V
    .locals 6

    const/4 v5, 0x0

    const/4 v4, 0x1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;->getStatus()I

    move-result v0

    if-ne v0, v4, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;->getData()[B

    move-result-object v0

    if-nez v0, :cond_2

    :cond_0
    const-string/jumbo v0, "Wearable: asset transfer failed for asset %s"

    new-array v1, v4, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->assetID:Ljava/util/UUID;

    aput-object v2, v1, v5

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iput-boolean v4, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->isFailed:Z

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->statusChangeListener:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable$OnWearableStatusChangeListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->statusChangeListener:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable$OnWearableStatusChangeListener;

    invoke-interface {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable$OnWearableStatusChangeListener;->onWearableStatusChanged(Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;)V

    :cond_1
    return-void

    :cond_2
    :try_start_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;->getData()[B

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData;-><init>([B)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->wearableData:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData;

    const-string/jumbo v0, "Wearable: retrieved wearable data for asset %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->assetID:Ljava/util/UUID;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->isFailed:Z
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v0, "Wearable: failed to parse wearable data for asset %s"

    new-array v1, v4, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->assetID:Ljava/util/UUID;

    aput-object v2, v1, v5

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iput-boolean v4, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->isFailed:Z

    goto :goto_0
.end method

.method public bridge synthetic onData(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->onData(Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;)V

    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 5

    const/4 v4, 0x1

    const-string/jumbo v0, "Wearable: got error for asset %s"

    new-array v1, v4, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->assetID:Ljava/util/UUID;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iput-boolean v4, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->isFailed:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->statusChangeListener:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable$OnWearableStatusChangeListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->statusChangeListener:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable$OnWearableStatusChangeListener;

    invoke-interface {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable$OnWearableStatusChangeListener;->onWearableStatusChanged(Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;)V

    :cond_0
    return-void
.end method

.method public setInventoryName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearable;->inventoryName:Ljava/lang/String;

    return-void
.end method
