.class public Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessage;


# instance fields
.field public final bluetoothState:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final speakerVolume:F

.field public final speakerphoneOn:Z


# direct methods
.method public constructor <init>(FZLcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;)V
    .locals 0
    .param p3    # Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;->speakerVolume:F

    iput-boolean p2, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;->speakerphoneOn:Z

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;->bluetoothState:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;

    return-void
.end method

.method public constructor <init>(Landroid/os/Bundle;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string/jumbo v0, "speakerVolume"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;->speakerVolume:F

    const-string/jumbo v0, "speakerphoneOn"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;->speakerphoneOn:Z

    :try_start_0
    const-string/jumbo v0, "bluetoothState"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;->valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;->bluetoothState:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;

    return-void

    :catch_0
    move-exception v0

    sget-object v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;->Error:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;

    goto :goto_0
.end method


# virtual methods
.method public toBundle()Landroid/os/Bundle;
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;->speakerVolume:F

    const-string/jumbo v2, "speakerVolume"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;->speakerphoneOn:Z

    const-string/jumbo v2, "speakerphoneOn"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;->bluetoothState:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;->name()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "bluetoothState"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method
