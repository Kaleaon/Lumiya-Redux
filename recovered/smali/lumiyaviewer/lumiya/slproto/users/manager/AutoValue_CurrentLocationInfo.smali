.class final Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_CurrentLocationInfo;
.super Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;


# instance fields
.field private final inChatRangeUsers:I

.field private final nearbyUsers:I

.field private final parcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

.field private final parcelVoiceChannel:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;IILcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_CurrentLocationInfo;->parcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_CurrentLocationInfo;->nearbyUsers:I

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_CurrentLocationInfo;->inChatRangeUsers:I

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_CurrentLocationInfo;->parcelVoiceChannel:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v2, p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;

    if-eqz v2, :cond_6

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_CurrentLocationInfo;->parcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->parcelData()Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    move-result-object v2

    if-nez v2, :cond_3

    :cond_1
    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_CurrentLocationInfo;->nearbyUsers:I

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->nearbyUsers()I

    move-result v3

    if-ne v2, v3, :cond_3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_CurrentLocationInfo;->inChatRangeUsers:I

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->inChatRangeUsers()I

    move-result v3

    if-ne v2, v3, :cond_3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_CurrentLocationInfo;->parcelVoiceChannel:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    if-nez v2, :cond_5

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->parcelVoiceChannel()Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    move-result-object v2

    if-nez v2, :cond_4

    :goto_0
    return v0

    :cond_2
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_CurrentLocationInfo;->parcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->parcelData()Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    :cond_3
    move v0, v1

    goto :goto_0

    :cond_4
    move v0, v1

    goto :goto_0

    :cond_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_CurrentLocationInfo;->parcelVoiceChannel:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->parcelVoiceChannel()Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    :cond_6
    return v1
.end method

.method public hashCode()I
    .locals 4

    const/4 v1, 0x0

    const v3, 0xf4243

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_CurrentLocationInfo;->parcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    xor-int/2addr v0, v3

    mul-int/2addr v0, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_CurrentLocationInfo;->nearbyUsers:I

    xor-int/2addr v0, v2

    mul-int/2addr v0, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_CurrentLocationInfo;->inChatRangeUsers:I

    xor-int/2addr v0, v2

    mul-int/2addr v0, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_CurrentLocationInfo;->parcelVoiceChannel:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    if-nez v2, :cond_1

    :goto_1
    xor-int/2addr v0, v1

    return v0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_CurrentLocationInfo;->parcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_CurrentLocationInfo;->parcelVoiceChannel:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->hashCode()I

    move-result v1

    goto :goto_1
.end method

.method public inChatRangeUsers()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_CurrentLocationInfo;->inChatRangeUsers:I

    return v0
.end method

.method public nearbyUsers()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_CurrentLocationInfo;->nearbyUsers:I

    return v0
.end method

.method public parcelData()Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_CurrentLocationInfo;->parcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    return-object v0
.end method

.method public parcelVoiceChannel()Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_CurrentLocationInfo;->parcelVoiceChannel:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "CurrentLocationInfo{parcelData="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_CurrentLocationInfo;->parcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "nearbyUsers="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_CurrentLocationInfo;->nearbyUsers:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "inChatRangeUsers="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_CurrentLocationInfo;->inChatRangeUsers:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "parcelVoiceChannel="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_CurrentLocationInfo;->parcelVoiceChannel:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
