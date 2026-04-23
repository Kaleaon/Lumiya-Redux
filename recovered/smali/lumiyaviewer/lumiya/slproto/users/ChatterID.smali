.class public abstract Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Parcelable;
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;,
        Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDLocal;,
        Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;,
        Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;,
        Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;,
        Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$OnChatterPictureIDListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-slproto-users-ChatterID$ChatterTypeSwitchesValues:[I


# instance fields
.field public final agentUUID:Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-slproto-users-ChatterID$ChatterTypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->-com-lumiyaviewer-lumiya-slproto-users-ChatterID$ChatterTypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->-com-lumiyaviewer-lumiya-slproto-users-ChatterID$ChatterTypeSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->values()[Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Group:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Local:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->User:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_0

    :goto_2
    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->-com-lumiyaviewer-lumiya-slproto-users-ChatterID$ChatterTypeSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_2

    :catch_1
    move-exception v1

    goto :goto_1

    :catch_2
    move-exception v1

    goto :goto_0
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(JJ)Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->agentUUID:Ljava/util/UUID;

    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method private constructor <init>(Ljava/util/UUID;)V
    .locals 0
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->agentUUID:Ljava/util/UUID;

    return-void
.end method

.method synthetic constructor <init>(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;-><init>(Ljava/util/UUID;)V

    return-void
.end method

.method public static fromBundle(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
    .locals 4

    const-string/jumbo v0, "chatterAgentUUID"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->VALUES:[Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    const-string/jumbo v2, "chatterType"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    aget-object v1, v1, v2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->-getcom-lumiyaviewer-lumiya-slproto-users-ChatterID$ChatterTypeSwitchesValues()[I

    move-result-object v2

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v1

    aget v1, v2, v1

    packed-switch v1, :pswitch_data_0

    const/4 v0, 0x0

    return-object v0

    :pswitch_0
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getLocalChatterID(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v0

    return-object v0

    :pswitch_1
    const-string/jumbo v1, "chatterUUID"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v0

    return-object v0

    :pswitch_2
    const-string/jumbo v1, "chatterUUID"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getGroupChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v0

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static fromDatabaseObject(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/dao/Chatter;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
    .locals 2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->VALUES:[Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getType()I

    move-result v1

    aget-object v0, v0, v1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->-getcom-lumiyaviewer-lumiya-slproto-users-ChatterID$ChatterTypeSwitchesValues()[I

    move-result-object v1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v0

    aget v0, v1, v0

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x0

    return-object v0

    :pswitch_0
    invoke-static {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getLocalChatterID(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v0

    return-object v0

    :pswitch_1
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getUuid()Ljava/util/UUID;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v0

    return-object v0

    :pswitch_2
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->getUuid()Ljava/util/UUID;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getGroupChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v0

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static getGroupChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
    .locals 2
    .param p0    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;-><init>(Ljava/util/UUID;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;)V

    return-object v0
.end method

.method public static getLocalChatterID(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
    .locals 2
    .param p0    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDLocal;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDLocal;-><init>(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDLocal;)V

    return-object v0
.end method

.method public static getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;
    .locals 2
    .param p0    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;-><init>(Ljava/util/UUID;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;)V

    return-object v0
.end method


# virtual methods
.method public compareTo(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)I
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->agentUUID:Ljava/util/UUID;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->agentUUID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/util/UUID;->compareTo(Ljava/util/UUID;)I

    move-result v0

    if-eqz v0, :cond_0

    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->compareTo(Ljava/lang/Enum;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->compareTo(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)I

    move-result v0

    return v0
.end method

.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->agentUUID:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->agentUUID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public abstract getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end method

.method public getConnection()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->agentUUID:Ljava/util/UUID;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/GridConnectionManager;->getConnection(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    move-result-object v0

    return-object v0
.end method

.method public getOptionalChatterUUID()Ljava/util/UUID;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method public getPictureID(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$OnChatterPictureIDListener;)Lcom/lumiyaviewer/lumiya/react/Subscription;
    .locals 1
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

    const/4 v0, 0x0

    return-object v0
.end method

.method public getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->agentUUID:Ljava/util/UUID;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->agentUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->hashCode()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public isValidUUID()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public toBundle()Landroid/os/Bundle;
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string/jumbo v1, "chatterType"

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string/jumbo v1, "chatterAgentUUID"

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->agentUUID:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public toDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/Chatter;)V
    .locals 1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->ordinal()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->setType(I)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getOptionalChatterUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/Chatter;->setUuid(Ljava/util/UUID;)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Chatter:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->agentUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->agentUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    return-void
.end method
