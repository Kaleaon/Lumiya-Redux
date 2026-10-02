package com.lumiyaviewer.lumiya.ui.render

import android.view.WindowManager
import android.view.Window
import com.google.vr.cardboard.FullscreenMode
import com.google.vr.sdk.base.AndroidCompat
import com.google.vrtoolkit.cardboard.ScreenOnFlagHelper
import android.annotation.SuppressLint
import android.content.Intent
import android.graphics.Canvas
import android.graphics.Point
import android.graphics.PorterDuff
import android.graphics.Rect
import android.opengl.Matrix
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.os.Message
import android.os.SystemClock
import androidx.preference.PreferenceManager
import android.speech.RecognitionListener
import android.speech.SpeechRecognizer
import androidx.fragment.app.Fragment
import androidx.recyclerview.widget.RecyclerView
import android.text.TextUtils
import android.util.TypedValue
import android.view.KeyEvent
import android.view.MotionEvent
import android.view.View
import android.view.ViewGroup
import android.view.ViewTreeObserver
import android.widget.Button
import android.widget.FrameLayout
import android.widget.ImageButton
import android.widget.LinearLayout
import android.widget.ListView
import android.widget.ProgressBar
import android.widget.TextView
import com.google.common.base.Objects
import com.google.common.base.Predicate
import com.google.common.base.Strings
import com.google.common.collect.ImmutableMap
import com.google.common.eventbus.Subscribe
import com.google.common.util.concurrent.AtomicDouble
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.GlobalOptions
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.databinding.CardboardControlsBinding
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.render.HeadTransformCompat
import com.lumiyaviewer.lumiya.render.WorldViewRenderer
import com.lumiyaviewer.lumiya.render.glres.textures.GLExternalTexture
import com.lumiyaviewer.lumiya.render.picking.ObjectIntersectInfo
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.chat.SLChatPermissionRequestEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLChatScriptDialog
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatYesNoEvent
import com.lumiyaviewer.lumiya.slproto.modules.SLAvatarControl
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectAvatarInfo
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectInfo
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectProfileData
import com.lumiyaviewer.lumiya.slproto.types.CameraParams
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever
import com.lumiyaviewer.lumiya.slproto.users.manager.ActiveChattersManager
import com.lumiyaviewer.lumiya.slproto.users.manager.CurrentLocationInfo
import com.lumiyaviewer.lumiya.slproto.users.manager.MyAvatarState
import com.lumiyaviewer.lumiya.slproto.users.manager.ObjectPopupsManager
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.chat.ChatFragment
import com.lumiyaviewer.lumiya.ui.chat.ContactsFragment
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.render.CardboardActivity
import com.lumiyaviewer.lumiya.ui.render.CardboardControlsPlaceholder
import com.lumiyaviewer.lumiya.ui.render.vr.VrEye
import com.lumiyaviewer.lumiya.ui.render.vr.VrInputState
import com.lumiyaviewer.lumiya.ui.render.vr.VrPose
import com.lumiyaviewer.lumiya.ui.render.vr.VrRuntime
import com.lumiyaviewer.lumiya.ui.render.vr.VrRuntimeSelector
import com.lumiyaviewer.lumiya.ui.render.vr.VrSession
import com.lumiyaviewer.lumiya.ui.voice.VoiceStatusView
import com.lumiyaviewer.lumiya.voice.common.model.VoiceChatInfo
import java.util.ArrayList
import java.util.HashSet
import java.util.Set
import java.util.UUID
import java.util.concurrent.atomic.AtomicBoolean
import java.util.concurrent.atomic.AtomicInteger
import java.util.concurrent.atomic.AtomicReference
import javax.microedition.khronos.egl.EGLConfig

open class CardboardActivity : DetailsActivity(), ObjectPopupsManager.ObjectPopupListener {

    private static int DEFAULT_FONT_SIZE_SP = 16
    private static int LISTVIEW_SCROLL_DURATION = 500
    private static int LISTVIEW_SCROLL_OFFSET = 100
    private static int RECYCLERVIEW_SCROLL_OFFSET = 100
    private static float VOICE_VIEW_HEIGHT_ALLOWANCE_DP = 60.0f
    public static String VR_MODE_TAG = "vrMode"
    private static float controlDrawSizeFactor = 1.5f
    private static float controlSizeFactorX = 1.0f
    private static float controlSizeFactorY = 0.75f
    private static float crosshairSize = 0.1f
    private static int[] dialogButtonIds = {R.id.buttonDialog1, R.id.buttonDialog2, R.id.buttonDialog3, R.id.buttonDialog4, R.id.buttonDialog5, R.id.buttonDialog6, R.id.buttonDialog7, R.id.buttonDialog8, R.id.buttonDialog9, R.id.buttonDialog10, R.id.buttonDialog11, R.id.buttonDialog12}

    private CardboardControlsBinding binding
    private VrSession vrSession
    // Window behaviour 3.4.2 applied in VR mode regardless of runtime:
    // keep the screen on, immersive fullscreen (restored after the VR
    // runtime refactor dropped them).
    private ScreenOnFlagHelper screenOnFlagHelper = ScreenOnFlagHelper(this)
    private FullscreenMode fullscreenMode
    private VrRuntime vrRuntime
    private ViewGroup onScreenControlsLayout
    private RenderSettings renderSettings
    private WorldViewRenderer renderer
    private SpeechRecognizer speechRecognizer
    private Handler stateHandler
    private UserManager userManager
    private int voiceViewHeightAllowance
    private VrSession.Renderer stereoRenderer = WorldStereoRenderer()
    private boolean isResumed = false
    private AtomicBoolean viewDrawPosted = AtomicBoolean(false)
    private boolean voiceEnabled = false
    private SubscriptionData<UUID, SLAgentCircuit> agentCircuit = SubscriptionData<>(UIThreadExecutor.getInstance(), Subscription.OnData() {
            CardboardActivity.this.onAgentCircuit((SLAgentCircuit) obj)
        }

        override fun onData(obj: Any) {
            CardboardActivity.this.onViewsInvalidated()
            return false
        }
    }
    private View.OnHoverListener onHoverListener = View.OnHoverListener() {
            return CardboardActivity.this.m784xd3567aba(view, motionEvent)
        }

        override fun onHover(view: View, motionEvent: MotionEvent): Boolean {
            CardboardActivity.this.showSpeechRecognitionError(string)
        }

        override fun onEvent(i: Int, bundle: Bundle) {
        }

        override fun onPartialResults(bundle: Bundle) {
            Debug.Printf("Cardboard: speech recognition: got partial results", arrayOfNulls<Object>(0])
            ArrayList<String> stringArrayList = bundle.getStringArrayList("results_recognition")
            if (stringArrayList == null || stringArrayList.size() <= 0) {
                return
            }
            String str = stringArrayList.get(0)
            CardboardActivity.this.lastSpeechRecognitionResults = str
            CardboardActivity.this.binding.speechRecognitionResults.setText(str)
            if (Strings.isNullOrEmpty(str)) {
                return
            }
            CardboardActivity.this.binding.buttonSpeechSend.setVisibility(View.VISIBLE)
        }

        override fun onReadyForSpeech(bundle: Bundle) {
            CardboardActivity.this.binding.speakNowText.setVisibility(View.VISIBLE)
        }

        override fun onResults(bundle: Bundle) {
            Debug.Printf("Cardboard: speech recognition: got some results", arrayOfNulls<Object>(0])
            ArrayList<String> stringArrayList = bundle.getStringArrayList("results_recognition")
            if (stringArrayList == null || stringArrayList.size() <= 0) {
                return
            }
            String str = stringArrayList.get(0)
            CardboardActivity.this.binding.speechRecognitionResults.setText(str)
            CardboardActivity.this.lastSpeechRecognitionResults = str
            if (Strings.isNullOrEmpty(str)) {
                return
            }
            CardboardActivity.this.binding.buttonSpeechSend.setVisibility(View.VISIBLE)
            CardboardActivity.this.binding.speakLevelIndicator.setVisibility(View.INVISIBLE)
            CardboardActivity.this.isSpeechFinished = true
        }

        override fun onRmsChanged(f: Float) {
            if (CardboardActivity.this.isSpeechFinished) {
                return
            }
            if (Float.isNaN(CardboardActivity.this.speechRmsMin) || f < CardboardActivity.this.speechRmsMin) {
                CardboardActivity.this.speechRmsMin = f
            }
            if (Float.isNaN(CardboardActivity.this.speechRmsMax) || f > CardboardActivity.this.speechRmsMax) {
                CardboardActivity.this.speechRmsMax = f
            }
            float f2 = CardboardActivity.this.speechRmsMax
            if (f2 - CardboardActivity.this.speechRmsMin < 1.0f) {
                f2 = CardboardActivity.this.speechRmsMin + 1.0f
            }
            int round = Math.round(((f - CardboardActivity.this.speechRmsMin) * 100.0f) / (f2 - CardboardActivity.this.speechRmsMin))
            if (round < 0) {
                round = 0
            }
            if (round > 100) {
                round = 100
            }
            Debug.Printf("Cardboard: speech recognition: RMS %f", Float.valueOf(f))
            CardboardActivity.this.binding.speakLevelIndicator.setVisibility(View.VISIBLE)
            CardboardActivity.this.binding.speakLevelIndicator.setProgress(round)
        }
    }
    private volatile boolean insideControls = false
    private boolean hitPointValid = false
    private long insideSince = 0
    private int hitPointX = 0
    private int hitPointY = 0
    private int[] locationInWindow = arrayOfNulls<int>(2]
    private Point scrollableViewPoint = Point()

    @SuppressLint({"HandlerLeak"})
    private Handler handler = Handler(Looper.getMainLooper()) {
        override fun handleMessage(message: Message) {
            internal fun switch(message.what):  {
                1 -> {
                    if (message.obj != null && (message.obj is ObjectIntersectInfo)) {
                        ObjectIntersectInfo objectIntersectInfo = (ObjectIntersectInfo) message.obj
                        Debug.Printf("Cardboard: PICKED OBJECT isAvatar %b localID %d", Boolean.valueOf(objectIntersectInfo.objInfo.isAvatar()), Integer.valueOf(objectIntersectInfo.objInfo.localID))
                        if (!(objectIntersectInfo.objInfo is SLObjectAvatarInfo ? ((SLObjectAvatarInfo) objectIntersectInfo.objInfo).isMyAvatar() : false)) {
                            CardboardActivity.this.handlePickedObject(objectIntersectInfo)
                            }
                        }
                    }
                    }
                2 -> {
                    if (message.obj != null && (message.obj is SLObjectInfo)) {
                        SLObjectInfo sLObjectInfo = (SLObjectInfo) message.obj
                        Debug.Printf("Cardboard: touched object isAvatar %b localID %d", Boolean.valueOf(sLObjectInfo.isAvatar()), Integer.valueOf(sLObjectInfo.localID))
                        }
                    }
                    }
            }
        }
    }
    private View.OnClickListener onDialogButtonClick = View.OnClickListener() {
        override fun onClick(view: View) {
            if (CardboardActivity.this.activeScriptDialog != null) {
                int i = 0
                while (true) {
                    if (i >= CardboardActivity.dialogButtonIds.length) {
                        i = -1
                        }
                    } else if (view.getId() == CardboardActivity.dialogButtonIds[i]) {
                        }
                    } else {
                        i++
                    }
                }
                CardboardActivity.this.activeScriptDialog.onDialogButton(CardboardActivity.this.userManager, i)
                CardboardActivity.this.activeScriptDialog = null
            }
            CardboardActivity.this.handlePickedObject(null)
            CardboardActivity.this.setControlsPage(ControlsPage.pageDefault)
        }
    }
    private Object chatEventHandler = AnonymousClass5()
    private View.OnClickListener onVoiceCallButtonListener = View.OnClickListener() {
            CardboardActivity.this.m785xd399c564(view)
        }

        override fun onClick(view: View) {
        }
    }
    private VrSession.InputListener vrInputListener = AnonymousClass7()



    private enum class ControlsPage {
        pageDefault(R.id.cardboard_primary_controls),
        pageSpeech(R.id.cardboard_speak_controls),
        pageTouchAim(R.id.cardboard_aim_controls),
        pageObject(R.id.cardboard_object_controls),
        pageScriptDialog(R.id.cardboard_script_dialog),
        pageYesNo(R.id.cardboard_yesno_dialog),
        pageDetails(R.id.cardboard_details_page)

        int pageViewId

        internal constructor(i: Int) {
            this.pageViewId = i
        }

    }

    internal open class WorldStereoRenderer : VrSession.Renderer {
        private static float TURN_DEGREES = 35.0f
        private static float TURN_DEGREES_PER_MS = 0.02f
        private static float YAW_AVERAGE_FACTOR = 1.0E-4f
        private GLExternalTexture externalTexture
        private int viewportWidth = 0
        private int viewportHeight = 0
        private HeadTransformCompat headTransformCompat = HeadTransformCompat()
        private boolean agentHeadingAcquired = false
        private float[] eyeHitTests = arrayOfNulls<float>(4]
        private float[] extTextureMatrixUV = arrayOfNulls<float>(16]
        private float eyeSeparation = 0.0f
        private float[] eyeOffset = arrayOfNulls<float>(4]
        private float[] eyeOffsetMatrix = arrayOfNulls<float>(16]
        private int[] eyeViewport = arrayOfNulls<int>(4]
        private float[] eyeProjection = arrayOfNulls<float>(32]
        private boolean[] eyeProjectionValid = arrayOfNulls<boolean>(2]
        private long lastFrameTime = 0
        private boolean crosshairVisible = false

        internal constructor() {
            Matrix.setIdentityM(this.eyeOffsetMatrix, 0)
            Matrix.rotateM(this.eyeOffsetMatrix, 0, -90.0f, 1.0f, 0.0f, 0.0f)
        }



        override fun onDrawEye(eye: VrEye) {
            int type = eye.getType()
            float f = (type == VrEye.TYPE_LEFT ? -0.5f : 0.5f) * this.eyeSeparation
            for (i in 0 until 4) {
                this.eyeOffset[i] = this.headTransformCompat.rightVector[i] * f
            }
            eye.getViewport(this.eyeViewport, 0)
            int i2 = type == VrEye.TYPE_LEFT ? 0 : 1
            if (CardboardActivity.this.renderSettings != null && (!this.eyeProjectionValid[i2] || eye.isProjectionChanged())) {
                System.arraycopy(eye.getPerspective(0.5f, CardboardActivity.this.renderSettings.drawDistance), 0, this.eyeProjection, i2 * 16, 16)
            }
            CardboardActivity.this.renderer.onDrawFrame(null, this.headTransformCompat, this.eyeOffset, this.eyeViewport, null, null, 0)
            if (this.externalTexture != null) {
                CardboardActivity.this.renderer.drawExternalTexture(this.externalTexture, this.extTextureMatrixUV, f, this.headTransformCompat.pitchDegrees, this.headTransformCompat.useButtonsYaw, CardboardActivity.controlDrawSizeFactor, 1.125f, this.eyeHitTests, type == VrEye.TYPE_LEFT ? 0 : 2)
                if (this.crosshairVisible) {
                    CardboardActivity.this.renderer.drawCrosshair(CardboardActivity.crosshairSize, f)
                }
            }
        }

        override fun onFinishFrame() {
            CardboardActivity.this.renderer.onFinishFrame()
            if (this.externalTexture != null) {
                float f = (this.eyeHitTests[0] + this.eyeHitTests[2]) / 2.0f
                int width = (int) (((f * 2.0f) + 0.5f) * this.externalTexture.getWidth())
                int height = (int) (((-(((this.eyeHitTests[1] + this.eyeHitTests[3]) / 2.0f) * 2.0f)) + 0.5f) * this.externalTexture.getHeight())
                synchronized (CardboardActivity.this.hitPointLock) {
                    CardboardActivity.this.postedHitPointX = width
                    CardboardActivity.this.postedHitPointY = height
                }
                if (CardboardActivity.this.hitPointUpdatePosted.getAndSet(true)) {
                    return
                }
                CardboardActivity.this.runOnUiThread(Runnable() {
                        WorldStereoRenderer.this.m793x10c82f4f()
                    }

                    override fun run() {
