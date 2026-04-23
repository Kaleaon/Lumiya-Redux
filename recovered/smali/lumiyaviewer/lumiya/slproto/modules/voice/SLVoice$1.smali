.class Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest$LLSDXMLResultListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->onGroupSessionReady(Ljava/util/UUID;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;

.field final synthetic val$groupID:Ljava/util/UUID;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;Ljava/util/UUID;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice$1;->val$groupID:Ljava/util/UUID;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLLSDXMLResult(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 9

    const/4 v8, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->-get1(Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice$1;->val$groupID:Ljava/util/UUID;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getGroupChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v1

    if-nez p1, :cond_1

    :try_start_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException;

    const-string/jumbo v2, "Null result"

    invoke-direct {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->-get0(Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;)Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v2

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSystemMessageEvent;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUnknown;->getInstance()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUnknown;

    move-result-object v4

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;

    invoke-static {v5}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->-get1(Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v5

    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getContext()Landroid/content/Context;

    move-result-object v6

    const v7, 0x7f09011a

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSystemMessageEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Ljava/lang/String;)V

    invoke-virtual {v2, v1, v3, v8}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    :try_start_1
    const-string/jumbo v0, "voice_credentials"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    const-string/jumbo v2, "channel_uri"

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v2, "voice_credentials"

    invoke-virtual {p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    const-string/jumbo v3, "channel_credentials"

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->-get4(Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;)Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    move-result-object v3

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->-get2(Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->-get3(Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;)Z

    move-result v4

    if-eqz v4, :cond_0

    if-eqz v3, :cond_0

    new-instance v4, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-direct {v4, v0, v5, v6}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;-><init>(Ljava/lang/String;ZZ)V

    invoke-virtual {v3, v1, v4}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->addChannel(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceConnectChannel:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    new-instance v5, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceConnectChannel;

    invoke-direct {v5, v4, v2}, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceConnectChannel;-><init>(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;Ljava/lang/String;)V

    invoke-virtual {v3, v0, v5}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->sendMessage(Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessage;)Z
    :try_end_1
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method
