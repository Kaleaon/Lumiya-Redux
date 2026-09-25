package com.lumiyaviewer.lumiya.ui.render;

import android.view.WindowManager;
import android.view.Window;
import com.google.vr.cardboard.FullscreenMode;
import com.google.vr.sdk.base.AndroidCompat;
import com.google.vrtoolkit.cardboard.ScreenOnFlagHelper;
import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.content.Intent;
import android.graphics.Canvas;
import android.graphics.Point;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.opengl.Matrix;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.os.SystemClock;
import androidx.preference.PreferenceManager;
import android.speech.RecognitionListener;
import android.speech.SpeechRecognizer;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.RecyclerView;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.google.common.base.Objects;
import com.google.common.base.Predicate;
import com.google.common.base.Strings;
import com.google.common.collect.ImmutableMap;
import com.google.common.eventbus.Subscribe;
import com.google.common.util.concurrent.AtomicDouble;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.GlobalOptions;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.react.Subscription;
import com.lumiyaviewer.lumiya.react.SubscriptionData;
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey;
import com.lumiyaviewer.lumiya.react.UIThreadExecutor;
import com.lumiyaviewer.lumiya.render.HeadTransformCompat;
import com.lumiyaviewer.lumiya.render.WorldViewRenderer;
import com.lumiyaviewer.lumiya.render.glres.textures.GLExternalTexture;
import com.lumiyaviewer.lumiya.render.picking.ObjectIntersectInfo;
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit;
import com.lumiyaviewer.lumiya.slproto.chat.SLChatPermissionRequestEvent;
import com.lumiyaviewer.lumiya.slproto.chat.SLChatScriptDialog;
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent;
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatYesNoEvent;
import com.lumiyaviewer.lumiya.slproto.modules.SLAvatarControl;
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectAvatarInfo;
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectInfo;
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectProfileData;
import com.lumiyaviewer.lumiya.slproto.types.CameraParams;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever;
import com.lumiyaviewer.lumiya.slproto.users.manager.ActiveChattersManager;
import com.lumiyaviewer.lumiya.slproto.users.manager.CurrentLocationInfo;
import com.lumiyaviewer.lumiya.slproto.users.manager.MyAvatarState;
import com.lumiyaviewer.lumiya.slproto.users.manager.ObjectPopupsManager;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import com.lumiyaviewer.lumiya.ui.chat.ChatFragment;
import com.lumiyaviewer.lumiya.ui.chat.ContactsFragment;
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils;
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity;
import com.lumiyaviewer.lumiya.ui.render.CardboardActivity;
import com.lumiyaviewer.lumiya.ui.render.CardboardControlsPlaceholder;
import com.lumiyaviewer.lumiya.ui.render.vr.VrEye;
import com.lumiyaviewer.lumiya.ui.render.vr.VrInputState;
import com.lumiyaviewer.lumiya.ui.render.vr.VrPose;
import com.lumiyaviewer.lumiya.ui.render.vr.VrRuntime;
import com.lumiyaviewer.lumiya.ui.render.vr.VrRuntimeSelector;
import com.lumiyaviewer.lumiya.ui.render.vr.VrSession;
import com.lumiyaviewer.lumiya.ui.voice.VoiceStatusView;
import com.lumiyaviewer.lumiya.voice.common.model.VoiceChatInfo;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.microedition.khronos.egl.EGLConfig;

@TargetApi(16)
public class CardboardActivity extends DetailsActivity implements ObjectPopupsManager.ObjectPopupListener {

    private static final int DEFAULT_FONT_SIZE_SP = 16;
    private static final int LISTVIEW_SCROLL_DURATION = 500;
    private static final int LISTVIEW_SCROLL_OFFSET = 100;
    private static final int RECYCLERVIEW_SCROLL_OFFSET = 100;
    private static final float VOICE_VIEW_HEIGHT_ALLOWANCE_DP = 60.0f;
    public static final String VR_MODE_TAG = "vrMode";
    private static final float controlDrawSizeFactor = 1.5f;
    private static final float controlSizeFactorX = 1.0f;
    private static final float controlSizeFactorY = 0.75f;
    private static final float crosshairSize = 0.1f;
    private static final int[] dialogButtonIds = {R.id.buttonDialog1, R.id.buttonDialog2, R.id.buttonDialog3, R.id.buttonDialog4, R.id.buttonDialog5, R.id.buttonDialog6, R.id.buttonDialog7, R.id.buttonDialog8, R.id.buttonDialog9, R.id.buttonDialog10, R.id.buttonDialog11, R.id.buttonDialog12};

    ImageButton buttonChat;

    ImageButton buttonMoveBackward;

    ImageButton buttonMoveForward;

    ImageButton buttonObjectChat;

    ImageButton buttonSit;

    ImageButton buttonSpeak;

    ImageButton buttonSpeechSend;

    ImageButton buttonStandUp;

    ImageButton buttonTouch;

    ImageButton buttonTouchObject;

    ImageButton buttonTurnLeft;

    ImageButton buttonTurnRight;

    ViewGroup cardboardAimControls;

    ViewGroup cardboardDetailsPage;

    ViewGroup cardboardObjectControls;

    ViewGroup cardboardPrimaryControls;

    ViewGroup cardboardScriptDialog;

    ViewGroup cardboardSpeakControls;

    LinearLayout chatsOverlayLayout;
    private VrSession vrSession;
    // Window behaviour 3.4.2 applied in VR mode regardless of runtime:
    // keep the screen on, immersive fullscreen (restored after the VR
    // runtime refactor dropped them).
    private final ScreenOnFlagHelper screenOnFlagHelper = new ScreenOnFlagHelper(this);
    private FullscreenMode fullscreenMode;
    private VrRuntime vrRuntime;

    TextView dialogQuestionText;

    ViewGroup moveButtonsLayout;

    ImageButton noButton;

    TextView objectNameView;
    private ViewGroup onScreenControlsLayout;
    private RenderSettings renderSettings;
    private WorldViewRenderer renderer;

    ProgressBar speakLevelIndicator;

    TextView speakNowText;

    TextView speechRecognitionResults;
    private SpeechRecognizer speechRecognizer;
    private Handler stateHandler;
    private UserManager userManager;

    VoiceStatusView voiceStatusView;
    private int voiceViewHeightAllowance;

    ImageButton yesButton;

    TextView yesNoText;
    private final VrSession.Renderer stereoRenderer = new WorldStereoRenderer();
    private boolean isResumed = false;
    private final AtomicBoolean viewDrawPosted = new AtomicBoolean(false);
    private boolean voiceEnabled = false;
    private final SubscriptionData<UUID, SLAgentCircuit> agentCircuit = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            CardboardActivity.this.onAgentCircuit((SLAgentCircuit) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    });
    private final SubscriptionData<SubscriptionSingleKey, MyAvatarState> myAvatarState = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            CardboardActivity.this.onMyAvatarState((MyAvatarState) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    });
    private final SubscriptionData<SubscriptionSingleKey, Boolean> voiceLoggedIn = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            CardboardActivity.this.onVoiceLoginStatusChanged((Boolean) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    });
    private final SubscriptionData<SubscriptionSingleKey, CurrentLocationInfo> currentLocationInfo = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            CardboardActivity.this.onCurrentLocationChanged((CurrentLocationInfo) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    });
    private final SubscriptionData<SubscriptionSingleKey, ChatterID> voiceActiveChatter = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            CardboardActivity.this.onVoiceActiveChatter((ChatterID) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    });
    private final SubscriptionData<ChatterID, VoiceChatInfo> voiceChatInfo = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            CardboardActivity.this.onVoiceChatInfo((VoiceChatInfo) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    });
    private final AtomicReference<GLExternalTexture> externalTextureRef = new AtomicReference<>(null);
    private final AtomicBoolean hitPointUpdatePosted = new AtomicBoolean(false);
    private final Object hitPointLock = new Object();
    private int postedHitPointX = 0;
    private int postedHitPointY = 0;
    private final AtomicBoolean keypadActive = new AtomicBoolean(false);
    private final AtomicDouble keypadTurning = new AtomicDouble(0.0d);
    private final AtomicInteger controllerConnectionState = new AtomicInteger(0);
    private final ImmutableMap<ControlsPage, View.OnTouchListener> outsideTouchListeners = ImmutableMap.of(ControlsPage.pageSpeech, new View.OnTouchListener() {
        private final /* synthetic */ boolean $m$0(View view, MotionEvent motionEvent) {
            return CardboardActivity.this.onSpeakControlsTouch(view, motionEvent);
        }

        @Override
        public final boolean onTouch(View view, MotionEvent motionEvent) {
            return $m$0(view, motionEvent);
        }
    }, ControlsPage.pageObject, new View.OnTouchListener() {
        private final /* synthetic */ boolean $m$0(View view, MotionEvent motionEvent) {
            return CardboardActivity.this.onObjectControlsTouch(view, motionEvent);
        }

        @Override
        public final boolean onTouch(View view, MotionEvent motionEvent) {
            return $m$0(view, motionEvent);
        }
    }, ControlsPage.pageScriptDialog, new View.OnTouchListener() {
        private final /* synthetic */ boolean $m$0(View view, MotionEvent motionEvent) {
            return CardboardActivity.this.onScriptDialogOutsideTouch(view, motionEvent);
        }

        @Override
        public final boolean onTouch(View view, MotionEvent motionEvent) {
            return $m$0(view, motionEvent);
        }
    }, ControlsPage.pageYesNo, new View.OnTouchListener() {
        private final /* synthetic */ boolean $m$0(View view, MotionEvent motionEvent) {
            return CardboardActivity.this.onYesNoOutsideTouch(view, motionEvent);
        }

        @Override
        public final boolean onTouch(View view, MotionEvent motionEvent) {
            return $m$0(view, motionEvent);
        }
    }, ControlsPage.pageDetails, new View.OnTouchListener() {
        private final /* synthetic */ boolean $m$0(View view, MotionEvent motionEvent) {
            return CardboardActivity.this.onDetailsOutsideTouch(view, motionEvent);
        }

        @Override
        public final boolean onTouch(View view, MotionEvent motionEvent) {
            return $m$0(view, motionEvent);
        }
    });

    @Nonnull
    private volatile ControlsPage currentControlsPage = ControlsPage.pageDefault;
    private FadingTextViewLog fadingTextViewLog = null;
    private String lastSpeechRecognitionResults = "";
    private float speechRmsMin = Float.NaN;
    private float speechRmsMax = Float.NaN;
    private boolean isSpeechFinished = false;
    private ChatterID dictationChatterID = null;
    private volatile float headAgentHeading = 0.0f;
    private volatile float neutralAgentHeading = Float.NaN;
    private View hoveringOverButton = null;
    private View hoveringPressedButton = null;
    private SLChatScriptDialog activeScriptDialog = null;
    private SLChatYesNoEvent activeYesNoEvent = null;
    private volatile boolean ownAvatarVisible = false;
    private volatile boolean isWalking = false;
    private int primaryButtonsViewBottom = 0;
    private int moveButtonsTop = 0;
    private final Set<View> touchActivatedButtons = new HashSet();
    private final AtomicReference<SLAvatarControl> avatarControl = new AtomicReference<>();
    private final AtomicBoolean touchRequested = new AtomicBoolean(false);
    private final AtomicReference<ObjectIntersectInfo> pickedObject = new AtomicReference<>();
    private final SubscriptionData<Integer, SLObjectProfileData> selectedObjectProfile = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            CardboardActivity.this.onSelectedObjectProfile((SLObjectProfileData) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    });
    private ChatterNameRetriever pickedAvatarNameRetriever = null;
    private final OnHoverListenerCompat hoverListener = new OnHoverListenerCompat() {
        @Override
        public boolean onHoverEnter(View view) {
            view.setAlpha(1.0f);
            Debug.Printf("Cardboard: hovering enter %d", Integer.valueOf(view.getId()));
            CardboardActivity.this.hoveringOverButton = view;
            CardboardActivity.this.onViewsInvalidated();
            return false;
        }

        @Override
        public boolean onHoverExit(View view) {
            view.setAlpha(0.5f);
            Debug.Printf("Cardboard: hovering exit %d", Integer.valueOf(view.getId()));
            if (CardboardActivity.this.hoveringOverButton == view) {
                CardboardActivity.this.hoveringOverButton = null;
            }
            CardboardActivity.this.onViewsInvalidated();
            return false;
        }
    };
    private final View.OnHoverListener onHoverListener = new View.OnHoverListener() {
        private final /* synthetic */ boolean $m$0(View view, MotionEvent motionEvent) {
            return CardboardActivity.this.m784xd3567aba(view, motionEvent);
        }

        @Override
        public final boolean onHover(View view, MotionEvent motionEvent) {
            return $m$0(view, motionEvent);
        }
    };
    private final RecognitionListener recognitionListener = new RecognitionListener() {
        @Override
        public void onBeginningOfSpeech() {
            Debug.Printf("Cardboard: beginning of speech", new Object[0]);
        }

        @Override
        public void onBufferReceived(byte[] bArr) {
        }

        @Override
        public void onEndOfSpeech() {
            Debug.Printf("Cardboard: end of speech", new Object[0]);
            CardboardActivity.this.speakLevelIndicator.setVisibility(View.INVISIBLE);
            CardboardActivity.this.speakNowText.setVisibility(View.INVISIBLE);
        }

        @Override
        public void onError(int i) {
            String string;
            Debug.Printf("Cardboard: speech error %d", Integer.valueOf(i));
            switch (i) {
                case 1:
                case 2:
                    string = CardboardActivity.this.getString(R.string.speech_recognition_network);
                    break;
                case 3:
                    string = CardboardActivity.this.getString(R.string.speech_recognition_audio_recording_error);
                    break;
                case 4:
                    string = CardboardActivity.this.getString(R.string.speech_recognition_error_server);
                    break;
                case 5:
                default:
                    string = CardboardActivity.this.getString(R.string.speech_recognition_error);
                    break;
                case 6:
                    string = CardboardActivity.this.getString(R.string.speech_recognition_error_timeout);
                    break;
                case 7:
                    string = CardboardActivity.this.getString(R.string.speech_recognition_no_match);
                    break;
                case 8:
                    string = CardboardActivity.this.getString(R.string.speech_recognition_error_busy);
                    break;
                case 9:
                    string = CardboardActivity.this.getString(R.string.speech_recognition_error_permissions);
                    break;
            }
            CardboardActivity.this.showSpeechRecognitionError(string);
        }

        @Override
        public void onEvent(int i, Bundle bundle) {
        }

        @Override
        public void onPartialResults(Bundle bundle) {
            Debug.Printf("Cardboard: speech recognition: got partial results", new Object[0]);
            ArrayList<String> stringArrayList = bundle.getStringArrayList("results_recognition");
            if (stringArrayList == null || stringArrayList.size() <= 0) {
                return;
            }
            String str = stringArrayList.get(0);
            CardboardActivity.this.lastSpeechRecognitionResults = str;
            CardboardActivity.this.speechRecognitionResults.setText(str);
            if (Strings.isNullOrEmpty(str)) {
                return;
            }
            CardboardActivity.this.buttonSpeechSend.setVisibility(View.VISIBLE);
        }

        @Override
        public void onReadyForSpeech(Bundle bundle) {
            CardboardActivity.this.speakNowText.setVisibility(View.VISIBLE);
        }

        @Override
        public void onResults(Bundle bundle) {
            Debug.Printf("Cardboard: speech recognition: got some results", new Object[0]);
            ArrayList<String> stringArrayList = bundle.getStringArrayList("results_recognition");
            if (stringArrayList == null || stringArrayList.size() <= 0) {
                return;
            }
            String str = stringArrayList.get(0);
            CardboardActivity.this.speechRecognitionResults.setText(str);
            CardboardActivity.this.lastSpeechRecognitionResults = str;
            if (Strings.isNullOrEmpty(str)) {
                return;
            }
            CardboardActivity.this.buttonSpeechSend.setVisibility(View.VISIBLE);
            CardboardActivity.this.speakLevelIndicator.setVisibility(View.INVISIBLE);
            CardboardActivity.this.isSpeechFinished = true;
        }

        @Override
        public void onRmsChanged(float f) {
            if (CardboardActivity.this.isSpeechFinished) {
                return;
            }
            if (Float.isNaN(CardboardActivity.this.speechRmsMin) || f < CardboardActivity.this.speechRmsMin) {
                CardboardActivity.this.speechRmsMin = f;
            }
            if (Float.isNaN(CardboardActivity.this.speechRmsMax) || f > CardboardActivity.this.speechRmsMax) {
                CardboardActivity.this.speechRmsMax = f;
            }
            float f2 = CardboardActivity.this.speechRmsMax;
            if (f2 - CardboardActivity.this.speechRmsMin < 1.0f) {
                f2 = CardboardActivity.this.speechRmsMin + 1.0f;
            }
            int round = Math.round(((f - CardboardActivity.this.speechRmsMin) * 100.0f) / (f2 - CardboardActivity.this.speechRmsMin));
            if (round < 0) {
                round = 0;
            }
            if (round > 100) {
                round = 100;
            }
            Debug.Printf("Cardboard: speech recognition: RMS %f", Float.valueOf(f));
            CardboardActivity.this.speakLevelIndicator.setVisibility(View.VISIBLE);
            CardboardActivity.this.speakLevelIndicator.setProgress(round);
        }
    };
    private volatile boolean insideControls = false;
    private boolean hitPointValid = false;
    private long insideSince = 0;
    private int hitPointX = 0;
    private int hitPointY = 0;
    private final int[] locationInWindow = new int[2];
    private Point scrollableViewPoint = new Point();

    @SuppressLint({"HandlerLeak"})
    private final Handler handler = new Handler() {
        @Override
        public void handleMessage(Message message) {
            switch (message.what) {
                case 1:
                    if (message.obj != null && (message.obj instanceof ObjectIntersectInfo)) {
                        ObjectIntersectInfo objectIntersectInfo = (ObjectIntersectInfo) message.obj;
                        Debug.Printf("Cardboard: PICKED OBJECT isAvatar %b localID %d", Boolean.valueOf(objectIntersectInfo.objInfo.isAvatar()), Integer.valueOf(objectIntersectInfo.objInfo.localID));
                        if (!(objectIntersectInfo.objInfo instanceof SLObjectAvatarInfo ? ((SLObjectAvatarInfo) objectIntersectInfo.objInfo).isMyAvatar() : false)) {
                            CardboardActivity.this.handlePickedObject(objectIntersectInfo);
                            break;
                        }
                    }
                    break;
                case 2:
                    if (message.obj != null && (message.obj instanceof SLObjectInfo)) {
                        SLObjectInfo sLObjectInfo = (SLObjectInfo) message.obj;
                        Debug.Printf("Cardboard: touched object isAvatar %b localID %d", Boolean.valueOf(sLObjectInfo.isAvatar()), Integer.valueOf(sLObjectInfo.localID));
                        break;
                    }
                    break;
            }
        }
    };
    private final View.OnClickListener onDialogButtonClick = new View.OnClickListener() {
        @Override
        public void onClick(View view) {
            if (CardboardActivity.this.activeScriptDialog != null) {
                int i = 0;
                while (true) {
                    if (i >= CardboardActivity.dialogButtonIds.length) {
                        i = -1;
                        break;
                    } else if (view.getId() == CardboardActivity.dialogButtonIds[i]) {
                        break;
                    } else {
                        i++;
                    }
                }
                CardboardActivity.this.activeScriptDialog.onDialogButton(CardboardActivity.this.userManager, i);
                CardboardActivity.this.activeScriptDialog = null;
            }
            CardboardActivity.this.handlePickedObject(null);
            CardboardActivity.this.setControlsPage(ControlsPage.pageDefault);
        }
    };
    private final Object chatEventHandler = new AnonymousClass5();
    private final View.OnClickListener onVoiceCallButtonListener = new View.OnClickListener() {
        private final /* synthetic */ void $m$0(View view) {
            CardboardActivity.this.m785xd399c564(view);
        }

        @Override
        public final void onClick(View view) {
            $m$0(view);
        }
    };
    private final VrSession.Listener vrSessionListener = new VrSession.Listener() {
        @Override
        public void onApiStatusChanged(int i) {
            Debug.Printf("Cardboard: controller API status: %d", Integer.valueOf(i));
        }

        @Override
        public void onRecentered() {
            if (CardboardActivity.this.vrSession != null) {
                CardboardActivity.this.vrSession.recenterHeadTracker();
            }
        }
    };
    private final VrSession.InputListener vrInputListener = new AnonymousClass7();

    /* renamed from: com.lumiyaviewer.lumiya.ui.render.CardboardActivity$5, reason: invalid class name */
    class AnonymousClass5 {
        AnonymousClass5() {
        }

        /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_render_CardboardActivity$5_68853, reason: not valid java name */
        /* synthetic */ void m786x4829a1cd(ActiveChattersManager.ChatMessageEvent chatMessageEvent) {
            if (CardboardActivity.this.fadingTextViewLog != null) {
                CardboardActivity.this.fadingTextViewLog.handleChatEvent(chatMessageEvent);
            }
        }

        @Subscribe
        public void onChatMessage(final ActiveChattersManager.ChatMessageEvent chatMessageEvent) {
            CardboardActivity.this.runOnUiThread(new Runnable() {
                private final /* synthetic */ void $m$0() {
                    AnonymousClass5.this.m786x4829a1cd((ActiveChattersManager.ChatMessageEvent) chatMessageEvent);
                }

                @Override
                public final void run() {
                    $m$0();
                }
            });
        }
    }

    /* renamed from: com.lumiyaviewer.lumiya.ui.render.CardboardActivity$7, reason: invalid class name */
    class AnonymousClass7 implements VrSession.InputListener {
        private boolean appButtonPressed = false;

        @Nullable
        private MoveControl activeMoveControl = null;

        AnonymousClass7() {
        }

        /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_render_CardboardActivity$7_78808, reason: not valid java name */
        /* synthetic */ void m787xb2042f3a() {
            CardboardActivity.this.onExternalButtonAction(true);
        }

        /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_render_CardboardActivity$7_78948, reason: not valid java name */
        /* synthetic */ void m788xb2043377() {
            CardboardActivity.this.onExternalButtonAction(false);
        }

        /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_render_CardboardActivity$7_80726, reason: not valid java name */
        /* synthetic */ void m789xb20ea03e(MoveControl moveControl, float f) {
            CardboardActivity.this.handleMoveControl(moveControl, f);
        }

        /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_render_CardboardActivity$7_80931, reason: not valid java name */
        /* synthetic */ void m790xb20ea7da(MoveControl moveControl) {
            CardboardActivity.this.handleMoveControl(moveControl, 0.0f);
        }

        /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_render_CardboardActivity$7_81145, reason: not valid java name */
        /* synthetic */ void m791xb20efe54(MoveControl moveControl, float f) {
            if (CardboardActivity.this.ownAvatarVisible || moveControl == MoveControl.Right || moveControl == MoveControl.Left) {
                CardboardActivity.this.handleMoveControl(moveControl, f);
            }
        }

        /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_render_CardboardActivity$7_81581, reason: not valid java name */
        /* synthetic */ void m792xb20f0dd0(MoveControl moveControl) {
            CardboardActivity.this.handleMoveControl(moveControl, 0.0f);
        }

        @Override
        public void onConnectionStateChanged(int i) {
            Object[] objArr = new Object[1];
            objArr[0] = i == 3 ? "connected" : "disconnected";
            Debug.Printf("Cardboard: Daydream controller is now %s", objArr);
            CardboardActivity.this.controllerConnectionState.set(i);
        }

        @Override
        public void onInputUpdated(VrInputState inputState) {
            final MoveControl moveControl;
            float moveAmount = 0.0f;
            if (inputState.isAppButtonPressed() && (!this.appButtonPressed)) {
                CardboardActivity.this.runOnUiThread(new Runnable() {
                    private final /* synthetic */ void $m$0() {
                        AnonymousClass7.this.m787xb2042f3a();
                    }

                    @Override
                    public final void run() {
                        $m$0();
                    }
                });
            } else if (!inputState.isAppButtonPressed() && this.appButtonPressed) {
                CardboardActivity.this.runOnUiThread(new Runnable() {
                    private final /* synthetic */ void $m$0() {
                        AnonymousClass7.this.m788xb2043377();
                    }

                    @Override
                    public final void run() {
                        $m$0();
                    }
                });
            }
            this.appButtonPressed = inputState.isAppButtonPressed();
            if (!inputState.isTouching()) {
                if (this.activeMoveControl != null) {
                    final MoveControl moveControl2 = this.activeMoveControl;
                    CardboardActivity.this.runOnUiThread(new Runnable() {
                        private final /* synthetic */ void $m$0() {
                            AnonymousClass7.this.m792xb20f0dd0((MoveControl) moveControl2);
                        }

                        @Override
                        public final void run() {
                            $m$0();
                        }
                    });
                    this.activeMoveControl = null;
                    return;
                }
                return;
            }
            float f2 = (inputState.getTouchX() * 2.0f) - 1.0f;
            float f3 = -((inputState.getTouchY() * 2.0f) - 1.0f);
            if (Math.abs(f2) < 0.5f) {
                f2 = 0.0f;
            }
            if (Math.abs(f3) < 0.5f) {
                f3 = 0.0f;
            }
            if (Math.abs(f2) >= Math.abs(f3)) {
                if (f2 > 0.0f) {
                    moveAmount = f2 * 2.0f;
                    moveControl = MoveControl.Right;
                } else if (f2 < 0.0f) {
                    moveAmount = (-f2) * 2.0f;
                    moveControl = MoveControl.Left;
                } else {
                    moveControl = null;
                }
            } else if (f3 > 0.0f) {
                moveControl = MoveControl.Forward;
                moveAmount = f3 * 2.0f;
            } else if (f3 < 0.0f) {
                moveControl = MoveControl.Backward;
                moveAmount = (-f3) * 2.0f;
            } else {
                moveControl = null;
            }
            final float f = moveAmount;
            if (moveControl == this.activeMoveControl) {
                if (moveControl != null) {
                    CardboardActivity.this.runOnUiThread(new Runnable() {
                        private final /* synthetic */ void $m$0() {
                            AnonymousClass7.this.m791xb20efe54((MoveControl) moveControl, f);
                        }

                        @Override
                        public final void run() {
                            $m$0();
                        }
                    });
                }
            } else if (moveControl != null) {
                this.activeMoveControl = moveControl;
                CardboardActivity.this.runOnUiThread(new Runnable() {
                    private final /* synthetic */ void $m$0() {
                        AnonymousClass7.this.m789xb20ea03e((MoveControl) moveControl, f);
                    }

                    @Override
                    public final void run() {
                        $m$0();
                    }
                });
            } else {
                final MoveControl moveControl3 = this.activeMoveControl;
                CardboardActivity.this.runOnUiThread(new Runnable() {
                    private final /* synthetic */ void $m$0() {
                        AnonymousClass7.this.m790xb20ea7da((MoveControl) moveControl3);
                    }

                    @Override
                    public final void run() {
                        $m$0();
                    }
                });
                this.activeMoveControl = null;
            }
        }
    }

    private enum ControlsPage {
        pageDefault(R.id.cardboard_primary_controls),
        pageSpeech(R.id.cardboard_speak_controls),
        pageTouchAim(R.id.cardboard_aim_controls),
        pageObject(R.id.cardboard_object_controls),
        pageScriptDialog(R.id.cardboard_script_dialog),
        pageYesNo(R.id.cardboard_yesno_dialog),
        pageDetails(R.id.cardboard_details_page);

        final int pageViewId;

        ControlsPage(int i) {
            this.pageViewId = i;
        }

        /* renamed from: values, reason: to resolve conflict with enum method */
        public static ControlsPage[] valuesCustom() {
            return values();
        }
    }

    class WorldStereoRenderer implements VrSession.Renderer {
        private static final float TURN_DEGREES = 35.0f;
        private static final float TURN_DEGREES_PER_MS = 0.02f;
        private static final float YAW_AVERAGE_FACTOR = 1.0E-4f;
        private GLExternalTexture externalTexture;
        private int viewportWidth = 0;
        private int viewportHeight = 0;
        private final HeadTransformCompat headTransformCompat = new HeadTransformCompat();
        private boolean agentHeadingAcquired = false;
        private final float[] eyeHitTests = new float[4];
        private final float[] extTextureMatrixUV = new float[16];
        private float eyeSeparation = 0.0f;
        private final float[] eyeOffset = new float[4];
        private final float[] eyeOffsetMatrix = new float[16];
        private final int[] eyeViewport = new int[4];
        private final float[] eyeProjection = new float[32];
        private final boolean[] eyeProjectionValid = new boolean[2];
        private long lastFrameTime = 0;
        private boolean crosshairVisible = false;

        WorldStereoRenderer() {
            Matrix.setIdentityM(this.eyeOffsetMatrix, 0);
            Matrix.rotateM(this.eyeOffsetMatrix, 0, -90.0f, 1.0f, 0.0f, 0.0f);
        }

        /* renamed from: -com_lumiyaviewer_lumiya_ui_render_CardboardActivity$WorldStereoRenderer-mthref-0, reason: not valid java name */
        /* synthetic */ void m793x10c82f4f() {
            CardboardActivity.this.updateExternalTexturePointer();
        }

        /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_render_CardboardActivity$WorldStereoRenderer_58554, reason: not valid java name */
        /* synthetic */ void m794x44e02702() {
            CardboardActivity.this.onNewExternalTexture(this.externalTexture);
            CardboardActivity.this.draw2DUI();
        }

        @Override
        public void onDrawEye(VrEye eye) {
            int type = eye.getType();
            float f = (type == VrEye.TYPE_LEFT ? -0.5f : 0.5f) * this.eyeSeparation;
            for (int i = 0; i < 4; i++) {
                this.eyeOffset[i] = this.headTransformCompat.rightVector[i] * f;
            }
            eye.getViewport(this.eyeViewport, 0);
            int i2 = type == VrEye.TYPE_LEFT ? 0 : 1;
            if (CardboardActivity.this.renderSettings != null && (!this.eyeProjectionValid[i2] || eye.isProjectionChanged())) {
                System.arraycopy(eye.getPerspective(0.5f, CardboardActivity.this.renderSettings.drawDistance), 0, this.eyeProjection, i2 * 16, 16);
            }
            CardboardActivity.this.renderer.onDrawFrame(null, this.headTransformCompat, this.eyeOffset, this.eyeViewport, null, null, 0);
            if (this.externalTexture != null) {
                CardboardActivity.this.renderer.drawExternalTexture(this.externalTexture, this.extTextureMatrixUV, f, this.headTransformCompat.pitchDegrees, this.headTransformCompat.useButtonsYaw, CardboardActivity.controlDrawSizeFactor, 1.125f, this.eyeHitTests, type == VrEye.TYPE_LEFT ? 0 : 2);
                if (this.crosshairVisible) {
                    CardboardActivity.this.renderer.drawCrosshair(CardboardActivity.crosshairSize, f);
                }
            }
        }

        @Override
        public void onFinishFrame() {
            CardboardActivity.this.renderer.onFinishFrame();
            if (this.externalTexture != null) {
                float f = (this.eyeHitTests[0] + this.eyeHitTests[2]) / 2.0f;
                int width = (int) (((f * 2.0f) + 0.5f) * this.externalTexture.getWidth());
                int height = (int) (((-(((this.eyeHitTests[1] + this.eyeHitTests[3]) / 2.0f) * 2.0f)) + 0.5f) * this.externalTexture.getHeight());
                synchronized (CardboardActivity.this.hitPointLock) {
                    CardboardActivity.this.postedHitPointX = width;
                    CardboardActivity.this.postedHitPointY = height;
                }
                if (CardboardActivity.this.hitPointUpdatePosted.getAndSet(true)) {
                    return;
                }
                CardboardActivity.this.runOnUiThread(new Runnable() {
                    private final /* synthetic */ void $m$0() {
                        WorldStereoRenderer.this.m793x10c82f4f();
                    }

                    @Override
                    public final void run() {
                        $m$0();
                    }
                });
            }
        }

        @Override
        public void onNewFrame(VrPose headTransform) {
            SLAvatarControl sLAvatarControl = (SLAvatarControl) CardboardActivity.this.avatarControl.get();
            long uptimeMillis = SystemClock.uptimeMillis();
            headTransform.getQuaternion(this.headTransformCompat.rotationQuat, 0);
            headTransform.getTranslation(this.headTransformCompat.translationVector, 0);
            headTransform.getHeadView(this.headTransformCompat.headTransformMatrix, 0);
            headTransform.getEulerAngles(this.headTransformCompat.eulerAngles, 0);
            headTransform.getRightVector(this.headTransformCompat.rightVectorRaw, 0);
            Matrix.multiplyMV(this.headTransformCompat.rightVector, 0, this.eyeOffsetMatrix, 0, this.headTransformCompat.rightVectorRaw, 0);
            this.headTransformCompat.yawDegrees = CameraParams.wrapAngle(this.headTransformCompat.eulerAngles[1] / 0.017453292f);
            if (sLAvatarControl != null && (!this.agentHeadingAcquired)) {
                this.headTransformCompat.viewExtraYaw = sLAvatarControl.getAgentHeading();
                this.agentHeadingAcquired = true;
                Debug.Printf("Cardboard: agent heading acquired: %.2f", Float.valueOf(this.headTransformCompat.viewExtraYaw));
            }
            if (CardboardActivity.this.currentControlsPage == ControlsPage.pageTouchAim) {
                this.headTransformCompat.pitchDegrees = 0.0f;
                this.headTransformCompat.useButtonsYaw = 0.0f;
                this.headTransformCompat.lastYaw = this.headTransformCompat.eulerAngles[1];
            } else if (CardboardActivity.this.currentControlsPage == ControlsPage.pageObject || CardboardActivity.this.currentControlsPage == ControlsPage.pageYesNo) {
                this.headTransformCompat.pitchDegrees = 0.0f;
                this.headTransformCompat.useButtonsYaw = (this.headTransformCompat.eulerAngles[1] - this.headTransformCompat.lastYaw) / 0.017453292f;
            } else {
                this.headTransformCompat.pitchDegrees = this.headTransformCompat.eulerAngles[0] / 0.017453292f;
                boolean z = false;
                if (CardboardActivity.this.currentControlsPage == ControlsPage.pageSpeech) {
                    z = true;
                } else if (CardboardActivity.this.currentControlsPage == ControlsPage.pageDefault) {
                    z = CardboardActivity.this.insideControls && CardboardActivity.this.hitPointY >= CardboardActivity.this.primaryButtonsViewBottom;
                    if ((!CardboardActivity.this.insideControls || CardboardActivity.this.hitPointY > CardboardActivity.this.moveButtonsTop) && CardboardActivity.this.ownAvatarVisible) {
                        z = false;
                    }
                }
                if (z) {
                    this.headTransformCompat.lastYaw = this.headTransformCompat.eulerAngles[1];
                    this.headTransformCompat.useButtonsYaw = 0.0f;
                } else {
                    this.headTransformCompat.useButtonsYaw = (this.headTransformCompat.eulerAngles[1] - this.headTransformCompat.lastYaw) / 0.017453292f;
                }
            }
            if (this.headTransformCompat.neutralYawValid) {
                long j = uptimeMillis - this.lastFrameTime;
                float angleMinusAngle = CameraParams.angleMinusAngle(this.headTransformCompat.yawDegrees, this.headTransformCompat.neutralYaw);
                boolean z2 = CardboardActivity.this.keypadActive.get() || CardboardActivity.this.controllerConnectionState.get() == 3;
                boolean z3 = false;
                boolean z4 = false;
                float f = 1.0f;
                if (z2) {
                    double d = CardboardActivity.this.keypadTurning.get();
                    z3 = d < 0.0d;
                    z4 = d > 0.0d;
                    f = (float) Math.abs(d);
                }
                if ((angleMinusAngle < -35.0f && (!z2)) || z4) {
                    this.headTransformCompat.viewExtraYaw = CameraParams.wrapAngle(this.headTransformCompat.viewExtraYaw - (f * (j * TURN_DEGREES_PER_MS)));
                } else if ((angleMinusAngle <= TURN_DEGREES || !(!z2)) && !z3) {
                    this.headTransformCompat.neutralYaw = CameraParams.wrapAngle(this.headTransformCompat.neutralYaw + (YAW_AVERAGE_FACTOR * angleMinusAngle * j));
                } else {
                    this.headTransformCompat.viewExtraYaw = CameraParams.wrapAngle((f * j * TURN_DEGREES_PER_MS) + this.headTransformCompat.viewExtraYaw);
                }
            } else {
                this.headTransformCompat.neutralYawValid = true;
                this.headTransformCompat.neutralYaw = this.headTransformCompat.yawDegrees;
            }
            if (this.headTransformCompat.viewExtraYaw != CardboardActivity.this.neutralAgentHeading || Float.isNaN(CardboardActivity.this.neutralAgentHeading)) {
                CardboardActivity.this.neutralAgentHeading = CameraParams.wrapAngle(this.headTransformCompat.viewExtraYaw);
            }
            CardboardActivity.this.headAgentHeading = CameraParams.wrapAngle(this.headTransformCompat.yawDegrees + this.headTransformCompat.viewExtraYaw);
            if (!Float.isNaN(CardboardActivity.this.neutralAgentHeading) && sLAvatarControl != null) {
                sLAvatarControl.setAgentHeading(CardboardActivity.this.isWalking ? CardboardActivity.this.headAgentHeading : CardboardActivity.this.neutralAgentHeading);
            }
            this.lastFrameTime = uptimeMillis;
            CardboardActivity.this.renderer.setOwnAvatarHidden(!CardboardActivity.this.ownAvatarVisible);
            CardboardActivity.this.renderer.onPrepareFrame(this.headTransformCompat);
            if (CardboardActivity.this.touchRequested.getAndSet(false)) {
                CardboardActivity.this.renderer.pickObject(this.viewportWidth / 2, this.viewportHeight / 2, CardboardActivity.this.handler);
            }
            ObjectIntersectInfo objectIntersectInfo = (ObjectIntersectInfo) CardboardActivity.this.pickedObject.get();
            CardboardActivity.this.renderer.setDrawPickedObject(objectIntersectInfo != null ? objectIntersectInfo.objInfo : null);
            this.crosshairVisible = CardboardActivity.this.currentControlsPage == ControlsPage.pageDetails ? CardboardActivity.this.insideControls : false;
            if (this.externalTexture != null) {
                this.externalTexture.update(this.extTextureMatrixUV);
            }
        }

        @Override
        public void onRendererShutdown() {
            this.externalTexture.release();
            this.externalTexture = null;
            CardboardActivity.this.renderer.onRendererShutdown();
        }

        @Override
        public void onSurfaceChanged(int i, int i2) {
            this.viewportWidth = i;
            this.viewportHeight = i2;
            CardboardActivity.this.renderer.onSurfaceChanged(null, i, i2);
            if (this.externalTexture != null) {
                this.externalTexture.release();
            }
            this.externalTexture = new GLExternalTexture((int) (i * 1.0f), ((int) (i2 * CardboardActivity.controlSizeFactorY)) + CardboardActivity.this.voiceViewHeightAllowance);
            this.eyeSeparation = CardboardActivity.this.vrSession != null ? CardboardActivity.this.vrSession.getInterpupillaryDistance() : 0.0f;
            this.headTransformCompat.neutralYawValid = false;
            CardboardActivity.this.runOnUiThread(new Runnable() {
                private final /* synthetic */ void $m$0() {
                    WorldStereoRenderer.this.m794x44e02702();
                }

                @Override
                public final void run() {
                    $m$0();
                }
            });
        }

        @Override
        public void onSurfaceCreated(EGLConfig eGLConfig) {
            CardboardActivity.this.renderer.onSurfaceCreated(null, eGLConfig, true);
        }
    }

    private void closeSpeechControls() {
        if (this.speechRecognizer != null) {
            this.speechRecognizer.stopListening();
        }
        if (getCurrentDetailsFragment() != null) {
            setControlsPage(ControlsPage.pageDetails);
        } else {
            setControlsPage(ControlsPage.pageDefault);
        }
    }

    public void draw2DUI() {
        GLExternalTexture gLExternalTexture = this.externalTextureRef.get();
        if (gLExternalTexture != null) {
            try {
                Canvas canvas = gLExternalTexture.getCanvas();
                drawExternalViews(canvas);
                gLExternalTexture.postCanvas(canvas);
            } catch (IllegalStateException e) {
            }
        }
    }

    private void drawExternalViews(Canvas canvas) {
        canvas.drawColor(0, PorterDuff.Mode.CLEAR);
        this.onScreenControlsLayout.draw(canvas);
    }

    public void drawViews() {
        this.viewDrawPosted.set(false);
        Debug.Printf("Cardboard: drawing 2D UI", new Object[0]);
        draw2DUI();
    }

    @TargetApi(19)
    private View findMatchingView(ViewGroup viewGroup, int i, int i2, int i3, int i4, Predicate<View> predicate, Point point) {
        View findMatchingView;
        for (int i5 = 0; i5 < viewGroup.getChildCount(); i5++) {
            View childAt = viewGroup.getChildAt(i5);
            if (childAt.getVisibility() == 0 && childAt.isAttachedToWindow() && predicate.apply(childAt)) {
                childAt.getLocationInWindow(this.locationInWindow);
                int i6 = this.locationInWindow[0];
                int i7 = this.locationInWindow[1];
                if (new Rect(i6, i7, childAt.getWidth() + i6, childAt.getHeight() + i7).contains(i, i2)) {
                    point.set(i - i6, i2 - i7);
                    return childAt;
                }
            }
        }
        int i8 = 0;
        while (true) {
            int i9 = i8;
            if (i9 >= viewGroup.getChildCount()) {
                return null;
            }
            View childAt2 = viewGroup.getChildAt(i9);
            if (childAt2.getVisibility() == 0 && childAt2.isAttachedToWindow() && (childAt2 instanceof ViewGroup) && (findMatchingView = findMatchingView((ViewGroup) childAt2, i, i2, 0, 0, predicate, point)) != null) {
                return findMatchingView;
            }
            i8 = i9 + 1;
        }
    }

    public void handleMoveControl(@Nonnull MoveControl moveControl, float f) {
        SLAvatarControl sLAvatarControl = this.avatarControl.get();
        if (sLAvatarControl != null) {
            switch (moveControl) {
                case Backward:
                    if (f == 0.0f) {
                        if (!this.ownAvatarVisible) {
                            stopWalking();
                            break;
                        } else {
                            sLAvatarControl.stopCameraManualControl();
                            break;
                        }
                    } else {
                        this.keypadActive.set(true);
                        if (!this.ownAvatarVisible) {
                            startWalking(false);
                            break;
                        } else {
                            sLAvatarControl.startCameraManualControl(0.0f, (-1.0f) * f, 0.0f, 0.0f);
                            break;
                        }
                    }
                case Forward:
                    if (f == 0.0f) {
                        if (!this.ownAvatarVisible) {
                            stopWalking();
                            break;
                        } else {
                            sLAvatarControl.stopCameraManualControl();
                            break;
                        }
                    } else {
                        this.keypadActive.set(true);
                        if (!this.ownAvatarVisible) {
                            startWalking(true);
                            break;
                        } else {
                            sLAvatarControl.startCameraManualControl(0.0f, 1.0f * f, 0.0f, 0.0f);
                            break;
                        }
                    }
                case Left:
                    if (f == 0.0f) {
                        this.keypadTurning.set(0.0d);
                        break;
                    } else {
                        this.keypadActive.set(true);
                        this.keypadTurning.set(-f);
                        break;
                    }
                case Right:
                    if (f == 0.0f) {
                        this.keypadTurning.set(0.0d);
                        break;
                    } else {
                        this.keypadActive.set(true);
                        this.keypadTurning.set(f);
                        break;
                    }
            }
        }
    }

    public void handlePickedObject(ObjectIntersectInfo objectIntersectInfo) {
        SLObjectInfo sLObjectInfo = objectIntersectInfo != null ? objectIntersectInfo.objInfo : null;
        if (sLObjectInfo == null) {
            this.selectedObjectProfile.unsubscribe();
            if (this.pickedAvatarNameRetriever != null) {
                this.pickedAvatarNameRetriever.dispose();
                this.pickedAvatarNameRetriever = null;
            }
            this.pickedObject.set(null);
            setControlsPage(ControlsPage.pageDefault);
            return;
        }
        this.pickedObject.set(objectIntersectInfo);
        if (sLObjectInfo.isAvatar()) {
            ChatterID.ChatterIDUser userChatterID = ChatterID.getUserChatterID(this.userManager.getUserID(), sLObjectInfo.getId());
            if (!Objects.equal(this.pickedAvatarNameRetriever != null ? this.pickedAvatarNameRetriever.chatterID : null, userChatterID)) {
                if (this.pickedAvatarNameRetriever != null) {
                    this.pickedAvatarNameRetriever.dispose();
                    this.pickedAvatarNameRetriever = null;
                }
                this.pickedAvatarNameRetriever = new ChatterNameRetriever(userChatterID, new ChatterNameRetriever.OnChatterNameUpdated() {
                    private final /* synthetic */ void $m$0(ChatterNameRetriever chatterNameRetriever) {
                        CardboardActivity.this.onPickedAvatarNameUpdated(chatterNameRetriever);
                    }

                    @Override
                    public final void onChatterNameUpdated(ChatterNameRetriever chatterNameRetriever) {
                        $m$0(chatterNameRetriever);
                    }
                }, UIThreadExecutor.getInstance());
            }
        } else {
            Debug.Printf("ObjectPick: picked object %d", Integer.valueOf(sLObjectInfo.localID));
            this.selectedObjectProfile.subscribe(this.userManager.getObjectsManager().getObjectProfile(), Integer.valueOf(sLObjectInfo.localID));
        }
        setControlsPage(ControlsPage.pageObject);
        updateObjectPanel();
    }

    public boolean isViewScrollable(View view) {
        if (view instanceof ListView) {
            return true;
        }
        return view instanceof RecyclerView;
    }

    private boolean isVoiceLoggedIn() {
        Boolean data = this.voiceLoggedIn.getData();
        if (data != null) {
            return data.booleanValue();
        }
        return false;
    }

    public void onAgentCircuit(SLAgentCircuit sLAgentCircuit) {
        updateDrawingEnabled();
        this.avatarControl.set(sLAgentCircuit != null ? sLAgentCircuit.getModules().avatarControl : null);
    }

    public void onCardboardTrigger() {
        Object[] objArr = new Object[3];
        objArr[0] = Integer.valueOf(this.hoveringOverButton != null ? this.hoveringOverButton.getId() : -1);
        objArr[1] = Integer.valueOf(this.hoveringPressedButton != null ? this.hoveringPressedButton.getId() : -1);
        objArr[2] = Boolean.valueOf(this.hitPointValid);
        Debug.Printf("Cardboard: trigger, hover over %d, hover pressed %d, hitPointValid %b", objArr);
        if (this.hoveringPressedButton == null && this.hitPointValid) {
            long uptimeMillis = SystemClock.uptimeMillis();
            if (!this.insideControls) {
                View.OnTouchListener onTouchListener = this.outsideTouchListeners.get(this.currentControlsPage);
                Debug.Printf("Cardboard: outside touch, listener %s", onTouchListener);
                if (onTouchListener != null) {
                    onTouchListener.onTouch(findViewById(this.currentControlsPage.pageViewId), MotionEvent.obtain(uptimeMillis, uptimeMillis + 100, 1, 0.0f, 0.0f, 0));
                    return;
                }
                return;
            }
            if (this.hoveringOverButton == null || (!this.touchActivatedButtons.contains(this.hoveringOverButton))) {
                MotionEvent obtain = MotionEvent.obtain(this.insideSince, uptimeMillis, 0, this.hitPointX, this.hitPointY, 0);
                obtain.setSource(2);
                this.onScreenControlsLayout.dispatchTouchEvent(obtain);
                MotionEvent obtain2 = MotionEvent.obtain(this.insideSince, uptimeMillis + 1, 1, this.hitPointX, this.hitPointY, 0);
                obtain2.setSource(2);
                this.onScreenControlsLayout.dispatchTouchEvent(obtain2);
            }
        }
    }

    public void onCurrentLocationChanged(CurrentLocationInfo currentLocationInfo) {
        updateVoiceIndication();
    }

    public boolean onDetailsOutsideTouch(View view, MotionEvent motionEvent) {
        switch (motionEvent.getActionMasked()) {
            case 1:
                handleBackPressed();
                break;
        }
        return true;
    }

    public void onExternalButtonAction(boolean z) {
        long uptimeMillis = SystemClock.uptimeMillis();
        if (!z) {
            MotionEvent obtain = MotionEvent.obtain(uptimeMillis, uptimeMillis, 1, this.hitPointX, this.hitPointY, 0);
            obtain.setSource(2);
            onVrTouchInternal(obtain, true);
        } else {
            MotionEvent obtain2 = MotionEvent.obtain(uptimeMillis, uptimeMillis, 0, this.hitPointX, this.hitPointY, 0);
            obtain2.setSource(2);
            onVrTouchInternal(obtain2, true);
            onCardboardTrigger();
        }
    }

    @TargetApi(14)
    private void onExternalTexturePointer(int i, int i2) {
        View findMatchingView;
        this.hitPointValid = true;
        this.hitPointX = i;
        this.hitPointY = i2;
        GLExternalTexture gLExternalTexture = this.externalTextureRef.get();
        if (gLExternalTexture != null) {
            if (!(i >= 0 && i < gLExternalTexture.getWidth() && i2 >= 0 && i2 < gLExternalTexture.getHeight())) {
                if (this.insideControls) {
                    this.insideControls = false;
                    MotionEvent obtain = MotionEvent.obtain(this.insideSince, SystemClock.uptimeMillis(), 10, i, i2, 0);
                    obtain.setSource(2);
                    this.onScreenControlsLayout.dispatchGenericMotionEvent(obtain);
                    return;
                }
                return;
            }
            if (!this.insideControls) {
                this.insideControls = true;
                this.insideSince = SystemClock.uptimeMillis();
                MotionEvent obtain2 = MotionEvent.obtain(this.insideSince, this.insideSince, 9, i, i2, 0);
                obtain2.setSource(2);
                this.onScreenControlsLayout.dispatchGenericMotionEvent(obtain2);
            }
            MotionEvent obtain3 = MotionEvent.obtain(this.insideSince, SystemClock.uptimeMillis(), 7, i, i2, 0);
            obtain3.setSource(2);
            this.onScreenControlsLayout.dispatchGenericMotionEvent(obtain3);
            if (this.currentControlsPage != ControlsPage.pageDetails || (findMatchingView = findMatchingView(this.cardboardDetailsPage, i, i2, 0, 0, new Predicate() {
                private final /* synthetic */ boolean $m$0(Object obj) {
                    return CardboardActivity.this.isViewScrollable((View) obj);
                }

                @Override
                public final boolean apply(Object obj) {
                    return $m$0(obj);
                }
            }, this.scrollableViewPoint)) == null) {
                return;
            }
            int height = findMatchingView.getHeight();
            if (this.scrollableViewPoint.y < height / 4) {
                Debug.Printf("Cardboard: want to scroll up %s", findMatchingView);
                if (findMatchingView instanceof ListView) {
                    ((ListView) findMatchingView).smoothScrollBy(-100, 500);
                    return;
                } else {
                    if (findMatchingView instanceof RecyclerView) {
                        ((RecyclerView) findMatchingView).smoothScrollBy(0, -100);
                        return;
                    }
                    return;
                }
            }
            if (this.scrollableViewPoint.y > (height * 3) / 4) {
                Debug.Printf("Cardboard: want to scroll down %s", findMatchingView);
                if (findMatchingView instanceof ListView) {
                    ((ListView) findMatchingView).smoothScrollBy(100, 500);
                } else if (findMatchingView instanceof RecyclerView) {
                    ((RecyclerView) findMatchingView).smoothScrollBy(0, 100);
                }
            }
        }
    }

    public void onMyAvatarState(MyAvatarState myAvatarState) {
        SLAvatarControl sLAvatarControl;
        if (myAvatarState.isSitting()) {
            this.moveButtonsLayout.setVisibility(View.VISIBLE);
            this.buttonStandUp.setVisibility(View.VISIBLE);
            this.ownAvatarVisible = true;
            return;
        }
        if (this.ownAvatarVisible && (sLAvatarControl = this.avatarControl.get()) != null) {
            sLAvatarControl.setCameraManualControl(false);
            sLAvatarControl.setAgentHeading(this.neutralAgentHeading);
        }
        this.moveButtonsLayout.setVisibility(View.GONE);
        this.buttonStandUp.setVisibility(View.GONE);
        this.ownAvatarVisible = false;
    }

    public void onNewExternalTexture(GLExternalTexture gLExternalTexture) {
        this.externalTextureRef.set(gLExternalTexture);
        ((CardboardControlsPlaceholder) findViewById(R.id.controls_placeholder)).setFixedSize(gLExternalTexture.getWidth(), gLExternalTexture.getHeight());
    }

    public void onPickedAvatarNameUpdated(ChatterNameRetriever chatterNameRetriever) {
        this.objectNameView.setText(chatterNameRetriever.getResolvedName());
    }

    public void onSelectedObjectProfile(SLObjectProfileData sLObjectProfileData) {
        this.objectNameView.setText(sLObjectProfileData.name().or(getString(R.string.object_name_loading)));
    }

    public void onViewsInvalidated() {
        if (this.viewDrawPosted.getAndSet(true)) {
            return;
        }
        Debug.Printf("Cardboard: posting draw views", new Object[0]);
        this.handler.post(new Runnable() {
            private final /* synthetic */ void $m$0() {
                CardboardActivity.this.drawViews();
            }

            @Override
            public final void run() {
                $m$0();
            }
        });
    }

    public void onVoiceActiveChatter(ChatterID chatterID) {
        if (this.voiceStatusView != null) {
            this.voiceStatusView.setChatterID(chatterID);
        }
        if (this.userManager == null || chatterID == null) {
            this.voiceChatInfo.unsubscribe();
        } else {
            this.voiceChatInfo.subscribe(this.userManager.getVoiceChatInfo(), chatterID);
        }
    }

    public void onVoiceChatInfo(VoiceChatInfo voiceChatInfo) {
        updateVoiceIndication();
    }

    public void onVoiceLoginStatusChanged(Boolean bool) {
        updateVoiceIndication();
    }

    public boolean onVrTouch(View view, MotionEvent motionEvent) {
        return onVrTouchInternal(motionEvent, false);
    }

    private boolean onVrTouchInternal(MotionEvent motionEvent, boolean z) {
        int actionMasked = motionEvent.getActionMasked();
        String str = actionMasked == 0 ? "down" : actionMasked == 1 ? "up" : null;
        if (str != null) {
            Object[] objArr = new Object[3];
            objArr[0] = str;
            objArr[1] = Integer.valueOf(this.hoveringOverButton != null ? this.hoveringOverButton.getId() : -1);
            objArr[2] = Integer.valueOf(this.hoveringPressedButton != null ? this.hoveringPressedButton.getId() : -1);
            Debug.Printf("Cardboard: vr touch %s, hover over %d, hover pressed %d", objArr);
        }
        if (this.hoveringPressedButton != null && actionMasked == 1) {
            Debug.Printf("Cardboard: touch act: release on button %s", this.hoveringPressedButton);
            this.hoveringPressedButton.dispatchTouchEvent(motionEvent);
            this.hoveringPressedButton = null;
            return true;
        }
        if (this.currentControlsPage == ControlsPage.pageDefault) {
            if (this.hoveringOverButton == null) {
                if (!z) {
                    switch (actionMasked) {
                        case 0:
                            startWalking(true);
                            break;
                        case 1:
                            stopWalking();
                            break;
                        default:
                            Debug.Printf("Cardboard: MotionEvent: %s", motionEvent.toString());
                            break;
                    }
                }
            } else if (this.touchActivatedButtons.contains(this.hoveringOverButton) && actionMasked == 0) {
                Debug.Printf("Cardboard: touch act: press on button %s", this.hoveringOverButton);
                this.hoveringPressedButton = this.hoveringOverButton;
                this.hoveringOverButton.dispatchTouchEvent(motionEvent);
            }
        }
        return false;
    }

    public void setControlsPage(@Nonnull ControlsPage controlsPage) {
        ControlsPage[] valuesCustom = ControlsPage.values();
        int length = valuesCustom.length;
        for (int i = 0; i < length; i++) {
            ControlsPage controlsPage2 = valuesCustom[i];
            findViewById(controlsPage2.pageViewId).setVisibility(controlsPage2 == controlsPage ? View.VISIBLE : View.INVISIBLE);
        }
        this.currentControlsPage = controlsPage;
    }

    public void showSpeechRecognitionError(String str) {
        this.speakNowText.setVisibility(View.INVISIBLE);
        this.speakLevelIndicator.setVisibility(View.INVISIBLE);
        this.buttonSpeechSend.setVisibility(View.INVISIBLE);
        this.speechRecognitionResults.setText(str);
        this.isSpeechFinished = true;
    }

    private void startWalking(boolean z) {
        SLAgentCircuit data = this.agentCircuit.getData();
        if (data != null) {
            this.isWalking = true;
            SLAvatarControl sLAvatarControl = data.getModules().avatarControl;
            sLAvatarControl.setAgentHeading(this.headAgentHeading);
            sLAvatarControl.StartAgentMotion(z ? 2 : 4);
        }
    }

    private void stopWalking() {
        SLAgentCircuit data = this.agentCircuit.getData();
        if (data != null) {
            data.getModules().avatarControl.StopAgentMotion();
            this.isWalking = false;
        }
    }

    private void updateDrawingEnabled() {
        SLAgentCircuit data = this.agentCircuit.getData();
        if (data == null || this.renderSettings == null) {
            return;
        }
        if (this.isResumed) {
            data.getModules().drawDistance.Enable3DView(this.renderSettings.drawDistance);
        } else {
            data.getModules().drawDistance.Disable3DView();
        }
    }

    public void updateExternalTexturePointer() {
        int i;
        int i2;
        if (this.hitPointUpdatePosted.getAndSet(false)) {
            synchronized (this.hitPointLock) {
                i = this.postedHitPointX;
                i2 = this.postedHitPointY;
            }
            onExternalTexturePointer(i, i2);
        }
    }

    private void updateObjectPanel() {
        ObjectIntersectInfo objectIntersectInfo = this.pickedObject.get();
        SLObjectInfo sLObjectInfo = objectIntersectInfo != null ? objectIntersectInfo.objInfo : null;
        if (sLObjectInfo == null) {
            setControlsPage(ControlsPage.pageDefault);
            return;
        }
        if (sLObjectInfo.isAvatar()) {
            this.buttonSit.setVisibility(View.GONE);
            this.buttonTouchObject.setVisibility(View.GONE);
            this.buttonObjectChat.setVisibility(View.VISIBLE);
        } else {
            this.buttonSit.setVisibility(View.VISIBLE);
            this.buttonTouchObject.setVisibility(sLObjectInfo.isTouchable() ? View.VISIBLE : View.GONE);
            this.buttonObjectChat.setVisibility(View.GONE);
        }
    }

    private void updateVoiceIndication() {
        boolean isVoiceLoggedIn = isVoiceLoggedIn();
        CurrentLocationInfo data = this.currentLocationInfo.getData();
        this.voiceStatusView.setCanConnect((!isVoiceLoggedIn || data == null || data.parcelVoiceChannel() == null) ? false : true);
        ChatterID data2 = this.voiceActiveChatter.getData();
        VoiceChatInfo data3 = this.voiceChatInfo.getData();
        if (data2 == null || data3 == null || data3.state == VoiceChatInfo.VoiceChatState.None) {
            this.buttonSpeak.setVisibility(View.VISIBLE);
        } else {
            this.buttonSpeak.setVisibility(View.INVISIBLE);
        }
    }

    @Override
    protected boolean acceptsDetailFragment(Class<? extends Fragment> cls) {
        if (ContactsFragment.class.isAssignableFrom(cls)) {
            return true;
        }
        return ChatFragment.class.isAssignableFrom(cls);
    }

    @Override
    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        Debug.Printf("Cardboard: dispatch key event: keycode %d", Integer.valueOf(keyEvent.getKeyCode()));
        if (this.avatarControl.get() != null) {
            switch (keyEvent.getKeyCode()) {
                case 19:
                    if (keyEvent.getAction() == 0) {
                        this.keypadActive.set(true);
                        handleMoveControl(MoveControl.Forward, 1.0f);
                    } else if (keyEvent.getAction() == 1) {
                        handleMoveControl(MoveControl.Forward, 0.0f);
                    }
                    return true;
                case 20:
                    if (keyEvent.getAction() == 0) {
                        this.keypadActive.set(true);
                        handleMoveControl(MoveControl.Backward, 1.0f);
                    } else if (keyEvent.getAction() == 1) {
                        handleMoveControl(MoveControl.Backward, 0.0f);
                    }
                    return true;
                case 21:
                    if (keyEvent.getAction() == 0) {
                        handleMoveControl(MoveControl.Left, 1.0f);
                    } else if (keyEvent.getAction() == 1) {
                        handleMoveControl(MoveControl.Left, 0.0f);
                    }
                    return true;
                case 22:
                    if (keyEvent.getAction() == 0) {
                        this.keypadActive.set(true);
                        handleMoveControl(MoveControl.Right, 1.0f);
                    } else if (keyEvent.getAction() == 1) {
                        handleMoveControl(MoveControl.Right, 0.0f);
                    }
                    return true;
                case 23:
                    return true;
                case 62:
                case 96:
                    if (keyEvent.getAction() == 0) {
                        onExternalButtonAction(true);
                    } else if (keyEvent.getAction() == 1) {
                        onExternalButtonAction(false);
                    }
                    return true;
            }
        }
        return super.dispatchKeyEvent(keyEvent);
    }

    @Override
    public boolean handleBackPressed() {
        if (this.currentControlsPage != ControlsPage.pageDetails) {
            return false;
        }
        return super.handleBackPressed();
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_render_CardboardActivity_16797, reason: not valid java name */
    /* synthetic */ void m782xd3478a38() {
        int height = this.speechRecognitionResults.getHeight() / this.speechRecognitionResults.getLineHeight();
        Debug.Printf("Cardboard: setting max lines = %d", Integer.valueOf(height));
        int i = height >= 1 ? height : 1;
        if (this.speechRecognitionResults.getMaxLines() != i) {
            this.speechRecognitionResults.setMaxLines(i);
            this.speechRecognitionResults.setEllipsize(TextUtils.TruncateAt.END);
        }
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_render_CardboardActivity_17418, reason: not valid java name */
    /* synthetic */ void m783xd347f25d() {
        this.primaryButtonsViewBottom = this.buttonTouch.getTop() + this.buttonTouch.getHeight();
        this.moveButtonsTop = this.moveButtonsLayout.getTop();
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_render_CardboardActivity_28338, reason: not valid java name */
    /* synthetic */ boolean m784xd3567aba(View view, MotionEvent motionEvent) {
        switch (motionEvent.getActionMasked()) {
            case 9:
                return this.hoverListener.onHoverEnter(view);
            case 10:
                return this.hoverListener.onHoverExit(view);
            default:
                return false;
        }
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_render_CardboardActivity_71435, reason: not valid java name */
    /* synthetic */ void m785xd399c564(View view) {
        SLAgentCircuit data = this.agentCircuit.getData();
        CurrentLocationInfo data2 = this.currentLocationInfo.getData();
        if (!this.voiceEnabled || data == null || !isVoiceLoggedIn() || data2 == null || data2.parcelVoiceChannel() == null) {
            return;
        }
        data.getModules().voice.nearbyVoiceChatRequest(data2.parcelVoiceChannel());
    }

    public boolean onAimControlsTouch(View view, MotionEvent motionEvent) {
        Debug.Printf("Cardboard: aim controls touched, view %s", view);
        switch (motionEvent.getActionMasked()) {
            case 1:
                this.touchRequested.set(true);
            default:
                return true;
        }
    }

    public boolean onCamButtonTouch(View view, MotionEvent motionEvent) {
        float f = 1.0f;
        float f2 = -1.0f;
        Debug.Printf("Cardboard: cam button: event %s button %s", motionEvent, view);
        SLAvatarControl sLAvatarControl = this.avatarControl.get();
        if (sLAvatarControl != null) {
            if (motionEvent.getActionMasked() == 0) {
                switch (view.getId()) {
                    case R.id.button_move_forward:
                        f2 = 1.0f;
                        f = 0.0f;
                        break;
                    case R.id.button_turn_left:
                        f2 = 0.0f;
                        break;
                    case R.id.button_move_backward:
                        f = 0.0f;
                        break;
                    case R.id.button_turn_right:
                        f = -1.0f;
                        f2 = 0.0f;
                        break;
                    default:
                        f = 0.0f;
                        f2 = 0.0f;
                        break;
                }
                sLAvatarControl.startCameraManualControl(0.0f, f2, 0.0f, f);
            } else if (motionEvent.getActionMasked() == 1) {
                sLAvatarControl.stopCameraManualControl();
            }
        }
        return true;
    }

    public void onChatButton() {
        if (this.userManager != null) {
            setControlsPage(ControlsPage.pageDetails);
            Bundle makeFragmentArguments = ActivityUtils.makeFragmentArguments(this.userManager.getUserID(), null);
            makeFragmentArguments.putBoolean(VR_MODE_TAG, true);
            DetailsActivity.showEmbeddedDetails(this, ContactsFragment.class, makeFragmentArguments);
        }
    }

    @Override
    protected void onCreate(Bundle bundle) {
        setTheme(R.style.Theme_Lumiya_Light);
        super.onCreate(bundle);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);
        this.fullscreenMode = new FullscreenMode(getWindow());
        setContentView(R.layout.cardboard_layout);
        this.userManager = ActivityUtils.getUserManager(getIntent());
        if (this.userManager == null) {
            finish();
            return;
        }
        // Android VR mode (low-persistence display, VR listener) and sustained
        // performance mode (stable clocks for frame pacing), as 3.4.2 set them.
        AndroidCompat.trySetVrModeEnabled(this, true);
        AndroidCompat.setSustainedPerformanceMode(this, true);
        this.renderSettings = new RenderSettings(PreferenceManager.getDefaultSharedPreferences(getBaseContext()));
        this.stateHandler = new Handler();
        Debug.Printf("Cardboard: creating VR view", new Object[0]);
        GlobalOptions globalOptions = GlobalOptions.getInstance();
        CardboardControlsPlaceholder cardboardControlsPlaceholder = (CardboardControlsPlaceholder) findViewById(R.id.controls_placeholder);
        this.onScreenControlsLayout = (ViewGroup) getLayoutInflater().inflate(R.layout.cardboard_controls, (ViewGroup) cardboardControlsPlaceholder, true);
        cardboardControlsPlaceholder.setOnViewInvalidateListener(new CardboardControlsPlaceholder.OnViewInvalidateListener() {
            private final /* synthetic */ void $m$0() {
                CardboardActivity.this.onViewsInvalidated();
            }

            @Override
            public final void onViewInvalidated() {
                $m$0();
            }
        });
        int applyDimension = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, 16.0f, getResources().getDisplayMetrics());
        this.voiceViewHeightAllowance = globalOptions.getVoiceEnabled() ? (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, VOICE_VIEW_HEIGHT_ALLOWANCE_DP, getResources().getDisplayMetrics()) : 0;
        this.renderer = new WorldViewRenderer(this.stateHandler, true, this.userManager, applyDimension);
        this.renderer.setDrawDistance(this.renderSettings.drawDistance);
        this.renderer.setAvatarCountLimit(this.renderSettings.avatarCountLimit);
        this.renderer.setForcedTime(globalOptions.getForceDaylightTime(), globalOptions.getForceDaylightHour());
        this.vrRuntime = VrRuntimeSelector.selectRuntime(this, getIntent());
        this.vrSession = this.vrRuntime.createSession(this, this.vrSessionListener);
        this.vrSession.setRenderer(this.stereoRenderer);
        this.vrSession.setInputListener(this.vrInputListener);
        Debug.Printf("Cardboard: runtime=%s has magnet: %b", this.vrRuntime.getRuntimeId(), Boolean.valueOf(this.vrSession.hasMagnet()));
        ((FrameLayout) findViewById(R.id.vr_view_placeholder)).addView(this.vrSession.getView(), new FrameLayout.LayoutParams(-1, -1));
        this.vrSession.setOnTriggerListener(new Runnable() {
            private final /* synthetic */ void $m$0() {
                CardboardActivity.this.onCardboardTrigger();
            }

            @Override
            public final void run() {
                $m$0();
            }
        });
        new CardboardActivity_ViewBinding(this, this.onScreenControlsLayout);
        for (View view : new View[]{this.buttonTouch, this.buttonSpeak, this.buttonChat, this.buttonSpeechSend, this.buttonSit, this.buttonTouchObject, this.buttonObjectChat, this.buttonMoveForward, this.buttonMoveBackward, this.buttonTurnLeft, this.buttonTurnRight, this.buttonStandUp, this.yesButton, this.noButton}) {
            view.setAlpha(0.5f);
            view.setOnHoverListener(this.onHoverListener);
        }
        this.touchActivatedButtons.add(this.buttonMoveForward);
        this.touchActivatedButtons.add(this.buttonMoveBackward);
        this.touchActivatedButtons.add(this.buttonTurnLeft);
        this.touchActivatedButtons.add(this.buttonTurnRight);
        this.buttonStandUp.setVisibility(View.GONE);
        this.moveButtonsLayout.setVisibility(View.GONE);
        this.voiceStatusView.setShowActiveChatterName(true);
        this.voiceStatusView.hideBackground();
        this.voiceStatusView.setLightTheme();
        this.voiceStatusView.enableHover(this.hoverListener);
        this.voiceStatusView.setOnCallButtonListener(this.onVoiceCallButtonListener);
        int applyDimension2 = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 1.0f, getResources().getDisplayMetrics());
        for (int i : dialogButtonIds) {
            Button button = (Button) findViewById(i);
            button.setAlpha(0.5f);
            button.setOnHoverListener(this.onHoverListener);
            button.setOnClickListener(this.onDialogButtonClick);
            button.setPadding(applyDimension2, applyDimension2, applyDimension2, applyDimension2);
            button.setCompoundDrawablePadding(applyDimension2);
        }
        this.dialogQuestionText.setTextColor(-1);
        this.fadingTextViewLog = new FadingTextViewLog(this.userManager, this, this.chatsOverlayLayout, -1, 0);
        setControlsPage(ControlsPage.pageDefault);
        this.speechRecognitionResults.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
            private final /* synthetic */ void $m$0() {
                CardboardActivity.this.m782xd3478a38();
            }

            @Override
            public final void onGlobalLayout() {
                $m$0();
            }
        });
        this.cardboardPrimaryControls.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
            private final /* synthetic */ void $m$0() {
                CardboardActivity.this.m783xd347f25d();
            }

            @Override
            public final void onGlobalLayout() {
                $m$0();
            }
        });
        this.vrSession.setOnTouchListener(new View.OnTouchListener() {
            private final /* synthetic */ boolean $m$0(View view2, MotionEvent motionEvent) {
                return CardboardActivity.this.onVrTouch(view2, motionEvent);
            }

            @Override
            public final boolean onTouch(View view2, MotionEvent motionEvent) {
                return $m$0(view2, motionEvent);
            }
        });
    }

    @Override
    protected void onDestroy() {
        if (this.vrSession != null) {
            this.vrSession.onDestroy();
            this.vrSession = null;
        }
        super.onDestroy();
    }

    @Override
    protected boolean onDetailsStackEmpty() {
        super.onDetailsStackEmpty();
        setControlsPage(ControlsPage.pageDefault);
        return true;
    }

    @Override
    public void onNewObjectPopup(SLChatEvent sLChatEvent) {
        if (!(sLChatEvent instanceof SLChatScriptDialog)) {
            if (sLChatEvent instanceof SLChatPermissionRequestEvent) {
                this.activeYesNoEvent = (SLChatYesNoEvent) sLChatEvent;
                this.yesNoText.setText(((SLChatPermissionRequestEvent) sLChatEvent).getQuestion(this));
                setControlsPage(ControlsPage.pageYesNo);
                return;
            }
            return;
        }
        if (this.currentControlsPage != ControlsPage.pageYesNo) {
            SLChatScriptDialog sLChatScriptDialog = (SLChatScriptDialog) sLChatEvent;
            this.activeScriptDialog = sLChatScriptDialog;
            setControlsPage(ControlsPage.pageScriptDialog);
            String[] buttons = sLChatScriptDialog.getButtons();
            for (int i = 0; i < dialogButtonIds.length; i++) {
                Button button = (Button) findViewById(dialogButtonIds[i]);
                if (i < buttons.length) {
                    button.setVisibility(View.VISIBLE);
                    button.setText(buttons[i]);
                } else {
                    button.setVisibility(View.GONE);
                }
            }
            this.dialogQuestionText.setText(sLChatScriptDialog.getRawText());
        }
    }

    public void onNoButton() {
        if (this.activeYesNoEvent != null && this.userManager != null) {
            this.activeYesNoEvent.onYesAction(this, this.userManager);
            this.activeYesNoEvent = null;
        }
        handlePickedObject(null);
        setControlsPage(ControlsPage.pageDefault);
    }

    public void onObjectChat() {
        SLAgentCircuit data = this.agentCircuit.getData();
        ObjectIntersectInfo objectIntersectInfo = this.pickedObject.get();
        SLObjectInfo sLObjectInfo = objectIntersectInfo != null ? objectIntersectInfo.objInfo : null;
        if (data == null || sLObjectInfo == null || this.userManager == null || !sLObjectInfo.isAvatar()) {
            return;
        }
        startDictation(ChatterID.getUserChatterID(this.userManager.getUserID(), sLObjectInfo.getId()));
    }

    public boolean onObjectControlsTouch(View view, MotionEvent motionEvent) {
        switch (motionEvent.getActionMasked()) {
            case 1:
                handlePickedObject(null);
                setControlsPage(ControlsPage.pageDefault);
                break;
        }
        return true;
    }

    @Override
    public void onObjectPopupCountChanged(int i) {
    }

    public void onObjectSit() {
        SLAgentCircuit data = this.agentCircuit.getData();
        ObjectIntersectInfo objectIntersectInfo = this.pickedObject.get();
        SLObjectInfo sLObjectInfo = objectIntersectInfo != null ? objectIntersectInfo.objInfo : null;
        if (data == null || sLObjectInfo == null) {
            return;
        }
        data.getModules().avatarControl.SitOnObject(sLObjectInfo.getId());
        handlePickedObject(null);
        setControlsPage(ControlsPage.pageDefault);
    }

    public void onObjectTouch() {
        SLAgentCircuit data = this.agentCircuit.getData();
        ObjectIntersectInfo objectIntersectInfo = this.pickedObject.get();
        SLObjectInfo sLObjectInfo = objectIntersectInfo != null ? objectIntersectInfo.objInfo : null;
        if (data == null || sLObjectInfo == null || sLObjectInfo.isAvatar()) {
            return;
        }
        if (!objectIntersectInfo.intersectInfo.faceKnown) {
            data.TouchObject(sLObjectInfo.localID);
        } else {
            LLVector3 absolutePosition = sLObjectInfo.getAbsolutePosition();
            data.TouchObjectFace(sLObjectInfo, objectIntersectInfo.intersectInfo.faceID, absolutePosition.x, absolutePosition.y, absolutePosition.z, objectIntersectInfo.intersectInfo.u, objectIntersectInfo.intersectInfo.v, objectIntersectInfo.intersectInfo.s, objectIntersectInfo.intersectInfo.t);
        }
    }

    @Override
    protected void onPause() {
        if (this.speechRecognizer != null) {
            this.speechRecognizer.destroy();
            this.speechRecognizer = null;
        }
        this.myAvatarState.unsubscribe();
        if (this.userManager != null) {
            this.userManager.getObjectPopupsManager().removeObjectPopupListener(this);
            this.userManager.getObjectPopupsManager().removePopupWatcher(this);
            try {
                this.userManager.getChatterList().getActiveChattersManager().getChatEventBus().unregister(this.chatEventHandler);
            } catch (IllegalArgumentException e) {
            }
        }
        this.isResumed = false;
        updateDrawingEnabled();
        if (this.vrSession != null) {
            this.vrSession.onPause();
        }
        this.screenOnFlagHelper.stop();
        super.onPause();
    }

    @Override
    protected void onResume() {
        super.onResume();
        if (this.vrSession != null) {
            this.vrSession.onResume();
        }
        this.fullscreenMode.goFullscreen();
        this.screenOnFlagHelper.start();
        if (this.speechRecognizer == null) {
            if (SpeechRecognizer.isRecognitionAvailable(this)) {
                Debug.Printf("Cardboard: speech recognition is available", new Object[0]);
                this.speechRecognizer = SpeechRecognizer.createSpeechRecognizer(this);
                this.speechRecognizer.setRecognitionListener(this.recognitionListener);
            } else {
                Debug.Printf("Cardboard: speech recognition is not available", new Object[0]);
                this.speechRecognizer = null;
            }
        }
        this.isResumed = true;
        updateDrawingEnabled();
        if (this.userManager != null) {
            this.userManager.getObjectPopupsManager().addPopupWatcher(this);
            this.userManager.getObjectPopupsManager().setObjectPopupListener(this, UIThreadExecutor.getInstance());
            this.myAvatarState.subscribe(this.userManager.getObjectsManager().myAvatarState(), SubscriptionSingleKey.Value);
            this.userManager.getChatterList().getActiveChattersManager().getChatEventBus().register(this.chatEventHandler);
        }
    }

    public boolean onScriptDialogOutsideTouch(View view, MotionEvent motionEvent) {
        switch (motionEvent.getActionMasked()) {
            case 1:
                if (this.activeScriptDialog != null) {
                    this.activeScriptDialog.onDialogIgnored(this.userManager);
                    this.activeScriptDialog = null;
                }
                handlePickedObject(null);
                setControlsPage(ControlsPage.pageDefault);
                break;
        }
        return true;
    }

    public void onSpeakButton() {
        if (this.userManager != null) {
            startDictation(ChatterID.getLocalChatterID(this.userManager.getUserID()));
        }
    }

    public boolean onSpeakControlsTouch(View view, MotionEvent motionEvent) {
        Debug.Printf("Cardboard: speak controls touched, view %s", view);
        switch (motionEvent.getActionMasked()) {
            case 1:
                closeSpeechControls();
            default:
                return true;
        }
    }

    public void onSpeechSendButton() {
        SLAgentCircuit activeAgentCircuit;
        if (!Strings.isNullOrEmpty(this.lastSpeechRecognitionResults)) {
            if (this.userManager != null && (activeAgentCircuit = this.userManager.getActiveAgentCircuit()) != null && this.dictationChatterID != null) {
                activeAgentCircuit.SendChatMessage(this.dictationChatterID, this.lastSpeechRecognitionResults);
            }
            this.lastSpeechRecognitionResults = "";
        }
        closeSpeechControls();
    }

    public void onStandUpButton() {
        SLAvatarControl sLAvatarControl = this.avatarControl.get();
        if (sLAvatarControl != null) {
            sLAvatarControl.Stand();
        }
    }

    @Override
    protected void onStart() {
        super.onStart();
        this.voiceEnabled = GlobalOptions.getInstance().getVoiceEnabled();
        if (this.vrSession != null) {
            this.vrSession.onStart();
        }
        if (this.userManager != null) {
            this.agentCircuit.subscribe(UserManager.agentCircuits(), this.userManager.getUserID());
            this.voiceLoggedIn.subscribe(this.userManager.getVoiceLoggedIn(), SubscriptionSingleKey.Value);
            this.voiceActiveChatter.subscribe(this.userManager.getVoiceActiveChatter(), SubscriptionSingleKey.Value);
            this.currentLocationInfo.subscribe(this.userManager.getCurrentLocationInfo(), SubscriptionSingleKey.Value);
        }
        if (this.voiceEnabled) {
            this.voiceStatusView.setShowWhenInactive(true);
        } else {
            this.voiceStatusView.setShowWhenInactive(false);
        }
    }

    @Override
    protected void onStop() {
        this.voiceActiveChatter.unsubscribe();
        this.voiceLoggedIn.unsubscribe();
        this.currentLocationInfo.unsubscribe();
        this.agentCircuit.unsubscribe();
        this.voiceStatusView.setChatterID(null);
        this.keypadActive.set(false);
        if (this.vrSession != null) {
            this.vrSession.onStop();
        }
        super.onStop();
    }

    public void onTouchButton() {
        setControlsPage(ControlsPage.pageTouchAim);
    }

    @Override
    public void onWindowFocusChanged(boolean z) {
        super.onWindowFocusChanged(z);
        if (this.fullscreenMode != null) {
            this.fullscreenMode.onWindowFocusChanged(z);
        }
    }

    public void onYesButton() {
        if (this.activeYesNoEvent != null && this.userManager != null) {
            this.activeYesNoEvent.onYesAction(this, this.userManager);
            this.activeYesNoEvent = null;
        }
        handlePickedObject(null);
        setControlsPage(ControlsPage.pageDefault);
    }

    public boolean onYesNoOutsideTouch(View view, MotionEvent motionEvent) {
        switch (motionEvent.getActionMasked()) {
            case 1:
                this.activeYesNoEvent = null;
                handlePickedObject(null);
                setControlsPage(ControlsPage.pageDefault);
                break;
        }
        return true;
    }

    public void startDictation(ChatterID chatterID) {
        setControlsPage(ControlsPage.pageSpeech);
        this.dictationChatterID = chatterID;
        this.speakNowText.setVisibility(View.INVISIBLE);
        this.speakLevelIndicator.setVisibility(View.INVISIBLE);
        this.buttonSpeechSend.setVisibility(View.INVISIBLE);
        this.speechRecognitionResults.setText("");
        if (this.speechRecognizer == null) {
            showSpeechRecognitionError(getString(R.string.speech_recognition_not_available));
            return;
        }
        this.isSpeechFinished = false;
        Intent intent = new Intent();
        intent.putExtra("android.speech.extra.PARTIAL_RESULTS", true);
        this.speechRecognizer.startListening(intent);
    }
}
