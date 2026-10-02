package com.lumiyaviewer.lumiya.ui.render

import android.animation.ValueAnimator
import android.annotation.SuppressLint
import android.content.DialogInterface
import android.content.Intent
import android.content.SharedPreferences
import android.content.pm.PackageManager
import android.content.res.Configuration
import android.graphics.Bitmap
import android.graphics.Color
import android.net.Uri
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.os.SystemClock
import androidx.preference.PreferenceManager
import androidx.core.app.ActivityCompat
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentManager
import androidx.core.content.ContextCompat
import androidx.core.content.FileProvider
import androidx.core.view.GestureDetectorCompat
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.widget.Toolbar
import android.util.TypedValue
import android.view.GestureDetector
import android.view.KeyEvent
import android.view.Menu
import android.view.MenuItem
import android.view.MotionEvent
import android.view.ScaleGestureDetector
import android.view.View
import android.view.ViewGroup
import android.widget.AbsoluteLayout
import android.widget.ArrayAdapter
import android.widget.Toast
import com.google.common.base.Objects
import com.google.common.base.Strings
import com.google.common.eventbus.Subscribe
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.GlobalOptions
import com.lumiyaviewer.lumiya.LumiyaApp
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.databinding.WorldViewBinding
import com.lumiyaviewer.lumiya.eventbus.EventHandler
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.render.picking.ObjectIntersectInfo
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.avatar.SLAttachmentPoint
import com.lumiyaviewer.lumiya.slproto.events.SLBakingProgressEvent
import com.lumiyaviewer.lumiya.slproto.modules.SLAvatarControl
import com.lumiyaviewer.lumiya.slproto.modules.SLDrawDistance
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectAvatarInfo
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectInfo
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectProfileData
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever
import com.lumiyaviewer.lumiya.slproto.users.ParcelData
import com.lumiyaviewer.lumiya.slproto.users.manager.ActiveChattersManager
import com.lumiyaviewer.lumiya.slproto.users.manager.CurrentLocationInfo
import com.lumiyaviewer.lumiya.slproto.users.manager.MyAvatarState
import com.lumiyaviewer.lumiya.slproto.users.manager.UnreadNotificationInfo
import com.lumiyaviewer.lumiya.slproto.users.manager.UnreadNotificationManager
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.ThemeMapper
import com.lumiyaviewer.lumiya.ui.chat.ChatFragment
import com.lumiyaviewer.lumiya.ui.chat.ContactsFragment
import com.lumiyaviewer.lumiya.ui.chat.profiles.UserProfileFragment
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.render.vr.VrRuntime
import com.lumiyaviewer.lumiya.ui.render.vr.VrRuntimeSelector
import com.lumiyaviewer.lumiya.ui.common.MasterDetailsActivity
import com.lumiyaviewer.lumiya.ui.common.ScriptDialogHandler
import com.lumiyaviewer.lumiya.ui.objects.ObjectDetailsFragment
import com.lumiyaviewer.lumiya.ui.objects.ObjectPayDialog
import com.lumiyaviewer.lumiya.ui.objects.TouchableObjectsFragment
import com.lumiyaviewer.lumiya.ui.outfits.OutfitsFragment
import com.lumiyaviewer.lumiya.ui.render.WorldViewActivity
import com.lumiyaviewer.lumiya.voice.common.model.VoiceChatInfo
import java.io.File
import java.io.FileOutputStream
import java.text.SimpleDateFormat
import java.util.ArrayList
import java.util.Date
import java.util.List
import java.util.Locale
import java.util.NoSuchElementException
import java.util.UUID

open class WorldViewActivity : DetailsActivity(), View.OnTouchListener, ThemeMapper, ScriptDialogHandler, UnreadNotificationManager.NotifyCapture {
    private static long BUTTONS_FADE_TIMEOUT_MILLIS = 7500
    private static String FROM_NOTIFICATION_TAG = "fromNotification"
    private static long OBJECT_DESELECT_TIMEOUT_MILLIS = 6000
    private static int PERMISSION_AUDIO_REQUEST_CODE = 100
    private static float TURNING_SPEED = 50.0f

    private SLAvatarControl avatarControl
    private WorldViewBinding binding

    private SLDrawDistance drawDistance
    private FadingTextViewLog fadingTextViewLog
    private GestureDetectorCompat gestureDetector
    private boolean isSplitScreen
    private WorldSurfaceView mGLView
    private ScaleGestureDetector scaleGestureDetector
    private UserManager userManager
    private SLObjectInfo pickedObject = null
    private ObjectIntersectInfo pickedIntersectInfo = null
    private ChatterNameRetriever pickedAvatarNameRetriever = null
    private Handler mHandler = Handler(Looper.getMainLooper())
    private int prefDrawDistance = 20
    private boolean chatOver3D = false
    private UUID lastTouchUUID = null
    private int displayedHUDid = 0
    private int prevDisplayedHUDid = 0
    private float hudScaleFactor = 1.0f
    private float hudOffsetX = 0.0f
    private float hudOffsetY = 0.0f
    private boolean arrowsToTurn = false
    private boolean camButtonEnabled = false
    private boolean manualCamMode = false
    private boolean localDrawingEnabled = false
    private long lastActivityTime = SystemClock.uptimeMillis()
    private boolean buttonsFadeTimerStarted = false
    private ValueAnimator buttonsFadeAnimator = null
    private long lastObjectActivityTime = SystemClock.uptimeMillis()
    private boolean objectDeselectTimerStarted = false
    private boolean isInScaling = false
    private float oldScaleFocusX = Float.NaN
    private float oldScaleFocusY = Float.NaN
    private boolean wasInScaling = false
    private boolean isInteracting = false
    private boolean isDragging = false
    private SubscriptionData<UUID, SLAgentCircuit> agentCircuit = SubscriptionData<>(UIThreadExecutor.getInstance(), Subscription.OnData() {
            WorldViewActivity.this.onAgentCircuit((SLAgentCircuit) obj)
        }

        override fun onData(obj: Any) {
            long uptimeMillis = (WorldViewActivity.this.lastObjectActivityTime + WorldViewActivity.OBJECT_DESELECT_TIMEOUT_MILLIS) - SystemClock.uptimeMillis()
            Debug.Printf("ObjectDeselect: remaining %d", Long.valueOf(uptimeMillis))
            if (uptimeMillis <= 0) {
                WorldViewActivity.this.handlePickedObject(null)
            } else {
                WorldViewActivity.this.objectDeselectTimerStarted = true
                WorldViewActivity.this.mHandler.postDelayed(WorldViewActivity.this.objectDeselectTimerTask, uptimeMillis)
            }
        }
    }
    private Runnable buttonsFadeTask = Runnable() {
        override fun run() {
            WorldViewActivity.this.buttonsFadeTimerStarted = false
            if (!WorldViewActivity.this.detailsVisible() && (!WorldViewActivity.this.isDragging) && WorldViewActivity.this.agentCircuit.hasData()) {
                VoiceChatInfo voiceChatInfo = (VoiceChatInfo) WorldViewActivity.this.voiceChatInfo.getData()
                if ((voiceChatInfo == null || voiceChatInfo.state != VoiceChatInfo.VoiceChatState.Active) ? false : voiceChatInfo.localMicActive) {
                    return
                }
                long uptimeMillis = (WorldViewActivity.this.lastActivityTime + WorldViewActivity.BUTTONS_FADE_TIMEOUT_MILLIS) - SystemClock.uptimeMillis()
                Debug.Printf("ButtonsFade: remaining %d", Long.valueOf(uptimeMillis))
                if (uptimeMillis <= 0) {
                    WorldViewActivity.this.startFadingButtons()
                } else {
                    WorldViewActivity.this.buttonsFadeTimerStarted = true
                    WorldViewActivity.this.mHandler.postDelayed(WorldViewActivity.this.buttonsFadeTask, uptimeMillis)
                }
            }
        }
    }
    private Runnable buttonsRestoreTask = Runnable() {
        override fun run() {
            if (WorldViewActivity.this.buttonsFadeAnimator != null) {
                WorldViewActivity.this.buttonsFadeAnimator.cancel()
            }
            WorldViewActivity.this.binding.insetsBackground.setAlpha(1.0f)
        }
    }
    private View.OnTouchListener worldViewTouchListener = View.OnTouchListener() {
        override fun onTouch(view: View, motionEvent: MotionEvent): Boolean {
            boolean z
            boolean isInteracting = WorldViewActivity.this.isInteracting
            when (motionEvent.getActionMasked()) {
                0 -> {
                    WorldViewActivity.this.isInteracting = true
                    z = true
                    }
                1 -> {
                    WorldViewActivity.this.isInteracting = false
                    z = true
                    }
                else -> {
                    z = false
                    }
            }
            if (WorldViewActivity.this.isInteracting && (!isInteracting)) {
                WorldViewActivity.this.mGLView.setIsInteracting(true)
            }
            WorldViewActivity.this.wasInScaling = WorldViewActivity.this.isInScaling
            boolean onTouchEvent = z | WorldViewActivity.this.scaleGestureDetector.onTouchEvent(motionEvent) | WorldViewActivity.this.gestureDetector.onTouchEvent(motionEvent)
            if (isInteracting && (!WorldViewActivity.this.isInteracting)) {
                WorldViewActivity.this.mGLView.setIsInteracting(false)
            }
            return onTouchEvent
        }
    }
    private GestureDetector.OnGestureListener gestureListener = GestureDetector.SimpleOnGestureListener() {
        override fun onFling(motionEvent: MotionEvent, motionEvent2: MotionEvent, f: Float, f2: Float): Boolean {
            if (WorldViewActivity.this.isInScaling || !(!WorldViewActivity.this.wasInScaling) || !(!WorldViewActivity.this.isDragging)) {
                return false
            }
            float height = (f * 60.0f) / WorldViewActivity.this.binding.worldViewHolder.getHeight()
            float height2 = ((-f2) * 60.0f) / WorldViewActivity.this.binding.worldViewHolder.getHeight()
            if (WorldViewActivity.this.avatarControl == null) {
                return true
            }
            WorldViewActivity.this.avatarControl.processCameraFling(height / 1.5f, height2 / 2.5f)
            return true
        }

        override fun onLongPress(motionEvent: MotionEvent) {
            float rawX = motionEvent.getRawX()
            float rawY = motionEvent.getRawY()
            if (WorldViewActivity.this.isDragging) {
                WorldViewActivity.this.dragSelectorSetRawPosition((int) rawX, (int) rawY)
            } else {
                if (WorldViewActivity.this.isInScaling || !(!WorldViewActivity.this.wasInScaling)) {
                    return
                }
                int[] location = arrayOfNulls<int>(2]
                WorldViewActivity.this.binding.worldViewHolder.getLocationOnScreen(location)
                WorldViewActivity.this.mGLView.pickObjectHover(rawX - location[0], rawY - location[1])
            }
        }

        override fun onScroll(motionEvent: MotionEvent, motionEvent2: MotionEvent, f: Float, f2: Float): Boolean {
            if (WorldViewActivity.this.isDragging) {
                AbsoluteLayout.LayoutParams layoutParams = (AbsoluteLayout.LayoutParams) WorldViewActivity.this.binding.dragPointerView.getLayoutParams()
                if (layoutParams != null) {
                    layoutParams.x = Math.max(Math.min((int) (layoutParams.x - f), WorldViewActivity.this.binding.dragPointerLayout.getWidth() - WorldViewActivity.this.binding.dragPointerView.getWidth()), 0)
                    layoutParams.y = Math.max(Math.min((int) (layoutParams.y - f2), WorldViewActivity.this.binding.dragPointerLayout.getHeight() - WorldViewActivity.this.binding.dragPointerView.getHeight()), 0)
                    WorldViewActivity.this.binding.dragPointerView.setLayoutParams(layoutParams)
                    WorldViewActivity.this.selectByDragPointer(layoutParams.x, layoutParams.y)
                }
                return true
            }
            if (WorldViewActivity.this.isInScaling || !(!WorldViewActivity.this.wasInScaling)) {
                return false
            }
            if (WorldViewActivity.this.displayedHUDid != 0) {
                WorldViewActivity.this.hudOffsetX += (f / WorldViewActivity.this.binding.worldViewHolder.getHeight()) / 2.0f
                WorldViewActivity.this.hudOffsetY += (f2 / WorldViewActivity.this.binding.worldViewHolder.getHeight()) / 2.0f
                WorldViewActivity.this.mGLView.setHUDOffset(WorldViewActivity.this.hudOffsetX, WorldViewActivity.this.hudOffsetY)
            } else {
                float height = ((-f) * 60.0f) / WorldViewActivity.this.binding.worldViewHolder.getHeight()
                float height2 = (f2 * 60.0f) / WorldViewActivity.this.binding.worldViewHolder.getHeight()
                if (WorldViewActivity.this.avatarControl != null) {
                    WorldViewActivity.this.avatarControl.processCameraRotate(height, height2)
                }
            }
            return true
        }

        override fun onSingleTapUp(motionEvent: MotionEvent): Boolean {
            if (WorldViewActivity.this.isDragging) {
                WorldViewActivity.this.dragSelectorSetRawPosition((int) motionEvent.getRawX(), (int) motionEvent.getRawY())
            } else if (WorldViewActivity.this.displayedHUDid != 0) {
                int[] location = arrayOfNulls<int>(2]
                WorldViewActivity.this.binding.worldViewHolder.getLocationOnScreen(location)
                WorldViewActivity.this.mGLView.touchHUD(motionEvent.getRawX() - location[0], motionEvent.getRawY() - location[1])
            } else {
                WorldViewActivity.this.handlePickedObject(null)
            }
            return true
        }
    }
    private ScaleGestureDetector.OnScaleGestureListener scaleGestureListener = ScaleGestureDetector.SimpleOnScaleGestureListener() {
        override fun onScale(scaleGestureDetector: ScaleGestureDetector): Boolean {
            Debug.Printf("Gesture: scale factor: %f", Float.valueOf(scaleGestureDetector.getScaleFactor()))
            if (WorldViewActivity.this.displayedHUDid != 0) {
                WorldViewActivity.this.hudScaleFactor = Math.max(0.1f, Math.min(WorldViewActivity.this.hudScaleFactor * scaleGestureDetector.getScaleFactor(), 10.0f))
                WorldViewActivity.this.mGLView.setHUDScaleFactor(WorldViewActivity.this.hudScaleFactor)
            } else {
                float width = WorldViewActivity.this.binding.worldViewTouchReceiver.getWidth()
                float height = WorldViewActivity.this.binding.worldViewTouchReceiver.getHeight()
                float focusX = scaleGestureDetector.getFocusX()
                float focusY = scaleGestureDetector.getFocusY()
                float f = ((focusX / width) - 0.5f) * (height / width)
                float f2 = (focusY / height) - 0.5f
                float f3 = (focusX - WorldViewActivity.this.oldScaleFocusX) / height
                float f4 = (focusY - WorldViewActivity.this.oldScaleFocusY) / height
                WorldViewActivity.this.oldScaleFocusX = focusX
                WorldViewActivity.this.oldScaleFocusY = focusY
                if (WorldViewActivity.this.avatarControl != null) {
                    WorldViewActivity.this.avatarControl.processCameraZoom(scaleGestureDetector.getScaleFactor(), (-f) * 2.0f, (-f2) * 2.0f, f3, f4)
                }
            }
            return true
        }

        override fun onScaleBegin(scaleGestureDetector: ScaleGestureDetector): Boolean {
            WorldViewActivity.this.isInScaling = true
            WorldViewActivity.this.oldScaleFocusX = scaleGestureDetector.getFocusX()
            WorldViewActivity.this.oldScaleFocusY = scaleGestureDetector.getFocusY()
            return true
        }

        override fun onScaleEnd(scaleGestureDetector: ScaleGestureDetector) {
            WorldViewActivity.this.isInScaling = false
        }
    }


    private class SelectableAttachment {
        private String attachmentName
        private int localID

        constructor(localID: Int, attachmentName: String) {
            this.localID = localID
            this.attachmentName = attachmentName
        }

        open fun getLocalID(): Int {
            return this.localID
        }

        open fun toString(): String {
            return this.attachmentName
        }
    }

    private fun beginCountingButtonsFade() {
        this.lastActivityTime = SystemClock.uptimeMillis()
        this.lastObjectActivityTime = this.lastActivityTime
        startFadingButtonsTimer()
    }

    private fun beginCountingObjectDeselect() {
        if (this.pickedObject != null) {
            this.lastObjectActivityTime = SystemClock.uptimeMillis()
            if (this.objectDeselectTimerStarted) {
                return
            }
            this.objectDeselectTimerStarted = true
            this.mHandler.postDelayed(this.objectDeselectTimerTask, OBJECT_DESELECT_TIMEOUT_MILLIS)
        }
    }

    private fun beginDragSelection() {
        this.isDragging = true
        removeAllDetails()
        AbsoluteLayout.LayoutParams layoutParams = (AbsoluteLayout.LayoutParams) binding.dragPointerView.getLayoutParams()
        layoutParams.x = (binding.dragPointerLayout.getWidth() - binding.dragPointerView.getWidth()) / 2
        layoutParams.y = (binding.dragPointerLayout.getHeight() - binding.dragPointerView.getHeight()) / 2
        binding.dragPointerView.setLayoutParams(layoutParams)
        selectByDragPointer(layoutParams.x, layoutParams.y)
        this.mGLView.setOwnAvatarHidden(true)
        updateObjectPanel()
    }

    private fun chatWithObject(objectInfo: SLObjectInfo) {
        if (!(objectInfo is SLObjectAvatarInfo) || ((SLObjectAvatarInfo) objectInfo).isMyAvatar() || objectInfo.getId() == null) {
            return
        }
        DetailsActivity.showEmbeddedDetails(this, ChatFragment.class, ChatFragment.makeSelection(ChatterID.getUserChatterID(this.userManager.getUserID(), objectInfo.getId())))
    }

    open fun detailsVisible(): Boolean {
        Fragment findFragmentById
        FragmentManager supportFragmentManager = getSupportFragmentManager()
        return (supportFragmentManager == null || (findFragmentById = supportFragmentManager.findFragmentById(R.id.details)) == null || !findFragmentById.isVisible()) ? false : true
    }

    private fun displayHUD(displayedHUDid: Int) {
        Debug.Printf("Displaying HUD with ID %d", Integer.valueOf(displayedHUDid))
        this.displayedHUDid = displayedHUDid
        this.mGLView.setDisplayedHUDid(displayedHUDid)
        if (this.displayedHUDid != this.prevDisplayedHUDid) {
            this.hudScaleFactor = 1.0f
            this.hudOffsetX = 0.0f
            this.hudOffsetY = 0.0f
            this.prevDisplayedHUDid = this.displayedHUDid
        }
        this.mGLView.setHUDScaleFactor(this.hudScaleFactor)
        this.mGLView.setHUDOffset(this.hudOffsetX, this.hudOffsetY)
        if (this.displayedHUDid != 0) {
            handlePickedObject(null)
        }
        updateObjectPanel()
    }

    open fun dragSelectorSetRawPosition(i: Int, i2: Int) {
        int[] ints = arrayOfNulls<int>(2]
        binding.dragPointerLayout.getLocationOnScreen(ints)
        int width = i - (binding.dragPointerView.getWidth() / 2)
        int height = i2 - (binding.dragPointerView.getHeight() / 2)
        AbsoluteLayout.LayoutParams layoutParams = (AbsoluteLayout.LayoutParams) binding.dragPointerView.getLayoutParams()
        if (layoutParams != null) {
            layoutParams.x = Math.max(Math.min(width - ints[0], binding.dragPointerLayout.getWidth() - binding.dragPointerView.getWidth()), 0)
            layoutParams.y = Math.max(Math.min(height - ints[1], binding.dragPointerLayout.getHeight() - binding.dragPointerView.getHeight()), 0)
            binding.dragPointerView.setLayoutParams(layoutParams)
            selectByDragPointer(layoutParams.x, layoutParams.y)
        }
    }

    private fun endDragSelection() {
        this.isDragging = false
        this.mGLView.setOwnAvatarHidden(false)
        updateObjectPanel()
        beginCountingButtonsFade()
        beginCountingObjectDeselect()
    }

    private fun enterVrView() {
        if (ContextCompat.checkSelfPermission(this, "android.permission.RECORD_AUDIO") != 0) {
            Debug.Printf("Cardboard: audio permission not yet granted", arrayOfNulls<Object>(0])
            ActivityCompat.requestPermissions(this, arrayOfNulls<String>(]{"android.permission.RECORD_AUDIO"}, 100)
        } else {
            Debug.Printf("Cardboard: audio permission already granted", arrayOfNulls<Object>(0])
            startVrActivity(VrIntentContract.VR_RUNTIME_CARDBOARD)
        }
    }

    private fun initContentView() {
        binding = WorldViewBinding.inflate(getLayoutInflater())
        setContentView(binding.getRoot())
        setSupportActionBar((Toolbar) findViewById(R.id.toolbar))
        // Click listeners (migrated from WorldViewActivity_ViewBinding)
        binding.buttonCamOff.setOnClickListener(v -> onCamOffButton())
        binding.buttonCamOn.setOnClickListener(v -> onCamOnButton())
        binding.buttonHud.setOnClickListener(v -> onHUDButton())
        binding.buttonStandUp.setOnClickListener(v -> onObjectStandButton())
        binding.buttonStopFlying.setOnClickListener(v -> onStopFlyingButton())
        binding.objectChatButton.setOnClickListener(v -> onObjectChatButton())
        binding.objectMoreButton.setOnClickListener(v -> onObjectMoreButton())
        binding.objectPayButton.setOnClickListener(v -> onObjectPayButton())
        binding.objectSitButton.setOnClickListener(v -> onObjectSitButton())
        binding.objectStandButton.setOnClickListener(v -> onObjectStandButton())
        binding.objectTouchButton.setOnClickListener(v -> onObjectTouchButton())
        this.mGLView = WorldSurfaceView(this, this.userManager)
        binding.worldViewHolder.addView(this.mGLView)
        binding.buttonMoveForward.setOnTouchListener(this)
        binding.buttonMoveBackward.setOnTouchListener(this)
        binding.buttonTurnLeft.setOnTouchListener(this)
        binding.buttonTurnRight.setOnTouchListener(this)
        binding.buttonMoveForward.setFocusable(false)
        binding.buttonMoveBackward.setFocusable(false)
        binding.buttonTurnLeft.setFocusable(false)
        binding.buttonTurnRight.setFocusable(false)
        binding.buttonFlyUpward.setOnTouchListener(this)
        binding.buttonFlyDownward.setOnTouchListener(this)
        binding.buttonFlyUpward.setFocusable(false)
        binding.buttonFlyDownward.setFocusable(false)
        binding.voiceStatusView3d.setShowActiveChatterName(true)
        binding.worldViewTouchReceiver.setOnTouchListener(this.worldViewTouchListener)
        binding.objectControlsPanel.setVisibility(View.GONE)
        View findViewById = findViewById(R.id.offline_notify_status_layout)
        if (findViewById != null) {
            findViewById.setBackgroundColor(Color.argb(128, 0, 0, 0))
            int applyDimension = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 10.0f, getResources().getDisplayMetrics())
            findViewById.setPadding(applyDimension, applyDimension, applyDimension, applyDimension)
        }
    }

    open fun onAgentCircuit(agentCircuit: SLAgentCircuit) {
        if (agentCircuit != null) {
            this.avatarControl = agentCircuit.getModules().avatarControl
            this.drawDistance = agentCircuit.getModules().drawDistance
            if (this.localDrawingEnabled) {
                this.drawDistance.Enable3DView(this.prefDrawDistance)
            }
            if (this.camButtonEnabled) {
                this.manualCamMode = this.avatarControl.getIsManualCamming()
            }
        } else {
            handlePickedObject(null)
            this.avatarControl = null
            this.drawDistance = null
        }
        this.mHandler.post(this.buttonsRestoreTask)
        beginCountingButtonsFade()
        beginCountingObjectDeselect()
        updateObjectPanel()
    }

    open fun onCurrentLocation(currentLocationInfo: CurrentLocationInfo) {
        ParcelData parcelData = currentLocationInfo != null ? currentLocationInfo.parcelData() : null
        String name = parcelData != null ? parcelData.getName() : null
        if (name == null) {
            name = getString(R.string.name_loading_title)
        }
        setDefaultTitle(name, null)
    }

    open fun onMyAvatarState(myAvatarState: MyAvatarState) {
        updateObjectPanel()
    }

    open fun onPickedAvatarNameUpdated(chatterNameRetriever: ChatterNameRetriever) {
        if (chatterNameRetriever == this.pickedAvatarNameRetriever) {
            updateObjectPanel()
        }
    }

    open fun onSelectedObjectProfile(objectProfileData: SLObjectProfileData) {
        Debug.Printf("got selected object profile: %s", objectProfileData)
        updateObjectPanel()
        if (objectProfileData != null) {
            SLAgentCircuit data = this.agentCircuit.getData()
            if (objectProfileData.isPayable() && objectProfileData.payInfo() == null && data != null) {
                data.DoRequestPayPrice(objectProfileData.objectUUID())
            }
        }
    }

    open fun onVoiceActiveChatter(chatterID: ChatterID) {
        if (binding.voiceStatusView3d != null) {
            binding.voiceStatusView3d.setChatterID(chatterID)
        }
        if (chatterID == null || this.userManager == null) {
            this.voiceChatInfo.unsubscribe()
        } else {
            this.voiceChatInfo.subscribe(this.userManager.getVoiceChatInfo(), chatterID)
        }
    }

    open fun onVoiceChatInfo(voiceChatInfo: VoiceChatInfo) {
    }

    open fun selectByDragPointer(i: Int, i2: Int) {
        int[] ints = arrayOfNulls<int>(2]
        binding.dragPointerLayout.getLocationOnScreen(ints)
        int width = ints[0] + (binding.dragPointerView.getWidth() / 2) + i
        int height = ints[1] + (binding.dragPointerView.getHeight() / 2) + i2
        int[] worldLocation = arrayOfNulls<int>(2]
        binding.worldViewHolder.getLocationOnScreen(worldLocation)
        this.mGLView.pickObjectHover(width - worldLocation[0], height - worldLocation[1])
    }

    private fun selectHUDtoDisplay() {
        int attachmentID
        SLAttachmentPoint attachmentPoint
        ArrayList arrayList = ArrayList()
        SLAgentCircuit data = this.agentCircuit.getData()
        if (data != null) {
            SLObjectAvatarInfo agentAvatar = data.getGridConnection().parcelInfo.getAgentAvatar()
            if (agentAvatar != null) {
                try {
                    for (objectInfo in agentAvatar.treeNode) {
                        if (!Strings.nullToEmpty(objectInfo.getName()).startsWith("#") && (attachmentID = objectInfo.attachmentID) >= 0 && attachmentID < 56 && (attachmentPoint = SLAttachmentPoint.attachmentPoints[attachmentID]) != null && attachmentPoint.isHUD) {
                            arrayList.add(SelectableAttachment(objectInfo.localID, objectInfo.name))
                        }
                    }
                } catch (NoSuchElementException e) {
                    Debug.Warning(e)
                }
            }
            if (arrayList.isEmpty()) {
                return
            }
            if (arrayList.size() == 1) {
                displayHUD(((SelectableAttachment) arrayList.get(0)).getLocalID())
                return
            }
            ArrayAdapter arrayAdapter = ArrayAdapter(this, android.R.layout.simple_list_item_1, arrayList)
            AlertDialog.Builder builder = AlertDialog.Builder(this)
            builder.setTitle(R.string.select_hud_title)
            builder.setAdapter(arrayAdapter, DialogInterface.OnClickListener() {
                    WorldViewActivity.this.m855x5cf6cbb8((List) arrayList, dialogInterface, i2)
                }

                override fun onClick(dialogInterface: DialogInterface, i2: Int) {
                    } else {
                        this.avatarControl.stopCamming()
                        this.avatarControl.StartAgentMotion(2)
                        }
                    }
                }
                }
            20 -> {
                if (this.avatarControl != null) {
                    if (keyEvent.getAction() != 0) {
                        if (keyEvent.getAction() == 1) {
                            this.avatarControl.StopAgentMotion()
                            }
                        }
                    } else {
                        this.avatarControl.stopCamming()
                        this.avatarControl.StartAgentMotion(4)
                        }
                    }
                }
                }
            21 -> {
                if (this.avatarControl != null) {
                    if (keyEvent.getAction() != 0) {
                        if (keyEvent.getAction() == 1) {
                            this.avatarControl.stopTurning()
                            }
                        }
                    } else {
                        this.avatarControl.startTurning(TURNING_SPEED)
                        }
                    }
                }
                }
            22 -> {
                if (this.avatarControl != null) {
                    if (keyEvent.getAction() != 0) {
                        if (keyEvent.getAction() == 1) {
                            this.avatarControl.stopTurning()
                            }
                        }
                    } else {
                        this.avatarControl.startTurning(-50.0f)
                        }
                    }
                }
                }
            92 -> {
                if (this.avatarControl != null) {
                    if (keyEvent.getAction() != 0) {
                        if (keyEvent.getAction() == 1) {
                            this.avatarControl.StopAgentMotion()
                            }
                        }
                    } else {
                        this.avatarControl.stopCamming()
                        this.avatarControl.StartAgentMotion(8)
                        }
                    }
                }
                }
            93 -> {
                if (this.avatarControl != null) {
                    if (keyEvent.getAction() != 0) {
                        if (keyEvent.getAction() == 1) {
                            this.avatarControl.StopAgentMotion()
                            }
                        }
                    } else {
                        this.avatarControl.stopCamming()
                        this.avatarControl.StartAgentMotion(16)
                        }
                    }
                }
                }
        }
        return super.dispatchKeyEvent(keyEvent)
    }

    @EventHandler
    open fun handleBakingProgressEvent(bakingProgressEvent: SLBakingProgressEvent) {
        if (bakingProgressEvent.first) {
            Toast.makeText(this, "Updating avatar appearance...", Toast.LENGTH_SHORT).show()
        }
    }

    open fun handleChatEvent(chatMessageEvent: ActiveChattersManager.ChatMessageEvent) {
        val mgr = this.userManager ?: return
        val log = this.fadingTextViewLog ?: return
        if (!this.chatOver3D || detailsVisible()) return
        log.handleChatEvent(chatMessageEvent)
    }

    open fun handlePickedObject(objectIntersectInfo: ObjectIntersectInfo?) {
        this.pickedIntersectInfo = objectIntersectInfo
        val obj = objectIntersectInfo?.objInfo
        this.pickedObject = obj
        val mgr = this.userManager
        if (obj != null && mgr != null && obj.isAvatar) {
            val userChatterID = ChatterID.getUserChatterID(mgr.getUserID(), obj.getId())
            if (!Objects.equal(this.pickedAvatarNameRetriever?.chatterID, userChatterID)) {
                this.pickedAvatarNameRetriever?.dispose()
                this.pickedAvatarNameRetriever = ChatterNameRetriever(
                    userChatterID,
                    { retriever -> onPickedAvatarNameUpdated(retriever) },
                    UIThreadExecutor.getInstance()
                )
            }
        }
    }
}
