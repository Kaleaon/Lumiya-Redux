.class public Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessage;


# instance fields
.field public final agentUUID:Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field public final sessionHandle:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final voiceChannelInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;


# direct methods
.method public constructor <init>(Landroid/net/Uri;)V
    .locals 2

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string/jumbo v1, "sessionHandle"

    invoke-virtual {p1, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->sessionHandle:Ljava/lang/String;

    const-string/jumbo v1, "agentUUID"

    invoke-virtual {p1, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    :goto_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->agentUUID:Ljava/util/UUID;

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    invoke-direct {v0, p1}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;-><init>(Landroid/net/Uri;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->voiceChannelInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    return-void

    :cond_0
    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    goto :goto_0
.end method

.method public constructor <init>(Landroid/os/Bundle;)V
    .locals 3

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string/jumbo v1, "sessionHandle"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->sessionHandle:Ljava/lang/String;

    new-instance v1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    const-string/jumbo v2, "voiceChannelInfo"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;-><init>(Landroid/os/Bundle;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->voiceChannelInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    const-string/jumbo v1, "agentUUID"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    :goto_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->agentUUID:Ljava/util/UUID;

    return-void

    :cond_0
    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;Ljava/util/UUID;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->sessionHandle:Ljava/lang/String;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->voiceChannelInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->agentUUID:Ljava/util/UUID;

    return-void
.end method


# virtual methods
.method public toBundle()Landroid/os/Bundle;
    .locals 4

    const/4 v0, 0x0

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->sessionHandle:Ljava/lang/String;

    const-string/jumbo v3, "sessionHandle"

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->voiceChannelInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "voiceChannelInfo"

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->agentUUID:Ljava/util/UUID;

    const-string/jumbo v3, "agentUUID"

    if-nez v2, :cond_0

    :goto_0
    invoke-virtual {v1, v3, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->agentUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public toUri()Landroid/net/Uri;
    .locals 3

    new-instance v0, Landroid/net/Uri$Builder;

    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    const-string/jumbo v1, "com.lumiyaviewer.lumiya"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string/jumbo v1, "voice"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->sessionHandle:Ljava/lang/String;

    const-string/jumbo v2, "sessionHandle"

    invoke-virtual {v0, v2, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->agentUUID:Ljava/util/UUID;

    if-nez v1, :cond_0

    :goto_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->voiceChannelInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->appendToUri(Landroid/net/Uri$Builder;)V

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->agentUUID:Ljava/util/UUID;

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "agentUUID"

    invoke-virtual {v0, v2, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_0
.end method
