.class Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection$1;
.super Landroid/os/Handler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-voice-common-VoicePluginMessageTypeSwitchesValues:[I


# instance fields
.field final synthetic $SWITCH_TABLE$com$lumiyaviewer$lumiya$voice$common$VoicePluginMessageType:[I

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-voice-common-VoicePluginMessageTypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection$1;->-com-lumiyaviewer-lumiya-voice-common-VoicePluginMessageTypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection$1;->-com-lumiyaviewer-lumiya-voice-common-VoicePluginMessageTypeSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->values()[Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceAcceptCall:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_f

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceAudioProperties:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_e

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceChannelClosed:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_d

    :goto_2
    :try_start_3
    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceChannelStatus:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_c

    :goto_3
    :try_start_4
    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceConnectChannel:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_b

    :goto_4
    :try_start_5
    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceEnableMic:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_a

    :goto_5
    :try_start_6
    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceInitialize:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_9

    :goto_6
    :try_start_7
    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceInitializeReply:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_8

    :goto_7
    :try_start_8
    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceLogin:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->ordinal()I

    move-result v1

    const/16 v2, 0xb

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_7

    :goto_8
    :try_start_9
    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceLoginStatus:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_6

    :goto_9
    :try_start_a
    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceLogout:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->ordinal()I

    move-result v1

    const/16 v2, 0xc

    aput v2, v0, v1
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_5

    :goto_a
    :try_start_b
    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceRejectCall:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->ordinal()I

    move-result v1

    const/16 v2, 0xd

    aput v2, v0, v1
    :try_end_b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_b .. :try_end_b} :catch_4

    :goto_b
    :try_start_c
    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceRinging:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_c} :catch_3

    :goto_c
    :try_start_d
    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceSet3DPosition:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->ordinal()I

    move-result v1

    const/16 v2, 0xe

    aput v2, v0, v1
    :try_end_d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_d .. :try_end_d} :catch_2

    :goto_d
    :try_start_e
    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceSetAudioProperties:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->ordinal()I

    move-result v1

    const/16 v2, 0xf

    aput v2, v0, v1
    :try_end_e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_e .. :try_end_e} :catch_1

    :goto_e
    :try_start_f
    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceTerminateCall:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->ordinal()I

    move-result v1

    const/16 v2, 0x10

    aput v2, v0, v1
    :try_end_f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_f .. :try_end_f} :catch_0

    :goto_f
    sput-object v0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection$1;->-com-lumiyaviewer-lumiya-voice-common-VoicePluginMessageTypeSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_f

    :catch_1
    move-exception v1

    goto :goto_e

    :catch_2
    move-exception v1

    goto :goto_d

    :catch_3
    move-exception v1

    goto :goto_c

    :catch_4
    move-exception v1

    goto :goto_b

    :catch_5
    move-exception v1

    goto :goto_a

    :catch_6
    move-exception v1

    goto :goto_9

    :catch_7
    move-exception v1

    goto :goto_8

    :catch_8
    move-exception v1

    goto :goto_7

    :catch_9
    move-exception v1

    goto :goto_6

    :catch_a
    move-exception v1

    goto :goto_5

    :catch_b
    move-exception v1

    goto/16 :goto_4

    :catch_c
    move-exception v1

    goto/16 :goto_3

    :catch_d
    move-exception v1

    goto/16 :goto_2

    :catch_e
    move-exception v1

    goto/16 :goto_1

    :catch_f
    move-exception v1

    goto/16 :goto_0
.end method

.method constructor <init>(Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection$1;->this$0:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Landroid/os/Bundle;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/Bundle;

    const-string/jumbo v1, "message"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v1, "messageType"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    :try_start_0
    const-string/jumbo v1, "messageType"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    move-result-object v1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection$1;->-getcom-lumiyaviewer-lumiya-voice-common-VoicePluginMessageTypeSwitchesValues()[I

    move-result-object v2

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->ordinal()I

    move-result v1

    aget v1, v2, v1

    packed-switch v1, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection$1;->this$0:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    new-instance v2, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceInitializeReply;

    const-string/jumbo v3, "message"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    invoke-direct {v2, v0}, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceInitializeReply;-><init>(Landroid/os/Bundle;)V

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->-wrap2(Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceInitializeReply;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0

    :pswitch_1
    :try_start_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection$1;->this$0:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    new-instance v2, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLoginStatus;

    const-string/jumbo v3, "message"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    invoke-direct {v2, v0}, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLoginStatus;-><init>(Landroid/os/Bundle;)V

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->-wrap3(Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLoginStatus;)V

    goto :goto_0

    :pswitch_2
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection$1;->this$0:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    new-instance v2, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;

    const-string/jumbo v3, "message"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    invoke-direct {v2, v0}, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;-><init>(Landroid/os/Bundle;)V

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->-wrap1(Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;)V

    goto :goto_0

    :pswitch_3
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection$1;->this$0:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    new-instance v2, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;

    const-string/jumbo v3, "message"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    invoke-direct {v2, v0}, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;-><init>(Landroid/os/Bundle;)V

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->-wrap4(Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;)V

    goto :goto_0

    :pswitch_4
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection$1;->this$0:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    new-instance v2, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;

    const-string/jumbo v3, "message"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    invoke-direct {v2, v0}, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;-><init>(Landroid/os/Bundle;)V

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->-wrap0(Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_3
    .end packed-switch
.end method
