package com.lumiyaviewer.lumiya.ui.render;

import android.animation.ValueAnimator;
import android.annotation.SuppressLint;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.SystemClock;
import androidx.preference.PreferenceManager;
import androidx.core.app.ActivityCompat;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.core.content.ContextCompat;
import androidx.core.content.FileProvider;
import androidx.core.view.GestureDetectorCompat;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.widget.Toolbar;
import android.util.TypedValue;
import android.view.GestureDetector;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsoluteLayout;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import com.google.common.base.Objects;
import com.google.common.base.Strings;
import com.google.common.eventbus.Subscribe;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.GlobalOptions;
import com.lumiyaviewer.lumiya.LumiyaApp;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.eventbus.EventHandler;
import com.lumiyaviewer.lumiya.react.Subscription;
import com.lumiyaviewer.lumiya.react.SubscriptionData;
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey;
import com.lumiyaviewer.lumiya.react.UIThreadExecutor;
import com.lumiyaviewer.lumiya.render.picking.ObjectIntersectInfo;
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit;
import com.lumiyaviewer.lumiya.slproto.avatar.SLAttachmentPoint;
import com.lumiyaviewer.lumiya.slproto.events.SLBakingProgressEvent;
import com.lumiyaviewer.lumiya.slproto.modules.SLAvatarControl;
import com.lumiyaviewer.lumiya.slproto.modules.SLDrawDistance;
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectAvatarInfo;
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectInfo;
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectProfileData;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever;
import com.lumiyaviewer.lumiya.slproto.users.ParcelData;
import com.lumiyaviewer.lumiya.slproto.users.manager.ActiveChattersManager;
import com.lumiyaviewer.lumiya.slproto.users.manager.CurrentLocationInfo;
import com.lumiyaviewer.lumiya.slproto.users.manager.MyAvatarState;
import com.lumiyaviewer.lumiya.slproto.users.manager.UnreadNotificationInfo;
import com.lumiyaviewer.lumiya.slproto.users.manager.UnreadNotificationManager;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import com.lumiyaviewer.lumiya.ui.ThemeMapper;
import com.lumiyaviewer.lumiya.ui.chat.ChatFragment;
import com.lumiyaviewer.lumiya.ui.chat.ContactsFragment;
import com.lumiyaviewer.lumiya.ui.chat.profiles.UserProfileFragment;
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils;
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity;
import com.lumiyaviewer.lumiya.ui.render.vr.VrRuntime;
import com.lumiyaviewer.lumiya.ui.render.vr.VrRuntimeSelector;
import com.lumiyaviewer.lumiya.ui.common.MasterDetailsActivity;
import com.lumiyaviewer.lumiya.ui.common.ScriptDialogHandler;
import com.lumiyaviewer.lumiya.ui.objects.ObjectDetailsFragment;
import com.lumiyaviewer.lumiya.ui.objects.ObjectPayDialog;
import com.lumiyaviewer.lumiya.ui.objects.TouchableObjectsFragment;
import com.lumiyaviewer.lumiya.ui.outfits.OutfitsFragment;
import com.lumiyaviewer.lumiya.ui.render.WorldViewActivity;
import com.lumiyaviewer.lumiya.ui.voice.VoiceStatusView;
import com.lumiyaviewer.lumiya.voice.common.model.VoiceChatInfo;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.NoSuchElementException;
import java.util.UUID;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public class WorldViewActivity extends DetailsActivity implements View.OnTouchListener, ThemeMapper, ScriptDialogHandler, UnreadNotificationManager.NotifyCapture {
    private static final long BUTTONS_FADE_TIMEOUT_MILLIS = 7500;
    private static final String FROM_NOTIFICATION_TAG = "fromNotification";
    private static final long OBJECT_DESELECT_TIMEOUT_MILLIS = 6000;
    private static final int PERMISSION_AUDIO_REQUEST_CODE = 100;
    private static final float TURNING_SPEED = 50.0f;

    @Nullable
    private SLAvatarControl avatarControl;

    ImageView avatarIconView;

    ImageButton buttonCamOff;

    ImageButton buttonCamOn;

    ImageButton buttonFlyDownward;

    ImageButton buttonFlyUpward;

    Button buttonHUD;

    ImageButton buttonMoveBackward;

    ImageButton buttonMoveForward;

    ImageButton buttonStandUp;

    ImageButton buttonStopFlying;

    ImageButton buttonTurnLeft;

    ImageButton buttonTurnRight;

    LinearLayout chatsOverlayLayout;

    View detailsContainer;

    View dragPointer;

    ViewGroup dragPointerLayout;

    @Nullable
    private SLDrawDistance drawDistance;
    private FadingTextViewLog fadingTextViewLog;

    LinearLayout flyButtonsLayout;
    private GestureDetectorCompat gestureDetector;

    FrameLayout insetsBackground;
    private boolean isSplitScreen;
    private WorldSurfaceView mGLView;

    View moveButtonsLayout;

    ImageButton objectChatButton;

    View objectControlsPanel;

    ImageButton objectMoreButton;

    TextView objectNameTextView;

    ImageButton objectPayButton;

    View objectPopupLeftSpacer;

    ImageButton objectSitButton;

    ImageButton objectStandButton;

    ImageButton objectTouchButton;
    private ScaleGestureDetector scaleGestureDetector;
    private UserManager userManager;

    VoiceStatusView voiceStatusView;

    ViewGroup worldOverlaysContainer;

    FrameLayout worldViewHolder;

    View worldViewTouchReceiver;
    private SLObjectInfo pickedObject = null;
    private ObjectIntersectInfo pickedIntersectInfo = null;
    private ChatterNameRetriever pickedAvatarNameRetriever = null;
    private Handler mHandler = new Handler();
    private int prefDrawDistance = 20;
    private boolean chatOver3D = false;
    private UUID lastTouchUUID = null;
    private int displayedHUDid = 0;
    private int prevDisplayedHUDid = 0;
    private float hudScaleFactor = 1.0f;
    private float hudOffsetX = 0.0f;
    private float hudOffsetY = 0.0f;
    private boolean arrowsToTurn = false;
    private boolean camButtonEnabled = false;
    private boolean manualCamMode = false;
    private boolean localDrawingEnabled = false;
    private long lastActivityTime = SystemClock.uptimeMillis();
    private boolean buttonsFadeTimerStarted = false;
    private ValueAnimator buttonsFadeAnimator = null;
    private long lastObjectActivityTime = SystemClock.uptimeMillis();
    private boolean objectDeselectTimerStarted = false;
    private boolean isInScaling = false;
    private float oldScaleFocusX = Float.NaN;
    private float oldScaleFocusY = Float.NaN;
    private boolean wasInScaling = false;
    private boolean isInteracting = false;
    private boolean isDragging = false;
    private final SubscriptionData<UUID, SLAgentCircuit> agentCircuit = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            WorldViewActivity.this.onAgentCircuit((SLAgentCircuit) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    });
    private final SubscriptionData<SubscriptionSingleKey, MyAvatarState> myAvatarState = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            WorldViewActivity.this.onMyAvatarState((MyAvatarState) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    });
    private final SubscriptionData<Integer, SLObjectProfileData> selectedObjectProfile = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            WorldViewActivity.this.onSelectedObjectProfile((SLObjectProfileData) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    });
    private final SubscriptionData<SubscriptionSingleKey, CurrentLocationInfo> currentLocationInfo = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            WorldViewActivity.this.onCurrentLocation((CurrentLocationInfo) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    });
    private final SubscriptionData<SubscriptionSingleKey, ChatterID> voiceActiveChatter = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            WorldViewActivity.this.onVoiceActiveChatter((ChatterID) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    });
    private final SubscriptionData<ChatterID, VoiceChatInfo> voiceChatInfo = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            WorldViewActivity.this.onVoiceChatInfo((VoiceChatInfo) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    });
    private final Object chatEventHandler = new AnonymousClass1();
    private final Runnable objectDeselectTimerTask = new Runnable() {
        @Override
        public void run() {
            WorldViewActivity.this.objectDeselectTimerStarted = false;
            if (WorldViewActivity.this.detailsVisible() || !(!WorldViewActivity.this.isDragging)) {
                return;
            }
            long uptimeMillis = (WorldViewActivity.this.lastObjectActivityTime + WorldViewActivity.OBJECT_DESELECT_TIMEOUT_MILLIS) - SystemClock.uptimeMillis();
            Debug.Printf("ObjectDeselect: remaining %d", Long.valueOf(uptimeMillis));
            if (uptimeMillis <= 0) {
                WorldViewActivity.this.handlePickedObject(null);
            } else {
                WorldViewActivity.this.objectDeselectTimerStarted = true;
                WorldViewActivity.this.mHandler.postDelayed(WorldViewActivity.this.objectDeselectTimerTask, uptimeMillis);
            }
        }
    };
    private final Runnable buttonsFadeTask = new Runnable() {
        @Override
        public void run() {
            WorldViewActivity.this.buttonsFadeTimerStarted = false;
            if (!WorldViewActivity.this.detailsVisible() && (!WorldViewActivity.this.isDragging) && WorldViewActivity.this.agentCircuit.hasData()) {
                VoiceChatInfo voiceChatInfo = (VoiceChatInfo) WorldViewActivity.this.voiceChatInfo.getData();
                if ((voiceChatInfo == null || voiceChatInfo.state != VoiceChatInfo.VoiceChatState.Active) ? false : voiceChatInfo.localMicActive) {
                    return;
                }
                long uptimeMillis = (WorldViewActivity.this.lastActivityTime + WorldViewActivity.BUTTONS_FADE_TIMEOUT_MILLIS) - SystemClock.uptimeMillis();
                Debug.Printf("ButtonsFade: remaining %d", Long.valueOf(uptimeMillis));
                if (uptimeMillis <= 0) {
                    WorldViewActivity.this.startFadingButtons();
                } else {
                    WorldViewActivity.this.buttonsFadeTimerStarted = true;
                    WorldViewActivity.this.mHandler.postDelayed(WorldViewActivity.this.buttonsFadeTask, uptimeMillis);
                }
            }
        }
    };
    private final Runnable buttonsRestoreTask = new Runnable() {
        @Override
        public void run() {
            if (WorldViewActivity.this.buttonsFadeAnimator != null) {
                WorldViewActivity.this.buttonsFadeAnimator.cancel();
            }
            WorldViewActivity.this.insetsBackground.setAlpha(1.0f);
        }
    };
    private final View.OnTouchListener worldViewTouchListener = new View.OnTouchListener() {
        @Override
        public boolean onTouch(View view, MotionEvent motionEvent) {
            boolean z;
            boolean isInteracting = WorldViewActivity.this.isInteracting;
            switch (motionEvent.getActionMasked()) {
                case 0:
                    WorldViewActivity.this.isInteracting = true;
                    z = true;
                    break;
                case 1:
                    WorldViewActivity.this.isInteracting = false;
                    z = true;
                    break;
                default:
                    z = false;
                    break;
            }
            if (WorldViewActivity.this.isInteracting && (!isInteracting)) {
                WorldViewActivity.this.mGLView.setIsInteracting(true);
            }
            WorldViewActivity.this.wasInScaling = WorldViewActivity.this.isInScaling;
            boolean onTouchEvent = z | WorldViewActivity.this.scaleGestureDetector.onTouchEvent(motionEvent) | WorldViewActivity.this.gestureDetector.onTouchEvent(motionEvent);
            if (isInteracting && (!WorldViewActivity.this.isInteracting)) {
                WorldViewActivity.this.mGLView.setIsInteracting(false);
            }
            return onTouchEvent;
        }
    };
    private final GestureDetector.OnGestureListener gestureListener = new GestureDetector.SimpleOnGestureListener() {
        @Override
        public boolean onFling(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            if (WorldViewActivity.this.isInScaling || !(!WorldViewActivity.this.wasInScaling) || !(!WorldViewActivity.this.isDragging)) {
                return false;
            }
            float height = (f * 60.0f) / WorldViewActivity.this.worldViewHolder.getHeight();
            float height2 = ((-f2) * 60.0f) / WorldViewActivity.this.worldViewHolder.getHeight();
            if (WorldViewActivity.this.avatarControl == null) {
                return true;
            }
            WorldViewActivity.this.avatarControl.processCameraFling(height / 1.5f, height2 / 2.5f);
            return true;
        }

        @Override
        public void onLongPress(MotionEvent motionEvent) {
            float rawX = motionEvent.getRawX();
            float rawY = motionEvent.getRawY();
            if (WorldViewActivity.this.isDragging) {
                WorldViewActivity.this.dragSelectorSetRawPosition((int) rawX, (int) rawY);
            } else {
                if (WorldViewActivity.this.isInScaling || !(!WorldViewActivity.this.wasInScaling)) {
                    return;
                }
                int[] location = new int[2];
                WorldViewActivity.this.worldViewHolder.getLocationOnScreen(location);
                WorldViewActivity.this.mGLView.pickObjectHover(rawX - location[0], rawY - location[1]);
            }
        }

        @Override
        public boolean onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            if (WorldViewActivity.this.isDragging) {
                AbsoluteLayout.LayoutParams layoutParams = (AbsoluteLayout.LayoutParams) WorldViewActivity.this.dragPointer.getLayoutParams();
                if (layoutParams != null) {
                    layoutParams.x = Math.max(Math.min((int) (layoutParams.x - f), WorldViewActivity.this.dragPointerLayout.getWidth() - WorldViewActivity.this.dragPointer.getWidth()), 0);
                    layoutParams.y = Math.max(Math.min((int) (layoutParams.y - f2), WorldViewActivity.this.dragPointerLayout.getHeight() - WorldViewActivity.this.dragPointer.getHeight()), 0);
                    WorldViewActivity.this.dragPointer.setLayoutParams(layoutParams);
                    WorldViewActivity.this.selectByDragPointer(layoutParams.x, layoutParams.y);
                }
                return true;
            }
            if (WorldViewActivity.this.isInScaling || !(!WorldViewActivity.this.wasInScaling)) {
                return false;
            }
            if (WorldViewActivity.this.displayedHUDid != 0) {
                WorldViewActivity.this.hudOffsetX += (f / WorldViewActivity.this.worldViewHolder.getHeight()) / 2.0f;
                WorldViewActivity.this.hudOffsetY += (f2 / WorldViewActivity.this.worldViewHolder.getHeight()) / 2.0f;
                WorldViewActivity.this.mGLView.setHUDOffset(WorldViewActivity.this.hudOffsetX, WorldViewActivity.this.hudOffsetY);
            } else {
                float height = ((-f) * 60.0f) / WorldViewActivity.this.worldViewHolder.getHeight();
                float height2 = (f2 * 60.0f) / WorldViewActivity.this.worldViewHolder.getHeight();
                if (WorldViewActivity.this.avatarControl != null) {
                    WorldViewActivity.this.avatarControl.processCameraRotate(height, height2);
                }
            }
            return true;
        }

        @Override
        public boolean onSingleTapUp(MotionEvent motionEvent) {
            if (WorldViewActivity.this.isDragging) {
                WorldViewActivity.this.dragSelectorSetRawPosition((int) motionEvent.getRawX(), (int) motionEvent.getRawY());
            } else if (WorldViewActivity.this.displayedHUDid != 0) {
                int[] location = new int[2];
                WorldViewActivity.this.worldViewHolder.getLocationOnScreen(location);
                WorldViewActivity.this.mGLView.touchHUD(motionEvent.getRawX() - location[0], motionEvent.getRawY() - location[1]);
            } else {
                WorldViewActivity.this.handlePickedObject(null);
            }
            return true;
        }
    };
    private final ScaleGestureDetector.OnScaleGestureListener scaleGestureListener = new ScaleGestureDetector.SimpleOnScaleGestureListener() {
        @Override
        public boolean onScale(ScaleGestureDetector scaleGestureDetector) {
            Debug.Printf("Gesture: scale factor: %f", Float.valueOf(scaleGestureDetector.getScaleFactor()));
            if (WorldViewActivity.this.displayedHUDid != 0) {
                WorldViewActivity.this.hudScaleFactor = Math.max(0.1f, Math.min(WorldViewActivity.this.hudScaleFactor * scaleGestureDetector.getScaleFactor(), 10.0f));
                WorldViewActivity.this.mGLView.setHUDScaleFactor(WorldViewActivity.this.hudScaleFactor);
            } else {
                float width = WorldViewActivity.this.worldViewTouchReceiver.getWidth();
                float height = WorldViewActivity.this.worldViewTouchReceiver.getHeight();
                float focusX = scaleGestureDetector.getFocusX();
                float focusY = scaleGestureDetector.getFocusY();
                float f = ((focusX / width) - 0.5f) * (height / width);
                float f2 = (focusY / height) - 0.5f;
                float f3 = (focusX - WorldViewActivity.this.oldScaleFocusX) / height;
                float f4 = (focusY - WorldViewActivity.this.oldScaleFocusY) / height;
                WorldViewActivity.this.oldScaleFocusX = focusX;
                WorldViewActivity.this.oldScaleFocusY = focusY;
                if (WorldViewActivity.this.avatarControl != null) {
                    WorldViewActivity.this.avatarControl.processCameraZoom(scaleGestureDetector.getScaleFactor(), (-f) * 2.0f, (-f2) * 2.0f, f3, f4);
                }
            }
            return true;
        }

        @Override
        public boolean onScaleBegin(ScaleGestureDetector scaleGestureDetector) {
            WorldViewActivity.this.isInScaling = true;
            WorldViewActivity.this.oldScaleFocusX = scaleGestureDetector.getFocusX();
            WorldViewActivity.this.oldScaleFocusY = scaleGestureDetector.getFocusY();
            return true;
        }

        @Override
        public void onScaleEnd(ScaleGestureDetector scaleGestureDetector) {
            WorldViewActivity.this.isInScaling = false;
        }
    };

    /* renamed from: com.lumiyaviewer.lumiya.ui.render.WorldViewActivity$1, reason: invalid class name */
    class AnonymousClass1 {
        AnonymousClass1() {
        }

        /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_render_WorldViewActivity$1_50098, reason: not valid java name */
        /* synthetic */ void m856xad728e4a(ActiveChattersManager.ChatMessageEvent chatMessageEvent) {
            WorldViewActivity.this.handleChatEvent(chatMessageEvent);
        }

        @Subscribe
        public void onChatMessage(final ActiveChattersManager.ChatMessageEvent chatMessageEvent) {
            WorldViewActivity.this.mHandler.post(new Runnable() {
                private final /* synthetic */ void $m$0() {
                    AnonymousClass1.this.m856xad728e4a((ActiveChattersManager.ChatMessageEvent) chatMessageEvent);
                }

                @Override
                public final void run() {
                    $m$0();
                }
            });
        }
    }

    private static class SelectableAttachment {
        private String attachmentName;
        private int localID;

        public SelectableAttachment(int localID, String attachmentName) {
            this.localID = localID;
            this.attachmentName = attachmentName;
        }

        public int getLocalID() {
            return this.localID;
        }

        public String toString() {
            return this.attachmentName;
        }
    }

    private void beginCountingButtonsFade() {
        this.lastActivityTime = SystemClock.uptimeMillis();
        this.lastObjectActivityTime = this.lastActivityTime;
        startFadingButtonsTimer();
    }

    private void beginCountingObjectDeselect() {
        if (this.pickedObject != null) {
            this.lastObjectActivityTime = SystemClock.uptimeMillis();
            if (this.objectDeselectTimerStarted) {
                return;
            }
            this.objectDeselectTimerStarted = true;
            this.mHandler.postDelayed(this.objectDeselectTimerTask, OBJECT_DESELECT_TIMEOUT_MILLIS);
        }
    }

    private void beginDragSelection() {
        this.isDragging = true;
        removeAllDetails();
        AbsoluteLayout.LayoutParams layoutParams = (AbsoluteLayout.LayoutParams) this.dragPointer.getLayoutParams();
        layoutParams.x = (this.dragPointerLayout.getWidth() - this.dragPointer.getWidth()) / 2;
        layoutParams.y = (this.dragPointerLayout.getHeight() - this.dragPointer.getHeight()) / 2;
        this.dragPointer.setLayoutParams(layoutParams);
        selectByDragPointer(layoutParams.x, layoutParams.y);
        this.mGLView.setOwnAvatarHidden(true);
        updateObjectPanel();
    }

    private void chatWithObject(SLObjectInfo objectInfo) {
        if (!(objectInfo instanceof SLObjectAvatarInfo) || ((SLObjectAvatarInfo) objectInfo).isMyAvatar() || objectInfo.getId() == null) {
            return;
        }
        DetailsActivity.showEmbeddedDetails(this, ChatFragment.class, ChatFragment.makeSelection(ChatterID.getUserChatterID(this.userManager.getUserID(), objectInfo.getId())));
    }

    public boolean detailsVisible() {
        Fragment findFragmentById;
        FragmentManager supportFragmentManager = getSupportFragmentManager();
        return (supportFragmentManager == null || (findFragmentById = supportFragmentManager.findFragmentById(R.id.details)) == null || !findFragmentById.isVisible()) ? false : true;
    }

    private void displayHUD(int displayedHUDid) {
        Debug.Printf("Displaying HUD with ID %d", Integer.valueOf(displayedHUDid));
        this.displayedHUDid = displayedHUDid;
        this.mGLView.setDisplayedHUDid(displayedHUDid);
        if (this.displayedHUDid != this.prevDisplayedHUDid) {
            this.hudScaleFactor = 1.0f;
            this.hudOffsetX = 0.0f;
            this.hudOffsetY = 0.0f;
            this.prevDisplayedHUDid = this.displayedHUDid;
        }
        this.mGLView.setHUDScaleFactor(this.hudScaleFactor);
        this.mGLView.setHUDOffset(this.hudOffsetX, this.hudOffsetY);
        if (this.displayedHUDid != 0) {
            handlePickedObject(null);
        }
        updateObjectPanel();
    }

    public void dragSelectorSetRawPosition(int i, int i2) {
        int[] ints = new int[2];
        this.dragPointerLayout.getLocationOnScreen(ints);
        int width = i - (this.dragPointer.getWidth() / 2);
        int height = i2 - (this.dragPointer.getHeight() / 2);
        AbsoluteLayout.LayoutParams layoutParams = (AbsoluteLayout.LayoutParams) this.dragPointer.getLayoutParams();
        if (layoutParams != null) {
            layoutParams.x = Math.max(Math.min(width - ints[0], this.dragPointerLayout.getWidth() - this.dragPointer.getWidth()), 0);
            layoutParams.y = Math.max(Math.min(height - ints[1], this.dragPointerLayout.getHeight() - this.dragPointer.getHeight()), 0);
            this.dragPointer.setLayoutParams(layoutParams);
            selectByDragPointer(layoutParams.x, layoutParams.y);
        }
    }

    private void endDragSelection() {
        this.isDragging = false;
        this.mGLView.setOwnAvatarHidden(false);
        updateObjectPanel();
        beginCountingButtonsFade();
        beginCountingObjectDeselect();
    }

    private void enterVrView() {
        if (ContextCompat.checkSelfPermission(this, "android.permission.RECORD_AUDIO") != 0) {
            Debug.Printf("Cardboard: audio permission not yet granted", new Object[0]);
            ActivityCompat.requestPermissions(this, new String[]{"android.permission.RECORD_AUDIO"}, 100);
        } else {
            Debug.Printf("Cardboard: audio permission already granted", new Object[0]);
            startVrActivity(VrIntentContract.VR_RUNTIME_CARDBOARD);
        }
    }

    private void initContentView() {
        setContentView(R.layout.world_view);
        new WorldViewActivity_ViewBinding(this);
        setSupportActionBar((Toolbar) findViewById(R.id.toolbar));
        this.mGLView = new WorldSurfaceView(this, this.userManager);
        this.worldViewHolder.addView(this.mGLView);
        this.buttonMoveForward.setOnTouchListener(this);
        this.buttonMoveBackward.setOnTouchListener(this);
        this.buttonTurnLeft.setOnTouchListener(this);
        this.buttonTurnRight.setOnTouchListener(this);
        this.buttonMoveForward.setFocusable(false);
        this.buttonMoveBackward.setFocusable(false);
        this.buttonTurnLeft.setFocusable(false);
        this.buttonTurnRight.setFocusable(false);
        this.buttonFlyUpward.setOnTouchListener(this);
        this.buttonFlyDownward.setOnTouchListener(this);
        this.buttonFlyUpward.setFocusable(false);
        this.buttonFlyDownward.setFocusable(false);
        this.voiceStatusView.setShowActiveChatterName(true);
        this.worldViewTouchReceiver.setOnTouchListener(this.worldViewTouchListener);
        this.objectControlsPanel.setVisibility(View.GONE);
        View findViewById = findViewById(R.id.offline_notify_status_layout);
        if (findViewById != null) {
            findViewById.setBackgroundColor(Color.argb(128, 0, 0, 0));
            int applyDimension = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 10.0f, getResources().getDisplayMetrics());
            findViewById.setPadding(applyDimension, applyDimension, applyDimension, applyDimension);
        }
    }

    public void onAgentCircuit(SLAgentCircuit agentCircuit) {
        if (agentCircuit != null) {
            this.avatarControl = agentCircuit.getModules().avatarControl;
            this.drawDistance = agentCircuit.getModules().drawDistance;
            if (this.localDrawingEnabled) {
                this.drawDistance.Enable3DView(this.prefDrawDistance);
            }
            if (this.camButtonEnabled) {
                this.manualCamMode = this.avatarControl.getIsManualCamming();
            }
        } else {
            handlePickedObject(null);
            this.avatarControl = null;
            this.drawDistance = null;
        }
        this.mHandler.post(this.buttonsRestoreTask);
        beginCountingButtonsFade();
        beginCountingObjectDeselect();
        updateObjectPanel();
    }

    public void onCurrentLocation(CurrentLocationInfo currentLocationInfo) {
        ParcelData parcelData = currentLocationInfo != null ? currentLocationInfo.parcelData() : null;
        String name = parcelData != null ? parcelData.getName() : null;
        if (name == null) {
            name = getString(R.string.name_loading_title);
        }
        setDefaultTitle(name, null);
    }

    public void onMyAvatarState(MyAvatarState myAvatarState) {
        updateObjectPanel();
    }

    public void onPickedAvatarNameUpdated(ChatterNameRetriever chatterNameRetriever) {
        if (chatterNameRetriever == this.pickedAvatarNameRetriever) {
            updateObjectPanel();
        }
    }

    public void onSelectedObjectProfile(SLObjectProfileData objectProfileData) {
        Debug.Printf("got selected object profile: %s", objectProfileData);
        updateObjectPanel();
        if (objectProfileData != null) {
            SLAgentCircuit data = this.agentCircuit.getData();
            if (objectProfileData.isPayable() && objectProfileData.payInfo() == null && data != null) {
                data.DoRequestPayPrice(objectProfileData.objectUUID());
            }
        }
    }

    public void onVoiceActiveChatter(ChatterID chatterID) {
        if (this.voiceStatusView != null) {
            this.voiceStatusView.setChatterID(chatterID);
        }
        if (chatterID == null || this.userManager == null) {
            this.voiceChatInfo.unsubscribe();
        } else {
            this.voiceChatInfo.subscribe(this.userManager.getVoiceChatInfo(), chatterID);
        }
    }

    public void onVoiceChatInfo(VoiceChatInfo voiceChatInfo) {
    }

    public void selectByDragPointer(int i, int i2) {
        int[] ints = new int[2];
        this.dragPointerLayout.getLocationOnScreen(ints);
        int width = ints[0] + (this.dragPointer.getWidth() / 2) + i;
        int height = ints[1] + (this.dragPointer.getHeight() / 2) + i2;
        int[] worldLocation = new int[2];
        this.worldViewHolder.getLocationOnScreen(worldLocation);
        this.mGLView.pickObjectHover(width - worldLocation[0], height - worldLocation[1]);
    }

    private void selectHUDtoDisplay() {
        int attachmentID;
        SLAttachmentPoint attachmentPoint;
        final ArrayList arrayList = new ArrayList();
        SLAgentCircuit data = this.agentCircuit.getData();
        if (data != null) {
            SLObjectAvatarInfo agentAvatar = data.getGridConnection().parcelInfo.getAgentAvatar();
            if (agentAvatar != null) {
                try {
                    for (SLObjectInfo objectInfo : agentAvatar.treeNode) {
                        if (!Strings.nullToEmpty(objectInfo.getName()).startsWith("#") && (attachmentID = objectInfo.attachmentID) >= 0 && attachmentID < 56 && (attachmentPoint = SLAttachmentPoint.attachmentPoints[attachmentID]) != null && attachmentPoint.isHUD) {
                            arrayList.add(new SelectableAttachment(objectInfo.localID, objectInfo.name));
                        }
                    }
                } catch (NoSuchElementException e) {
                    Debug.Warning(e);
                }
            }
            if (arrayList.isEmpty()) {
                return;
            }
            if (arrayList.size() == 1) {
                displayHUD(((SelectableAttachment) arrayList.get(0)).getLocalID());
                return;
            }
            ArrayAdapter arrayAdapter = new ArrayAdapter(this, android.R.layout.simple_list_item_1, arrayList);
            AlertDialog.Builder builder = new AlertDialog.Builder(this);
            builder.setTitle(R.string.select_hud_title);
            builder.setAdapter(arrayAdapter, new DialogInterface.OnClickListener() {
                private final /* synthetic */ void $m$0(DialogInterface dialogInterface, int i2) {
                    WorldViewActivity.this.m855x5cf6cbb8((List) arrayList, dialogInterface, i2);
                }

                @Override
                public final void onClick(DialogInterface dialogInterface, int i2) {
                    $m$0(dialogInterface, i2);
                }
            });
            builder.create().show();
        }
    }

    private void showObjectInfo(SLObjectInfo objectInfo) {
        if (objectInfo.getId() == null || this.userManager == null) {
            return;
        }
        if (!objectInfo.isAvatar()) {
            DetailsActivity.showEmbeddedDetails(this, ObjectDetailsFragment.class, ObjectDetailsFragment.makeSelection(this.userManager.getUserID(), objectInfo.localID));
        } else if (objectInfo instanceof SLObjectAvatarInfo) {
            DetailsActivity.showEmbeddedDetails(this, UserProfileFragment.class, UserProfileFragment.makeSelection(ChatterID.getUserChatterID(this.userManager.getUserID(), objectInfo.getId())));
        }
    }

    private void startVrActivity(String str) {
        if (this.userManager != null) {
            Intent intent = new Intent(this, (Class<?>) CardboardTransitionActivity.class);
            intent.putExtra(VrIntentContract.EXTRA_VR_RUNTIME, VrIntentContract.sanitizeRuntime(str));
            ActivityUtils.setActiveAgentID(intent, this.userManager.getUserID());
            VrRuntime selectedRuntime = VrRuntimeSelector.selectRuntime(this, intent);
            VrRuntimeSelector.putRuntime(intent, selectedRuntime.getRuntimeId());
            Debug.Printf("VR metrics: WorldViewActivity launching runtime=%s", selectedRuntime.getRuntimeId());
            intent.addFlags(16777216);
            startActivity(intent);
        }
        finish();
    }

    public void startFadingButtons() {
        if (this.buttonsFadeAnimator == null) {
            return;
        }
        this.buttonsFadeAnimator.start();
    }

    private void startFadingButtonsTimer() {
        if (this.buttonsFadeTimerStarted) {
            return;
        }
        Debug.Printf("ButtonsFade: starting timer", new Object[0]);
        this.buttonsFadeTimerStarted = true;
        this.mHandler.postDelayed(this.buttonsFadeTask, BUTTONS_FADE_TIMEOUT_MILLIS);
    }

    private void stopAvatarAnimations() {
        if (this.avatarControl != null) {
            this.avatarControl.StopAvatarAnimations();
        }
    }

    private void takeScreenshot() {
        Toast.makeText(this, R.string.taking_screenshot, Toast.LENGTH_SHORT).show();
        this.mGLView.takeScreenshot();
    }

    private void touchObject(SLObjectInfo objectInfo, ObjectIntersectInfo objectIntersectInfo) {
        SLAgentCircuit data = this.agentCircuit.getData();
        if (data == null || objectInfo == null) {
            return;
        }
        if (objectInfo.isAvatar()) {
            if (objectInfo.hasTouchableChildren()) {
                DetailsActivity.showEmbeddedDetails(this, TouchableObjectsFragment.class, TouchableObjectsFragment.makeSelection(this.userManager.getUserID(), objectInfo.getId()));
            }
        } else {
            this.lastTouchUUID = objectInfo.getId();
            if (!(objectIntersectInfo != null ? objectIntersectInfo.intersectInfo.faceKnown : false)) {
                data.TouchObject(objectInfo.localID);
            } else {
                LLVector3 absolutePosition = objectInfo.getAbsolutePosition();
                data.TouchObjectFace(objectInfo, objectIntersectInfo.intersectInfo.faceID, absolutePosition.x, absolutePosition.y, absolutePosition.z, objectIntersectInfo.intersectInfo.u, objectIntersectInfo.intersectInfo.v, objectIntersectInfo.intersectInfo.s, objectIntersectInfo.intersectInfo.t);
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:165:0x00af, code lost:
    
        if ((!(!r12.camButtonEnabled ? r12.manualCamMode : false)) != false) goto L49;
     */
    /* JADX WARN: Code restructure failed: missing block: B:172:0x0092, code lost:
    
        if ((!(r12.camButtonEnabled ? r12.manualCamMode : false)) == false) goto L33;
     */
    /* JADX WARN: Removed duplicated region for block: B:151:0x017b  */
    /* JADX WARN: Removed duplicated region for block: B:163:0x00ab  */
    /* JADX WARN: Removed duplicated region for block: B:166:0x0169  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00f7  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00fd  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x0107  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0121  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x0137  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void updateObjectPanel() {
        int i;
        int i2;
        int i3;
        String orNull;
        MyAvatarState data = this.myAvatarState.getData();
        SLAgentCircuit agentCircuit = this.agentCircuit.getData();
        boolean z = agentCircuit != null;
        boolean isSitting = data != null ? data.isSitting() : false;
        boolean hasHUDs = data != null ? data.hasHUDs() : false;
        boolean isFlying = data != null ? data.isFlying() : false;
        boolean canStandUp = agentCircuit != null ? agentCircuit.getModules().rlvController.canStandUp() : false;
        boolean canSit = agentCircuit != null ? agentCircuit.getModules().rlvController.canSit() : false;
        boolean z2 = this.pickedObject != null;
        Debug.Printf("isSitting %b, isFlying %b, hasHUDs %b, isDragging %b", Boolean.valueOf(isSitting), Boolean.valueOf(isFlying), Boolean.valueOf(hasHUDs), Boolean.valueOf(this.isDragging));
        this.dragPointerLayout.setVisibility(this.isDragging ? View.VISIBLE : View.INVISIBLE);
        this.dragPointer.setVisibility(this.isDragging ? View.VISIBLE : View.INVISIBLE);
        boolean movementControlsVisible = z && !isSitting
                && !(this.camButtonEnabled && this.manualCamMode)
                && !this.isDragging && !z2;
        LinearLayout linearLayout = this.flyButtonsLayout;
        i = movementControlsVisible ? 0 : 8;
        linearLayout.setVisibility(i);
        View view = this.moveButtonsLayout;
        i2 = movementControlsVisible ? 0 : 4;
        view.setVisibility(i2);
        this.buttonStandUp.setVisibility((canStandUp && isSitting && (this.isDragging ^ true)) ? View.VISIBLE : View.GONE);
        this.buttonHUD.setVisibility((hasHUDs && (this.isDragging ^ true) && z) ? View.VISIBLE : View.GONE);
        this.buttonFlyDownward.setVisibility(((isFlying && z) || (this.camButtonEnabled && this.manualCamMode)) ? View.VISIBLE : View.GONE);
        ImageButton imageButton = this.buttonStopFlying;
        i3 = isFlying && z && !(this.camButtonEnabled && this.manualCamMode) ? 0 : 8;
        imageButton.setVisibility(i3);
        this.buttonCamOn.setVisibility((this.camButtonEnabled && (this.manualCamMode ^ true) && (this.isDragging ^ true) && (z2 ^ true)) ? View.VISIBLE : View.GONE);
        this.buttonCamOff.setVisibility((this.camButtonEnabled && this.manualCamMode && (this.isDragging ^ true) && (z2 ^ true)) ? View.VISIBLE : View.GONE);
        if (this.pickedObject == null || (!z)) {
            this.objectControlsPanel.setVisibility(View.GONE);
            return;
        }
        this.objectControlsPanel.setVisibility(View.VISIBLE);
        boolean isTouchable = this.pickedObject.isTouchable();
        if (this.pickedObject.isAvatar()) {
            isTouchable |= this.pickedObject.hasTouchableChildren();
        }
        this.objectTouchButton.setVisibility(isTouchable ? View.VISIBLE : View.GONE);
        boolean isAvatar = this.pickedObject.isAvatar();
        boolean z3 = isSitting && this.pickedObject.localID == data.sittingOn();
        boolean z4 = !isAvatar ? !z3 : false;
        if (isAvatar) {
            z3 = false;
        }
        this.objectSitButton.setVisibility((z4 && canSit) ? View.VISIBLE : View.GONE);
        this.objectStandButton.setVisibility((z3 && canStandUp) ? View.VISIBLE : View.GONE);
        this.objectChatButton.setVisibility(isAvatar ? View.VISIBLE : View.GONE);
        this.avatarIconView.setVisibility(isAvatar ? View.VISIBLE : View.GONE);
        this.objectPayButton.setVisibility((this.pickedObject.isPayable() || this.pickedObject.saleType != 0) ? View.VISIBLE : View.GONE);
        if (this.pickedObject.isAvatar()) {
            orNull = this.pickedAvatarNameRetriever != null ? this.pickedAvatarNameRetriever.getResolvedName() : null;
        } else {
            SLObjectProfileData objectProfileData = this.selectedObjectProfile.getData();
            orNull = (objectProfileData == null || !Objects.equal(objectProfileData.objectUUID(), this.pickedObject.getId())) ? null : objectProfileData.name().orNull();
            if (orNull == null) {
                orNull = this.pickedObject.name;
            }
        }
        if (orNull == null) {
            orNull = getString(R.string.object_name_loading);
        }
        this.objectNameTextView.setText(orNull);
    }

    private void updateSimTimeOverride() {
        if (this.mGLView != null) {
            GlobalOptions globalOptions = GlobalOptions.getInstance();
            this.mGLView.setForcedTime(globalOptions.getForceDaylightTime(), globalOptions.getForceDaylightHour());
        }
    }

    private void updateSplitScreenLayout() {
        Fragment findFragmentById = getSupportFragmentManager().findFragmentById(R.id.details);
        Object[] objArr = new Object[3];
        objArr[0] = Boolean.valueOf(this.isSplitScreen);
        objArr[1] = Boolean.valueOf(findFragmentById != null);
        objArr[2] = Boolean.valueOf(findFragmentById != null ? findFragmentById.isDetached() : false);
        Debug.Printf("updateSplitScreenLayout: isSplitScreen now %b details has %b detached %b", objArr);
        if (findFragmentById == null || !(!findFragmentById.isDetached())) {
            this.worldOverlaysContainer.setVisibility(View.VISIBLE);
        } else {
            this.detailsContainer.setVisibility(View.VISIBLE);
            this.worldOverlaysContainer.setVisibility(this.isSplitScreen ? View.VISIBLE : View.GONE);
        }
        this.objectPopupLeftSpacer.setVisibility(this.isSplitScreen ? View.VISIBLE : View.GONE);
    }

    @Override
    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        if (this.detailsContainer.getVisibility() == 0) {
            return super.dispatchKeyEvent(keyEvent);
        }
        switch (keyEvent.getKeyCode()) {
            case 19:
                if (this.avatarControl != null) {
                    if (keyEvent.getAction() != 0) {
                        if (keyEvent.getAction() == 1) {
                            this.avatarControl.StopAgentMotion();
                            break;
                        }
                    } else {
                        this.avatarControl.stopCamming();
                        this.avatarControl.StartAgentMotion(2);
                        break;
                    }
                }
                break;
            case 20:
                if (this.avatarControl != null) {
                    if (keyEvent.getAction() != 0) {
                        if (keyEvent.getAction() == 1) {
                            this.avatarControl.StopAgentMotion();
                            break;
                        }
                    } else {
                        this.avatarControl.stopCamming();
                        this.avatarControl.StartAgentMotion(4);
                        break;
                    }
                }
                break;
            case 21:
                if (this.avatarControl != null) {
                    if (keyEvent.getAction() != 0) {
                        if (keyEvent.getAction() == 1) {
                            this.avatarControl.stopTurning();
                            break;
                        }
                    } else {
                        this.avatarControl.startTurning(TURNING_SPEED);
                        break;
                    }
                }
                break;
            case 22:
                if (this.avatarControl != null) {
                    if (keyEvent.getAction() != 0) {
                        if (keyEvent.getAction() == 1) {
                            this.avatarControl.stopTurning();
                            break;
                        }
                    } else {
                        this.avatarControl.startTurning(-50.0f);
                        break;
                    }
                }
                break;
            case 92:
                if (this.avatarControl != null) {
                    if (keyEvent.getAction() != 0) {
                        if (keyEvent.getAction() == 1) {
                            this.avatarControl.StopAgentMotion();
                            break;
                        }
                    } else {
                        this.avatarControl.stopCamming();
                        this.avatarControl.StartAgentMotion(8);
                        break;
                    }
                }
                break;
            case 93:
                if (this.avatarControl != null) {
                    if (keyEvent.getAction() != 0) {
                        if (keyEvent.getAction() == 1) {
                            this.avatarControl.StopAgentMotion();
                            break;
                        }
                    } else {
                        this.avatarControl.stopCamming();
                        this.avatarControl.StartAgentMotion(16);
                        break;
                    }
                }
                break;
        }
        return super.dispatchKeyEvent(keyEvent);
    }

    @EventHandler
    public void handleBakingProgressEvent(SLBakingProgressEvent bakingProgressEvent) {
        if (bakingProgressEvent.first) {
            Toast.makeText(this, "Updating avatar appearance...", Toast.LENGTH_SHORT).show();
        }
    }

    public void handleChatEvent(ActiveChattersManager.ChatMessageEvent chatMessageEvent) {
        if (!this.chatOver3D || detailsVisible() || this.userManager == null || this.chatsOverlayLayout == null || this.fadingTextViewLog == null) {
            return;
        }
        this.fadingTextViewLog.handleChatEvent(chatMessageEvent);
    }

    public void handlePickedObject(ObjectIntersectInfo objectIntersectInfo) {
        this.pickedIntersectInfo = objectIntersectInfo;
        this.pickedObject = objectIntersectInfo != null ? objectIntersectInfo.objInfo : null;
        if (this.pickedObject != null) {
            if (this.pickedObject.isAvatar()) {
                ChatterID.ChatterIDUser userChatterID = ChatterID.getUserChatterID(this.userManager.getUserID(), this.pickedObject.getId());
                if (!Objects.equal(this.pickedAvatarNameRetriever != null ? this.pickedAvatarNameRetriever.chatterID : null, userChatterID)) {
                    if (this.pickedAvatarNameRetriever != null) {
                        this.pickedAvatarNameRetriever.dispose();
                        this.pickedAvatarNameRetriever = null;
                    }
                    this.pickedAvatarNameRetriever = new ChatterNameRetriever(userChatterID, new ChatterNameRetriever.OnChatterNameUpdated() {
                        private final /* synthetic */ void $m$0(ChatterNameRetriever chatterNameRetriever) {
                            WorldViewActivity.this.onPickedAvatarNameUpdated(chatterNameRetriever);
                        }

                        @Override
                        public final void onChatterNameUpdated(ChatterNameRetriever chatterNameRetriever) {
                            $m$0(chatterNameRetriever);
                        }
                    }, UIThreadExecutor.getInstance());
                }
            } else {
                Debug.Printf("ObjectPick: picked object %d", Integer.valueOf(this.pickedObject.localID));
                this.selectedObjectProfile.subscribe(this.userManager.getObjectsManager().getObjectProfile(), Integer.valueOf(this.pickedObject.localID));
            }
            updateObjectPanel();
            beginCountingObjectDeselect();
        } else {
            this.selectedObjectProfile.unsubscribe();
            if (this.pickedAvatarNameRetriever != null) {
                this.pickedAvatarNameRetriever.dispose();
                this.pickedAvatarNameRetriever = null;
            }
        }
        this.mGLView.setDrawPickedObject(this.pickedObject);
        updateObjectPanel();
    }

    @Override
    protected boolean isRootDetailsFragment(Class<? extends Fragment> cls) {
        return cls == ContactsFragment.class || cls == ChatFragment.class || cls == ObjectDetailsFragment.class || cls == OutfitsFragment.class || cls == UserProfileFragment.class;
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_render_WorldViewActivity_10269, reason: not valid java name */
    /* synthetic */ void m853x5cc8da9f(ValueAnimator valueAnimator) {
        this.insetsBackground.setAlpha(1.0f - valueAnimator.getAnimatedFraction());
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_render_WorldViewActivity_43183, reason: not valid java name */
    /* synthetic */ void m854x5cf47ab6(DialogInterface dialogInterface, int i) {
        SLAgentCircuit activeAgentCircuit;
        if (this.userManager != null && (activeAgentCircuit = this.userManager.getActiveAgentCircuit()) != null && this.pickedObject != null) {
            activeAgentCircuit.BuyObject(this.pickedObject.localID, this.pickedObject.saleType, this.pickedObject.salePrice);
        }
        dialogInterface.dismiss();
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_render_WorldViewActivity_48476, reason: not valid java name */
    /* synthetic */ void m855x5cf6cbb8(List list, DialogInterface dialogInterface, int i) {
        if (i < 0 || i >= list.size()) {
            return;
        }
        displayHUD(((SelectableAttachment) list.get(i)).getLocalID());
    }

    @Override
    public int mapThemeResourceId(int i) {
        return i == com.lumiyaviewer.lumiya.R.style.Theme_Lumiya_Light ? R.style.Theme_Lumiya_Light_NoActionBar : i == com.lumiyaviewer.lumiya.R.style.Theme_Lumiya_Pink ? R.style.Theme_Lumiya_Pink_NoActionBar : R.style.Theme_Lumiya_NoActionBar;
    }

    public void moveTouchEvent(int i, MotionEvent motionEvent) {
        if (this.avatarControl != null) {
            if (motionEvent.getAction() != 0) {
                if (motionEvent.getAction() == 1) {
                    if (this.manualCamMode && this.camButtonEnabled) {
                        this.avatarControl.stopCameraManualControl();
                        return;
                    } else {
                        this.avatarControl.StopAgentMotion();
                        return;
                    }
                }
                return;
            }
            if (this.manualCamMode && this.camButtonEnabled) {
                float f = (i & 16) != 0 ? -1.0f : (i & 8) != 0 ? 1.0f : 0.0f;
                float f2 = (i & 2) != 0 ? 1.0f : 0.0f;
                if ((i & 4) != 0) {
                    f2 = -1.0f;
                }
                this.avatarControl.startCameraManualControl(0.0f, f2, f, (i & 64) == 0 ? (i & 32) == 0 ? 0.0f : 1.0f : -1.0f);
                return;
            }
            this.avatarControl.stopCamming();
            this.avatarControl.StartAgentMotion(i);
            if ((i & 8) == 0 && (i & 16) == 0) {
                return;
            }
            updateObjectPanel();
        }
    }

    public void onCamOffButton() {
        if (this.camButtonEnabled) {
            this.manualCamMode = false;
            if (this.avatarControl != null) {
                this.avatarControl.setCameraManualControl(false);
            }
            updateObjectPanel();
        }
    }

    public void onCamOnButton() {
        if (this.camButtonEnabled) {
            this.manualCamMode = true;
            if (this.avatarControl != null) {
                this.avatarControl.setCameraManualControl(true);
            }
            updateObjectPanel();
        }
    }

    @Override
    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        this.isSplitScreen = LumiyaApp.isSplitScreenNeeded(this);
        updateSplitScreenLayout();
    }

    @Override
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.userManager = ActivityUtils.getUserManager(getIntent());
        if (this.userManager == null) {
            finish();
            return;
        }
        this.isSplitScreen = LumiyaApp.isSplitScreenNeeded(this);
        this.scaleGestureDetector = new ScaleGestureDetector(this, this.scaleGestureListener);
        if (Build.VERSION.SDK_INT >= 19) {
            this.scaleGestureDetector.setQuickScaleEnabled(true);
        }
        this.gestureDetector = new GestureDetectorCompat(this, this.gestureListener);
        initContentView();
        this.fadingTextViewLog = new FadingTextViewLog(this.userManager, this, this.chatsOverlayLayout, Color.rgb(192, 192, 192), Color.argb(160, 0, 0, 0));
        if (Build.VERSION.SDK_INT >= 12) {
            this.buttonsFadeAnimator = ValueAnimator.ofFloat(0.0f, 1.0f);
            this.buttonsFadeAnimator.setDuration(1000L);
            this.buttonsFadeAnimator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() {
                private final /* synthetic */ void $m$0(ValueAnimator valueAnimator) {
                    WorldViewActivity.this.m853x5cc8da9f(valueAnimator);
                }

                @Override
                public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                    $m$0(valueAnimator);
                }
            });
        }
        updateSplitScreenLayout();
        startFadingButtonsTimer();
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        super.onCreateOptionsMenu(menu);
        getMenuInflater().inflate(R.menu.world_view_menu, menu);
        return true;
    }

    @Override
    protected boolean onDetailsStackEmpty() {
        if (super.onDetailsStackEmpty()) {
            return true;
        }
        this.detailsContainer.setVisibility(View.GONE);
        if (!this.isSplitScreen) {
            this.worldOverlaysContainer.setVisibility(View.VISIBLE);
        }
        beginCountingButtonsFade();
        beginCountingObjectDeselect();
        return false;
    }

    @Override
    @Nullable
    public Intent onGetNotifyCaptureIntent(@Nonnull UnreadNotificationInfo unreadNotificationInfo, Intent intent) {
        Debug.Printf("NotifyCapture: returning new intent", new Object[0]);
        Intent intent2 = new Intent(this, (Class<?>) WorldViewActivity.class);
        intent2.putExtras(intent);
        intent2.putExtra(FROM_NOTIFICATION_TAG, true);
        intent2.addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP);
        return intent2;
    }

    @EventHandler
    public void onGlobalOptionsChanged(GlobalOptions.GlobalOptionsChangedEvent globalOptionsChangedEvent) {
        updateSimTimeOverride();
    }

    public void onHUDButton() {
        if (this.displayedHUDid == 0) {
            selectHUDtoDisplay();
            return;
        }
        this.displayedHUDid = 0;
        this.mGLView.setDisplayedHUDid(this.displayedHUDid);
        updateObjectPanel();
    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        Debug.Printf("NotifyCapture: got newIntent: %s", intent);
        this.mHandler.post(this.buttonsRestoreTask);
        beginCountingButtonsFade();
        beginCountingObjectDeselect();
        if (intent.hasExtra(FROM_NOTIFICATION_TAG)) {
            Bundle bundle = intent.hasExtra(MasterDetailsActivity.INTENT_SELECTION_KEY) ? intent.getBundleExtra(MasterDetailsActivity.INTENT_SELECTION_KEY) : null;
            if (bundle != null) {
                DetailsActivity.showEmbeddedDetails(this, ChatFragment.class, bundle);
            } else if (this.userManager != null) {
                DetailsActivity.showEmbeddedDetails(this, ContactsFragment.class, ActivityUtils.makeFragmentArguments(this.userManager.getUserID(), null));
            }
        }
    }

    public void onObjectChatButton() {
        if (this.pickedObject != null) {
            chatWithObject(this.pickedObject);
        }
    }

    public void onObjectMoreButton() {
        if (this.pickedObject != null) {
            showObjectInfo(this.pickedObject);
        }
    }

    public void onObjectPayButton() {
        SLObjectProfileData data;
        if (this.pickedObject != null) {
            String name = this.pickedObject.getName();
            if (Strings.isNullOrEmpty(name)) {
                name = getString(R.string.object_name_loading);
            }
            if (this.pickedObject.saleType != 0) {
                AlertDialog.Builder builder = new AlertDialog.Builder(this);
                builder.setMessage(String.format(getString(R.string.object_buy_confirm), name, Integer.valueOf(this.pickedObject.salePrice))).setCancelable(false).setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                    private final /* synthetic */ void $m$0(DialogInterface dialogInterface, int i) {
                        WorldViewActivity.this.m854x5cf47ab6(dialogInterface, i);
                    }

                    @Override
                    public final void onClick(DialogInterface dialogInterface, int i) {
                        $m$0(dialogInterface, i);
                    }
                }).setNegativeButton("No", new DialogInterface.OnClickListener() {
                    private final /* synthetic */ void $m$0(DialogInterface dialogInterface, int i) {
                        dialogInterface.cancel();
                    }

                    @Override
                    public final void onClick(DialogInterface dialogInterface, int i) {
                        $m$0(dialogInterface, i);
                    }
                });
                builder.show();
            } else {
                if (!this.pickedObject.isPayable() || (data = this.selectedObjectProfile.getData()) == null || this.userManager == null) {
                    return;
                }
                ObjectPayDialog.show(this, this.userManager, data);
            }
        }
    }

    public void onObjectSitButton() {
        if (this.pickedObject == null || this.avatarControl == null) {
            return;
        }
        this.avatarControl.SitOnObject(this.pickedObject.getId());
    }

    public void onObjectStandButton() {
        if (this.avatarControl != null) {
            this.avatarControl.Stand();
        }
    }

    public void onObjectTouchButton() {
        if (this.pickedObject != null) {
            touchObject(this.pickedObject, this.pickedIntersectInfo);
        }
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            case R.id.item_chat:
                DetailsActivity.showEmbeddedDetails(this, ContactsFragment.class, ActivityUtils.makeFragmentArguments(this.userManager.getUserID(), null));
                return true;
            case R.id.item_outfits:
                DetailsActivity.showEmbeddedDetails(this, OutfitsFragment.class, OutfitsFragment.makeSelection(this.userManager.getUserID(), null));
                return true;
            case R.id.item_select_object:
                if (this.isDragging) {
                    endDragSelection();
                } else {
                    beginDragSelection();
                }
                return true;
            case R.id.item_cardboard_view:
                enterVrView();
                return true;
            case R.id.item_take_screenshot:
                takeScreenshot();
                return true;
            case R.id.item_stop_animations:
                stopAvatarAnimations();
                return true;
            default:
                return super.onOptionsItemSelected(menuItem);
        }
    }

    @Override
    public void onPause() {
        Debug.Printf("WorldViewActivity: onPause", new Object[0]);
        if (this.userManager != null) {
            this.userManager.getUnreadNotificationManager().clearNotifyCapture(this);
            try {
                this.userManager.getChatterList().getActiveChattersManager().getChatEventBus().unregister(this.chatEventHandler);
            } catch (IllegalArgumentException e) {
            }
            if (this.fadingTextViewLog != null) {
                this.fadingTextViewLog.clearChatEvents();
            }
        }
        this.localDrawingEnabled = false;
        if (this.drawDistance != null) {
            this.drawDistance.Disable3DView();
        }
        this.mGLView.onPause();
        this.mHandler.removeCallbacks(this.objectDeselectTimerTask);
        this.mHandler.removeCallbacks(this.buttonsFadeTask);
        this.objectDeselectTimerStarted = false;
        this.buttonsFadeTimerStarted = false;
        this.myAvatarState.unsubscribe();
        this.selectedObjectProfile.unsubscribe();
        this.currentLocationInfo.unsubscribe();
        System.gc();
        super.onPause();
    }

    @Override
    public boolean onPrepareOptionsMenu(Menu menu) {
        MenuItem findItem = menu.findItem(R.id.item_cardboard_view);
        if (findItem != null) {
            findItem.setVisible(true);
        }
        return super.onPrepareOptionsMenu(menu);
    }

    @Override
    public void onRequestPermissionsResult(int i, @Nonnull String[] strArr, @Nonnull int[] ints) {
        super.onRequestPermissionsResult(i, strArr, ints);
        Debug.Printf("Cardboard: onRequestPermissionResult, code %d", Integer.valueOf(i));
        if (i == 100 && ints.length > 0 && ints[0] == PackageManager.PERMISSION_GRANTED) {
            startVrActivity(VrIntentContract.VR_RUNTIME_CARDBOARD);
        }
    }

    @Override
    public void onResume() {
        super.onResume();
        Debug.Printf("WorldViewActivity: onResume", new Object[0]);
        SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(getBaseContext());
        this.chatOver3D = defaultSharedPreferences.getBoolean("chat_over_3d", true);
        this.arrowsToTurn = defaultSharedPreferences.getBoolean("arrows_rotate_avatar", false);
        this.camButtonEnabled = defaultSharedPreferences.getBoolean("cam_button_enabled", false);
        if (this.userManager != null) {
            this.userManager.getUnreadNotificationManager().setNotifyCapture(this);
            this.myAvatarState.subscribe(this.userManager.getObjectsManager().myAvatarState(), SubscriptionSingleKey.Value);
            this.currentLocationInfo.subscribe(this.userManager.getCurrentLocationInfo(), SubscriptionSingleKey.Value);
            this.userManager.getChatterList().getActiveChattersManager().getChatEventBus().register(this.chatEventHandler);
        }
        RenderSettings renderSettings = new RenderSettings(defaultSharedPreferences);
        this.prefDrawDistance = renderSettings.drawDistance;
        this.localDrawingEnabled = true;
        if (this.drawDistance != null) {
            this.drawDistance.Enable3DView(this.prefDrawDistance);
        }
        if (this.camButtonEnabled && this.avatarControl != null) {
            this.manualCamMode = this.avatarControl.getIsManualCamming();
        }
        this.mGLView.setDrawDistance(this.prefDrawDistance);
        this.mGLView.setAvatarCountLimit(renderSettings.avatarCountLimit);
        this.mGLView.onResume();
        updateObjectPanel();
        if (this.fadingTextViewLog != null) {
            this.fadingTextViewLog.postRemovingStaleChats();
        }
    }

    @Override
    protected void onStart() {
        super.onStart();
        if (this.userManager != null) {
            this.agentCircuit.subscribe(UserManager.agentCircuits(), this.userManager.getUserID());
            this.voiceActiveChatter.subscribe(this.userManager.getVoiceActiveChatter(), SubscriptionSingleKey.Value);
        }
        updateSimTimeOverride();
    }

    @Override
    protected void onStop() {
        this.agentCircuit.unsubscribe();
        this.voiceActiveChatter.unsubscribe();
        this.voiceChatInfo.unsubscribe();
        this.voiceStatusView.setChatterID(null);
        super.onStop();
    }

    public void onStopFlyingButton() {
        if (this.avatarControl != null) {
            this.avatarControl.stopFlying();
            updateObjectPanel();
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code restructure failed: missing block: B:3:0x000e, code lost:
    
        return false;
     */
    @Override
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean onTouch(View view, MotionEvent motionEvent) {
        switch (view.getId()) {
            case R.id.button_move_forward:
                moveTouchEvent(2, motionEvent);
                return false;
            case R.id.button_turn_left:
                if (!this.arrowsToTurn) {
                    moveTouchEvent(32, motionEvent);
                } else if (this.avatarControl != null) {
                    if (this.manualCamMode && this.camButtonEnabled) {
                        if (motionEvent.getActionMasked() == 0) {
                            this.avatarControl.startCameraManualControl(TURNING_SPEED, 0.0f, 0.0f, 0.0f);
                        } else if (motionEvent.getActionMasked() == 1) {
                            this.avatarControl.stopCameraManualControl();
                        }
                    } else if (motionEvent.getActionMasked() == 0) {
                        this.avatarControl.startTurning(TURNING_SPEED);
                    } else if (motionEvent.getActionMasked() == 1) {
                        this.avatarControl.stopTurning();
                    }
                }
                return false;
            case R.id.button_move_backward:
                moveTouchEvent(4, motionEvent);
                return false;
            case R.id.button_turn_right:
                if (!this.arrowsToTurn) {
                    moveTouchEvent(64, motionEvent);
                } else if (this.avatarControl != null) {
                    if (this.manualCamMode && this.camButtonEnabled) {
                        if (motionEvent.getActionMasked() == 0) {
                            this.avatarControl.startCameraManualControl(-50.0f, 0.0f, 0.0f, 0.0f);
                        } else if (motionEvent.getActionMasked() == 1) {
                            this.avatarControl.stopCameraManualControl();
                        }
                    } else if (motionEvent.getActionMasked() == 0) {
                        this.avatarControl.startTurning(-50.0f);
                    } else if (motionEvent.getActionMasked() == 1) {
                        this.avatarControl.stopTurning();
                    }
                }
                return false;
            case R.id.button_fly_upward:
                moveTouchEvent(8, motionEvent);
                return false;
            case R.id.button_fly_downward:
                moveTouchEvent(16, motionEvent);
                return false;
            default:
                return false;
        }
    }

    @Override
    public void onUserInteraction() {
        super.onUserInteraction();
        Debug.Printf("ButtonsFade: some user interaction", new Object[0]);
        this.mHandler.post(this.buttonsRestoreTask);
        beginCountingButtonsFade();
        beginCountingObjectDeselect();
    }

    public void processScreenshot(Bitmap bitmap) {
        try {
            File file = new File(getCacheDir(), "screenshots");
            file.mkdirs();
            File file2 = new File(file, "Lumiya-" + new SimpleDateFormat("yyyy-MM-dd-HHmmss", Locale.US).format(new Date()) + ".jpg");
            FileOutputStream fileOutputStream = new FileOutputStream(file2);
            bitmap.compress(Bitmap.CompressFormat.JPEG, 80, fileOutputStream);
            fileOutputStream.close();
            Uri uriForFile = FileProvider.getUriForFile(this, "com.lumiyaviewer.files", file2);
            SLAgentCircuit data = this.agentCircuit.getData();
            String agentSLURL = data != null ? data.getAgentSLURL() : null;
            String string = agentSLURL != null ? getString(R.string.screenshot_taken_slurl, new Object[]{agentSLURL}) : getString(R.string.screenshot_taken_lumiya);
            Intent intent = new Intent();
            intent.setAction("android.intent.action.SEND");
            intent.putExtra("android.intent.extra.TEXT", string);
            intent.putExtra("android.intent.extra.STREAM", uriForFile);
            intent.putExtra("android.intent.extra.SUBJECT", "Screenshot from Lumiya");
            intent.setType("image/jpeg");
            intent.setFlags(1);
            startActivity(Intent.createChooser(intent, getString(R.string.export_screenshot_to)));
        } catch (Exception e) {
            Toast.makeText(this, R.string.failed_to_make_screenshot, Toast.LENGTH_SHORT).show();
        }
    }

    public void rendererAdvancedRenderingChanged() {
        Intent intent = getIntent();
        finish();
        startActivity(intent);
    }

    @SuppressLint({"CommitPrefEdits"})
    void rendererShaderCompileError() {
        Toast.makeText(this, "Advanced rendering is not available on your hardware. Falling back to basic rendering.", Toast.LENGTH_LONG).show();
        SharedPreferences.Editor edit = PreferenceManager.getDefaultSharedPreferences(getBaseContext()).edit();
        edit.putBoolean("advanced_rendering", false);
        edit.commit();
        finish();
        startActivity(new Intent(this, (Class<?>) getClass()));
    }

    void rendererSurfaceCreated() {
        if (this.drawDistance != null) {
            this.drawDistance.Enable3DView(this.prefDrawDistance);
        }
    }

    @Override
    public void setLastTouchUUID(UUID uuid) {
        this.lastTouchUUID = uuid;
    }

    public void setTouchedObject(SLObjectInfo objectInfo) {
        if (objectInfo != null) {
            this.lastTouchUUID = objectInfo.getId();
            if (this.lastTouchUUID != null) {
                Debug.Log("Touch: Last touched object set to " + this.lastTouchUUID);
            }
        }
    }

    @Override
    @Nullable
    public Fragment showDetailsFragment(Class<? extends Fragment> cls, Intent intent, Bundle bundle) {
        this.detailsContainer.setVisibility(View.VISIBLE);
        if (!this.isSplitScreen) {
            this.worldOverlaysContainer.setVisibility(View.GONE);
            this.voiceStatusView.disableMic();
        }
        if (this.fadingTextViewLog != null) {
            this.fadingTextViewLog.clearChatEvents();
        }
        return super.showDetailsFragment(cls, intent, bundle);
    }
}
