.class public Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessage;


# instance fields
.field public final channelInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final chatInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final errorMessage:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/os/Bundle;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    const-string/jumbo v1, "channelInfo"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;-><init>(Landroid/os/Bundle;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;->channelInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    const-string/jumbo v0, "chatInfo"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->create(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;->chatInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;

    const-string/jumbo v0, "errorMessage"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;->errorMessage:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;Ljava/lang/String;)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;->channelInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;->chatInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;->errorMessage:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public toBundle()Landroid/os/Bundle;
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;->channelInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->toBundle()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "channelInfo"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;->chatInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->toBundle()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "chatInfo"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;->errorMessage:Ljava/lang/String;

    const-string/jumbo v2, "errorMessage"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method
