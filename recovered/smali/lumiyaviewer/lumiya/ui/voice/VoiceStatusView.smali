.class public Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;
.super Landroid/widget/FrameLayout;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView$1;
    }
.end annotation


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-voice-common-model-VoiceBluetoothStateSwitchesValues:[I

.field private static final synthetic -com-lumiyaviewer-lumiya-voice-common-model-VoiceChatInfo$VoiceChatStateSwitchesValues:[I


# instance fields
.field private activeChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private activeChatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private canConnect:Z

.field private chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private hoverEnabled:Z

.field private final onActiveSpeakerNameUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;

.field private onCallButtonListener:Landroid/view/View$OnClickListener;

.field private showActiveChatterName:Z

.field private showWhenInactive:Z

.field private speakerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private updatingAudioVolume:Z

.field voiceAnswerButton:Landroid/widget/ImageButton;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002d3
    .end annotation
.end field

.field private final voiceAudioProperties:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;",
            ">;"
        }
    .end annotation
.end field

.field voiceBluetoothButton:Landroid/widget/Button;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002dc
    .end annotation
.end field

.field private final voiceChatInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;",
            "Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;",
            ">;"
        }
    .end annotation
.end field

.field voiceLoudspeakerButton:Landroid/widget/Button;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002db
    .end annotation
.end field

.field voiceMicOffButton:Landroid/widget/ImageButton;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002d2
    .end annotation
.end field

.field voiceMicOnButton:Landroid/widget/ImageButton;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002d1
    .end annotation
.end field

.field voiceSpeakIndicatorLeft:Landroid/widget/ImageView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002d4
    .end annotation
.end field

.field voiceSpeakIndicatorRight:Landroid/widget/ImageView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002d7
    .end annotation
.end field

.field voiceSpeakerVolumeControl:Landroid/widget/SeekBar;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002da
    .end annotation
.end field

.field voiceStatusCardView:Landroid/support/v7/widget/CardView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002d0
    .end annotation
.end field

.field voiceStatusControls:Landroid/view/ViewGroup;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002d9
    .end annotation
.end field

.field voiceStatusSmallText:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002d6
    .end annotation
.end field

.field voiceStatusText:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002d5
    .end annotation
.end field

.field voiceTerminateButton:Landroid/widget/ImageButton;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002d8
    .end annotation
.end field

.field private final volumeChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->updatingAudioVolume:Z

    return v0
.end method

.method private static synthetic -getcom-lumiyaviewer-lumiya-voice-common-model-VoiceBluetoothStateSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->-com-lumiyaviewer-lumiya-voice-common-model-VoiceBluetoothStateSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->-com-lumiyaviewer-lumiya-voice-common-model-VoiceBluetoothStateSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;->values()[Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;->Active:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_4

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;->Connected:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_3

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;->Connecting:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :goto_2
    :try_start_3
    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;->Disconnected:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_1

    :goto_3
    :try_start_4
    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;->Error:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_0

    :goto_4
    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->-com-lumiyaviewer-lumiya-voice-common-model-VoiceBluetoothStateSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_4

    :catch_1
    move-exception v1

    goto :goto_3

    :catch_2
    move-exception v1

    goto :goto_2

    :catch_3
    move-exception v1

    goto :goto_1

    :catch_4
    move-exception v1

    goto :goto_0
.end method

.method private static synthetic -getcom-lumiyaviewer-lumiya-voice-common-model-VoiceChatInfo$VoiceChatStateSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->-com-lumiyaviewer-lumiya-voice-common-model-VoiceChatInfo$VoiceChatStateSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->-com-lumiyaviewer-lumiya-voice-common-model-VoiceChatInfo$VoiceChatStateSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->values()[Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->Active:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_3

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->Connecting:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_2

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->None:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_1

    :goto_2
    :try_start_3
    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->Ringing:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_0

    :goto_3
    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->-com-lumiyaviewer-lumiya-voice-common-model-VoiceChatInfo$VoiceChatStateSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_3

    :catch_1
    move-exception v1

    goto :goto_2

    :catch_2
    move-exception v1

    goto :goto_1

    :catch_3
    move-exception v1

    goto :goto_0
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 5

    const/4 v4, 0x0

    const/4 v3, 0x0

    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/voice/-$Lambda$LRu9qjGWbEJmZF4NfrRGigLGXl8$1;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/voice/-$Lambda$LRu9qjGWbEJmZF4NfrRGigLGXl8$1;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceAudioProperties:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/voice/-$Lambda$LRu9qjGWbEJmZF4NfrRGigLGXl8$2;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/voice/-$Lambda$LRu9qjGWbEJmZF4NfrRGigLGXl8$2;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceChatInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->speakerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->activeChatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->activeChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->showActiveChatterName:Z

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->showWhenInactive:Z

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->canConnect:Z

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->hoverEnabled:Z

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->onCallButtonListener:Landroid/view/View$OnClickListener;

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->updatingAudioVolume:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->volumeChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/voice/-$Lambda$LRu9qjGWbEJmZF4NfrRGigLGXl8$9;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/voice/-$Lambda$LRu9qjGWbEJmZF4NfrRGigLGXl8$9;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->onActiveSpeakerNameUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0400bb

    const/4 v2, 0x1

    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->initializeControls()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 5

    const/4 v4, 0x0

    const/4 v3, 0x0

    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/voice/-$Lambda$LRu9qjGWbEJmZF4NfrRGigLGXl8$3;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/voice/-$Lambda$LRu9qjGWbEJmZF4NfrRGigLGXl8$3;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceAudioProperties:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/voice/-$Lambda$LRu9qjGWbEJmZF4NfrRGigLGXl8$4;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/voice/-$Lambda$LRu9qjGWbEJmZF4NfrRGigLGXl8$4;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceChatInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->speakerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->activeChatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->activeChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->showActiveChatterName:Z

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->showWhenInactive:Z

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->canConnect:Z

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->hoverEnabled:Z

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->onCallButtonListener:Landroid/view/View$OnClickListener;

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->updatingAudioVolume:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->volumeChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/voice/-$Lambda$LRu9qjGWbEJmZF4NfrRGigLGXl8$10;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/voice/-$Lambda$LRu9qjGWbEJmZF4NfrRGigLGXl8$10;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->onActiveSpeakerNameUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0400bb

    const/4 v2, 0x1

    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->initializeControls()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 5

    const/4 v4, 0x0

    const/4 v3, 0x0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/voice/-$Lambda$LRu9qjGWbEJmZF4NfrRGigLGXl8$5;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/voice/-$Lambda$LRu9qjGWbEJmZF4NfrRGigLGXl8$5;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceAudioProperties:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/voice/-$Lambda$LRu9qjGWbEJmZF4NfrRGigLGXl8$6;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/voice/-$Lambda$LRu9qjGWbEJmZF4NfrRGigLGXl8$6;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceChatInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->speakerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->activeChatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->activeChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->showActiveChatterName:Z

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->showWhenInactive:Z

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->canConnect:Z

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->hoverEnabled:Z

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->onCallButtonListener:Landroid/view/View$OnClickListener;

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->updatingAudioVolume:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->volumeChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/voice/-$Lambda$LRu9qjGWbEJmZF4NfrRGigLGXl8$11;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/voice/-$Lambda$LRu9qjGWbEJmZF4NfrRGigLGXl8$11;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->onActiveSpeakerNameUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0400bb

    const/4 v2, 0x1

    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->initializeControls()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 5
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    const/4 v4, 0x0

    const/4 v3, 0x0

    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/voice/-$Lambda$LRu9qjGWbEJmZF4NfrRGigLGXl8$7;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/voice/-$Lambda$LRu9qjGWbEJmZF4NfrRGigLGXl8$7;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceAudioProperties:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/voice/-$Lambda$LRu9qjGWbEJmZF4NfrRGigLGXl8$8;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/voice/-$Lambda$LRu9qjGWbEJmZF4NfrRGigLGXl8$8;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceChatInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->speakerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->activeChatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->activeChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->showActiveChatterName:Z

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->showWhenInactive:Z

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->canConnect:Z

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->hoverEnabled:Z

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->onCallButtonListener:Landroid/view/View$OnClickListener;

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->updatingAudioVolume:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->volumeChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/voice/-$Lambda$LRu9qjGWbEJmZF4NfrRGigLGXl8$12;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/voice/-$Lambda$LRu9qjGWbEJmZF4NfrRGigLGXl8$12;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->onActiveSpeakerNameUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0400bb

    const/4 v2, 0x1

    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->initializeControls()V

    return-void
.end method

.method private initializeControls()V
    .locals 2

    invoke-static {p0}, Lbutterknife/ButterKnife;->bind(Landroid/view/View;)Lbutterknife/Unbinder;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->updateVoiceState()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceSpeakerVolumeControl:Landroid/widget/SeekBar;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->volumeChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_voice_VoiceStatusView_6407(Lcom/lumiyaviewer/lumiya/ui/render/OnHoverListenerCompat;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    instance-of v0, p1, Landroid/widget/ImageButton;

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    const/4 v0, 0x0

    return v0

    :pswitch_0
    invoke-interface {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/OnHoverListenerCompat;->onHoverEnter(Landroid/view/View;)Z

    goto :goto_0

    :pswitch_1
    invoke-interface {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/OnHoverListenerCompat;->onHoverExit(Landroid/view/View;)Z

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x9
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private onVoiceAudioProperties(Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;)V
    .locals 4

    const/4 v0, 0x0

    const-string/jumbo v1, "Voice: voice audio properties updated, bluetooth state %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;->bluetoothState:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;

    :cond_0
    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->updateVoiceState()V

    return-void
.end method

.method private onVoiceChatInfo(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->updateVoiceState()V

    return-void
.end method

.method private updateVoiceState()V
    .locals 11

    const/16 v10, 0x8

    const/4 v2, 0x1

    const/4 v5, 0x4

    const/4 v3, 0x0

    const/4 v6, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceChatInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;

    const-string/jumbo v1, "VoiceStatusView: voice state %s"

    new-array v4, v2, [Ljava/lang/Object;

    aput-object v0, v4, v3

    invoke-static {v1, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz v0, :cond_16

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->state:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    sget-object v4, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->None:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    invoke-virtual {v1, v4}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->equals(Ljava/lang/Object;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_16

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->setVisibility(I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceTerminateButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, v3}, Landroid/widget/ImageButton;->setVisibility(I)V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->state:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    sget-object v4, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->Active:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    if-ne v1, v4, :cond_8

    move v1, v2

    :goto_0
    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceMicOnButton:Landroid/widget/ImageButton;

    if-eqz v1, :cond_9

    iget-boolean v4, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->localMicActive:Z

    if-eqz v4, :cond_9

    move v4, v3

    :goto_1
    invoke-virtual {v7, v4}, Landroid/widget/ImageButton;->setVisibility(I)V

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceMicOffButton:Landroid/widget/ImageButton;

    if-eqz v1, :cond_a

    iget-boolean v1, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->localMicActive:Z

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_a

    move v1, v3

    :goto_2
    invoke-virtual {v4, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceAnswerButton:Landroid/widget/ImageButton;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->state:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    sget-object v7, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->Ringing:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    if-ne v1, v7, :cond_b

    move v1, v3

    :goto_3
    invoke-virtual {v4, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->state:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    sget-object v4, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->Active:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    if-ne v1, v4, :cond_10

    iget v1, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->numActiveSpeakers:I

    if-eqz v1, :cond_10

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceSpeakIndicatorLeft:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getVisibility()I

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceSpeakIndicatorRight:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getVisibility()I

    move-result v1

    if-eqz v1, :cond_2

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceSpeakIndicatorLeft:Landroid/widget/ImageView;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceSpeakIndicatorRight:Landroid/widget/ImageView;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceSpeakIndicatorLeft:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    instance-of v4, v1, Landroid/graphics/drawable/AnimationDrawable;

    if-eqz v4, :cond_1

    check-cast v1, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    :cond_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceSpeakIndicatorRight:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    instance-of v4, v1, Landroid/graphics/drawable/AnimationDrawable;

    if-eqz v4, :cond_2

    check-cast v1, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    :cond_2
    iget v1, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->numActiveSpeakers:I

    if-ne v1, v2, :cond_c

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->activeSpeakerID:Ljava/util/UUID;

    if-eqz v1, :cond_c

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v1, :cond_c

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->agentUUID:Ljava/util/UUID;

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->activeSpeakerID:Ljava/util/UUID;

    invoke-static {v1, v4}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v4

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->speakerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v1, :cond_d

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->speakerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-static {v4, v1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1f

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->speakerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v1

    :goto_4
    const-string/jumbo v7, "Voice: numActiveSpeakers %d, speakerName %s, activeChatterID %s (view chatterID %s)"

    new-array v5, v5, [Ljava/lang/Object;

    iget v8, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->numActiveSpeakers:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v5, v3

    aput-object v1, v5, v2

    const/4 v8, 0x2

    aput-object v4, v5, v8

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    const/4 v9, 0x3

    aput-object v8, v5, v9

    invoke-static {v7, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const-string/jumbo v7, "Voice: speakerNameRetriever %s, snr.chatterID %s"

    const/4 v5, 0x2

    new-array v8, v5, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->speakerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    aput-object v5, v8, v3

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->speakerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v5, :cond_e

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->speakerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iget-object v5, v5, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    :goto_5
    aput-object v5, v8, v2

    invoke-static {v7, v8}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz v1, :cond_f

    :goto_6
    if-nez v1, :cond_3

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->-getcom-lumiyaviewer-lumiya-voice-common-model-VoiceChatInfo$VoiceChatStateSwitchesValues()[I

    move-result-object v5

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->state:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->ordinal()I

    move-result v7

    aget v5, v5, v7

    packed-switch v5, :pswitch_data_0

    :cond_3
    :goto_7
    iget-boolean v5, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->showActiveChatterName:Z

    if-eqz v5, :cond_1d

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->activeChatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v5, :cond_13

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->activeChatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v5

    :goto_8
    if-eqz v5, :cond_14

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceStatusSmallText:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceStatusText:Landroid/widget/TextView;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceStatusSmallText:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    move-object v0, v4

    :goto_9
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->activeChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-static {v1, v0}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    const-string/jumbo v1, "Voice: new activeChatterID %s"

    new-array v4, v2, [Ljava/lang/Object;

    aput-object v0, v4, v3

    invoke-static {v1, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->activeChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v0, :cond_1a

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->speakerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->speakerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-static {v1, v0}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_6

    :cond_4
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->speakerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->speakerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    :cond_5
    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->onActiveSpeakerNameUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v5

    invoke-direct {v1, v0, v4, v5, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;Ljava/util/concurrent/Executor;Z)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->speakerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->speakerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->subscribe()V

    :cond_6
    :goto_a
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceAudioProperties:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;

    if-eqz v0, :cond_7

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceBluetoothButton:Landroid/widget/Button;

    invoke-virtual {v1}, Landroid/widget/Button;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->-getcom-lumiyaviewer-lumiya-voice-common-model-VoiceBluetoothStateSwitchesValues()[I

    move-result-object v1

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;->bluetoothState:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;->ordinal()I

    move-result v5

    aget v1, v1, v5

    packed-switch v1, :pswitch_data_1

    const v1, 0x7f0200bc

    :goto_b
    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceBluetoothButton:Landroid/widget/Button;

    aget-object v4, v4, v3

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7, v1}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v5, v4, v6, v6, v1}, Landroid/widget/Button;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceLoudspeakerButton:Landroid/widget/Button;

    invoke-virtual {v1}, Landroid/widget/Button;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceLoudspeakerButton:Landroid/widget/Button;

    aget-object v5, v1, v3

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->getContext()Landroid/content/Context;

    move-result-object v7

    iget-boolean v1, v0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;->speakerphoneOn:Z

    if-eqz v1, :cond_1b

    const v1, 0x7f020055

    :goto_c
    invoke-static {v7, v1}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v4, v5, v6, v6, v1}, Landroid/widget/Button;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->updatingAudioVolume:Z

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceSpeakerVolumeControl:Landroid/widget/SeekBar;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceSpeakerVolumeControl:Landroid/widget/SeekBar;

    invoke-virtual {v2}, Landroid/widget/SeekBar;->getMax()I

    move-result v2

    int-to-float v2, v2

    iget v0, v0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;->speakerVolume:F

    mul-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->updatingAudioVolume:Z

    :cond_7
    return-void

    :cond_8
    move v1, v3

    goto/16 :goto_0

    :cond_9
    move v4, v5

    goto/16 :goto_1

    :cond_a
    move v1, v5

    goto/16 :goto_2

    :cond_b
    move v1, v5

    goto/16 :goto_3

    :cond_c
    move-object v1, v6

    move-object v4, v6

    goto/16 :goto_4

    :cond_d
    move-object v1, v6

    goto/16 :goto_4

    :cond_e
    move-object v5, v6

    goto/16 :goto_5

    :cond_f
    iget v1, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->numActiveSpeakers:I

    if-eq v1, v2, :cond_1e

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->getContext()Landroid/content/Context;

    move-result-object v1

    new-array v5, v2, [Ljava/lang/Object;

    iget v7, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->numActiveSpeakers:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v3

    const v7, 0x7f090313

    invoke-virtual {v1, v7, v5}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_6

    :cond_10
    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->state:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    sget-object v4, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->Ringing:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    if-ne v1, v4, :cond_11

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceSpeakIndicatorLeft:Landroid/widget/ImageView;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceSpeakIndicatorRight:Landroid/widget/ImageView;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    move-object v1, v6

    move-object v4, v6

    goto/16 :goto_6

    :cond_11
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceSpeakIndicatorLeft:Landroid/widget/ImageView;

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceSpeakIndicatorRight:Landroid/widget/ImageView;

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    move-object v1, v6

    move-object v4, v6

    goto/16 :goto_6

    :pswitch_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->getContext()Landroid/content/Context;

    move-result-object v1

    const v5, 0x7f090381

    invoke-virtual {v1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_7

    :pswitch_1
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->getContext()Landroid/content/Context;

    move-result-object v1

    const v5, 0x7f090380

    invoke-virtual {v1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_7

    :pswitch_2
    iget-boolean v1, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->localMicActive:Z

    if-eqz v1, :cond_12

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->getContext()Landroid/content/Context;

    move-result-object v1

    const v5, 0x7f090382

    invoke-virtual {v1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_7

    :cond_12
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->getContext()Landroid/content/Context;

    move-result-object v1

    const v5, 0x7f090383

    invoke-virtual {v1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_7

    :cond_13
    move-object v5, v6

    goto/16 :goto_8

    :cond_14
    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceStatusSmallText:Landroid/widget/TextView;

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceStatusText:Landroid/widget/TextView;

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceStatusSmallText:Landroid/widget/TextView;

    invoke-virtual {v1, v10}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->state:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    sget-object v5, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->Active:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    if-ne v1, v5, :cond_15

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->localMicActive:Z

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceStatusSmallText:Landroid/widget/TextView;

    const v1, 0x7f090339

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceStatusSmallText:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    move-object v0, v4

    goto/16 :goto_9

    :cond_15
    move-object v0, v4

    goto/16 :goto_9

    :cond_16
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceStatusControls:Landroid/view/ViewGroup;

    invoke-virtual {v0, v10}, Landroid/view/ViewGroup;->setVisibility(I)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->showWhenInactive:Z

    if-nez v0, :cond_17

    invoke-virtual {p0, v10}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->setVisibility(I)V

    :goto_d
    move-object v0, v6

    goto/16 :goto_9

    :cond_17
    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceStatusText:Landroid/widget/TextView;

    const v1, 0x7f09037d

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->canConnect:Z

    if-eqz v0, :cond_19

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceStatusSmallText:Landroid/widget/TextView;

    const v1, 0x7f090384

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceStatusSmallText:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_e
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceSpeakIndicatorLeft:Landroid/widget/ImageView;

    invoke-virtual {v0, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceSpeakIndicatorRight:Landroid/widget/ImageView;

    invoke-virtual {v0, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceTerminateButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, v5}, Landroid/widget/ImageButton;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceMicOnButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, v5}, Landroid/widget/ImageButton;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceMicOffButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, v5}, Landroid/widget/ImageButton;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceAnswerButton:Landroid/widget/ImageButton;

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->canConnect:Z

    if-eqz v1, :cond_18

    move v5, v3

    :cond_18
    invoke-virtual {v0, v5}, Landroid/widget/ImageButton;->setVisibility(I)V

    goto :goto_d

    :cond_19
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceStatusSmallText:Landroid/widget/TextView;

    invoke-virtual {v0, v10}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_e

    :cond_1a
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->speakerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->speakerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    iput-object v6, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->speakerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    goto/16 :goto_a

    :pswitch_3
    const v1, 0x7f020055

    goto/16 :goto_b

    :pswitch_4
    const v1, 0x7f020166

    goto/16 :goto_b

    :cond_1b
    const v1, 0x7f0200bc

    goto/16 :goto_c

    :cond_1c
    move-object v0, v4

    goto/16 :goto_9

    :cond_1d
    move-object v5, v6

    goto/16 :goto_8

    :cond_1e
    move-object v1, v6

    goto/16 :goto_6

    :cond_1f
    move-object v1, v6

    goto/16 :goto_4

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_ui_voice_VoiceStatusView-mthref-0(Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->onVoiceAudioProperties(Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_voice_VoiceStatusView-mthref-1(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->onVoiceChatInfo(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;)V

    return-void
.end method

.method public disableMic()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceChatInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->state:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->Active:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    if-ne v0, v1, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getServiceInstance()Lcom/lumiyaviewer/lumiya/GridConnectionService;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->enableVoiceMic(Z)V

    :cond_0
    return-void
.end method

.method public enableHover(Lcom/lumiyaviewer/lumiya/ui/render/OnHoverListenerCompat;)V
    .locals 10

    const/4 v6, 0x1

    const/4 v1, 0x0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v0, v2, :cond_2

    iput-boolean v6, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->hoverEnabled:Z

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/voice/-$Lambda$LRu9qjGWbEJmZF4NfrRGigLGXl8;

    invoke-direct {v2, p1}, Lcom/lumiyaviewer/lumiya/ui/voice/-$Lambda$LRu9qjGWbEJmZF4NfrRGigLGXl8;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    const/high16 v3, 0x41600000    # 14.0f

    invoke-static {v6, v3, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v3, v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->getContext()Landroid/content/Context;

    move-result-object v0

    new-array v4, v6, [I

    const v5, 0x7f010059

    aput v5, v4, v1

    invoke-virtual {v0, v4}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v4

    const/4 v0, 0x4

    new-array v5, v0, [Landroid/widget/ImageButton;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceAnswerButton:Landroid/widget/ImageButton;

    aput-object v0, v5, v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceTerminateButton:Landroid/widget/ImageButton;

    aput-object v0, v5, v6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceMicOnButton:Landroid/widget/ImageButton;

    const/4 v6, 0x2

    aput-object v0, v5, v6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceMicOffButton:Landroid/widget/ImageButton;

    const/4 v6, 0x3

    aput-object v0, v5, v6

    array-length v6, v5

    move v0, v1

    :goto_0
    if-ge v0, v6, :cond_1

    aget-object v7, v5, v0

    invoke-virtual {v7, v2}, Landroid/widget/ImageButton;->setOnHoverListener(Landroid/view/View$OnHoverListener;)V

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceMicOnButton:Landroid/widget/ImageButton;

    if-ne v7, v8, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->getContext()Landroid/content/Context;

    move-result-object v8

    const v9, 0x7f02006c

    invoke-virtual {v8, v9}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/ImageButton;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :goto_1
    invoke-virtual {v7, v3, v3, v3, v3}, Landroid/widget/ImageButton;->setPadding(IIII)V

    const/high16 v8, 0x3f000000    # 0.5f

    invoke-virtual {v7, v8}, Landroid/widget/ImageButton;->setAlpha(F)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {v4, v1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/ImageButton;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_1

    :cond_1
    invoke-virtual {v4}, Landroid/content/res/TypedArray;->recycle()V

    :cond_2
    return-void
.end method

.method public hideBackground()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceStatusCardView:Landroid/support/v7/widget/CardView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/CardView;->setCardBackgroundColor(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceStatusCardView:Landroid/support/v7/widget/CardView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/CardView;->setCardElevation(F)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_voice_VoiceStatusView_24065(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V
    .locals 4

    const-string/jumbo v0, "Voice: chatter name updated: %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->updateVoiceState()V

    return-void
.end method

.method public onLoudspeakerButton()V
    .locals 5
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f1002db
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceAudioProperties:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getServiceInstance()Lcom/lumiyaviewer/lumiya/GridConnectionService;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getVoicePluginServiceConnection()Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    move-result-object v1

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSetAudioProperties;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;->speakerphoneOn:Z

    if-eqz v0, :cond_1

    sget-object v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceAudioDevice;->Default:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceAudioDevice;

    :goto_0
    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4, v0}, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSetAudioProperties;-><init>(FZLcom/lumiyaviewer/lumiya/voice/common/model/VoiceAudioDevice;)V

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->setVoiceAudioProperties(Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSetAudioProperties;)V

    :cond_0
    return-void

    :cond_1
    sget-object v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceAudioDevice;->Loudspeaker:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceAudioDevice;

    goto :goto_0
.end method

.method public onVoiceAnswerButton()V
    .locals 2
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f1002d3
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceChatInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->onCallButtonListener:Landroid/view/View$OnClickListener;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v1, :cond_0

    if-nez v0, :cond_3

    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->onCallButtonListener:Landroid/view/View$OnClickListener;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceAnswerButton:Landroid/widget/ImageButton;

    invoke-interface {v0, v1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getServiceInstance()Lcom/lumiyaviewer/lumiya/GridConnectionService;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->acceptVoiceCall(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    :cond_2
    return-void

    :cond_3
    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->state:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->None:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    if-ne v0, v1, :cond_1

    goto :goto_0
.end method

.method public onVoiceBluetoothButton()V
    .locals 5
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f1002dc
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceAudioProperties:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getServiceInstance()Lcom/lumiyaviewer/lumiya/GridConnectionService;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getVoicePluginServiceConnection()Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    move-result-object v1

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSetAudioProperties;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;->bluetoothState:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;

    sget-object v3, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;->Active:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;

    if-ne v0, v3, :cond_1

    sget-object v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceAudioDevice;->Default:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceAudioDevice;

    :goto_0
    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4, v0}, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSetAudioProperties;-><init>(FZLcom/lumiyaviewer/lumiya/voice/common/model/VoiceAudioDevice;)V

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->setVoiceAudioProperties(Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSetAudioProperties;)V

    :cond_0
    return-void

    :cond_1
    sget-object v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceAudioDevice;->Bluetooth:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceAudioDevice;

    goto :goto_0
.end method

.method public onVoiceMicOffButton()V
    .locals 2
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f1002d2
        }
    .end annotation

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getServiceInstance()Lcom/lumiyaviewer/lumiya/GridConnectionService;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->enableVoiceMic(Z)V

    :cond_0
    return-void
.end method

.method public onVoiceMicOnButton()V
    .locals 2
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f1002d1
        }
    .end annotation

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getServiceInstance()Lcom/lumiyaviewer/lumiya/GridConnectionService;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->enableVoiceMic(Z)V

    :cond_0
    return-void
.end method

.method public onVoiceStatusCardClick()V
    .locals 2
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f1002d0
        }
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceStatusControls:Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceStatusControls:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceStatusControls:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f05000e

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceStatusControls:Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->startAnimation(Landroid/view/animation/Animation;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceStatusControls:Landroid/view/ViewGroup;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    goto :goto_0
.end method

.method public onVoiceTerminateButton()V
    .locals 2
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f1002d8
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getServiceInstance()Lcom/lumiyaviewer/lumiya/GridConnectionService;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->terminateVoiceCall(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    :cond_0
    return-void
.end method

.method public setCanConnect(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->canConnect:Z

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->updateVoiceState()V

    return-void
.end method

.method public setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 6
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v5, 0x0

    const/4 v4, 0x0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceAudioProperties:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getVoiceAudioProperties()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceChatInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getVoiceChatInfo()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    invoke-virtual {v1, v0, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->activeChatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->activeChatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-static {v0, p1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->activeChatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->activeChatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    :cond_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->showActiveChatterName:Z

    if-eqz v0, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->onActiveSpeakerNameUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v2

    invoke-direct {v0, p1, v1, v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;Ljava/util/concurrent/Executor;Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->activeChatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->activeChatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->subscribe()V

    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->updateVoiceState()V

    return-void

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceAudioProperties:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceChatInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->speakerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->speakerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->speakerNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->activeChatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->activeChatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->activeChatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    :cond_4
    invoke-static {}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getServiceInstance()Lcom/lumiyaviewer/lumiya/GridConnectionService;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0, v5}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->enableVoiceMic(Z)V

    goto :goto_0
.end method

.method public setLightTheme()V
    .locals 2

    const/4 v1, -0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceStatusText:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceStatusSmallText:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceAnswerButton:Landroid/widget/ImageButton;

    const v1, 0x7f0200ba

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceMicOnButton:Landroid/widget/ImageButton;

    const v1, 0x7f0200ad

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceMicOffButton:Landroid/widget/ImageButton;

    const v1, 0x7f0200af

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceTerminateButton:Landroid/widget/ImageButton;

    const v1, 0x7f0200e8

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    return-void
.end method

.method public setOnCallButtonListener(Landroid/view/View$OnClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->onCallButtonListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method public setShowActiveChatterName(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->showActiveChatterName:Z

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->updateVoiceState()V

    return-void
.end method

.method public setShowWhenInactive(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->showWhenInactive:Z

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->updateVoiceState()V

    return-void
.end method
