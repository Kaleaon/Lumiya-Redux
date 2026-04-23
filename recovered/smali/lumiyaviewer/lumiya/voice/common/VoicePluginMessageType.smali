.class public final enum Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

.field public static final VOICE_PLUGIN_MESSAGE:I = 0xc8

.field public static final enum VoiceAcceptCall:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

.field public static final enum VoiceAudioProperties:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

.field public static final enum VoiceChannelClosed:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

.field public static final enum VoiceChannelStatus:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

.field public static final enum VoiceConnectChannel:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

.field public static final enum VoiceEnableMic:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

.field public static final enum VoiceInitialize:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

.field public static final enum VoiceInitializeReply:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

.field public static final enum VoiceLogin:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

.field public static final enum VoiceLoginStatus:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

.field public static final enum VoiceLogout:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

.field public static final enum VoiceRejectCall:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

.field public static final enum VoiceRinging:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

.field public static final enum VoiceSet3DPosition:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

.field public static final enum VoiceSetAudioProperties:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

.field public static final enum VoiceTerminateCall:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    const-string/jumbo v1, "VoiceInitialize"

    invoke-direct {v0, v1, v3}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceInitialize:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    const-string/jumbo v1, "VoiceInitializeReply"

    invoke-direct {v0, v1, v4}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceInitializeReply:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    const-string/jumbo v1, "VoiceLogin"

    invoke-direct {v0, v1, v5}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceLogin:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    const-string/jumbo v1, "VoiceLogout"

    invoke-direct {v0, v1, v6}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceLogout:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    const-string/jumbo v1, "VoiceConnectChannel"

    invoke-direct {v0, v1, v7}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceConnectChannel:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    const-string/jumbo v1, "VoiceLoginStatus"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceLoginStatus:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    const-string/jumbo v1, "VoiceChannelStatus"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceChannelStatus:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    const-string/jumbo v1, "VoiceSet3DPosition"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceSet3DPosition:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    const-string/jumbo v1, "VoiceRinging"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceRinging:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    const-string/jumbo v1, "VoiceAcceptCall"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceAcceptCall:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    const-string/jumbo v1, "VoiceRejectCall"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceRejectCall:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    const-string/jumbo v1, "VoiceChannelClosed"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceChannelClosed:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    const-string/jumbo v1, "VoiceTerminateCall"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceTerminateCall:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    const-string/jumbo v1, "VoiceEnableMic"

    const/16 v2, 0xd

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceEnableMic:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    const-string/jumbo v1, "VoiceSetAudioProperties"

    const/16 v2, 0xe

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceSetAudioProperties:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    const-string/jumbo v1, "VoiceAudioProperties"

    const/16 v2, 0xf

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceAudioProperties:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    const/16 v0, 0x10

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceInitialize:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceInitializeReply:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceLogin:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceLogout:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceConnectChannel:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    aput-object v1, v0, v7

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceLoginStatus:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceChannelStatus:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceSet3DPosition:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceRinging:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceAcceptCall:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceRejectCall:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    const/16 v2, 0xa

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceChannelClosed:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    const/16 v2, 0xb

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceTerminateCall:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    const/16 v2, 0xc

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceEnableMic:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    const/16 v2, 0xd

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceSetAudioProperties:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    const/16 v2, 0xe

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceAudioProperties:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    const/16 v2, 0xf

    aput-object v1, v0, v2

    sput-object v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->$VALUES:[Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->$VALUES:[Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    return-object v0
.end method
