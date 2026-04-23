.class public abstract Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;IILcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;
    .locals 1
    .param p0    # Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_CurrentLocationInfo;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_CurrentLocationInfo;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;IILcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;)V

    return-object v0
.end method


# virtual methods
.method public abstract inChatRangeUsers()I
.end method

.method public abstract nearbyUsers()I
.end method

.method public abstract parcelData()Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method public abstract parcelVoiceChannel()Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method
