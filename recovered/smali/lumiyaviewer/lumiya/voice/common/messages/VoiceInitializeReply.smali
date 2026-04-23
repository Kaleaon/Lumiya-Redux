.class public Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceInitializeReply;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessage;


# instance fields
.field public final appVersionOk:Z

.field public final errorMessage:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field public final pluginVersionCode:I


# direct methods
.method public constructor <init>(ILjava/lang/String;Z)V
    .locals 0
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceInitializeReply;->pluginVersionCode:I

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceInitializeReply;->errorMessage:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceInitializeReply;->appVersionOk:Z

    return-void
.end method

.method public constructor <init>(Landroid/os/Bundle;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string/jumbo v0, "pluginVersionCode"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceInitializeReply;->pluginVersionCode:I

    const-string/jumbo v0, "errorMessage"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceInitializeReply;->errorMessage:Ljava/lang/String;

    const-string/jumbo v0, "appVersionOk"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceInitializeReply;->appVersionOk:Z

    return-void
.end method


# virtual methods
.method public toBundle()Landroid/os/Bundle;
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceInitializeReply;->pluginVersionCode:I

    const-string/jumbo v2, "pluginVersionCode"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceInitializeReply;->errorMessage:Ljava/lang/String;

    const-string/jumbo v2, "errorMessage"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceInitializeReply;->appVersionOk:Z

    const-string/jumbo v2, "appVersionOk"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-object v0
.end method
