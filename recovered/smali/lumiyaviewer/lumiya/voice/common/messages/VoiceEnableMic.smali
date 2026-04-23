.class public Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceEnableMic;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessage;


# instance fields
.field public final enableMic:Z


# direct methods
.method public constructor <init>(Landroid/os/Bundle;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string/jumbo v0, "enableMic"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceEnableMic;->enableMic:Z

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceEnableMic;->enableMic:Z

    return-void
.end method


# virtual methods
.method public toBundle()Landroid/os/Bundle;
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceEnableMic;->enableMic:Z

    const-string/jumbo v2, "enableMic"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-object v0
.end method
