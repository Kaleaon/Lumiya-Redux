.class public Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLogin;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessage;


# instance fields
.field public final voiceLoginInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/os/Bundle;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;

    const-string/jumbo v1, "voiceLoginInfo"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;-><init>(Landroid/os/Bundle;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLogin;->voiceLoginInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLogin;->voiceLoginInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;

    return-void
.end method


# virtual methods
.method public toBundle()Landroid/os/Bundle;
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLogin;->voiceLoginInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->toBundle()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "voiceLoginInfo"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    return-object v0
.end method
