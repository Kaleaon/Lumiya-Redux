.class final synthetic Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$6;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;

.field private final synthetic -$f1:Ljava/lang/Object;

.field private final synthetic -$f2:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0()V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$6;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$6;->-$f1:Ljava/lang/Object;

    check-cast v1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLoginStatus;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$6;->-$f2:Ljava/lang/Object;

    check-cast v2, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->lambda$-com_lumiyaviewer_lumiya_slproto_modules_voice_SLVoice_14030(Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLoginStatus;Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$6;->-$f0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$6;->-$f1:Ljava/lang/Object;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$6;->-$f2:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$6;->$m$0()V

    return-void
.end method
