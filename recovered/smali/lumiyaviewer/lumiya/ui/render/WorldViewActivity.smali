.class public Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;
.super Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

# interfaces
.implements Landroid/view/View$OnTouchListener;
.implements Lcom/lumiyaviewer/lumiya/ui/ThemeMapper;
.implements Lcom/lumiyaviewer/lumiya/ui/common/ScriptDialogHandler;
.implements Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$NotifyCapture;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$1;,
        Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$2;,
        Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$3;,
        Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$4;,
        Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$5;,
        Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;,
        Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$7;,
        Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$SelectableAttachment;
    }
.end annotation


# static fields
.field private static final BUTTONS_FADE_TIMEOUT_MILLIS:J = 0x1d4cL

.field private static final FROM_NOTIFICATION_TAG:Ljava/lang/String; = "fromNotification"

.field private static final OBJECT_DESELECT_TIMEOUT_MILLIS:J = 0x1770L

.field private static final PERMISSION_AUDIO_REQUEST_CODE:I = 0x64

.field private static final TURNING_SPEED:F = 50.0f


# instance fields
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

.field private arrowsToTurn:Z

.field private avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field avatarIconView:Landroid/widget/ImageView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100238
    .end annotation
.end field

.field buttonCamOff:Landroid/widget/ImageButton;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002f2
    .end annotation
.end field

.field buttonCamOn:Landroid/widget/ImageButton;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002f1
    .end annotation
.end field

.field buttonFlyDownward:Landroid/widget/ImageButton;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002ed
    .end annotation
.end field

.field buttonFlyUpward:Landroid/widget/ImageButton;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002ec
    .end annotation
.end field

.field buttonHUD:Landroid/widget/Button;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002f3
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

.field buttonStandUp:Landroid/widget/ImageButton;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100100
    .end annotation
.end field

.field buttonStopFlying:Landroid/widget/ImageButton;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002ee
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

.field private buttonsFadeAnimator:Landroid/animation/ValueAnimator;

.field private final buttonsFadeTask:Ljava/lang/Runnable;

.field private buttonsFadeTimerStarted:Z

.field private final buttonsRestoreTask:Ljava/lang/Runnable;

.field private camButtonEnabled:Z

.field private final chatEventHandler:Ljava/lang/Object;

.field private chatOver3D:Z

.field chatsOverlayLayout:Landroid/widget/LinearLayout;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002ef
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

.field detailsContainer:Landroid/view/View;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100114
    .end annotation
.end field

.field private displayedHUDid:I

.field dragPointer:Landroid/view/View;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002e4
    .end annotation
.end field

.field dragPointerLayout:Landroid/view/ViewGroup;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002e3
    .end annotation
.end field

.field private drawDistance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private fadingTextViewLog:Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;

.field flyButtonsLayout:Landroid/widget/LinearLayout;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002eb
    .end annotation
.end field

.field private gestureDetector:Landroid/support/v4/view/GestureDetectorCompat;

.field private final gestureListener:Landroid/view/GestureDetector$OnGestureListener;

.field private hudOffsetX:F

.field private hudOffsetY:F

.field private hudScaleFactor:F

.field insetsBackground:Landroid/widget/FrameLayout;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002e0
    .end annotation
.end field

.field private isDragging:Z

.field private isInScaling:Z

.field private isInteracting:Z

.field private isSplitScreen:Z

.field private lastActivityTime:J

.field private lastObjectActivityTime:J

.field private lastTouchUUID:Ljava/util/UUID;

.field private localDrawingEnabled:Z

.field private mGLView:Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

.field private mHandler:Landroid/os/Handler;

.field private manualCamMode:Z

.field moveButtonsLayout:Landroid/view/View;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1000fb
    .end annotation
.end field

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

.field objectChatButton:Landroid/widget/ImageButton;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100106
    .end annotation
.end field

.field objectControlsPanel:Landroid/view/View;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002e9
    .end annotation
.end field

.field private objectDeselectTimerStarted:Z

.field private final objectDeselectTimerTask:Ljava/lang/Runnable;

.field objectMoreButton:Landroid/widget/ImageButton;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002ea
    .end annotation
.end field

.field objectNameTextView:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100239
    .end annotation
.end field

.field objectPayButton:Landroid/widget/ImageButton;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100222
    .end annotation
.end field

.field objectPopupLeftSpacer:Landroid/view/View;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002f4
    .end annotation
.end field

.field objectSitButton:Landroid/widget/ImageButton;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100105
    .end annotation
.end field

.field objectStandButton:Landroid/widget/ImageButton;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100212
    .end annotation
.end field

.field objectTouchButton:Landroid/widget/ImageButton;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100104
    .end annotation
.end field

.field private oldScaleFocusX:F

.field private oldScaleFocusY:F

.field private pickedAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

.field private pickedIntersectInfo:Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;

.field private pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

.field private prefDrawDistance:I

.field private prevDisplayedHUDid:I

.field private scaleGestureDetector:Landroid/view/ScaleGestureDetector;

.field private final scaleGestureListener:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

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

.field private userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

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

.field voiceStatusView:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002e8
    .end annotation
.end field

.field private wasInScaling:Z

.field worldOverlaysContainer:Landroid/view/ViewGroup;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002e6
    .end annotation
.end field

.field worldViewHolder:Landroid/widget/FrameLayout;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002df
    .end annotation
.end field

.field private final worldViewTouchListener:Landroid/view/View$OnTouchListener;

.field worldViewTouchReceiver:Landroid/view/View;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002e2
    .end annotation
.end field


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    return-object v0
.end method

.method static synthetic -get10(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->isInScaling:Z

    return v0
.end method

.method static synthetic -get11(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->isInteracting:Z

    return v0
.end method

.method static synthetic -get12(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)J
    .locals 2

    iget-wide v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->lastActivityTime:J

    return-wide v0
.end method

.method static synthetic -get13(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)J
    .locals 2

    iget-wide v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->lastObjectActivityTime:J

    return-wide v0
.end method

.method static synthetic -get14(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->mGLView:Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    return-object v0
.end method

.method static synthetic -get15(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic -get16(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Ljava/lang/Runnable;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectDeselectTimerTask:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic -get17(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->oldScaleFocusX:F

    return v0
.end method

.method static synthetic -get18(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->oldScaleFocusY:F

    return v0
.end method

.method static synthetic -get19(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Landroid/view/ScaleGestureDetector;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->scaleGestureDetector:Landroid/view/ScaleGestureDetector;

    return-object v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Landroid/animation/ValueAnimator;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonsFadeAnimator:Landroid/animation/ValueAnimator;

    return-object v0
.end method

.method static synthetic -get20(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->voiceChatInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    return-object v0
.end method

.method static synthetic -get21(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->wasInScaling:Z

    return v0
.end method

.method static synthetic -get3(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Ljava/lang/Runnable;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonsFadeTask:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic -get4(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->displayedHUDid:I

    return v0
.end method

.method static synthetic -get5(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Landroid/support/v4/view/GestureDetectorCompat;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->gestureDetector:Landroid/support/v4/view/GestureDetectorCompat;

    return-object v0
.end method

.method static synthetic -get6(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->hudOffsetX:F

    return v0
.end method

.method static synthetic -get7(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->hudOffsetY:F

    return v0
.end method

.method static synthetic -get8(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->hudScaleFactor:F

    return v0
.end method

.method static synthetic -get9(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->isDragging:Z

    return v0
.end method

.method static synthetic -set0(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonsFadeTimerStarted:Z

    return p1
.end method

.method static synthetic -set1(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;F)F
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->hudOffsetX:F

    return p1
.end method

.method static synthetic -set2(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;F)F
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->hudOffsetY:F

    return p1
.end method

.method static synthetic -set3(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;F)F
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->hudScaleFactor:F

    return p1
.end method

.method static synthetic -set4(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->isInScaling:Z

    return p1
.end method

.method static synthetic -set5(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->isInteracting:Z

    return p1
.end method

.method static synthetic -set6(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectDeselectTimerStarted:Z

    return p1
.end method

.method static synthetic -set7(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;F)F
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->oldScaleFocusX:F

    return p1
.end method

.method static synthetic -set8(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;F)F
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->oldScaleFocusY:F

    return p1
.end method

.method static synthetic -set9(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->wasInScaling:Z

    return p1
.end method

.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Z
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->detailsVisible()Z

    move-result v0

    return v0
.end method

.method static synthetic -wrap1(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragSelectorSetRawPosition(II)V

    return-void
.end method

.method static synthetic -wrap2(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->selectByDragPointer(II)V

    return-void
.end method

.method static synthetic -wrap3(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->startFadingButtons()V

    return-void
.end method

.method public constructor <init>()V
    .locals 5

    const/high16 v4, 0x7fc00000    # Float.NaN

    const/4 v1, 0x0

    const/4 v3, 0x0

    const/4 v2, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;-><init>()V

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedIntersectInfo:Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->mHandler:Landroid/os/Handler;

    const/16 v0, 0x14

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->prefDrawDistance:I

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->chatOver3D:Z

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->lastTouchUUID:Ljava/util/UUID;

    iput v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->displayedHUDid:I

    iput v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->prevDisplayedHUDid:I

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->hudScaleFactor:F

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->hudOffsetX:F

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->hudOffsetY:F

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->arrowsToTurn:Z

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->camButtonEnabled:Z

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->manualCamMode:Z

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->localDrawingEnabled:Z

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->lastActivityTime:J

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonsFadeTimerStarted:Z

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonsFadeAnimator:Landroid/animation/ValueAnimator;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->lastObjectActivityTime:J

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectDeselectTimerStarted:Z

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->isInScaling:Z

    iput v4, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->oldScaleFocusX:F

    iput v4, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->oldScaleFocusY:F

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->wasInScaling:Z

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->isInteracting:Z

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->isDragging:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$3;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$3;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$4;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$4;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->myAvatarState:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$5;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$5;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->selectedObjectProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$6;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$6;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->currentLocationInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$7;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$7;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->voiceActiveChatter:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$8;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$8;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->voiceChatInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->chatEventHandler:Ljava/lang/Object;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$2;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$2;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectDeselectTimerTask:Ljava/lang/Runnable;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$3;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$3;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonsFadeTask:Ljava/lang/Runnable;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$4;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$4;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonsRestoreTask:Ljava/lang/Runnable;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$5;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$5;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->worldViewTouchListener:Landroid/view/View$OnTouchListener;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$6;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->gestureListener:Landroid/view/GestureDetector$OnGestureListener;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$7;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$7;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->scaleGestureListener:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    return-void
.end method

.method private beginCountingButtonsFade()V
    .locals 2

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->lastActivityTime:J

    iget-wide v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->lastActivityTime:J

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->lastObjectActivityTime:J

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->startFadingButtonsTimer()V

    return-void
.end method

.method private beginCountingObjectDeselect()V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    if-eqz v0, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->lastObjectActivityTime:J

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectDeselectTimerStarted:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectDeselectTimerStarted:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectDeselectTimerTask:Ljava/lang/Runnable;

    const-wide/16 v2, 0x1770

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method

.method private beginDragSelection()V
    .locals 4

    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->isDragging:Z

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->removeAllDetails()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragPointer:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/AbsoluteLayout$LayoutParams;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragPointerLayout:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragPointer:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    sub-int/2addr v1, v2

    div-int/lit8 v1, v1, 0x2

    iput v1, v0, Landroid/widget/AbsoluteLayout$LayoutParams;->x:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragPointerLayout:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getHeight()I

    move-result v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragPointer:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    sub-int/2addr v1, v2

    div-int/lit8 v1, v1, 0x2

    iput v1, v0, Landroid/widget/AbsoluteLayout$LayoutParams;->y:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragPointer:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget v1, v0, Landroid/widget/AbsoluteLayout$LayoutParams;->x:I

    iget v0, v0, Landroid/widget/AbsoluteLayout$LayoutParams;->y:I

    invoke-direct {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->selectByDragPointer(II)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->mGLView:Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->setOwnAvatarHidden(Z)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->updateObjectPanel()V

    return-void
.end method

.method private chatWithObject(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V
    .locals 3

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->isMyAvatar()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v0

    if-eqz v0, :cond_0

    const-class v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    :cond_0
    return-void
.end method

.method private detailsVisible()Z
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    if-eqz v0, :cond_0

    const v1, 0x7f100114

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/v4/app/Fragment;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private displayHUD(I)V
    .locals 5

    const/4 v4, 0x0

    const/4 v3, 0x0

    const-string/jumbo v0, "Displaying HUD with ID %d"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->displayedHUDid:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->mGLView:Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->setDisplayedHUDid(I)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->displayedHUDid:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->prevDisplayedHUDid:I

    if-eq v0, v1, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->hudScaleFactor:F

    iput v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->hudOffsetX:F

    iput v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->hudOffsetY:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->displayedHUDid:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->prevDisplayedHUDid:I

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->mGLView:Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->hudScaleFactor:F

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->setHUDScaleFactor(F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->mGLView:Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->hudOffsetX:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->hudOffsetY:F

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->setHUDOffset(FF)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->displayedHUDid:I

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->handlePickedObject(Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;)V

    :cond_1
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->updateObjectPanel()V

    return-void
.end method

.method private dragSelectorSetRawPosition(II)V
    .locals 7

    const/4 v6, 0x0

    const/4 v0, 0x2

    new-array v1, v0, [I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragPointerLayout:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getLocationOnScreen([I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragPointer:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    sub-int v2, p1, v0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragPointer:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    sub-int v3, p2, v0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragPointer:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/AbsoluteLayout$LayoutParams;

    if-eqz v0, :cond_0

    aget v4, v1, v6

    sub-int/2addr v2, v4

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragPointerLayout:Landroid/view/ViewGroup;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->getWidth()I

    move-result v4

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragPointer:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-static {v2, v4}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {v2, v6}, Ljava/lang/Math;->max(II)I

    move-result v2

    iput v2, v0, Landroid/widget/AbsoluteLayout$LayoutParams;->x:I

    const/4 v2, 0x1

    aget v1, v1, v2

    sub-int v1, v3, v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragPointerLayout:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getHeight()I

    move-result v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragPointer:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v1, v6}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, v0, Landroid/widget/AbsoluteLayout$LayoutParams;->y:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragPointer:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget v1, v0, Landroid/widget/AbsoluteLayout$LayoutParams;->x:I

    iget v0, v0, Landroid/widget/AbsoluteLayout$LayoutParams;->y:I

    invoke-direct {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->selectByDragPointer(II)V

    :cond_0
    return-void
.end method

.method private endDragSelection()V
    .locals 2

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->isDragging:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->mGLView:Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->setOwnAvatarHidden(Z)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->updateObjectPanel()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->beginCountingButtonsFade()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->beginCountingObjectDeselect()V

    return-void
.end method

.method private enterCardboardView()V
    .locals 3

    const/4 v2, 0x0

    const-string/jumbo v0, "android.permission.RECORD_AUDIO"

    invoke-static {p0, v0}, Landroid/support/v4/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "Cardboard: audio permission not yet granted"

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "android.permission.RECORD_AUDIO"

    aput-object v1, v0, v2

    const/16 v1, 0x64

    invoke-static {p0, v0, v1}, Landroid/support/v4/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    :goto_0
    return-void

    :cond_0
    const-string/jumbo v0, "Cardboard: audio permission already granted"

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->startCardboardActivity()V

    goto :goto_0
.end method

.method private initContentView()V
    .locals 4

    const/4 v3, 0x1

    const/4 v2, 0x0

    const v0, 0x7f0400bd

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->setContentView(I)V

    invoke-static {p0}, Lbutterknife/ButterKnife;->bind(Landroid/app/Activity;)Lbutterknife/Unbinder;

    const v0, 0x7f1002e1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/Toolbar;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->setSupportActionBar(Landroid/support/v7/widget/Toolbar;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-direct {v0, p0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->mGLView:Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->worldViewHolder:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->mGLView:Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonMoveForward:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonMoveBackward:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonTurnLeft:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonTurnRight:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonMoveForward:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setFocusable(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonMoveBackward:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setFocusable(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonTurnLeft:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setFocusable(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonTurnRight:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setFocusable(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonFlyUpward:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonFlyDownward:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonFlyUpward:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setFocusable(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonFlyDownward:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setFocusable(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->voiceStatusView:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->setShowActiveChatterName(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->worldViewTouchReceiver:Landroid/view/View;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->worldViewTouchListener:Landroid/view/View$OnTouchListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectControlsPanel:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f100242

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    const/16 v1, 0x80

    invoke-static {v1, v2, v2, v2}, Landroid/graphics/Color;->argb(IIII)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    const/high16 v2, 0x41200000    # 10.0f

    invoke-static {v3, v2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    :cond_0
    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_render_WorldViewActivity_43728(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method private onAgentCircuit(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 2

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->drawDistance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->drawDistance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->localDrawingEnabled:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->drawDistance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->prefDrawDistance:I

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->Enable3DView(I)V

    :cond_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->camButtonEnabled:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->getIsManualCamming()Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->manualCamMode:Z

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonsRestoreTask:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->beginCountingButtonsFade()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->beginCountingObjectDeselect()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->updateObjectPanel()V

    return-void

    :cond_2
    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->handlePickedObject(Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->drawDistance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;

    goto :goto_0
.end method

.method private onCurrentLocation(Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;)V
    .locals 2

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->parcelData()Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    move-result-object v0

    :goto_0
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_1
    if-eqz v0, :cond_1

    :goto_2
    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->setDefaultTitle(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    move-object v0, v1

    goto :goto_0

    :cond_1
    const v0, 0x7f0901c8

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    :cond_2
    move-object v0, v1

    goto :goto_1
.end method

.method private onMyAvatarState(Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->updateObjectPanel()V

    return-void
.end method

.method private onPickedAvatarNameUpdated(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-ne p1, v0, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->updateObjectPanel()V

    :cond_0
    return-void
.end method

.method private onSelectedObjectProfile(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;)V
    .locals 3

    const-string/jumbo v0, "got selected object profile: %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->updateObjectPanel()V

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->isPayable()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->payInfo()Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;

    move-result-object v1

    if-nez v1, :cond_0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->objectUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->DoRequestPayPrice(Ljava/util/UUID;)V

    :cond_0
    return-void
.end method

.method private onVoiceActiveChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->voiceStatusView:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->voiceStatusView:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    :cond_0
    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->voiceChatInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getVoiceChatInfo()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->voiceChatInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    goto :goto_0
.end method

.method private onVoiceChatInfo(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;)V
    .locals 0

    return-void
.end method

.method private selectByDragPointer(II)V
    .locals 6

    const/4 v3, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    new-array v0, v3, [I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragPointerLayout:Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getLocationOnScreen([I)V

    aget v1, v0, v4

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragPointer:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v1, v2

    add-int/2addr v1, p1

    aget v0, v0, v5

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragPointer:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v0, v2

    add-int/2addr v0, p2

    new-array v2, v3, [I

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->worldViewHolder:Landroid/widget/FrameLayout;

    invoke-virtual {v3, v2}, Landroid/widget/FrameLayout;->getLocationOnScreen([I)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->mGLView:Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    aget v4, v2, v4

    sub-int/2addr v1, v4

    int-to-float v1, v1

    aget v2, v2, v5

    sub-int/2addr v0, v2

    int-to-float v0, v0

    invoke-virtual {v3, v1, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->pickObjectHover(FF)V

    return-void
.end method

.method private selectHUDtoDisplay()V
    .locals 6

    const/4 v5, 0x0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getGridConnection()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->parcelInfo:Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLParcelInfo;->getAgentAvatar()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    move-result-object v0

    if-eqz v0, :cond_1

    :try_start_0
    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->treeNode:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/google/common/base/Strings;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "#"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    iget v3, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->attachmentID:I

    if-ltz v3, :cond_0

    const/16 v4, 0x38

    if-ge v3, v4, :cond_0

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    aget-object v3, v4, v3

    if-eqz v3, :cond_0

    iget-boolean v3, v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->isHUD:Z

    if-eqz v3, :cond_0

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$SelectableAttachment;

    iget v4, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->name:Ljava/lang/String;

    invoke-direct {v3, v4, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$SelectableAttachment;-><init>(ILjava/lang/String;)V

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    :cond_1
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_3

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$SelectableAttachment;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$SelectableAttachment;->getLocalID()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->displayHUD(I)V

    :cond_2
    :goto_1
    return-void

    :cond_3
    new-instance v0, Landroid/widget/ArrayAdapter;

    const v2, 0x1090003

    invoke-direct {v0, p0, v2, v1}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    new-instance v2, Landroid/support/v7/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x7f0902f3

    invoke-virtual {v2, v3}, Landroid/support/v7/app/AlertDialog$Builder;->setTitle(I)Landroid/support/v7/app/AlertDialog$Builder;

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$10;

    invoke-direct {v3, p0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$10;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v2, v0, v3}, Landroid/support/v7/app/AlertDialog$Builder;->setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {v2}, Landroid/support/v7/app/AlertDialog$Builder;->create()Landroid/support/v7/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog;->show()V

    goto :goto_1
.end method

.method private showObjectInfo(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V
    .locals 3

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAvatar()Z

    move-result v0

    if-nez v0, :cond_1

    const-class v0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v1

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->makeSelection(Ljava/util/UUID;I)Landroid/os/Bundle;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    :cond_0
    :goto_0
    return-void

    :cond_1
    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    if-eqz v0, :cond_0

    const-class v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    goto :goto_0
.end method

.method private startCardboardActivity()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardTransitionActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->setActiveAgentID(Landroid/content/Intent;Ljava/util/UUID;)V

    const/high16 v1, 0x1000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->startActivity(Landroid/content/Intent;)V

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->finish()V

    return-void
.end method

.method private startFadingButtons()V
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonsFadeAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonsFadeAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    :cond_0
    return-void
.end method

.method private startFadingButtonsTimer()V
    .locals 4

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonsFadeTimerStarted:Z

    if-nez v0, :cond_0

    const-string/jumbo v0, "ButtonsFade: starting timer"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonsFadeTimerStarted:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonsFadeTask:Ljava/lang/Runnable;

    const-wide/16 v2, 0x1d4c

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method

.method private stopAvatarAnimations()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->StopAvatarAnimations()V

    :cond_0
    return-void
.end method

.method private takeScreenshot()V
    .locals 2

    const v0, 0x7f090338

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->mGLView:Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->takeScreenshot()V

    return-void
.end method

.method private touchObject(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;)V
    .locals 10

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAvatar()Z

    move-result v1

    if-nez v1, :cond_3

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->lastTouchUUID:Ljava/util/UUID;

    const/4 v1, 0x0

    if-eqz p2, :cond_0

    iget-object v1, p2, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->intersectInfo:Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

    iget-boolean v1, v1, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->faceKnown:Z

    :cond_0
    if-eqz v1, :cond_2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getAbsolutePosition()Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iget-object v2, p2, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->intersectInfo:Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->faceID:I

    iget v3, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v4, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v5, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget-object v1, p2, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->intersectInfo:Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

    iget v6, v1, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->u:F

    iget-object v1, p2, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->intersectInfo:Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

    iget v7, v1, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->v:F

    iget-object v1, p2, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->intersectInfo:Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

    iget v8, v1, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->s:F

    iget-object v1, p2, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->intersectInfo:Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

    iget v9, v1, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->t:F

    move-object v1, p1

    invoke-virtual/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->TouchObjectFace(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;IFFFFFFF)V

    :cond_1
    :goto_0
    return-void

    :cond_2
    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->TouchObject(I)V

    goto :goto_0

    :cond_3
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->hasTouchableChildren()Z

    move-result v0

    if-eqz v0, :cond_1

    const-class v0, Lcom/lumiyaviewer/lumiya/ui/objects/TouchableObjectsFragment;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/ui/objects/TouchableObjectsFragment;->makeSelection(Ljava/util/UUID;Ljava/util/UUID;)Landroid/os/Bundle;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    goto :goto_0
.end method

.method private updateObjectPanel()V
    .locals 12

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->myAvatarState:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    if-eqz v1, :cond_9

    const/4 v2, 0x1

    move v8, v2

    :goto_0
    if-eqz v0, :cond_a

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;->isSitting()Z

    move-result v2

    move v7, v2

    :goto_1
    if-eqz v0, :cond_b

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;->hasHUDs()Z

    move-result v2

    move v6, v2

    :goto_2
    if-eqz v0, :cond_c

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;->isFlying()Z

    move-result v2

    move v5, v2

    :goto_3
    if-eqz v1, :cond_d

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v2

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canStandUp()Z

    move-result v2

    move v4, v2

    :goto_4
    if-eqz v1, :cond_e

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v1

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->rlvController:Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/rlv/RLVController;->canSit()Z

    move-result v1

    :goto_5
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    if-eqz v2, :cond_f

    const/4 v2, 0x1

    :goto_6
    const-string/jumbo v3, "isSitting %b, isFlying %b, hasHUDs %b, isDragging %b"

    const/4 v9, 0x4

    new-array v9, v9, [Ljava/lang/Object;

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    const/4 v11, 0x0

    aput-object v10, v9, v11

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    const/4 v11, 0x1

    aput-object v10, v9, v11

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    const/4 v11, 0x2

    aput-object v10, v9, v11

    iget-boolean v10, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->isDragging:Z

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    const/4 v11, 0x3

    aput-object v10, v9, v11

    invoke-static {v3, v9}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v9, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragPointerLayout:Landroid/view/ViewGroup;

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->isDragging:Z

    if-eqz v3, :cond_10

    const/4 v3, 0x0

    :goto_7
    invoke-virtual {v9, v3}, Landroid/view/ViewGroup;->setVisibility(I)V

    iget-object v9, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragPointer:Landroid/view/View;

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->isDragging:Z

    if-eqz v3, :cond_11

    const/4 v3, 0x0

    :goto_8
    invoke-virtual {v9, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v9, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->flyButtonsLayout:Landroid/widget/LinearLayout;

    if-nez v7, :cond_0

    xor-int/lit8 v3, v8, 0x1

    if-eqz v3, :cond_1

    :cond_0
    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->camButtonEnabled:Z

    if-eqz v3, :cond_12

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->manualCamMode:Z

    :goto_9
    xor-int/lit8 v3, v3, 0x1

    if-nez v3, :cond_2

    :cond_1
    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->isDragging:Z

    if-nez v3, :cond_2

    if-eqz v2, :cond_13

    :cond_2
    const/16 v3, 0x8

    :goto_a
    invoke-virtual {v9, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v9, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->moveButtonsLayout:Landroid/view/View;

    if-nez v7, :cond_3

    xor-int/lit8 v3, v8, 0x1

    if-eqz v3, :cond_4

    :cond_3
    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->camButtonEnabled:Z

    if-eqz v3, :cond_14

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->manualCamMode:Z

    :goto_b
    xor-int/lit8 v3, v3, 0x1

    if-nez v3, :cond_5

    :cond_4
    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->isDragging:Z

    if-nez v3, :cond_5

    if-eqz v2, :cond_15

    :cond_5
    const/4 v3, 0x4

    :goto_c
    invoke-virtual {v9, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v9, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonStandUp:Landroid/widget/ImageButton;

    if-eqz v4, :cond_16

    if-eqz v7, :cond_16

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->isDragging:Z

    xor-int/lit8 v3, v3, 0x1

    if-eqz v3, :cond_16

    const/4 v3, 0x0

    :goto_d
    invoke-virtual {v9, v3}, Landroid/widget/ImageButton;->setVisibility(I)V

    iget-object v9, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonHUD:Landroid/widget/Button;

    if-eqz v6, :cond_17

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->isDragging:Z

    xor-int/lit8 v3, v3, 0x1

    if-eqz v3, :cond_17

    if-eqz v8, :cond_17

    const/4 v3, 0x0

    :goto_e
    invoke-virtual {v9, v3}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonFlyDownward:Landroid/widget/ImageButton;

    if-eqz v5, :cond_6

    if-nez v8, :cond_7

    :cond_6
    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->camButtonEnabled:Z

    if-eqz v3, :cond_18

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->manualCamMode:Z

    if-eqz v3, :cond_18

    :cond_7
    const/4 v3, 0x0

    :goto_f
    invoke-virtual {v6, v3}, Landroid/widget/ImageButton;->setVisibility(I)V

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonStopFlying:Landroid/widget/ImageButton;

    if-eqz v5, :cond_1a

    if-eqz v8, :cond_1a

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->camButtonEnabled:Z

    if-eqz v3, :cond_19

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->manualCamMode:Z

    :goto_10
    xor-int/lit8 v3, v3, 0x1

    if-eqz v3, :cond_1a

    const/4 v3, 0x0

    :goto_11
    invoke-virtual {v6, v3}, Landroid/widget/ImageButton;->setVisibility(I)V

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonCamOn:Landroid/widget/ImageButton;

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->camButtonEnabled:Z

    if-eqz v3, :cond_1b

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->manualCamMode:Z

    xor-int/lit8 v3, v3, 0x1

    if-eqz v3, :cond_1b

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->isDragging:Z

    xor-int/lit8 v3, v3, 0x1

    if-eqz v3, :cond_1b

    xor-int/lit8 v3, v2, 0x1

    if-eqz v3, :cond_1b

    const/4 v3, 0x0

    :goto_12
    invoke-virtual {v5, v3}, Landroid/widget/ImageButton;->setVisibility(I)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonCamOff:Landroid/widget/ImageButton;

    iget-boolean v5, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->camButtonEnabled:Z

    if-eqz v5, :cond_1c

    iget-boolean v5, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->manualCamMode:Z

    if-eqz v5, :cond_1c

    iget-boolean v5, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->isDragging:Z

    xor-int/lit8 v5, v5, 0x1

    if-eqz v5, :cond_1c

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_1c

    const/4 v2, 0x0

    :goto_13
    invoke-virtual {v3, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    if-eqz v2, :cond_8

    xor-int/lit8 v2, v8, 0x1

    if-eqz v2, :cond_1d

    :cond_8
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectControlsPanel:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :goto_14
    return-void

    :cond_9
    const/4 v2, 0x0

    move v8, v2

    goto/16 :goto_0

    :cond_a
    const/4 v2, 0x0

    move v7, v2

    goto/16 :goto_1

    :cond_b
    const/4 v2, 0x0

    move v6, v2

    goto/16 :goto_2

    :cond_c
    const/4 v2, 0x0

    move v5, v2

    goto/16 :goto_3

    :cond_d
    const/4 v2, 0x0

    move v4, v2

    goto/16 :goto_4

    :cond_e
    const/4 v1, 0x0

    goto/16 :goto_5

    :cond_f
    const/4 v2, 0x0

    goto/16 :goto_6

    :cond_10
    const/4 v3, 0x4

    goto/16 :goto_7

    :cond_11
    const/4 v3, 0x4

    goto/16 :goto_8

    :cond_12
    const/4 v3, 0x0

    goto/16 :goto_9

    :cond_13
    const/4 v3, 0x0

    goto/16 :goto_a

    :cond_14
    const/4 v3, 0x0

    goto/16 :goto_b

    :cond_15
    const/4 v3, 0x0

    goto/16 :goto_c

    :cond_16
    const/16 v3, 0x8

    goto/16 :goto_d

    :cond_17
    const/16 v3, 0x8

    goto/16 :goto_e

    :cond_18
    const/16 v3, 0x8

    goto/16 :goto_f

    :cond_19
    const/4 v3, 0x0

    goto/16 :goto_10

    :cond_1a
    const/16 v3, 0x8

    goto/16 :goto_11

    :cond_1b
    const/16 v3, 0x8

    goto :goto_12

    :cond_1c
    const/16 v2, 0x8

    goto :goto_13

    :cond_1d
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectControlsPanel:Landroid/view/View;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isTouchable()Z

    move-result v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAvatar()Z

    move-result v3

    if-eqz v3, :cond_1e

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->hasTouchableChildren()Z

    move-result v3

    or-int/2addr v2, v3

    :cond_1e
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectTouchButton:Landroid/widget/ImageButton;

    if-eqz v2, :cond_22

    const/4 v2, 0x0

    :goto_15
    invoke-virtual {v3, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAvatar()Z

    move-result v3

    if-eqz v7, :cond_23

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;->sittingOn()I

    move-result v0

    if-ne v2, v0, :cond_23

    const/4 v0, 0x1

    :goto_16
    if-nez v3, :cond_24

    xor-int/lit8 v2, v0, 0x1

    :goto_17
    if-nez v3, :cond_25

    :goto_18
    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectSitButton:Landroid/widget/ImageButton;

    if-eqz v2, :cond_26

    if-eqz v1, :cond_26

    const/4 v1, 0x0

    :goto_19
    invoke-virtual {v5, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectStandButton:Landroid/widget/ImageButton;

    if-eqz v0, :cond_27

    if-eqz v4, :cond_27

    const/4 v0, 0x0

    :goto_1a
    invoke-virtual {v1, v0}, Landroid/widget/ImageButton;->setVisibility(I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectChatButton:Landroid/widget/ImageButton;

    if-eqz v3, :cond_28

    const/4 v0, 0x0

    :goto_1b
    invoke-virtual {v1, v0}, Landroid/widget/ImageButton;->setVisibility(I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarIconView:Landroid/widget/ImageView;

    if-eqz v3, :cond_29

    const/4 v0, 0x0

    :goto_1c
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectPayButton:Landroid/widget/ImageButton;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isPayable()Z

    move-result v0

    if-nez v0, :cond_1f

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget-byte v0, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->saleType:B

    if-eqz v0, :cond_2a

    :cond_1f
    const/4 v0, 0x0

    :goto_1d
    invoke-virtual {v1, v0}, Landroid/widget/ImageButton;->setVisibility(I)V

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAvatar()Z

    move-result v0

    if-eqz v0, :cond_2b

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v0, :cond_2d

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v0

    :cond_20
    :goto_1e
    if-nez v0, :cond_21

    const v0, 0x7f090239

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    :cond_21
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectNameTextView:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_14

    :cond_22
    const/16 v2, 0x8

    goto :goto_15

    :cond_23
    const/4 v0, 0x0

    goto :goto_16

    :cond_24
    const/4 v2, 0x0

    goto :goto_17

    :cond_25
    const/4 v0, 0x0

    goto :goto_18

    :cond_26
    const/16 v1, 0x8

    goto :goto_19

    :cond_27
    const/16 v0, 0x8

    goto :goto_1a

    :cond_28
    const/16 v0, 0x8

    goto :goto_1b

    :cond_29
    const/16 v0, 0x8

    goto :goto_1c

    :cond_2a
    const/16 v0, 0x8

    goto :goto_1d

    :cond_2b
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->selectedObjectProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    if-eqz v0, :cond_2c

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->objectUUID()Ljava/util/UUID;

    move-result-object v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2c

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->name()Lcom/google/common/base/Optional;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/base/Optional;->orNull()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :goto_1f
    if-nez v0, :cond_20

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->name:Ljava/lang/String;

    goto :goto_1e

    :cond_2c
    move-object v0, v1

    goto :goto_1f

    :cond_2d
    move-object v0, v1

    goto :goto_1e
.end method

.method private updateSimTimeOverride()V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->mGLView:Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getForceDaylightTime()Z

    move-result v1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getForceDaylightHour()F

    move-result v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->mGLView:Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    invoke-virtual {v2, v1, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->setForcedTime(ZF)V

    :cond_0
    return-void
.end method

.method private updateSplitScreenLayout()V
    .locals 7

    const/16 v3, 0x8

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const v4, 0x7f100114

    invoke-virtual {v0, v4}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v4

    const-string/jumbo v5, "updateSplitScreenLayout: isSplitScreen now %b details has %b detached %b"

    const/4 v0, 0x3

    new-array v6, v0, [Ljava/lang/Object;

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->isSplitScreen:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    aput-object v0, v6, v2

    if-eqz v4, :cond_0

    move v0, v1

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    aput-object v0, v6, v1

    if-eqz v4, :cond_1

    invoke-virtual {v4}, Landroid/support/v4/app/Fragment;->isDetached()Z

    move-result v0

    :goto_1
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const/4 v1, 0x2

    aput-object v0, v6, v1

    invoke-static {v5, v6}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz v4, :cond_3

    invoke-virtual {v4}, Landroid/support/v4/app/Fragment;->isDetached()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->detailsContainer:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->worldOverlaysContainer:Landroid/view/ViewGroup;

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->isSplitScreen:Z

    if-eqz v0, :cond_2

    move v0, v2

    :goto_2
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    :goto_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectPopupLeftSpacer:Landroid/view/View;

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->isSplitScreen:Z

    if-eqz v1, :cond_4

    :goto_4
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_0
    move v0, v2

    goto :goto_0

    :cond_1
    move v0, v2

    goto :goto_1

    :cond_2
    move v0, v3

    goto :goto_2

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->worldOverlaysContainer:Landroid/view/ViewGroup;

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    goto :goto_3

    :cond_4
    move v2, v3

    goto :goto_4
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_ui_render_WorldViewActivity-mthref-0(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->onAgentCircuit(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_render_WorldViewActivity-mthref-1(Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->onMyAvatarState(Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_render_WorldViewActivity-mthref-2(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->onSelectedObjectProfile(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_render_WorldViewActivity-mthref-3(Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->onCurrentLocation(Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_render_WorldViewActivity-mthref-4(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->onVoiceActiveChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_render_WorldViewActivity-mthref-5(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->onVoiceChatInfo(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_ui_render_WorldViewActivity-mthref-6(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->onPickedAvatarNameUpdated(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V

    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->detailsContainer:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    return v0

    :cond_0
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    return v0

    :sswitch_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    const/high16 v1, 0x42480000    # 50.0f

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->startTurning(F)V

    :cond_1
    :goto_0
    return v2

    :cond_2
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-ne v0, v2, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->stopTurning()V

    goto :goto_0

    :sswitch_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    const/high16 v1, -0x3db80000    # -50.0f

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->startTurning(F)V

    :cond_3
    :goto_1
    return v2

    :cond_4
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-ne v0, v2, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->stopTurning()V

    goto :goto_1

    :sswitch_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    if-eqz v0, :cond_5

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->stopCamming()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->StartAgentMotion(I)V

    :cond_5
    :goto_2
    return v2

    :cond_6
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-ne v0, v2, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->StopAgentMotion()V

    goto :goto_2

    :sswitch_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    if-eqz v0, :cond_7

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->stopCamming()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->StartAgentMotion(I)V

    :cond_7
    :goto_3
    return v2

    :cond_8
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-ne v0, v2, :cond_7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->StopAgentMotion()V

    goto :goto_3

    :sswitch_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    if-eqz v0, :cond_9

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_a

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->stopCamming()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->StartAgentMotion(I)V

    :cond_9
    :goto_4
    return v2

    :cond_a
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-ne v0, v2, :cond_9

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->StopAgentMotion()V

    goto :goto_4

    :sswitch_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    if-eqz v0, :cond_b

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_c

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->stopCamming()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->StartAgentMotion(I)V

    :cond_b
    :goto_5
    return v2

    :cond_c
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-ne v0, v2, :cond_b

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->StopAgentMotion()V

    goto :goto_5

    :sswitch_data_0
    .sparse-switch
        0x13 -> :sswitch_2
        0x14 -> :sswitch_3
        0x15 -> :sswitch_0
        0x16 -> :sswitch_1
        0x5c -> :sswitch_4
        0x5d -> :sswitch_5
    .end sparse-switch
.end method

.method public handleBakingProgressEvent(Lcom/lumiyaviewer/lumiya/slproto/events/SLBakingProgressEvent;)V
    .locals 2
    .annotation runtime Lcom/lumiyaviewer/lumiya/eventbus/EventHandler;
    .end annotation

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/slproto/events/SLBakingProgressEvent;->first:Z

    if-eqz v0, :cond_0

    const-string/jumbo v0, "Updating avatar appearance..."

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :cond_0
    return-void
.end method

.method public handleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$ChatMessageEvent;)V
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->chatOver3D:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->detailsVisible()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-nez v0, :cond_1

    :cond_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->chatsOverlayLayout:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->fadingTextViewLog:Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->fadingTextViewLog:Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->handleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$ChatMessageEvent;)V

    return-void
.end method

.method public handlePickedObject(Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;)V
    .locals 4

    const/4 v1, 0x0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedIntersectInfo:Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;

    if-eqz p1, :cond_3

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;->objInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    :goto_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAvatar()Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    :goto_1
    invoke-static {v0, v2}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    :cond_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$9;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$9;-><init>(Ljava/lang/Object;)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v3

    invoke-direct {v0, v2, v1, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    :cond_1
    :goto_2
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->updateObjectPanel()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->beginCountingObjectDeselect()V

    :cond_2
    :goto_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->mGLView:Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->setDrawPickedObject(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->updateObjectPanel()V

    return-void

    :cond_3
    move-object v0, v1

    goto :goto_0

    :cond_4
    move-object v0, v1

    goto :goto_1

    :cond_5
    const-string/jumbo v0, "ObjectPick: picked object %d"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->selectedObjectProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->getObjectProfile()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    goto :goto_2

    :cond_6
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->selectedObjectProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedAvatarNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    goto :goto_3
.end method

.method protected isRootDetailsFragment(Ljava/lang/Class;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Landroid/support/v4/app/Fragment;",
            ">;)Z"
        }
    .end annotation

    const/4 v0, 0x1

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;

    if-eq p1, v1, :cond_0

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;

    if-ne p1, v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const-class v1, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;

    if-eq p1, v1, :cond_0

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;

    if-eq p1, v1, :cond_0

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;

    if-eq p1, v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_render_WorldViewActivity_10269(Landroid/animation/ValueAnimator;)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->insetsBackground:Landroid/widget/FrameLayout;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    move-result v1

    const/high16 v2, 0x3f800000    # 1.0f

    sub-float v1, v2, v1

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setAlpha(F)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_render_WorldViewActivity_43183(Landroid/content/DialogInterface;I)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget-byte v2, v2, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->saleType:B

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->salePrice:I

    invoke-virtual {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->BuyObject(IBI)V

    :cond_0
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_render_WorldViewActivity_48476(Ljava/util/List;Landroid/content/DialogInterface;I)V
    .locals 1

    if-ltz p3, :cond_0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-ge p3, v0, :cond_0

    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$SelectableAttachment;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$SelectableAttachment;->getLocalID()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->displayHUD(I)V

    :cond_0
    return-void
.end method

.method public mapThemeResourceId(I)I
    .locals 1

    const v0, 0x7f0b002c

    if-ne p1, v0, :cond_0

    const v0, 0x7f0b002d

    return v0

    :cond_0
    const v0, 0x7f0b002f

    if-ne p1, v0, :cond_1

    const v0, 0x7f0b0030

    return v0

    :cond_1
    const v0, 0x7f0b002e

    return v0
.end method

.method public moveTouchEvent(ILandroid/view/MotionEvent;)V
    .locals 6

    const/high16 v1, 0x3f800000    # 1.0f

    const/high16 v0, -0x40800000    # -1.0f

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    if-eqz v3, :cond_1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    if-nez v3, :cond_4

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->manualCamMode:Z

    if-eqz v3, :cond_2

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->camButtonEnabled:Z

    if-eqz v3, :cond_2

    and-int/lit8 v3, p1, 0x8

    if-eqz v3, :cond_a

    move v3, v1

    :goto_0
    and-int/lit8 v4, p1, 0x10

    if-eqz v4, :cond_9

    move v4, v0

    :goto_1
    and-int/lit8 v3, p1, 0x2

    if-eqz v3, :cond_8

    move v3, v1

    :goto_2
    and-int/lit8 v5, p1, 0x4

    if-eqz v5, :cond_0

    move v3, v0

    :cond_0
    and-int/lit8 v5, p1, 0x20

    if-eqz v5, :cond_7

    :goto_3
    and-int/lit8 v5, p1, 0x40

    if-eqz v5, :cond_6

    :goto_4
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v1, v2, v3, v4, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->startCameraManualControl(FFFF)V

    :cond_1
    :goto_5
    return-void

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->stopCamming()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->StartAgentMotion(I)V

    and-int/lit8 v0, p1, 0x8

    if-nez v0, :cond_3

    and-int/lit8 v0, p1, 0x10

    if-eqz v0, :cond_1

    :cond_3
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->updateObjectPanel()V

    goto :goto_5

    :cond_4
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->manualCamMode:Z

    if-eqz v0, :cond_5

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->camButtonEnabled:Z

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->stopCameraManualControl()V

    goto :goto_5

    :cond_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->StopAgentMotion()V

    goto :goto_5

    :cond_6
    move v0, v1

    goto :goto_4

    :cond_7
    move v1, v2

    goto :goto_3

    :cond_8
    move v3, v2

    goto :goto_2

    :cond_9
    move v4, v3

    goto :goto_1

    :cond_a
    move v3, v2

    goto :goto_0
.end method

.method public onCamOffButton()V
    .locals 2
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f1002f2
        }
    .end annotation

    const/4 v1, 0x0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->camButtonEnabled:Z

    if-eqz v0, :cond_1

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->manualCamMode:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->setCameraManualControl(Z)V

    :cond_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->updateObjectPanel()V

    :cond_1
    return-void
.end method

.method public onCamOnButton()V
    .locals 2
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f1002f1
        }
    .end annotation

    const/4 v1, 0x1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->camButtonEnabled:Z

    if-eqz v0, :cond_1

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->manualCamMode:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->setCameraManualControl(Z)V

    :cond_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->updateObjectPanel()V

    :cond_1
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    invoke-static {p0}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->isSplitScreenNeeded(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->isSplitScreen:Z

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->updateSplitScreenLayout()V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 6

    const/16 v2, 0xc0

    const/4 v5, 0x0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/content/Intent;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->finish()V

    return-void

    :cond_0
    invoke-static {p0}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->isSplitScreenNeeded(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->isSplitScreen:Z

    new-instance v0, Landroid/view/ScaleGestureDetector;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->scaleGestureListener:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    invoke-direct {v0, p0, v1}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->scaleGestureDetector:Landroid/view/ScaleGestureDetector;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->scaleGestureDetector:Landroid/view/ScaleGestureDetector;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/ScaleGestureDetector;->setQuickScaleEnabled(Z)V

    :cond_1
    new-instance v0, Landroid/support/v4/view/GestureDetectorCompat;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->gestureListener:Landroid/view/GestureDetector$OnGestureListener;

    invoke-direct {v0, p0, v1}, Landroid/support/v4/view/GestureDetectorCompat;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->gestureDetector:Landroid/support/v4/view/GestureDetectorCompat;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->initContentView()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->chatsOverlayLayout:Landroid/widget/LinearLayout;

    invoke-static {v2, v2, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v4

    const/16 v2, 0xa0

    invoke-static {v2, v5, v5, v5}, Landroid/graphics/Color;->argb(IIII)I

    move-result v5

    move-object v2, p0

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Landroid/content/Context;Landroid/widget/LinearLayout;II)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->fadingTextViewLog:Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xc

    if-lt v0, v1, :cond_2

    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonsFadeAnimator:Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonsFadeAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonsFadeAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$1;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$1;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    :cond_2
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->updateSplitScreenLayout()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->startFadingButtonsTimer()V

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f120027

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    const/4 v0, 0x1

    return v0
.end method

.method protected onDetailsStackEmpty()Z
    .locals 3

    const/4 v2, 0x0

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onDetailsStackEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->detailsContainer:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->isSplitScreen:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->worldOverlaysContainer:Landroid/view/ViewGroup;

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    :cond_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->beginCountingButtonsFade()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->beginCountingObjectDeselect()V

    return v2

    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method public onGetNotifyCaptureIntent(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;Landroid/content/Intent;)Landroid/content/Intent;
    .locals 3
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const-string/jumbo v0, "NotifyCapture: returning new intent"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, p2}, Landroid/content/Intent;->putExtras(Landroid/content/Intent;)Landroid/content/Intent;

    const-string/jumbo v1, "fromNotification"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const/high16 v1, 0x20000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    return-object v0
.end method

.method public onGlobalOptionsChanged(Lcom/lumiyaviewer/lumiya/GlobalOptions$GlobalOptionsChangedEvent;)V
    .locals 0
    .annotation runtime Lcom/lumiyaviewer/lumiya/eventbus/EventHandler;
    .end annotation

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->updateSimTimeOverride()V

    return-void
.end method

.method public onHUDButton()V
    .locals 2
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f1002f3
        }
    .end annotation

    const/4 v1, 0x0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->displayedHUDid:I

    if-eqz v0, :cond_0

    iput v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->displayedHUDid:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->mGLView:Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->displayedHUDid:I

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->setDisplayedHUDid(I)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->updateObjectPanel()V

    :goto_0
    return-void

    :cond_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->selectHUDtoDisplay()V

    goto :goto_0
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 4

    const/4 v1, 0x0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onNewIntent(Landroid/content/Intent;)V

    const-string/jumbo v0, "NotifyCapture: got newIntent: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonsRestoreTask:Ljava/lang/Runnable;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->beginCountingButtonsFade()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->beginCountingObjectDeselect()V

    const-string/jumbo v0, "fromNotification"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "selection"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo v0, "selection"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    :goto_0
    if-eqz v0, :cond_2

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;

    invoke-static {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    :cond_0
    :goto_1
    return-void

    :cond_1
    move-object v0, v1

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    const-class v0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->makeFragmentArguments(Ljava/util/UUID;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    goto :goto_1
.end method

.method public onObjectChatButton()V
    .locals 1
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f100106
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->chatWithObject(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V

    :cond_0
    return-void
.end method

.method public onObjectMoreButton()V
    .locals 1
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f1002ea
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->showObjectInfo(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V

    :cond_0
    return-void
.end method

.method public onObjectPayButton()V
    .locals 6
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f100222
        }
    .end annotation

    const/4 v5, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const v0, 0x7f090239

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget-byte v1, v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->saleType:B

    if-eqz v1, :cond_2

    new-instance v1, Landroid/support/v7/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f090213

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v0, v3, v5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->salePrice:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v4, 0x1

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/support/v7/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/support/v7/app/AlertDialog$Builder;->setCancelable(Z)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v2, "Yes"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$2;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$2;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v2, v3}, Landroid/support/v7/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v2, "No"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8;-><init>()V

    invoke-virtual {v0, v2, v3}, Landroid/support/v7/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {v1}, Landroid/support/v7/app/AlertDialog$Builder;->show()Landroid/support/v7/app/AlertDialog;

    :cond_1
    :goto_0
    return-void

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isPayable()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->selectedObjectProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-static {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectPayDialog;->show(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;)V

    goto :goto_0
.end method

.method public onObjectSitButton()V
    .locals 2
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f100105
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->SitOnObject(Ljava/util/UUID;)V

    :cond_0
    return-void
.end method

.method public onObjectStandButton()V
    .locals 1
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f100100,
            0x7f100212
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->Stand()V

    :cond_0
    return-void
.end method

.method public onObjectTouchButton()V
    .locals 2
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f100104
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedObject:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->pickedIntersectInfo:Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;

    invoke-direct {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->touchObject(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;)V

    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 4

    const/4 v3, 0x0

    const/4 v2, 0x1

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0

    :pswitch_0
    const-class v0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v1

    invoke-static {v1, v3}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->makeFragmentArguments(Ljava/util/UUID;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    return v2

    :pswitch_1
    const-class v0, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v1

    invoke-static {v1, v3}, Lcom/lumiyaviewer/lumiya/ui/outfits/OutfitsFragment;->makeSelection(Ljava/util/UUID;Ljava/util/UUID;)Landroid/os/Bundle;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    return v2

    :pswitch_2
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->stopAvatarAnimations()V

    return v2

    :pswitch_3
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->isDragging:Z

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->beginDragSelection()V

    :goto_0
    return v2

    :cond_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->endDragSelection()V

    goto :goto_0

    :pswitch_4
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->takeScreenshot()V

    return v2

    :pswitch_5
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->enterCardboardView()V

    return v2

    :pswitch_data_0
    .packed-switch 0x7f100369
        :pswitch_0
        :pswitch_1
        :pswitch_3
        :pswitch_5
        :pswitch_4
        :pswitch_2
    .end packed-switch
.end method

.method public onPause()V
    .locals 3

    const/4 v2, 0x0

    const-string/jumbo v0, "WorldViewActivity: onPause"

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUnreadNotificationManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->clearNotifyCapture(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$NotifyCapture;)V

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->getChatEventBus()Lcom/google/common/eventbus/EventBus;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->chatEventHandler:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/google/common/eventbus/EventBus;->unregister(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->fadingTextViewLog:Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->fadingTextViewLog:Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->clearChatEvents()V

    :cond_0
    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->localDrawingEnabled:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->drawDistance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->drawDistance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->Disable3DView()V

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->mGLView:Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->onPause()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectDeselectTimerTask:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonsFadeTask:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectDeselectTimerStarted:Z

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonsFadeTimerStarted:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->myAvatarState:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->selectedObjectProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->currentLocationInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    invoke-static {}, Ljava/lang/System;->gc()V

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onPause()V

    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 3

    const v0, 0x7f10036c

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    if-eqz v1, :cond_0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    if-lt v0, v2, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_0
    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 4
    .param p2    # [Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # [I
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const-string/jumbo v0, "Cardboard: onRequestPermissionResult, code %d"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const/16 v0, 0x64

    if-ne p1, v0, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->startCardboardActivity()V

    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 5

    const/4 v4, 0x1

    const/4 v2, 0x0

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onResume()V

    const-string/jumbo v0, "WorldViewActivity: onResume"

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "chat_over_3d"

    invoke-interface {v0, v1, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->chatOver3D:Z

    const-string/jumbo v1, "arrows_rotate_avatar"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->arrowsToTurn:Z

    const-string/jumbo v1, "cam_button_enabled"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->camButtonEnabled:Z

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUnreadNotificationManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->setNotifyCapture(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager$NotifyCapture;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->myAvatarState:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->myAvatarState()Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->currentLocationInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getCurrentLocationInfo()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->getChatEventBus()Lcom/google/common/eventbus/EventBus;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->chatEventHandler:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Lcom/google/common/eventbus/EventBus;->register(Ljava/lang/Object;)V

    :cond_0
    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/render/RenderSettings;

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/render/RenderSettings;-><init>(Landroid/content/SharedPreferences;)V

    iget v0, v1, Lcom/lumiyaviewer/lumiya/ui/render/RenderSettings;->drawDistance:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->prefDrawDistance:I

    iput-boolean v4, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->localDrawingEnabled:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->drawDistance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->drawDistance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->prefDrawDistance:I

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->Enable3DView(I)V

    :cond_1
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->camButtonEnabled:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->getIsManualCamming()Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->manualCamMode:Z

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->mGLView:Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->prefDrawDistance:I

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->setDrawDistance(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->mGLView:Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/ui/render/RenderSettings;->avatarCountLimit:I

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->setAvatarCountLimit(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->mGLView:Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->onResume()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->updateObjectPanel()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->fadingTextViewLog:Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->fadingTextViewLog:Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->postRemovingStaleChats()V

    :cond_3
    return-void
.end method

.method protected onStart()V
    .locals 3

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onStart()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->agentCircuits()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->voiceActiveChatter:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getVoiceActiveChatter()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :cond_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->updateSimTimeOverride()V

    return-void
.end method

.method protected onStop()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->voiceActiveChatter:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->voiceChatInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->voiceStatusView:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->setChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onStop()V

    return-void
.end method

.method public onStopFlyingButton()V
    .locals 1
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f1002ee
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->stopFlying()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->updateObjectPanel()V

    :cond_0
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 6

    const/high16 v5, 0x42480000    # 50.0f

    const/high16 v4, -0x3db80000    # -50.0f

    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    :cond_0
    :goto_0
    return v2

    :sswitch_0
    const/4 v0, 0x2

    invoke-virtual {p0, v0, p2}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->moveTouchEvent(ILandroid/view/MotionEvent;)V

    goto :goto_0

    :sswitch_1
    const/4 v0, 0x4

    invoke-virtual {p0, v0, p2}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->moveTouchEvent(ILandroid/view/MotionEvent;)V

    goto :goto_0

    :sswitch_2
    const/16 v0, 0x8

    invoke-virtual {p0, v0, p2}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->moveTouchEvent(ILandroid/view/MotionEvent;)V

    goto :goto_0

    :sswitch_3
    const/16 v0, 0x10

    invoke-virtual {p0, v0, p2}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->moveTouchEvent(ILandroid/view/MotionEvent;)V

    goto :goto_0

    :sswitch_4
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->arrowsToTurn:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->manualCamMode:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->camButtonEnabled:Z

    if-eqz v0, :cond_2

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0, v5, v1, v1, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->startCameraManualControl(FFFF)V

    goto :goto_0

    :cond_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-ne v0, v3, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->stopCameraManualControl()V

    goto :goto_0

    :cond_2
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0, v5}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->startTurning(F)V

    goto :goto_0

    :cond_3
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-ne v0, v3, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->stopTurning()V

    goto :goto_0

    :cond_4
    const/16 v0, 0x20

    invoke-virtual {p0, v0, p2}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->moveTouchEvent(ILandroid/view/MotionEvent;)V

    goto :goto_0

    :sswitch_5
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->arrowsToTurn:Z

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->manualCamMode:Z

    if-eqz v0, :cond_6

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->camButtonEnabled:Z

    if-eqz v0, :cond_6

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0, v4, v1, v1, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->startCameraManualControl(FFFF)V

    goto :goto_0

    :cond_5
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-ne v0, v3, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->stopCameraManualControl()V

    goto/16 :goto_0

    :cond_6
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-nez v0, :cond_7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0, v4}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->startTurning(F)V

    goto/16 :goto_0

    :cond_7
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-ne v0, v3, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->stopTurning()V

    goto/16 :goto_0

    :cond_8
    const/16 v0, 0x40

    invoke-virtual {p0, v0, p2}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->moveTouchEvent(ILandroid/view/MotionEvent;)V

    goto/16 :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x7f1000fc -> :sswitch_0
        0x7f1000fd -> :sswitch_4
        0x7f1000fe -> :sswitch_1
        0x7f1000ff -> :sswitch_5
        0x7f1002ec -> :sswitch_2
        0x7f1002ed -> :sswitch_3
    .end sparse-switch
.end method

.method public onUserInteraction()V
    .locals 2

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->onUserInteraction()V

    const-string/jumbo v0, "ButtonsFade: some user interaction"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonsRestoreTask:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->beginCountingButtonsFade()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->beginCountingObjectDeselect()V

    return-void
.end method

.method public processScreenshot(Landroid/graphics/Bitmap;)V
    .locals 6

    const/4 v5, 0x0

    const/4 v1, 0x0

    :try_start_0
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->getCacheDir()Ljava/io/File;

    move-result-object v2

    const-string/jumbo v3, "screenshots"

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string/jumbo v3, "yyyy-MM-dd-HHmmss"

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v2, v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Lumiya-"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    new-instance v4, Ljava/util/Date;

    invoke-direct {v4}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2, v4}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ".jpg"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v4, 0x50

    invoke-virtual {p1, v2, v4, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    const-string/jumbo v0, "com.lumiyaviewer.files"

    invoke-static {p0, v0, v3}, Landroid/support/v4/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getAgentSLURL()Ljava/lang/String;

    move-result-object v0

    :goto_0
    if-eqz v0, :cond_1

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v1, v3

    const v0, 0x7f0902e4

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_1
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    const-string/jumbo v3, "android.intent.action.SEND"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string/jumbo v3, "android.intent.extra.TEXT"

    invoke-virtual {v1, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string/jumbo v0, "android.intent.extra.STREAM"

    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string/jumbo v0, "android.intent.extra.SUBJECT"

    const-string/jumbo v2, "Screenshot from Lumiya"

    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string/jumbo v0, "image/jpeg"

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const v0, 0x7f090118

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->startActivity(Landroid/content/Intent;)V

    :goto_2
    return-void

    :cond_0
    move-object v0, v1

    goto :goto_0

    :cond_1
    const v0, 0x7f0902e3

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->getString(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_1

    :catch_0
    move-exception v0

    const v0, 0x7f09011e

    invoke-static {p0, v0, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_2
.end method

.method public rendererAdvancedRenderingChanged()V
    .locals 1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->finish()V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method rendererShaderCompileError()V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "CommitPrefEdits"
        }
    .end annotation

    const-string/jumbo v0, "Advanced rendering is not available on your hardware. Falling back to basic rendering."

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "advanced_rendering"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->finish()V

    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method rendererSurfaceCreated()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->drawDistance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->drawDistance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->prefDrawDistance:I

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->Enable3DView(I)V

    :cond_0
    return-void
.end method

.method public setLastTouchUUID(Ljava/util/UUID;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->lastTouchUUID:Ljava/util/UUID;

    return-void
.end method

.method public setTouchedObject(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V
    .locals 2

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->lastTouchUUID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->lastTouchUUID:Ljava/util/UUID;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Touch: Last touched object set to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->lastTouchUUID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public showDetailsFragment(Ljava/lang/Class;Landroid/content/Intent;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Landroid/support/v4/app/Fragment;",
            ">;",
            "Landroid/content/Intent;",
            "Landroid/os/Bundle;",
            ")",
            "Landroid/support/v4/app/Fragment;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->detailsContainer:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->isSplitScreen:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->worldOverlaysContainer:Landroid/view/ViewGroup;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->voiceStatusView:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->disableMic()V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->fadingTextViewLog:Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->fadingTextViewLog:Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->clearChatEvents()V

    :cond_1
    invoke-super {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showDetailsFragment(Ljava/lang/Class;Landroid/content/Intent;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    return-object v0
.end method
