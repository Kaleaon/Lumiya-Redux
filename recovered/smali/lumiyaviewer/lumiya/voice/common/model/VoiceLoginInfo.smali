.class public Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;
.super Ljava/lang/Object;


# instance fields
.field public final agentUUID:Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final password:Ljava/lang/String;

.field public final userName:Ljava/lang/String;

.field public final voiceAccountServerName:Ljava/lang/String;

.field public final voiceSipUriHostname:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/os/Bundle;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string/jumbo v0, "voiceSipUriHostname"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->voiceSipUriHostname:Ljava/lang/String;

    const-string/jumbo v0, "voiceAccountServerName"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->voiceAccountServerName:Ljava/lang/String;

    const-string/jumbo v0, "agentUUID"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->agentUUID:Ljava/util/UUID;

    const-string/jumbo v0, "userName"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->userName:Ljava/lang/String;

    const-string/jumbo v0, "password"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->password:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p3    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->voiceSipUriHostname:Ljava/lang/String;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->voiceAccountServerName:Ljava/lang/String;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->agentUUID:Ljava/util/UUID;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->userName:Ljava/lang/String;

    iput-object p5, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->password:Ljava/lang/String;

    return-void
.end method


# virtual methods
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

    check-cast p1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->voiceSipUriHostname:Ljava/lang/String;

    if-nez v2, :cond_6

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->voiceSipUriHostname:Ljava/lang/String;

    if-nez v2, :cond_7

    :cond_3
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->voiceAccountServerName:Ljava/lang/String;

    if-nez v2, :cond_8

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->voiceAccountServerName:Ljava/lang/String;

    if-nez v2, :cond_9

    :cond_4
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->agentUUID:Ljava/util/UUID;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->agentUUID:Ljava/util/UUID;

    invoke-virtual {v2, v3}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->userName:Ljava/lang/String;

    if-nez v2, :cond_b

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->userName:Ljava/lang/String;

    if-nez v2, :cond_c

    :cond_5
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->password:Ljava/lang/String;

    if-nez v2, :cond_d

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->password:Ljava/lang/String;

    if-eqz v2, :cond_e

    :goto_0
    return v0

    :cond_6
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->voiceSipUriHostname:Ljava/lang/String;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->voiceSipUriHostname:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    :cond_7
    return v0

    :cond_8
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->voiceAccountServerName:Ljava/lang/String;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->voiceAccountServerName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    :cond_9
    return v0

    :cond_a
    return v0

    :cond_b
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->userName:Ljava/lang/String;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->userName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    :cond_c
    return v0

    :cond_d
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->password:Ljava/lang/String;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->password:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    :cond_e
    move v0, v1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 3

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->voiceSipUriHostname:Ljava/lang/String;

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->voiceAccountServerName:Ljava/lang/String;

    if-nez v0, :cond_1

    move v0, v1

    :goto_1
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->agentUUID:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->userName:Ljava/lang/String;

    if-nez v0, :cond_2

    move v0, v1

    :goto_2
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->password:Ljava/lang/String;

    if-nez v2, :cond_3

    :goto_3
    add-int/2addr v0, v1

    return v0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->voiceSipUriHostname:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->voiceAccountServerName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->userName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_2

    :cond_3
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->password:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_3
.end method

.method public toBundle()Landroid/os/Bundle;
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->voiceSipUriHostname:Ljava/lang/String;

    const-string/jumbo v2, "voiceSipUriHostname"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->voiceAccountServerName:Ljava/lang/String;

    const-string/jumbo v2, "voiceAccountServerName"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->agentUUID:Ljava/util/UUID;

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "agentUUID"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->userName:Ljava/lang/String;

    const-string/jumbo v2, "userName"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->password:Ljava/lang/String;

    const-string/jumbo v2, "password"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method
