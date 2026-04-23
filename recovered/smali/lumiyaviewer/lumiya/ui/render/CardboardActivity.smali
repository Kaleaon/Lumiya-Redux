.class public Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;
.super Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$1;,
        Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;,
        Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$3;,
        Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$4;,
        Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$5;,
        Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$6;,
        Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;,
        Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;,
        Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;
    }
.end annotation


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-ui-render-MoveControlSwitchesValues:[I = null

.field private static final DEFAULT_FONT_SIZE_SP:I = 0x10

.field private static final LISTVIEW_SCROLL_DURATION:I = 0x1f4

.field private static final LISTVIEW_SCROLL_OFFSET:I = 0x64

.field private static final RECYCLERVIEW_SCROLL_OFFSET:I = 0x64

.field private static final VOICE_VIEW_HEIGHT_ALLOWANCE_DP:F = 60.0f

.field public static final VR_MODE_TAG:Ljava/lang/String; = "vrMode"

.field private static final controlDrawSizeFactor:F = 1.5f

.field private static final controlSizeFactorX:F = 1.0f

.field private static final controlSizeFactorY:F = 0.75f

.field private static final crosshairSize:F = 0.1f

.field private static final dialogButtonIds:[I


# instance fields
.field private activeScriptDialog:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;

.field private activeYesNoEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;

.field private final agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;",
            ">;"
        }
    .end annotation
.end field

.field private final avatarControl:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;",
            ">;"
        }
    .end annotation
.end field

.field buttonChat:Landroid/widget/ImageButton;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1000f9
    .end annotation
.end field

.field buttonMoveBackward:Landroid/widget/ImageButton;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1000fe
    .end annotation
.end field

.field buttonMoveForward:Landroid/widget/ImageButton;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1000fc
    .end annotation
.end field

.field buttonObjectChat:Landroid/widget/ImageButton;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100106
    .end annotation
.end field

.field buttonSit:Landroid/widget/ImageButton;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100105
    .end annotation
.end field

.field buttonSpeak:Landroid/widget/ImageButton;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1000f8
    .end annotation
.end field

.field buttonSpeechSend:Landroid/widget/ImageButton;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100111
    .end annotation
.end field

.field buttonStandUp:Landroid/widget/ImageButton;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100100
    .end annotation
.end field

.field buttonTouch:Landroid/widget/ImageButton;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1000f7
    .end annotation
.end field

.field buttonTouchObject:Landroid/widget/ImageButton;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100104
    .end annotation
.end field

.field buttonTurnLeft:Landroid/widget/ImageButton;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1000fd
    .end annotation
.end field

.field buttonTurnRight:Landroid/widget/ImageButton;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1000ff
    .end annotation
.end field

.field cardboardAimControls:Landroid/view/ViewGroup;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100101
    .end annotation
.end field

.field cardboardDetailsPage:Landroid/view/ViewGroup;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100113
    .end annotation
.end field

.field cardboardObjectControls:Landroid/view/ViewGroup;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100102
    .end annotation
.end field

.field cardboardPrimaryControls:Landroid/view/ViewGroup;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1000f5
    .end annotation
.end field

.field cardboardScriptDialog:Landroid/view/ViewGroup;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100112
    .end annotation
.end field

.field cardboardSpeakControls:Landroid/view/ViewGroup;
    .annotation build Lbutterknife/BindView;
        value = 0x7f10010d
    .end annotation
.end field

.field private final chatEventHandler:Ljava/lang/Object;

.field chatsOverlayLayout:Landroid/widget/LinearLayout;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1000fa
    .end annotation
.end field

.field private controller:Lcom/google/vr/sdk/controller/Controller;

.field private final controllerConnectionState:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final controllerEventListener:Lcom/google/vr/sdk/controller/Controller$EventListener;

.field private controllerManager:Lcom/google/vr/sdk/controller/ControllerManager;

.field private final controllerManagerEventListener:Lcom/google/vr/sdk/controller/ControllerManager$EventListener;

.field private volatile currentControlsPage:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final currentLocationInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;",
            ">;"
        }
    .end annotation
.end field

.field dialogQuestionText:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100274
    .end annotation
.end field

.field private dictationChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

.field private final externalTextureRef:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;",
            ">;"
        }
    .end annotation
.end field

.field private fadingTextViewLog:Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;

.field private fullscreenMode:Lcom/google/vr/cardboard/FullscreenMode;

.field private gvrView:Lcom/google/vr/sdk/base/GvrView;

.field private final handler:Landroid/os/Handler;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "HandlerLeak"
        }
    .end annotation
.end field

.field private volatile headAgentHeading:F

.field private final hitPointLock:Ljava/lang/Object;

.field private final hitPointUpdatePosted:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private hitPointValid:Z

.field private hitPointX:I

.field private hitPointY:I

.field private final hoverListener:Lcom/lumiyaviewer/lumiya/ui/render/OnHoverListenerCompat;

.field private hoveringOverButton:Landroid/view/View;

.field private hoveringPressedButton:Landroid/view/View;

.field private volatile insideControls:Z

.field private insideSince:J

.field private isResumed:Z

.field private isSpeechFinished:Z

.field private volatile isWalking:Z

.field private final keypadActive:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final keypadTurning:Lcom/google/common/util/concurrent/AtomicDouble;

.field private lastSpeechRecognitionResults:Ljava/lang/String;

.field private final locationInWindow:[I

.field moveButtonsLayout:Landroid/view/ViewGroup;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1000fb
    .end annotation
.end field

.field private moveButtonsTop:I

.field private final myAvatarState:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;",
            ">;"
        }
    .end annotation
.end field

.field private volatile neutralAgentHeading:F

.field noButton:Landroid/widget/ImageButton;
    .annotation build Lbutterknife/BindView;
        value = 0x7f10010b
    .end annotation
.end field

.field objectNameView:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100107
    .end annotation
.end field

.field private final onDialogButtonClick:Landroid/view/View$OnClickListener;

.field private final onHoverListener:Landroid/view/View$OnHoverListener;

.field private onScreenControlsLayout:Landroid/view/ViewGroup;

.field private final onVoiceCallButtonListener:Landroid/view/View$OnClickListener;

.field private final outsideTouchListeners:Lcom/google/common/collect/ImmutableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableMap",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;",
            "Landroid/view/View$OnTouchListener;",
            ">;"
        }
    .end annotation
.end field

.field private volatile ownAvatarVisible:Z

.field private pickedAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

.field private final pickedObject:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;",
            ">;"
        }
    .end annotation
.end field

.field private postedHitPointX:I

.field private postedHitPointY:I

.field private primaryButtonsViewBottom:I

.field private final recognitionListener:Landroid/speech/RecognitionListener;

.field private renderSettings:Lcom/lumiyaviewer/lumiya/ui/render/RenderSettings;

.field private renderer:Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

.field private final screenOnFlagHelper:Lcom/google/vrtoolkit/cardboard/ScreenOnFlagHelper;

.field private scrollableViewPoint:Landroid/graphics/Point;

.field private final selectedObjectProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;",
            ">;"
        }
    .end annotation
.end field

.field speakLevelIndicator:Landroid/widget/ProgressBar;
    .annotation build Lbutterknife/BindView;
        value = 0x7f10010f
    .end annotation
.end field

.field speakNowText:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f10010e
    .end annotation
.end field

.field speechRecognitionResults:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100110
    .end annotation
.end field

.field private speechRecognizer:Landroid/speech/SpeechRecognizer;

.field private speechRmsMax:F

.field private speechRmsMin:F

.field private stateHandler:Landroid/os/Handler;

.field private final stereoRenderer:Lcom/google/vr/sdk/base/GvrView$StereoRenderer;

.field private final touchActivatedButtons:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final touchRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

.field private final viewDrawPosted:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final voiceActiveChatter:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;",
            ">;"
        }
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

.field private voiceEnabled:Z

.field private final voiceLoggedIn:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field voiceStatusView:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1000f6
    .end annotation
.end field

.field private voiceViewHeightAllowance:I

.field yesButton:Landroid/widget/ImageButton;
    .annotation build Lbutterknife/BindView;
        value = 0x7f10010a
    .end annotation
.end field

.field yesNoText:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f10010c
    .end annotation
.end field


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->activeScriptDialog:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Ljava/util/concurrent/atomic/AtomicReference;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->avatarControl:Ljava/util/concurrent/atomic/AtomicReference;

    return-object v0
.end method

.method static synthetic -get10(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hitPointLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic -get11(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hitPointUpdatePosted:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method static synthetic -get12(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hitPointY:I

    return v0
.end method

.method static synthetic -get13(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hoveringOverButton:Landroid/view/View;

    return-object v0
.end method

.method static synthetic -get14(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->insideControls:Z

    return v0
.end method

.method static synthetic -get15(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->isSpeechFinished:Z

    return v0
.end method

.method static synthetic -get16(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->isWalking:Z

    return v0
.end method

.method static synthetic -get17(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->keypadActive:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method static synthetic -get18(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/google/common/util/concurrent/AtomicDouble;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->keypadTurning:Lcom/google/common/util/concurrent/AtomicDouble;

    return-object v0
.end method

.method static synthetic -get19(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->moveButtonsTop:I

    return v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/google/vr/sdk/controller/Controller;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->controller:Lcom/google/vr/sdk/controller/Controller;

    return-object v0
.end method

.method static synthetic -get20(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->neutralAgentHeading:F

    return v0
.end method

.method static synthetic -get21(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->ownAvatarVisible:Z

    return v0
.end method

.method static synthetic -get22(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Ljava/util/concurrent/atomic/AtomicReference;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->pickedObject:Ljava/util/concurrent/atomic/AtomicReference;

    return-object v0
.end method

.method static synthetic -get23(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->primaryButtonsViewBottom:I

    return v0
.end method

.method static synthetic -get24(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/lumiyaviewer/lumiya/ui/render/RenderSettings;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->renderSettings:Lcom/lumiyaviewer/lumiya/ui/render/RenderSettings;

    return-object v0
.end method

.method static synthetic -get25(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->renderer:Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    return-object v0
.end method

.method static synthetic -get26(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speechRmsMax:F

    return v0
.end method

.method static synthetic -get27(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speechRmsMin:F

    return v0
.end method

.method static synthetic -get28(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->touchRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method static synthetic -get29(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    return-object v0
.end method

.method static synthetic -get3(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->controllerConnectionState:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object v0
.end method

.method static synthetic -get30(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceViewHeightAllowance:I

    return v0
.end method

.method static synthetic -get4(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->currentControlsPage:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    return-object v0
.end method

.method static synthetic -get5()[I
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->dialogButtonIds:[I

    return-object v0
.end method

.method static synthetic -get6(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->fadingTextViewLog:Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;

    return-object v0
.end method

.method static synthetic -get7(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/google/vr/sdk/base/GvrView;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->gvrView:Lcom/google/vr/sdk/base/GvrView;

    return-object v0
.end method

.method static synthetic -get8(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic -get9(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->headAgentHeading:F

    return v0
.end method

.method private static synthetic -getcom-lumiyaviewer-lumiya-ui-render-MoveControlSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-com-lumiyaviewer-lumiya-ui-render-MoveControlSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-com-lumiyaviewer-lumiya-ui-render-MoveControlSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->values()[Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->Backward:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_3

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->Forward:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_2

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->Left:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_1

    :goto_2
    :try_start_3
    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->Right:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_0

    :goto_3
    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-com-lumiyaviewer-lumiya-ui-render-MoveControlSwitchesValues:[I

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

.method static synthetic -set0(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;)Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->activeScriptDialog:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;

    return-object p1
.end method

.method static synthetic -set1(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;F)F
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->headAgentHeading:F

    return p1
.end method

.method static synthetic -set2(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;Landroid/view/View;)Landroid/view/View;
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hoveringOverButton:Landroid/view/View;

    return-object p1
.end method

.method static synthetic -set3(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->isSpeechFinished:Z

    return p1
.end method

.method static synthetic -set4(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->lastSpeechRecognitionResults:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic -set5(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;F)F
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->neutralAgentHeading:F

    return p1
.end method

.method static synthetic -set6(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;I)I
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->postedHitPointX:I

    return p1
.end method

.method static synthetic -set7(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;I)I
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->postedHitPointY:I

    return p1
.end method

.method static synthetic -set8(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;F)F
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speechRmsMax:F

    return p1
.end method

.method static synthetic -set9(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;F)F
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speechRmsMin:F

    return p1
.end method

.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->draw2DUI()V

    return-void
.end method

.method static synthetic -wrap1(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;F)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->handleMoveControl(Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;F)V

    return-void
.end method

.method static synthetic -wrap2(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->handlePickedObject(Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;)V

    return-void
.end method

.method static synthetic -wrap3(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onExternalButtonAction(Z)V

    return-void
.end method

.method static synthetic -wrap4(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onNewExternalTexture(Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;)V

    return-void
.end method

.method static synthetic -wrap5(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onViewsInvalidated()V

    return-void
.end method

.method static synthetic -wrap6(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->setControlsPage(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;)V

    return-void
.end method

.method static synthetic -wrap7(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->showSpeechRecognitionError(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic -wrap8(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->updateExternalTexturePointer()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0xc

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->dialogButtonIds:[I

    return-void

    :array_0
    .array-data 4
        0x7f100135
        0x7f100136
        0x7f100137
        0x7f100132
        0x7f100133
        0x7f100134
        0x7f10012f
        0x7f100130
        0x7f100131
        0x7f10012c
        0x7f10012d
        0x7f10012e
    .end array-data
.end method

.method public constructor <init>()V
    .locals 13

    const/high16 v12, 0x7fc00000    # Float.NaN

    const/4 v11, 0x0

    const/4 v10, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$WorldStereoRenderer;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->stereoRenderer:Lcom/google/vr/sdk/base/GvrView$StereoRenderer;

    new-instance v0, Lcom/google/vrtoolkit/cardboard/ScreenOnFlagHelper;

    invoke-direct {v0, p0}, Lcom/google/vrtoolkit/cardboard/ScreenOnFlagHelper;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->screenOnFlagHelper:Lcom/google/vrtoolkit/cardboard/ScreenOnFlagHelper;

    iput-boolean v10, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->isResumed:Z

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v10}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->viewDrawPosted:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-boolean v10, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceEnabled:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$11;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$11;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$12;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$12;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->myAvatarState:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$14;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$14;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceLoggedIn:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$15;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$15;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->currentLocationInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$16;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$16;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceActiveChatter:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$17;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$17;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceChatInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0, v11}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->externalTextureRef:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v10}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hitPointUpdatePosted:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hitPointLock:Ljava/lang/Object;

    iput v10, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->postedHitPointX:I

    iput v10, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->postedHitPointY:I

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v10}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->keypadActive:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Lcom/google/common/util/concurrent/AtomicDouble;

    const-wide/16 v2, 0x0

    invoke-direct {v0, v2, v3}, Lcom/google/common/util/concurrent/AtomicDouble;-><init>(D)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->keypadTurning:Lcom/google/common/util/concurrent/AtomicDouble;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v10}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->controllerConnectionState:Ljava/util/concurrent/atomic/AtomicInteger;

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageSpeech:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$3;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$3;-><init>(Ljava/lang/Object;)V

    sget-object v2, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageObject:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$4;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$4;-><init>(Ljava/lang/Object;)V

    sget-object v4, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageScriptDialog:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    new-instance v5, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$5;

    invoke-direct {v5, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$5;-><init>(Ljava/lang/Object;)V

    sget-object v6, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageYesNo:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    new-instance v7, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$6;

    invoke-direct {v7, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$6;-><init>(Ljava/lang/Object;)V

    sget-object v8, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageDetails:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    new-instance v9, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$2;

    invoke-direct {v9, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$2;-><init>(Ljava/lang/Object;)V

    invoke-static/range {v0 .. v9}, Lcom/google/common/collect/ImmutableMap;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->outsideTouchListeners:Lcom/google/common/collect/ImmutableMap;

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageDefault:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->currentControlsPage:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    iput-object v11, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->fadingTextViewLog:Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;

    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->lastSpeechRecognitionResults:Ljava/lang/String;

    iput v12, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speechRmsMin:F

    iput v12, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speechRmsMax:F

    iput-boolean v10, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->isSpeechFinished:Z

    iput-object v11, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->dictationChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->headAgentHeading:F

    iput v12, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->neutralAgentHeading:F

    iput-object v11, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hoveringOverButton:Landroid/view/View;

    iput-object v11, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hoveringPressedButton:Landroid/view/View;

    iput-object v11, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->activeScriptDialog:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;

    iput-object v11, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->activeYesNoEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;

    iput-boolean v10, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->ownAvatarVisible:Z

    iput-boolean v10, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->isWalking:Z

    iput v10, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->primaryButtonsViewBottom:I

    iput v10, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->moveButtonsTop:I

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->touchActivatedButtons:Ljava/util/Set;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->avatarControl:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v10}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->touchRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->pickedObject:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$13;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$13;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->selectedObjectProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iput-object v11, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->pickedAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hoverListener:Lcom/lumiyaviewer/lumiya/ui/render/OnHoverListenerCompat;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$1;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onHoverListener:Landroid/view/View$OnHoverListener;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->recognitionListener:Landroid/speech/RecognitionListener;

    iput-boolean v10, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->insideControls:Z

    iput-boolean v10, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hitPointValid:Z

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->insideSince:J

    iput v10, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hitPointX:I

    iput v10, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hitPointY:I

    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->locationInWindow:[I

    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->scrollableViewPoint:Landroid/graphics/Point;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$3;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$3;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->handler:Landroid/os/Handler;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$4;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$4;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onDialogButtonClick:Landroid/view/View$OnClickListener;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$5;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$5;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->chatEventHandler:Ljava/lang/Object;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onVoiceCallButtonListener:Landroid/view/View$OnClickListener;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$6;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$6;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->controllerManagerEventListener:Lcom/google/vr/sdk/controller/ControllerManager$EventListener;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$7;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->controllerEventListener:Lcom/google/vr/sdk/controller/Controller$EventListener;

    return-void
.end method

.method private closeSpeechControls()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speechRecognizer:Landroid/speech/SpeechRecognizer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speechRecognizer:Landroid/speech/SpeechRecognizer;

    invoke-virtual {v0}, Landroid/speech/SpeechRecognizer;->stopListening()V

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->getCurrentDetailsFragment()Landroid/support/v4/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageDetails:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->setControlsPage(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;)V

    :goto_0
    return-void

    :cond_1
    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageDefault:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->setControlsPage(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;)V

    goto :goto_0
.end method

.method private draw2DUI()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->externalTextureRef:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;

    if-eqz v0, :cond_0

    :try_start_0
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->getCanvas()Landroid/graphics/Canvas;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->drawExternalViews(Landroid/graphics/Canvas;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->postCanvas(Landroid/graphics/Canvas;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private drawExternalViews(Landroid/graphics/Canvas;)V
    .locals 2

    sget-object v0, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onScreenControlsLayout:Landroid/view/ViewGroup;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method private drawViews()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->viewDrawPosted:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    const-string/jumbo v0, "Cardboard: drawing 2D UI"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->draw2DUI()V

    return-void
.end method

.method private findMatchingView(Landroid/view/ViewGroup;IIIILcom/google/common/base/Predicate;Landroid/graphics/Point;)Landroid/view/View;
    .locals 10
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "IIII",
            "Lcom/google/common/base/Predicate",
            "<",
            "Landroid/view/View;",
            ">;",
            "Landroid/graphics/Point;",
            ")",
            "Landroid/view/View;"
        }
    .end annotation

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_1

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {v2}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v3

    if-eqz v3, :cond_0

    move-object/from16 v0, p6

    invoke-interface {v0, v2}, Lcom/google/common/base/Predicate;->apply(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->locationInWindow:[I

    invoke-virtual {v2, v3}, Landroid/view/View;->getLocationInWindow([I)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->locationInWindow:[I

    const/4 v4, 0x0

    aget v3, v3, v4

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->locationInWindow:[I

    const/4 v5, 0x1

    aget v4, v4, v5

    new-instance v5, Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v6

    add-int/2addr v6, v3

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v7

    add-int/2addr v7, v4

    invoke-direct {v5, v3, v4, v6, v7}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v5, p2, p3}, Landroid/graphics/Rect;->contains(II)Z

    move-result v5

    if-eqz v5, :cond_0

    sub-int v1, p2, v3

    sub-int v3, p3, v4

    move-object/from16 v0, p7

    invoke-virtual {v0, v1, v3}, Landroid/graphics/Point;->set(II)V

    return-object v2

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    move v9, v1

    :goto_1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v9, v1, :cond_3

    invoke-virtual {p1, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {v2}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    if-eqz v1, :cond_2

    instance-of v1, v2, Landroid/view/ViewGroup;

    if-eqz v1, :cond_2

    check-cast v2, Landroid/view/ViewGroup;

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, p0

    move v3, p2

    move v4, p3

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    invoke-direct/range {v1 .. v8}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->findMatchingView(Landroid/view/ViewGroup;IIIILcom/google/common/base/Predicate;Landroid/graphics/Point;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_2

    return-object v1

    :cond_2
    add-int/lit8 v1, v9, 0x1

    move v9, v1

    goto :goto_1

    :cond_3
    const/4 v1, 0x0

    return-object v1
.end method

.method private handleMoveControl(Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;F)V
    .locals 8
    .param p1    # Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const-wide/16 v6, 0x0

    const/4 v4, 0x1

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->avatarControl:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-getcom-lumiyaviewer-lumiya-ui-render-MoveControlSwitchesValues()[I

    move-result-object v1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    cmpl-float v0, p2, v3

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->keypadActive:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->keypadTurning:Lcom/google/common/util/concurrent/AtomicDouble;

    neg-float v1, p2

    float-to-double v2, v1

    invoke-virtual {v0, v2, v3}, Lcom/google/common/util/concurrent/AtomicDouble;->set(D)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->keypadTurning:Lcom/google/common/util/concurrent/AtomicDouble;

    invoke-virtual {v0, v6, v7}, Lcom/google/common/util/concurrent/AtomicDouble;->set(D)V

    goto :goto_0

    :pswitch_1
    cmpl-float v0, p2, v3

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->keypadActive:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->keypadTurning:Lcom/google/common/util/concurrent/AtomicDouble;

    float-to-double v2, p2

    invoke-virtual {v0, v2, v3}, Lcom/google/common/util/concurrent/AtomicDouble;->set(D)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->keypadTurning:Lcom/google/common/util/concurrent/AtomicDouble;

    invoke-virtual {v0, v6, v7}, Lcom/google/common/util/concurrent/AtomicDouble;->set(D)V

    goto :goto_0

    :pswitch_2
    cmpl-float v1, p2, v3

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->keypadActive:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->ownAvatarVisible:Z

    if-eqz v1, :cond_3

    const/high16 v1, 0x3f800000    # 1.0f

    mul-float/2addr v1, p2

    invoke-virtual {v0, v3, v1, v3, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->startCameraManualControl(FFFF)V

    goto :goto_0

    :cond_3
    invoke-direct {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->startWalking(Z)V

    goto :goto_0

    :cond_4
    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->ownAvatarVisible:Z

    if-eqz v1, :cond_5

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->stopCameraManualControl()V

    goto :goto_0

    :cond_5
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->stopWalking()V

    goto :goto_0

    :pswitch_3
    cmpl-float v1, p2, v3

    if-eqz v1, :cond_7

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->keypadActive:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->ownAvatarVisible:Z

    if-eqz v1, :cond_6

    const/high16 v1, -0x40800000    # -1.0f

    mul-float/2addr v1, p2

    invoke-virtual {v0, v3, v1, v3, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->startCameraManualControl(FFFF)V

    goto :goto_0

    :cond_6
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->startWalking(Z)V

    goto :goto_0

    :cond_7
    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->ownAvatarVisible:Z

    if-eqz v1, :cond_8

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->stopCameraManualControl()V

    goto :goto_0

    :cond_8
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->stopWalking()V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private handlePickedObject(Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;)V
    .locals 5

    const/4 v1, 0x0

    if-eqz p1, :cond_2

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    :goto_0
    if-eqz v0, :cond_5

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->pickedObject:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAvatar()Z

    move-result v2

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->pickedAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->pickedAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    :goto_1
    invoke-static {v0, v2}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->pickedAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->pickedAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->pickedAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    :cond_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$18;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$18;-><init>(Ljava/lang/Object;)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v3

    invoke-direct {v0, v2, v1, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->pickedAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    :cond_1
    :goto_2
    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageObject:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->setControlsPage(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->updateObjectPanel()V

    :goto_3
    return-void

    :cond_2
    move-object v0, v1

    goto :goto_0

    :cond_3
    move-object v0, v1

    goto :goto_1

    :cond_4
    const-string/jumbo v1, "ObjectPick: picked object %d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget v3, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->selectedObjectProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->getObjectProfile()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v2

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    goto :goto_2

    :cond_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->selectedObjectProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->pickedAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->pickedAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->pickedAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    :cond_6
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->pickedObject:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageDefault:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->setControlsPage(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;)V

    goto :goto_3
.end method

.method private isViewScrollable(Landroid/view/View;)Z
    .locals 1

    instance-of v0, p1, Landroid/widget/ListView;

    if-nez v0, :cond_0

    instance-of v0, p1, Landroid/support/v7/widget/RecyclerView;

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private isVoiceLoggedIn()Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceLoggedIn:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private onAgentCircuit(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 2

    const/4 v0, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->updateDrawingEnabled()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->avatarControl:Ljava/util/concurrent/atomic/AtomicReference;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    :cond_0
    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    return-void
.end method

.method private onCardboardTrigger()V
    .locals 15

    const/4 v11, 0x0

    const/4 v14, 0x2

    const/4 v10, 0x1

    const/4 v4, 0x0

    const-string/jumbo v1, "Cardboard: trigger, hover over %d, hover pressed %d, hitPointValid %b"

    const/4 v0, 0x3

    new-array v2, v0, [Ljava/lang/Object;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hoveringOverButton:Landroid/view/View;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hoveringOverButton:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v0

    :goto_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hoveringPressedButton:Landroid/view/View;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hoveringPressedButton:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v0

    :goto_1
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v2, v10

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hitPointValid:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    aput-object v0, v2, v14

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hoveringPressedButton:Landroid/view/View;

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hitPointValid:Z

    if-eqz v0, :cond_1

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->insideControls:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hoveringOverButton:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->touchActivatedButtons:Ljava/util/Set;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hoveringOverButton:Landroid/view/View;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    :cond_0
    iget-wide v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->insideSince:J

    iget v5, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hitPointX:I

    int-to-float v5, v5

    iget v6, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hitPointY:I

    int-to-float v6, v6

    move v7, v4

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v0

    invoke-virtual {v0, v14}, Landroid/view/MotionEvent;->setSource(I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onScreenControlsLayout:Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    iget-wide v6, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->insideSince:J

    const-wide/16 v0, 0x1

    add-long v8, v2, v0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hitPointX:I

    int-to-float v11, v0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hitPointY:I

    int-to-float v12, v0

    move v13, v4

    invoke-static/range {v6 .. v13}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v0

    invoke-virtual {v0, v14}, Landroid/view/MotionEvent;->setSource(I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onScreenControlsLayout:Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    :cond_1
    :goto_2
    return-void

    :cond_2
    const/4 v0, -0x1

    goto :goto_0

    :cond_3
    const/4 v0, -0x1

    goto :goto_1

    :cond_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->outsideTouchListeners:Lcom/google/common/collect/ImmutableMap;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->currentControlsPage:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View$OnTouchListener;

    const-string/jumbo v1, "Cardboard: outside touch, listener %s"

    new-array v5, v10, [Ljava/lang/Object;

    aput-object v0, v5, v4

    invoke-static {v1, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->currentControlsPage:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageViewId:I

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const-wide/16 v6, 0x64

    add-long v8, v2, v6

    move-wide v6, v2

    move v12, v11

    move v13, v4

    invoke-static/range {v6 .. v13}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/view/View$OnTouchListener;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    goto :goto_2
.end method

.method private onCurrentLocationChanged(Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->updateVoiceIndication()V

    return-void
.end method

.method private onDetailsOutsideTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :goto_0
    const/4 v0, 0x1

    return v0

    :pswitch_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->handleBackPressed()Z

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method private onExternalButtonAction(Z)V
    .locals 8

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    if-eqz p1, :cond_0

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hitPointX:I

    int-to-float v5, v2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hitPointY:I

    int-to-float v6, v2

    const/4 v4, 0x0

    const/4 v7, 0x0

    move-wide v2, v0

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->setSource(I)V

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onVrTouchInternal(Landroid/view/MotionEvent;Z)Z

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onCardboardTrigger()V

    :goto_0
    return-void

    :cond_0
    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hitPointX:I

    int-to-float v5, v2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hitPointY:I

    int-to-float v6, v2

    const/4 v4, 0x1

    const/4 v7, 0x0

    move-wide v2, v0

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->setSource(I)V

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onVrTouchInternal(Landroid/view/MotionEvent;Z)Z

    goto :goto_0
.end method

.method private onExternalTexturePointer(II)V
    .locals 8
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hitPointValid:Z

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hitPointX:I

    iput p2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hitPointY:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->externalTextureRef:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;

    if-eqz v0, :cond_1

    if-ltz p1, :cond_2

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->getWidth()I

    move-result v1

    if-ge p1, v1, :cond_2

    if-ltz p2, :cond_2

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->getHeight()I

    move-result v0

    if-ge p2, v0, :cond_2

    const/4 v0, 0x1

    :goto_0
    if-eqz v0, :cond_6

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->insideControls:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->insideControls:Z

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->insideSince:J

    iget-wide v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->insideSince:J

    iget-wide v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->insideSince:J

    int-to-float v5, p1

    int-to-float v6, p2

    const/16 v4, 0x9

    const/4 v7, 0x0

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->setSource(I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onScreenControlsLayout:Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z

    :cond_0
    iget-wide v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->insideSince:J

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    int-to-float v5, p1

    int-to-float v6, p2

    const/4 v4, 0x7

    const/4 v7, 0x0

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->setSource(I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onScreenControlsLayout:Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->currentControlsPage:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageDetails:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    if-ne v0, v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->cardboardDetailsPage:Landroid/view/ViewGroup;

    new-instance v6, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$10;

    invoke-direct {v6, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$10;-><init>(Ljava/lang/Object;)V

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->scrollableViewPoint:Landroid/graphics/Point;

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move v2, p1

    move v3, p2

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->findMatchingView(Landroid/view/ViewGroup;IIIILcom/google/common/base/Predicate;Landroid/graphics/Point;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->scrollableViewPoint:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->y:I

    div-int/lit8 v3, v1, 0x4

    if-ge v2, v3, :cond_4

    const-string/jumbo v1, "Cardboard: want to scroll up %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    instance-of v1, v0, Landroid/widget/ListView;

    if-eqz v1, :cond_3

    check-cast v0, Landroid/widget/ListView;

    const/16 v1, -0x64

    const/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2}, Landroid/widget/ListView;->smoothScrollBy(II)V

    :cond_1
    :goto_1
    return-void

    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    :cond_3
    instance-of v1, v0, Landroid/support/v7/widget/RecyclerView;

    if-eqz v1, :cond_1

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x0

    const/16 v2, -0x64

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView;->smoothScrollBy(II)V

    goto :goto_1

    :cond_4
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->scrollableViewPoint:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->y:I

    mul-int/lit8 v1, v1, 0x3

    div-int/lit8 v1, v1, 0x4

    if-le v2, v1, :cond_1

    const-string/jumbo v1, "Cardboard: want to scroll down %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    instance-of v1, v0, Landroid/widget/ListView;

    if-eqz v1, :cond_5

    check-cast v0, Landroid/widget/ListView;

    const/16 v1, 0x64

    const/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2}, Landroid/widget/ListView;->smoothScrollBy(II)V

    goto :goto_1

    :cond_5
    instance-of v1, v0, Landroid/support/v7/widget/RecyclerView;

    if-eqz v1, :cond_1

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x0

    const/16 v2, 0x64

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView;->smoothScrollBy(II)V

    goto :goto_1

    :cond_6
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->insideControls:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->insideControls:Z

    iget-wide v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->insideSince:J

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    int-to-float v5, p1

    int-to-float v6, p2

    const/16 v4, 0xa

    const/4 v7, 0x0

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->setSource(I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onScreenControlsLayout:Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z

    goto :goto_1
.end method

.method private onMyAvatarState(Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;)V
    .locals 4

    const/16 v3, 0x8

    const/4 v2, 0x0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;->isSitting()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->moveButtonsLayout:Landroid/view/ViewGroup;

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonStandUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->ownAvatarVisible:Z

    :goto_0
    return-void

    :cond_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->ownAvatarVisible:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->avatarControl:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    if-eqz v0, :cond_1

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->setCameraManualControl(Z)V

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->neutralAgentHeading:F

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->setAgentHeading(F)V

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->moveButtonsLayout:Landroid/view/ViewGroup;

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonStandUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setVisibility(I)V

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->ownAvatarVisible:Z

    goto :goto_0
.end method

.method private onNewExternalTexture(Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->externalTextureRef:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->getHeight()I

    move-result v2

    const v0, 0x7f100116

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;->setFixedSize(II)V

    return-void
.end method

.method private onPickedAvatarNameUpdated(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->objectNameView:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private onSelectedObjectProfile(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;)V
    .locals 3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->objectNameView:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->name()Lcom/google/common/base/Optional;

    move-result-object v0

    const v2, 0x7f090239

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/common/base/Optional;->or(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private onViewsInvalidated()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->viewDrawPosted:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "Cardboard: posting draw views"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->handler:Landroid/os/Handler;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$25;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$25;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method private onVoiceActiveChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceStatusView:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceStatusView:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceChatInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getVoiceChatInfo()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceChatInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    goto :goto_0
.end method

.method private onVoiceChatInfo(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->updateVoiceIndication()V

    return-void
.end method

.method private onVoiceLoginStatusChanged(Ljava/lang/Boolean;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->updateVoiceIndication()V

    return-void
.end method

.method private onVrTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p2, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onVrTouchInternal(Landroid/view/MotionEvent;Z)Z

    move-result v0

    return v0
.end method

.method private onVrTouchInternal(Landroid/view/MotionEvent;Z)Z
    .locals 8

    const/4 v1, -0x1

    const/4 v2, 0x0

    const/4 v7, 0x0

    const/4 v6, 0x1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v3

    if-nez v3, :cond_2

    const-string/jumbo v0, "down"

    :goto_0
    if-eqz v0, :cond_1

    const-string/jumbo v4, "Cardboard: vr touch %s, hover over %d, hover pressed %d"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v0, v5, v7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hoveringOverButton:Landroid/view/View;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hoveringOverButton:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v0

    :goto_1
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v5, v6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hoveringPressedButton:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hoveringPressedButton:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v1

    :cond_0
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x2

    aput-object v0, v5, v1

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hoveringPressedButton:Landroid/view/View;

    if-eqz v0, :cond_4

    if-ne v3, v6, :cond_4

    const-string/jumbo v0, "Cardboard: touch act: release on button %s"

    new-array v1, v6, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hoveringPressedButton:Landroid/view/View;

    aput-object v3, v1, v7

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hoveringPressedButton:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hoveringPressedButton:Landroid/view/View;

    return v6

    :cond_2
    if-ne v3, v6, :cond_7

    const-string/jumbo v0, "up"

    goto :goto_0

    :cond_3
    move v0, v1

    goto :goto_1

    :cond_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->currentControlsPage:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageDefault:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    if-ne v0, v1, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hoveringOverButton:Landroid/view/View;

    if-nez v0, :cond_6

    if-nez p2, :cond_5

    packed-switch v3, :pswitch_data_0

    const-string/jumbo v0, "Cardboard: MotionEvent: %s"

    new-array v1, v6, [Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v7

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_5
    :goto_2
    return v7

    :pswitch_0
    invoke-direct {p0, v6}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->startWalking(Z)V

    goto :goto_2

    :pswitch_1
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->stopWalking()V

    goto :goto_2

    :cond_6
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->touchActivatedButtons:Ljava/util/Set;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hoveringOverButton:Landroid/view/View;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    if-nez v3, :cond_5

    const-string/jumbo v0, "Cardboard: touch act: press on button %s"

    new-array v1, v6, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hoveringOverButton:Landroid/view/View;

    aput-object v2, v1, v7

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hoveringOverButton:Landroid/view/View;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hoveringPressedButton:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hoveringOverButton:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    goto :goto_2

    :cond_7
    move-object v0, v2

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private setControlsPage(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;)V
    .locals 6
    .param p1    # Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v1, 0x0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->values()[Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    move-result-object v3

    array-length v4, v3

    move v2, v1

    :goto_0
    if-ge v2, v4, :cond_1

    aget-object v0, v3, v2

    iget v5, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageViewId:I

    invoke-virtual {p0, v5}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    if-ne v0, p1, :cond_0

    move v0, v1

    :goto_1
    invoke-virtual {v5, v0}, Landroid/view/View;->setVisibility(I)V

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x4

    goto :goto_1

    :cond_1
    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->currentControlsPage:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    return-void
.end method

.method private showSpeechRecognitionError(Ljava/lang/String;)V
    .locals 2

    const/4 v1, 0x4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speakNowText:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speakLevelIndicator:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonSpeechSend:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speechRecognitionResults:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->isSpeechFinished:Z

    return-void
.end method

.method private startWalking(Z)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->isWalking:Z

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->headAgentHeading:F

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->setAgentHeading(F)V

    if-eqz p1, :cond_1

    const/4 v0, 0x2

    :goto_0
    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->StartAgentMotion(I)V

    :cond_0
    return-void

    :cond_1
    const/4 v0, 0x4

    goto :goto_0
.end method

.method private stopWalking()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->StopAgentMotion()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->isWalking:Z

    :cond_0
    return-void
.end method

.method private updateDrawingEnabled()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->renderSettings:Lcom/lumiyaviewer/lumiya/ui/render/RenderSettings;

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->isResumed:Z

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->drawDistance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->renderSettings:Lcom/lumiyaviewer/lumiya/ui/render/RenderSettings;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/ui/render/RenderSettings;->drawDistance:I

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->Enable3DView(I)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->drawDistance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->Disable3DView()V

    goto :goto_0
.end method

.method private updateExternalTexturePointer()V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hitPointUpdatePosted:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hitPointLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->postedHitPointX:I

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->postedHitPointY:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    invoke-direct {p0, v0, v2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onExternalTexturePointer(II)V

    :cond_0
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private updateObjectPanel()V
    .locals 4

    const/4 v3, 0x0

    const/4 v1, 0x0

    const/16 v2, 0x8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->pickedObject:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    :goto_0
    if-nez v0, :cond_1

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageDefault:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->setControlsPage(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;)V

    :goto_1
    return-void

    :cond_0
    move-object v0, v3

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAvatar()Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonSit:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonTouchObject:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonObjectChat:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    goto :goto_1

    :cond_2
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonSit:Landroid/widget/ImageButton;

    invoke-virtual {v3, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonTouchObject:Landroid/widget/ImageButton;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isTouchable()Z

    move-result v0

    if-eqz v0, :cond_3

    move v0, v1

    :goto_2
    invoke-virtual {v3, v0}, Landroid/widget/ImageButton;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonObjectChat:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    goto :goto_1

    :cond_3
    move v0, v2

    goto :goto_2
.end method

.method private updateVoiceIndication()V
    .locals 4

    const/4 v2, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->isVoiceLoggedIn()Z

    move-result v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->currentLocationInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceStatusView:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->parcelVoiceChannel()Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v3, v0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->setCanConnect(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceActiveChatter:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceChatInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;

    if-eqz v0, :cond_1

    if-eqz v1, :cond_1

    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->state:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->None:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonSpeak:Landroid/widget/ImageButton;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    :goto_1
    return-void

    :cond_0
    move v0, v2

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonSpeak:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    goto :goto_1
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_ui_render_CardboardActivity-mthref-0(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onAgentCircuit(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_render_CardboardActivity-mthref-1(Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onMyAvatarState(Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_render_CardboardActivity-mthref-10(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onDetailsOutsideTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_render_CardboardActivity-mthref-11(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onSelectedObjectProfile(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_render_CardboardActivity-mthref-12()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onViewsInvalidated()V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_render_CardboardActivity-mthref-13()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onCardboardTrigger()V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_render_CardboardActivity-mthref-14(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onVrTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_render_CardboardActivity-mthref-15()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->drawViews()V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_render_CardboardActivity-mthref-16(Landroid/view/View;)Z
    .locals 1

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->isViewScrollable(Landroid/view/View;)Z

    move-result v0

    return v0
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_render_CardboardActivity-mthref-17(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onPickedAvatarNameUpdated(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_render_CardboardActivity-mthref-2(Ljava/lang/Boolean;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onVoiceLoginStatusChanged(Ljava/lang/Boolean;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_render_CardboardActivity-mthref-3(Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onCurrentLocationChanged(Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_render_CardboardActivity-mthref-4(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onVoiceActiveChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_render_CardboardActivity-mthref-5(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onVoiceChatInfo(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_render_CardboardActivity-mthref-6(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onSpeakControlsTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_render_CardboardActivity-mthref-7(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onObjectControlsTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_render_CardboardActivity-mthref-8(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onScriptDialogOutsideTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_render_CardboardActivity-mthref-9(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onYesNoOutsideTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method protected acceptsDetailFragment(Ljava/lang/Class;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Landroid/support/v4/app/Fragment;",
            ">;)Z"
        }
    .end annotation

    const-class v0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_0

    const-class v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 7

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v5, 0x0

    const/4 v4, 0x0

    const/4 v3, 0x1

    const-string/jumbo v0, "Cardboard: dispatch key event: keycode %d"

    new-array v1, v3, [Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->avatarControl:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    :cond_0
    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    return v0

    :sswitch_0
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->Left:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    invoke-direct {p0, v0, v6}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->handleMoveControl(Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;F)V

    :cond_1
    :goto_0
    return v3

    :cond_2
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-ne v0, v3, :cond_1

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->Left:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    invoke-direct {p0, v0, v5}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->handleMoveControl(Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;F)V

    goto :goto_0

    :sswitch_1
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->keypadActive:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->Right:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    invoke-direct {p0, v0, v6}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->handleMoveControl(Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;F)V

    :cond_3
    :goto_1
    return v3

    :cond_4
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-ne v0, v3, :cond_3

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->Right:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    invoke-direct {p0, v0, v5}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->handleMoveControl(Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;F)V

    goto :goto_1

    :sswitch_2
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->keypadActive:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->Forward:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    invoke-direct {p0, v0, v6}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->handleMoveControl(Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;F)V

    :cond_5
    :goto_2
    return v3

    :cond_6
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-ne v0, v3, :cond_5

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->Forward:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    invoke-direct {p0, v0, v5}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->handleMoveControl(Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;F)V

    goto :goto_2

    :sswitch_3
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->keypadActive:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->Backward:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    invoke-direct {p0, v0, v6}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->handleMoveControl(Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;F)V

    :cond_7
    :goto_3
    return v3

    :cond_8
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-ne v0, v3, :cond_7

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;->Backward:Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;

    invoke-direct {p0, v0, v5}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->handleMoveControl(Lcom/lumiyaviewer/lumiya/ui/render/MoveControl;F)V

    goto :goto_3

    :sswitch_4
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_a

    invoke-direct {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onExternalButtonAction(Z)V

    :cond_9
    :goto_4
    return v3

    :cond_a
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-ne v0, v3, :cond_9

    invoke-direct {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onExternalButtonAction(Z)V

    goto :goto_4

    :sswitch_5
    return v3

    nop

    :sswitch_data_0
    .sparse-switch
        0x13 -> :sswitch_2
        0x14 -> :sswitch_3
        0x15 -> :sswitch_0
        0x16 -> :sswitch_1
        0x17 -> :sswitch_5
        0x3e -> :sswitch_4
        0x60 -> :sswitch_4
    .end sparse-switch
.end method

.method public handleBackPressed()Z
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->currentControlsPage:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageDetails:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->handleBackPressed()Z

    move-result v0

    return v0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_render_CardboardActivity_16797()V
    .locals 6

    const/4 v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speechRecognitionResults:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getLineHeight()I

    move-result v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speechRecognitionResults:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getHeight()I

    move-result v2

    div-int v1, v2, v1

    const-string/jumbo v2, "Cardboard: setting max lines = %d"

    new-array v3, v0, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-ge v1, v0, :cond_1

    :goto_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speechRecognitionResults:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getMaxLines()I

    move-result v1

    if-eq v1, v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speechRecognitionResults:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setMaxLines(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speechRecognitionResults:Landroid/widget/TextView;

    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    :cond_0
    return-void

    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_render_CardboardActivity_17418()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonTouch:Landroid/widget/ImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getTop()I

    move-result v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonTouch:Landroid/widget/ImageButton;

    invoke-virtual {v1}, Landroid/widget/ImageButton;->getHeight()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->primaryButtonsViewBottom:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->moveButtonsLayout:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getTop()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->moveButtonsTop:I

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_render_CardboardActivity_28338(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x0

    return v0

    :pswitch_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hoverListener:Lcom/lumiyaviewer/lumiya/ui/render/OnHoverListenerCompat;

    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/OnHoverListenerCompat;->onHoverEnter(Landroid/view/View;)Z

    move-result v0

    return v0

    :pswitch_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hoverListener:Lcom/lumiyaviewer/lumiya/ui/render/OnHoverListenerCompat;

    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/OnHoverListenerCompat;->onHoverExit(Landroid/view/View;)Z

    move-result v0

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x9
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_render_CardboardActivity_71435(Landroid/view/View;)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->currentLocationInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceEnabled:Z

    if-eqz v2, :cond_0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->isVoiceLoggedIn()Z

    move-result v2

    if-eqz v2, :cond_0

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->parcelVoiceChannel()Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->voice:Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->parcelVoiceChannel()Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->nearbyVoiceChatRequest(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;)V

    :cond_0
    return-void
.end method

.method public onAimControlsTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4
    .annotation build Lbutterknife/OnTouch;
        value = {
            0x7f100101
        }
    .end annotation

    const/4 v3, 0x1

    const-string/jumbo v0, "Cardboard: aim controls touched, view %s"

    new-array v1, v3, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :goto_0
    return v3

    :pswitch_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->touchRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public onCamButtonTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 7
    .annotation build Lbutterknife/OnTouch;
        value = {
            0x7f1000fc,
            0x7f1000fe,
            0x7f1000fd,
            0x7f1000ff
        }
    .end annotation

    const/4 v6, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    const/high16 v3, -0x40800000    # -1.0f

    const/4 v5, 0x1

    const/4 v2, 0x0

    const-string/jumbo v0, "Cardboard: cam button: event %s button %s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p2, v4, v6

    aput-object p1, v4, v5

    invoke-static {v0, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->avatarControl:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v4

    if-nez v4, :cond_1

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v4

    packed-switch v4, :pswitch_data_0

    move v1, v2

    move v3, v2

    :goto_0
    invoke-virtual {v0, v2, v3, v2, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->startCameraManualControl(FFFF)V

    :cond_0
    :goto_1
    return v5

    :pswitch_0
    move v3, v1

    move v1, v2

    goto :goto_0

    :pswitch_1
    move v1, v2

    goto :goto_0

    :pswitch_2
    move v3, v2

    goto :goto_0

    :pswitch_3
    move v1, v3

    move v3, v2

    goto :goto_0

    :cond_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    if-ne v1, v5, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->stopCameraManualControl()V

    goto :goto_1

    nop

    :pswitch_data_0
    .packed-switch 0x7f1000fc
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_3
    .end packed-switch
.end method

.method public onChatButton()V
    .locals 3
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f1000f9
        }
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageDetails:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->setControlsPage(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->makeFragmentArguments(Ljava/util/UUID;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "vrMode"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;

    invoke-static {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 10

    const/high16 v9, 0x3f000000    # 0.5f

    const/16 v8, 0x8

    const/4 v4, -0x1

    const/4 v5, 0x0

    const/4 v7, 0x1

    const v0, 0x7f0b002c

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->setTheme(I)V

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0, v7}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->requestWindowFeature(I)Z

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x400

    const/16 v2, 0x400

    invoke-virtual {v0, v1, v2}, Landroid/view/Window;->setFlags(II)V

    new-instance v0, Lcom/google/vr/cardboard/FullscreenMode;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/vr/cardboard/FullscreenMode;-><init>(Landroid/view/Window;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->fullscreenMode:Lcom/google/vr/cardboard/FullscreenMode;

    const v0, 0x7f040022

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/content/Intent;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->finish()V

    return-void

    :cond_0
    invoke-static {p0, v7}, Lcom/google/vr/sdk/base/AndroidCompat;->trySetVrModeEnabled(Landroid/app/Activity;Z)Z

    invoke-static {p0, v7}, Lcom/google/vr/sdk/base/AndroidCompat;->setSustainedPerformanceMode(Landroid/app/Activity;Z)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/RenderSettings;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/RenderSettings;-><init>(Landroid/content/SharedPreferences;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->renderSettings:Lcom/lumiyaviewer/lumiya/ui/render/RenderSettings;

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->stateHandler:Landroid/os/Handler;

    const-string/jumbo v0, "Cardboard: creating VR view"

    new-array v1, v5, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v2

    const v0, 0x7f100116

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    const v3, 0x7f040021

    invoke-virtual {v1, v3, v0, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onScreenControlsLayout:Landroid/view/ViewGroup;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$19;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$19;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder;->setOnViewInvalidateListener(Lcom/lumiyaviewer/lumiya/ui/render/CardboardControlsPlaceholder$OnViewInvalidateListener;)V

    const/high16 v0, 0x41800000    # 16.0f

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    const/4 v3, 0x2

    invoke-static {v3, v0, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v1, v0

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getVoiceEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    const/high16 v3, 0x42700000    # 60.0f

    invoke-static {v7, v3, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v0, v0

    :goto_0
    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceViewHeightAllowance:I

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->stateHandler:Landroid/os/Handler;

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-direct {v0, v3, v7, v6, v1}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;-><init>(Landroid/os/Handler;ZLcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->renderer:Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->renderer:Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->renderSettings:Lcom/lumiyaviewer/lumiya/ui/render/RenderSettings;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/ui/render/RenderSettings;->drawDistance:I

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->setDrawDistance(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->renderer:Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->renderSettings:Lcom/lumiyaviewer/lumiya/ui/render/RenderSettings;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/ui/render/RenderSettings;->avatarCountLimit:I

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->setAvatarCountLimit(I)V

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getForceDaylightTime()Z

    move-result v0

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getForceDaylightHour()F

    move-result v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->renderer:Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    invoke-virtual {v2, v0, v1}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->setForcedTime(ZF)V

    new-instance v0, Lcom/google/vr/sdk/base/GvrView;

    invoke-direct {v0, p0}, Lcom/google/vr/sdk/base/GvrView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->gvrView:Lcom/google/vr/sdk/base/GvrView;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->gvrView:Lcom/google/vr/sdk/base/GvrView;

    invoke-virtual {v0, v7}, Lcom/google/vr/sdk/base/GvrView;->setDistortionCorrectionEnabled(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->gvrView:Lcom/google/vr/sdk/base/GvrView;

    invoke-virtual {v0, v7}, Lcom/google/vr/sdk/base/GvrView;->setAsyncReprojectionEnabled(Z)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->gvrView:Lcom/google/vr/sdk/base/GvrView;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->stereoRenderer:Lcom/google/vr/sdk/base/GvrView$StereoRenderer;

    invoke-virtual {v0, v1}, Lcom/google/vr/sdk/base/GvrView;->setRenderer(Lcom/google/vr/sdk/base/GvrView$StereoRenderer;)V

    new-instance v0, Lcom/google/vr/sdk/controller/ControllerManager;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->controllerManagerEventListener:Lcom/google/vr/sdk/controller/ControllerManager$EventListener;

    invoke-direct {v0, p0, v1}, Lcom/google/vr/sdk/controller/ControllerManager;-><init>(Landroid/content/Context;Lcom/google/vr/sdk/controller/ControllerManager$EventListener;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->controllerManager:Lcom/google/vr/sdk/controller/ControllerManager;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->gvrView:Lcom/google/vr/sdk/base/GvrView;

    invoke-virtual {v0}, Lcom/google/vr/sdk/base/GvrView;->getGvrViewerParams()Lcom/google/vr/sdk/base/GvrViewerParams;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/vr/sdk/base/GvrViewerParams;->getHasMagnet()Z

    move-result v0

    const-string/jumbo v1, "Cardboard: has magnet: %b"

    new-array v2, v7, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    aput-object v0, v2, v5

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const v0, 0x7f100117

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->gvrView:Lcom/google/vr/sdk/base/GvrView;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->gvrView:Lcom/google/vr/sdk/base/GvrView;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$24;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$24;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/google/vr/sdk/base/GvrView;->setOnCardboardTriggerListener(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onScreenControlsLayout:Landroid/view/ViewGroup;

    invoke-static {p0, v0}, Lbutterknife/ButterKnife;->bind(Ljava/lang/Object;Landroid/view/View;)Lbutterknife/Unbinder;

    const/16 v0, 0xe

    new-array v1, v0, [Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonTouch:Landroid/widget/ImageButton;

    aput-object v0, v1, v5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonSpeak:Landroid/widget/ImageButton;

    aput-object v0, v1, v7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonChat:Landroid/widget/ImageButton;

    const/4 v2, 0x2

    aput-object v0, v1, v2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonSpeechSend:Landroid/widget/ImageButton;

    const/4 v2, 0x3

    aput-object v0, v1, v2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonSit:Landroid/widget/ImageButton;

    const/4 v2, 0x4

    aput-object v0, v1, v2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonTouchObject:Landroid/widget/ImageButton;

    const/4 v2, 0x5

    aput-object v0, v1, v2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonObjectChat:Landroid/widget/ImageButton;

    const/4 v2, 0x6

    aput-object v0, v1, v2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonMoveForward:Landroid/widget/ImageButton;

    const/4 v2, 0x7

    aput-object v0, v1, v2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonMoveBackward:Landroid/widget/ImageButton;

    aput-object v0, v1, v8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonTurnLeft:Landroid/widget/ImageButton;

    const/16 v2, 0x9

    aput-object v0, v1, v2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonTurnRight:Landroid/widget/ImageButton;

    const/16 v2, 0xa

    aput-object v0, v1, v2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonStandUp:Landroid/widget/ImageButton;

    const/16 v2, 0xb

    aput-object v0, v1, v2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->yesButton:Landroid/widget/ImageButton;

    const/16 v2, 0xc

    aput-object v0, v1, v2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->noButton:Landroid/widget/ImageButton;

    const/16 v2, 0xd

    aput-object v0, v1, v2

    array-length v2, v1

    move v0, v5

    :goto_1
    if-ge v0, v2, :cond_2

    aget-object v3, v1, v0

    invoke-virtual {v3, v9}, Landroid/view/View;->setAlpha(F)V

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onHoverListener:Landroid/view/View$OnHoverListener;

    invoke-virtual {v3, v6}, Landroid/view/View;->setOnHoverListener(Landroid/view/View$OnHoverListener;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    move v0, v5

    goto/16 :goto_0

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->touchActivatedButtons:Ljava/util/Set;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonMoveForward:Landroid/widget/ImageButton;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->touchActivatedButtons:Ljava/util/Set;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonMoveBackward:Landroid/widget/ImageButton;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->touchActivatedButtons:Ljava/util/Set;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonTurnLeft:Landroid/widget/ImageButton;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->touchActivatedButtons:Ljava/util/Set;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonTurnRight:Landroid/widget/ImageButton;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonStandUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v8}, Landroid/widget/ImageButton;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->moveButtonsLayout:Landroid/view/ViewGroup;

    invoke-virtual {v0, v8}, Landroid/view/ViewGroup;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceStatusView:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    invoke-virtual {v0, v7}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->setShowActiveChatterName(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceStatusView:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->hideBackground()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceStatusView:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->setLightTheme()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceStatusView:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->hoverListener:Lcom/lumiyaviewer/lumiya/ui/render/OnHoverListenerCompat;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->enableHover(Lcom/lumiyaviewer/lumiya/ui/render/OnHoverListenerCompat;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceStatusView:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onVoiceCallButtonListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->setOnCallButtonListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v7, v1, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v2, v0

    sget-object v3, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->dialogButtonIds:[I

    array-length v6, v3

    move v1, v5

    :goto_2
    if-ge v1, v6, :cond_3

    aget v0, v3, v1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, v9}, Landroid/widget/Button;->setAlpha(F)V

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onHoverListener:Landroid/view/View$OnHoverListener;

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setOnHoverListener(Landroid/view/View$OnHoverListener;)V

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onDialogButtonClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/widget/Button;->setPadding(IIII)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setCompoundDrawablePadding(I)V

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_2

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->dialogQuestionText:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextColor(I)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->chatsOverlayLayout:Landroid/widget/LinearLayout;

    move-object v2, p0

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Landroid/content/Context;Landroid/widget/LinearLayout;II)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->fadingTextViewLog:Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageDefault:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->setControlsPage(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speechRecognitionResults:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$8;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$8;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->cardboardPrimaryControls:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$9;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$9;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->gvrView:Lcom/google/vr/sdk/base/GvrView;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$7;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/google/vr/sdk/base/GvrView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method

.method protected onDestroy()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->gvrView:Lcom/google/vr/sdk/base/GvrView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->gvrView:Lcom/google/vr/sdk/base/GvrView;

    invoke-virtual {v0, v1}, Lcom/google/vr/sdk/base/GvrView;->setOnCardboardTriggerListener(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->gvrView:Lcom/google/vr/sdk/base/GvrView;

    invoke-virtual {v0}, Lcom/google/vr/sdk/base/GvrView;->shutdown()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->gvrView:Lcom/google/vr/sdk/base/GvrView;

    :cond_0
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onDestroy()V

    return-void
.end method

.method protected onDetailsStackEmpty()Z
    .locals 1

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onDetailsStackEmpty()Z

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageDefault:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->setControlsPage(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;)V

    const/4 v0, 0x1

    return v0
.end method

.method public onNewObjectPopup(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V
    .locals 5

    const/4 v2, 0x0

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->currentControlsPage:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageYesNo:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    if-eq v0, v1, :cond_2

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->activeScriptDialog:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageScriptDialog:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->setControlsPage(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->getButtons()[Ljava/lang/String;

    move-result-object v3

    move v1, v2

    :goto_0
    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->dialogButtonIds:[I

    array-length v0, v0

    if-ge v1, v0, :cond_1

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->dialogButtonIds:[I

    aget v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    array-length v4, v3

    if-ge v1, v4, :cond_0

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    aget-object v4, v3, v1

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    :goto_1
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_0
    const/16 v4, 0x8

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->dialogQuestionText:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->getRawText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_2
    :goto_2
    return-void

    :cond_3
    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatPermissionRequestEvent;

    if-eqz v0, :cond_2

    move-object v0, p1

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->activeYesNoEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->yesNoText:Landroid/widget/TextView;

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatPermissionRequestEvent;

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatPermissionRequestEvent;->getQuestion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageYesNo:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->setControlsPage(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;)V

    goto :goto_2
.end method

.method public onNoButton()V
    .locals 3
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f10010b
        }
    .end annotation

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->activeYesNoEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->activeYesNoEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0, p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->onYesAction(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->activeYesNoEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;

    :cond_0
    invoke-direct {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->handlePickedObject(Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageDefault:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->setControlsPage(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;)V

    return-void
.end method

.method public onObjectChat()V
    .locals 3
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f100106
        }
    .end annotation

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->pickedObject:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;

    if-eqz v1, :cond_1

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    :goto_0
    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAvatar()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->startDictation(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    :cond_0
    return-void

    :cond_1
    move-object v1, v2

    goto :goto_0
.end method

.method public onObjectControlsTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1
    .annotation build Lbutterknife/OnTouch;
        value = {
            0x7f100102
        }
    .end annotation

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :goto_0
    const/4 v0, 0x1

    return v0

    :pswitch_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->handlePickedObject(Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageDefault:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->setControlsPage(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public onObjectPopupCountChanged(I)V
    .locals 0

    return-void
.end method

.method public onObjectSit()V
    .locals 3
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f100105
        }
    .end annotation

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->pickedObject:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;

    if-eqz v1, :cond_1

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    :goto_0
    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->SitOnObject(Ljava/util/UUID;)V

    invoke-direct {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->handlePickedObject(Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageDefault:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->setControlsPage(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;)V

    :cond_0
    return-void

    :cond_1
    move-object v1, v2

    goto :goto_0
.end method

.method public onObjectTouch()V
    .locals 10
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f100104
        }
    .end annotation

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->pickedObject:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;

    if-eqz v9, :cond_1

    iget-object v1, v9, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    :goto_0
    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAvatar()Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, v9, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->intersectInfo:Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

    iget-boolean v2, v2, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->faceKnown:Z

    if-eqz v2, :cond_2

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getAbsolutePosition()Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v5

    iget-object v2, v9, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->intersectInfo:Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->faceID:I

    iget v3, v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v4, v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v5, v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget-object v6, v9, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->intersectInfo:Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

    iget v6, v6, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->u:F

    iget-object v7, v9, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->intersectInfo:Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

    iget v7, v7, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->v:F

    iget-object v8, v9, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->intersectInfo:Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

    iget v8, v8, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->s:F

    iget-object v9, v9, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->intersectInfo:Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

    iget v9, v9, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->t:F

    invoke-virtual/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->TouchObjectFace(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;IFFFFFFF)V

    :cond_0
    :goto_1
    return-void

    :cond_1
    move-object v1, v2

    goto :goto_0

    :cond_2
    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->TouchObject(I)V

    goto :goto_1
.end method

.method protected onPause()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speechRecognizer:Landroid/speech/SpeechRecognizer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speechRecognizer:Landroid/speech/SpeechRecognizer;

    invoke-virtual {v0}, Landroid/speech/SpeechRecognizer;->destroy()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speechRecognizer:Landroid/speech/SpeechRecognizer;

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->myAvatarState:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectPopupsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->removeObjectPopupListener(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectPopupsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->removePopupWatcher(Ljava/lang/Object;)V

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->getChatEventBus()Lcom/google/common/eventbus/EventBus;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->chatEventHandler:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/google/common/eventbus/EventBus;->unregister(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->isResumed:Z

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->updateDrawingEnabled()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->gvrView:Lcom/google/vr/sdk/base/GvrView;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->gvrView:Lcom/google/vr/sdk/base/GvrView;

    invoke-virtual {v0}, Lcom/google/vr/sdk/base/GvrView;->onPause()V

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->screenOnFlagHelper:Lcom/google/vrtoolkit/cardboard/ScreenOnFlagHelper;

    invoke-virtual {v0}, Lcom/google/vrtoolkit/cardboard/ScreenOnFlagHelper;->stop()V

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onPause()V

    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method protected onResume()V
    .locals 3

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onResume()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->gvrView:Lcom/google/vr/sdk/base/GvrView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->gvrView:Lcom/google/vr/sdk/base/GvrView;

    invoke-virtual {v0}, Lcom/google/vr/sdk/base/GvrView;->onResume()V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->fullscreenMode:Lcom/google/vr/cardboard/FullscreenMode;

    invoke-virtual {v0}, Lcom/google/vr/cardboard/FullscreenMode;->goFullscreen()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->screenOnFlagHelper:Lcom/google/vrtoolkit/cardboard/ScreenOnFlagHelper;

    invoke-virtual {v0}, Lcom/google/vrtoolkit/cardboard/ScreenOnFlagHelper;->start()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speechRecognizer:Landroid/speech/SpeechRecognizer;

    if-nez v0, :cond_1

    invoke-static {p0}, Landroid/speech/SpeechRecognizer;->isRecognitionAvailable(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string/jumbo v0, "Cardboard: speech recognition is available"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {p0}, Landroid/speech/SpeechRecognizer;->createSpeechRecognizer(Landroid/content/Context;)Landroid/speech/SpeechRecognizer;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speechRecognizer:Landroid/speech/SpeechRecognizer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speechRecognizer:Landroid/speech/SpeechRecognizer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->recognitionListener:Landroid/speech/RecognitionListener;

    invoke-virtual {v0, v1}, Landroid/speech/SpeechRecognizer;->setRecognitionListener(Landroid/speech/RecognitionListener;)V

    :cond_1
    :goto_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->isResumed:Z

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->updateDrawingEnabled()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectPopupsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->addPopupWatcher(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectPopupsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    move-result-object v0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->setObjectPopupListener(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager$ObjectPopupListener;Ljava/util/concurrent/Executor;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->myAvatarState:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->myAvatarState()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->getChatEventBus()Lcom/google/common/eventbus/EventBus;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->chatEventHandler:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/google/common/eventbus/EventBus;->register(Ljava/lang/Object;)V

    :cond_2
    return-void

    :cond_3
    const-string/jumbo v0, "Cardboard: speech recognition is not available"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speechRecognizer:Landroid/speech/SpeechRecognizer;

    goto :goto_0
.end method

.method public onScriptDialogOutsideTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3
    .annotation build Lbutterknife/OnTouch;
        value = {
            0x7f100112
        }
    .end annotation

    const/4 v2, 0x0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :goto_0
    const/4 v0, 0x1

    return v0

    :pswitch_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->activeScriptDialog:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->activeScriptDialog:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->onDialogIgnored(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->activeScriptDialog:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;

    :cond_0
    invoke-direct {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->handlePickedObject(Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageDefault:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->setControlsPage(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public onSpeakButton()V
    .locals 1
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f1000f8
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getLocalChatterID(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->startDictation(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    :cond_0
    return-void
.end method

.method public onSpeakControlsTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4
    .annotation build Lbutterknife/OnTouch;
        value = {
            0x7f10010d
        }
    .end annotation

    const/4 v3, 0x1

    const-string/jumbo v0, "Cardboard: speak controls touched, view %s"

    new-array v1, v3, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :goto_0
    return v3

    :pswitch_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->closeSpeechControls()V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public onSpeechSendButton()V
    .locals 3
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f100111
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->lastSpeechRecognitionResults:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->dictationChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->dictationChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->lastSpeechRecognitionResults:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendChatMessage(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    :cond_0
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->lastSpeechRecognitionResults:Ljava/lang/String;

    :cond_1
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->closeSpeechControls()V

    return-void
.end method

.method public onStandUpButton()V
    .locals 1
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f100100
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->avatarControl:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->Stand()V

    :cond_0
    return-void
.end method

.method protected onStart()V
    .locals 3

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onStart()V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getVoiceEnabled()Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceEnabled:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->controllerManager:Lcom/google/vr/sdk/controller/ControllerManager;

    invoke-virtual {v0}, Lcom/google/vr/sdk/controller/ControllerManager;->start()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->controllerManager:Lcom/google/vr/sdk/controller/ControllerManager;

    invoke-virtual {v0}, Lcom/google/vr/sdk/controller/ControllerManager;->getController()Lcom/google/vr/sdk/controller/Controller;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->controller:Lcom/google/vr/sdk/controller/Controller;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->controller:Lcom/google/vr/sdk/controller/Controller;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->controller:Lcom/google/vr/sdk/controller/Controller;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->controllerEventListener:Lcom/google/vr/sdk/controller/Controller$EventListener;

    invoke-virtual {v0, v1}, Lcom/google/vr/sdk/controller/Controller;->setEventListener(Lcom/google/vr/sdk/controller/Controller$EventListener;)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->agentCircuits()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceLoggedIn:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getVoiceLoggedIn()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceActiveChatter:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getVoiceActiveChatter()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->currentLocationInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getCurrentLocationInfo()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :cond_1
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceEnabled:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceStatusView:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->setShowWhenInactive(Z)V

    :goto_0
    return-void

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceStatusView:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->setShowWhenInactive(Z)V

    goto :goto_0
.end method

.method protected onStop()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceActiveChatter:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceLoggedIn:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->currentLocationInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceStatusView:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->keypadActive:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->controllerManager:Lcom/google/vr/sdk/controller/ControllerManager;

    invoke-virtual {v0}, Lcom/google/vr/sdk/controller/ControllerManager;->stop()V

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onStop()V

    return-void
.end method

.method public onTouchButton()V
    .locals 1
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f1000f7
        }
    .end annotation

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageTouchAim:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->setControlsPage(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;)V

    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 1

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onWindowFocusChanged(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->fullscreenMode:Lcom/google/vr/cardboard/FullscreenMode;

    invoke-virtual {v0, p1}, Lcom/google/vr/cardboard/FullscreenMode;->onWindowFocusChanged(Z)V

    return-void
.end method

.method public onYesButton()V
    .locals 3
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f10010a
        }
    .end annotation

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->activeYesNoEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->activeYesNoEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0, p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->onYesAction(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->activeYesNoEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;

    :cond_0
    invoke-direct {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->handlePickedObject(Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageDefault:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->setControlsPage(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;)V

    return-void
.end method

.method public onYesNoOutsideTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2
    .annotation build Lbutterknife/OnTouch;
        value = {
            0x7f100108
        }
    .end annotation

    const/4 v1, 0x0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :goto_0
    const/4 v0, 0x1

    return v0

    :pswitch_0
    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->activeYesNoEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;

    invoke-direct {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->handlePickedObject(Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageDefault:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->setControlsPage(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public startDictation(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 3

    const/4 v1, 0x4

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageSpeech:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->setControlsPage(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;)V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->dictationChatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speakNowText:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speakLevelIndicator:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonSpeechSend:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speechRecognitionResults:Landroid/widget/TextView;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speechRecognizer:Landroid/speech/SpeechRecognizer;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->isSpeechFinished:Z

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string/jumbo v1, "android.speech.extra.PARTIAL_RESULTS"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speechRecognizer:Landroid/speech/SpeechRecognizer;

    invoke-virtual {v1, v0}, Landroid/speech/SpeechRecognizer;->startListening(Landroid/content/Intent;)V

    :goto_0
    return-void

    :cond_0
    const v0, 0x7f09031c

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->showSpeechRecognitionError(Ljava/lang/String;)V

    goto :goto_0
.end method
