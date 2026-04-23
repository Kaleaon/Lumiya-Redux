.class public Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessenger;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static sendMessage(Landroid/os/Messenger;Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessage;Landroid/os/Messenger;)Z
    .locals 5

    const/4 v4, 0x0

    const/4 v3, 0x0

    if-nez p0, :cond_0

    return v3

    :cond_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->toString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "messageType"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p2}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessage;->toBundle()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "message"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    const/16 v1, 0xc8

    invoke-static {v4, v1, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    iput-object p3, v0, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    :try_start_0
    invoke-virtual {p0, v0}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x1

    return v0

    :catch_0
    move-exception v0

    return v3
.end method
