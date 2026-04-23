.class public Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;
.super Ljava/lang/Object;


# instance fields
.field public final isConference:Z

.field public final isSpatial:Z

.field public final voiceChannelURI:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/net/Uri;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string/jumbo v0, "voiceChannelURI"

    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->voiceChannelURI:Ljava/lang/String;

    const-string/jumbo v0, "isSpatial"

    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "true"

    invoke-static {v0, v1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->isSpatial:Z

    const-string/jumbo v0, "isConference"

    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "true"

    invoke-static {v0, v1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->isConference:Z

    return-void
.end method

.method public constructor <init>(Landroid/os/Bundle;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string/jumbo v0, "voiceChannelURI"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->voiceChannelURI:Ljava/lang/String;

    const-string/jumbo v0, "isSpatial"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->isSpatial:Z

    const-string/jumbo v0, "isConference"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->isConference:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ZZ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->voiceChannelURI:Ljava/lang/String;

    iput-boolean p2, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->isSpatial:Z

    iput-boolean p3, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->isConference:Z

    return-void
.end method

.method public constructor <init>(Ljava/util/UUID;Ljava/lang/String;)V
    .locals 5
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v4, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    new-array v0, v0, [[B

    invoke-virtual {p1}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/google/common/primitives/Longs;->toByteArray(J)[B

    move-result-object v1

    aput-object v1, v0, v4

    invoke-virtual {p1}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/google/common/primitives/Longs;->toByteArray(J)[B

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/google/common/primitives/Bytes;->concat([[B)[B

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v0, v4}, Lcom/lumiyaviewer/lumiya/base64/Base64;->encodeToString([BZ)Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0x2b

    const/16 v3, 0x2d

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0x2f

    const/16 v3, 0x5f

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "sip:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "@"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->voiceChannelURI:Ljava/lang/String;

    iput-boolean v4, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->isSpatial:Z

    iput-boolean v4, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->isConference:Z

    return-void
.end method

.method public static agentUUIDFromURI(Ljava/lang/String;)Ljava/util/UUID;
    .locals 7
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v6, 0x0

    const/16 v5, 0x10

    const/16 v4, 0x8

    const/4 v2, -0x1

    const/4 v3, 0x0

    invoke-static {p0}, Lcom/google/common/base/Strings;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ne v1, v2, :cond_1

    :goto_0
    const/16 v1, 0x40

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ne v1, v2, :cond_2

    :goto_1
    const-string/jumbo v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3

    :goto_2
    const-string/jumbo v1, "-"

    const-string/jumbo v2, "+"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "_"

    const-string/jumbo v2, "/"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/base64/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v0

    if-nez v0, :cond_4

    :cond_0
    return-object v6

    :cond_1
    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_2
    invoke-virtual {v0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_3
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    :cond_4
    array-length v1, v0

    if-ne v1, v5, :cond_0

    invoke-static {v0, v3, v4}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v1

    invoke-static {v1}, Lcom/google/common/primitives/Longs;->fromByteArray([B)J

    move-result-wide v2

    invoke-static {v0, v4, v5}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/primitives/Longs;->fromByteArray([B)J

    move-result-wide v0

    new-instance v4, Ljava/util/UUID;

    invoke-direct {v4, v2, v3, v0, v1}, Ljava/util/UUID;-><init>(JJ)V

    return-object v4
.end method


# virtual methods
.method public appendToUri(Landroid/net/Uri$Builder;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->voiceChannelURI:Ljava/lang/String;

    const-string/jumbo v1, "voiceChannelURI"

    invoke-virtual {p1, v1, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->isSpatial:Z

    const-string/jumbo v1, "isSpatial"

    if-nez v0, :cond_0

    const-string/jumbo v0, "false"

    :goto_0
    invoke-virtual {p1, v1, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->isConference:Z

    const-string/jumbo v1, "isConference"

    if-nez v0, :cond_1

    const-string/jumbo v0, "false"

    :goto_1
    invoke-virtual {p1, v1, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    return-void

    :cond_0
    const-string/jumbo v0, "true"

    goto :goto_0

    :cond_1
    const-string/jumbo v0, "true"

    goto :goto_1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v1, 0x1

    const/4 v0, 0x0

    if-eq p0, p1, :cond_1

    if-nez p1, :cond_2

    :cond_0
    return v0

    :cond_1
    return v1

    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_0

    check-cast p1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->isSpatial:Z

    iget-boolean v3, p1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->isSpatial:Z

    if-ne v2, v3, :cond_3

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->isConference:Z

    iget-boolean v3, p1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->isConference:Z

    if-ne v2, v3, :cond_4

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->voiceChannelURI:Ljava/lang/String;

    if-nez v2, :cond_5

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->voiceChannelURI:Ljava/lang/String;

    if-eqz v2, :cond_6

    :goto_0
    return v0

    :cond_3
    return v0

    :cond_4
    return v0

    :cond_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->voiceChannelURI:Ljava/lang/String;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->voiceChannelURI:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    :cond_6
    move v0, v1

    goto :goto_0
.end method

.method public getAgentUUID()Ljava/util/UUID;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->voiceChannelURI:Ljava/lang/String;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->agentUUIDFromURI(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    const/4 v2, 0x1

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->voiceChannelURI:Ljava/lang/String;

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    mul-int/lit8 v3, v0, 0x1f

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->isSpatial:Z

    if-nez v0, :cond_1

    move v0, v1

    :goto_1
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->isConference:Z

    if-nez v3, :cond_2

    :goto_2
    add-int/2addr v0, v1

    return v0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->voiceChannelURI:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_1
    move v0, v2

    goto :goto_1

    :cond_2
    move v1, v2

    goto :goto_2
.end method

.method public toBundle()Landroid/os/Bundle;
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->voiceChannelURI:Ljava/lang/String;

    const-string/jumbo v2, "voiceChannelURI"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->isSpatial:Z

    const-string/jumbo v2, "isSpatial"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->isConference:Z

    const-string/jumbo v2, "isConference"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-object v0
.end method
