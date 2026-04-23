.class public Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSetAudioProperties;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessage;


# instance fields
.field public final audioDevice:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceAudioDevice;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field public final speakerVolume:F

.field public final speakerVolumeValid:Z


# direct methods
.method public constructor <init>(FZLcom/lumiyaviewer/lumiya/voice/common/model/VoiceAudioDevice;)V
    .locals 0
    .param p3    # Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceAudioDevice;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSetAudioProperties;->speakerVolume:F

    iput-boolean p2, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSetAudioProperties;->speakerVolumeValid:Z

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSetAudioProperties;->audioDevice:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceAudioDevice;

    return-void
.end method

.method public constructor <init>(Landroid/os/Bundle;)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string/jumbo v0, "speakerVolume"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSetAudioProperties;->speakerVolumeValid:Z

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSetAudioProperties;->speakerVolumeValid:Z

    if-nez v0, :cond_0

    const/high16 v0, 0x7fc00000    # Float.NaN

    :goto_0
    iput v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSetAudioProperties;->speakerVolume:F

    const-string/jumbo v0, "audioDevice"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    move-object v0, v1

    :goto_1
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSetAudioProperties;->audioDevice:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceAudioDevice;

    return-void

    :cond_0
    const-string/jumbo v0, "speakerVolume"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result v0

    goto :goto_0

    :cond_1
    :try_start_0
    const-string/jumbo v0, "audioDevice"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceAudioDevice;->valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceAudioDevice;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_1

    :catch_0
    move-exception v0

    move-object v0, v1

    goto :goto_1
.end method


# virtual methods
.method public toBundle()Landroid/os/Bundle;
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSetAudioProperties;->speakerVolumeValid:Z

    if-nez v1, :cond_0

    :goto_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSetAudioProperties;->audioDevice:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceAudioDevice;

    if-nez v1, :cond_1

    :goto_1
    return-object v0

    :cond_0
    iget v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSetAudioProperties;->speakerVolume:F

    const-string/jumbo v2, "speakerVolume"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSetAudioProperties;->audioDevice:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceAudioDevice;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceAudioDevice;->name()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "audioDevice"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method
