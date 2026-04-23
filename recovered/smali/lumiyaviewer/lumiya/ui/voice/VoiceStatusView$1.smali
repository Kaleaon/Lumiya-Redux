.class Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 5

    const/4 v4, 0x0

    if-eqz p3, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->-get0(Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    int-to-float v0, p2

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getMax()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getServiceInstance()Lcom/lumiyaviewer/lumiya/GridConnectionService;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getVoicePluginServiceConnection()Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    move-result-object v1

    if-eqz v1, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSetAudioProperties;

    const/4 v3, 0x1

    invoke-direct {v2, v0, v3, v4}, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSetAudioProperties;-><init>(FZLcom/lumiyaviewer/lumiya/voice/common/model/VoiceAudioDevice;)V

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->setVoiceAudioProperties(Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSetAudioProperties;)V

    :cond_0
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method
