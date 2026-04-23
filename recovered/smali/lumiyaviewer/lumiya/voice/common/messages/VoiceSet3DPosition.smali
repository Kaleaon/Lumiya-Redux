.class public Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSet3DPosition;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessage;


# instance fields
.field public final listenerPosition:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final speakerPosition:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final voiceChannelInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/os/Bundle;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    const-string/jumbo v1, "voiceChannelInfo"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;-><init>(Landroid/os/Bundle;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSet3DPosition;->voiceChannelInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;

    const-string/jumbo v1, "speakerPosition"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;-><init>(Landroid/os/Bundle;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSet3DPosition;->speakerPosition:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;

    const-string/jumbo v1, "listenerPosition"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;-><init>(Landroid/os/Bundle;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSet3DPosition;->listenerPosition:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSet3DPosition;->voiceChannelInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSet3DPosition;->speakerPosition:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSet3DPosition;->listenerPosition:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;

    return-void
.end method


# virtual methods
.method public toBundle()Landroid/os/Bundle;
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSet3DPosition;->voiceChannelInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->toBundle()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "voiceChannelInfo"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSet3DPosition;->speakerPosition:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;->toBundle()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "speakerPosition"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSet3DPosition;->listenerPosition:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;->toBundle()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "listenerPosition"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    return-object v0
.end method
