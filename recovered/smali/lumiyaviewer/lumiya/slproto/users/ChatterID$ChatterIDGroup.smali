.class public Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;
.super Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ChatterIDGroup"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup$1;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup$1;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup$1;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;-><init>(Landroid/os/Parcel;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;)V

    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method private constructor <init>(Ljava/util/UUID;Ljava/util/UUID;)V
    .locals 1
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;-><init>(Ljava/util/UUID;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/util/UUID;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;-><init>(Ljava/util/UUID;Ljava/util/UUID;)V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_ChatterID$ChatterIDGroup_7487(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$OnChatterPictureIDListener;Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;)V
    .locals 1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;->InsigniaID:Ljava/util/UUID;

    invoke-interface {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$OnChatterPictureIDListener;->onChatterPictureID(Ljava/util/UUID;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic compareTo(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)I
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;->compareTo(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    if-eqz v0, :cond_0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Group:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    return-object v0
.end method

.method public bridge synthetic getChatterUUID()Ljava/util/UUID;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;->getChatterUUID()Ljava/util/UUID;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getOptionalChatterUUID()Ljava/util/UUID;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;->getOptionalChatterUUID()Ljava/util/UUID;

    move-result-object v0

    return-object v0
.end method

.method public getPictureID(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$OnChatterPictureIDListener;)Lcom/lumiyaviewer/lumiya/react/Subscription;
    .locals 4
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/util/concurrent/Executor;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$OnChatterPictureIDListener;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getCachedGroupProfiles()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;->uuid:Ljava/util/UUID;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v2

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/users/-$Lambda$0dEDWURupJXcv_HDGgfxSQl02DE;

    invoke-direct {v3, p3}, Lcom/lumiyaviewer/lumiya/slproto/users/-$Lambda$0dEDWURupJXcv_HDGgfxSQl02DE;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic hashCode()I
    .locals 1

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;->hashCode()I

    move-result v0

    return v0
.end method

.method public bridge synthetic isValidUUID()Z
    .locals 1

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;->isValidUUID()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic toBundle()Landroid/os/Bundle;
    .locals 1

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;->toBundle()Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toString()Ljava/lang/String;
    .locals 1

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;->writeToParcel(Landroid/os/Parcel;I)V

    return-void
.end method
