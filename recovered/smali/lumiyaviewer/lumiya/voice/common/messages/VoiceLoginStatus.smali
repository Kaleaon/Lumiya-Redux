.class public Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLoginStatus;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessage;


# instance fields
.field public final errorMessage:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field public final loggedIn:Z

.field public final voiceLoginInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/os/Bundle;)V
    .locals 2

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string/jumbo v1, "voiceLoginInfo"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    if-nez v1, :cond_0

    :goto_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLoginStatus;->voiceLoginInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;

    const-string/jumbo v0, "loggedIn"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLoginStatus;->loggedIn:Z

    const-string/jumbo v0, "errorMessage"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLoginStatus;->errorMessage:Ljava/lang/String;

    return-void

    :cond_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;-><init>(Landroid/os/Bundle;)V

    goto :goto_0
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;ZLjava/lang/String;)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLoginStatus;->voiceLoginInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;

    iput-boolean p2, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLoginStatus;->loggedIn:Z

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLoginStatus;->errorMessage:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public toBundle()Landroid/os/Bundle;
    .locals 4

    const/4 v0, 0x0

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLoginStatus;->voiceLoginInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;

    const-string/jumbo v3, "voiceLoginInfo"

    if-nez v2, :cond_0

    :goto_0
    invoke-virtual {v1, v3, v0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLoginStatus;->loggedIn:Z

    const-string/jumbo v2, "loggedIn"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLoginStatus;->errorMessage:Ljava/lang/String;

    const-string/jumbo v2, "errorMessage"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLoginStatus;->voiceLoginInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->toBundle()Landroid/os/Bundle;

    move-result-object v0

    goto :goto_0
.end method
