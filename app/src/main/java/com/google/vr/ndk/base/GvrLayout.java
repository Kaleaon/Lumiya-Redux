package com.google.vr.ndk.base;

import android.app.Activity;
import android.app.PendingIntent;
import android.app.Presentation;
import android.content.Context;
import android.content.res.Configuration;
import android.hardware.display.DisplayManager;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.AttributeSet;
import android.util.Log;
import android.view.Display;
import android.view.MotionEvent;
import android.view.Surface;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import com.google.vr.cardboard.ContextUtils;
import com.google.vr.cardboard.DisplaySynchronizer;
import com.google.vr.cardboard.DisplayUtils;
import com.google.vr.cardboard.EglFactory;
import com.google.vr.cardboard.MutableEglConfigChooser;
import com.google.vr.cardboard.ScanlineRacingRenderer;
import com.google.vr.ndk.base.DaydreamAlignment;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class GvrLayout extends FrameLayout {
    private static final boolean DEBUG = false;
    private static final int EXTERNAL_PRESENTATION_MIN_API = 16;
    private static final int SHOW_RENDERING_VIEWS_DELAY_FOR_FADE = 50;
    private static final String TAG = "GvrLayout";
    private static PresentationFactory sOptionalPresentationFactory = null;
    private CardboardEmulator cardboardEmulator;
    private DaydreamAlignment daydreamAlignment;
    private DaydreamUtilsWrapper daydreamUtils;
    private DisplaySynchronizer displaySynchronizer;
    private EglFactory eglFactory;
    private FadeOverlayView fadeOverlayView;
    private GvrApi gvrApi;
    private boolean isAsyncReprojectionUsingProtectedBuffers;
    private boolean isAsyncReprojectionVideoEnabled;
    private boolean isResumed;
    private PresentationHelper presentationHelper;
    private FrameLayout presentationLayout;
    private View presentationView;
    private ScanlineRacingRenderer scanlineRacingRenderer;
    private GvrSurfaceView scanlineRacingView;
    private final Runnable showRenderingViewsRunnable;
    private boolean stereoModeEnabled;
    private GvrUiLayout uiLayout;
    private int videoSurfaceId;
    private VrCoreSdkClient vrCoreSdkClient;

    public interface ExternalSurfaceListener {
        void onFrameAvailable();

        void onSurfaceAvailable(Surface surface);
    }

    public interface ExternalSurfaceManager {
        int createExternalSurface();

        int createExternalSurface(ExternalSurfaceListener externalSurfaceListener, Handler handler);

        Surface getSurface(int i);

        int getSurfaceCount();

        void releaseExternalSurface(int i);
    }

    interface PresentationFactory {
        Presentation create(Context context, Display display);
    }

    private static class PresentationHelper implements DisplayManager.DisplayListener {
        private final Context context;
        private final DisplayManager displayManager;
        private final DisplaySynchronizer displaySynchronizer;
        private String externalDisplayName;
        private final RelativeLayout.LayoutParams layout = new RelativeLayout.LayoutParams(-1, -1);
        private final List<PresentationListener> listeners = new ArrayList();
        private final FrameLayout originalParent;
        private Presentation presentation;
        private final View view;

        PresentationHelper(Context context, FrameLayout frameLayout, View view, DisplaySynchronizer displaySynchronizer, String externalDisplayName) {
            this.context = context;
            this.originalParent = frameLayout;
            this.view = view;
            this.displaySynchronizer = displaySynchronizer;
            this.externalDisplayName = externalDisplayName;
            this.displayManager = (DisplayManager) context.getSystemService("display");
        }

        private static void detachViewFromParent(View view) {
            ViewGroup viewGroup = (ViewGroup) view.getParent();
            if (viewGroup == null) {
                return;
            }
            viewGroup.removeView(view);
        }

        private boolean hasCurrentPresentationExpired() {
            if (this.presentation != null) {
                return (this.presentation.isShowing() && this.presentation.getDisplay().isValid()) ? false : true;
            }
            return false;
        }

        private boolean isValidExternalDisplay(Display display) {
            return display.isValid() && display.getName().equals(this.externalDisplayName);
        }

        /* JADX WARN: Removed duplicated region for block: B:13:0x0027  */
        /* JADX WARN: Removed duplicated region for block: B:18:0x0036 A[ORIG_RETURN, RETURN] */
        /* JADX WARN: Removed duplicated region for block: B:20:0x00cb  */
        /* JADX WARN: Removed duplicated region for block: B:26:0x00b5  */
        /* JADX WARN: Removed duplicated region for block: B:31:0x00ad  */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        private void setDisplay(Display display) {
            Display display2 = this.presentation == null ? null : this.presentation.getDisplay();
            if (!hasCurrentPresentationExpired() && DisplayUtils.isSameDisplay(display, display2)) {
                return;
            }
            Presentation presentation = this.presentation;
            if (this.presentation != null) {
                this.presentation.dismiss();
                this.presentation = null;
            }
            detachViewFromParent(this.view);
            if (display == null) {
                this.originalParent.addView(this.view, 0);
            } else {
                this.presentation = GvrLayout.sOptionalPresentationFactory == null ? new Presentation(this.context, display) : GvrLayout.sOptionalPresentationFactory.create(this.context, display);
                this.presentation.addContentView(this.view, this.layout);
                try {
                    this.presentation.show();
                } catch (WindowManager.InvalidDisplayException e) {
                    String strValueOf = String.valueOf(e);
                    Log.e(GvrLayout.TAG, new StringBuilder(String.valueOf(strValueOf).length() + 57).append("Attaching Cardboard View to the external display failed: ").append(strValueOf).toString());
                    this.presentation.cancel();
                    this.presentation = null;
                    detachViewFromParent(this.view);
                    this.originalParent.addView(this.view, 0);
                }
            }
            this.displaySynchronizer.setDisplay(this.presentation == null ? DisplayUtils.getDefaultDisplay(this.context) : this.presentation.getDisplay());
            if (presentation != null) {
                Iterator<PresentationListener> it = this.listeners.iterator();
                while (it.hasNext()) {
                    it.next().onPresentationStopped();
                }
            }
            if (this.presentation == null) {
                return;
            }
            Iterator<PresentationListener> iterator = this.listeners.iterator();
            while (iterator.hasNext()) {
                iterator.next().onPresentationStarted(this.presentation.getDisplay());
            }
        }

        public void addListener(PresentationListener presentationListener) {
            if (this.listeners.contains(presentationListener)) {
                return;
            }
            this.listeners.add(presentationListener);
            if (this.presentation == null) {
                return;
            }
            presentationListener.onPresentationStarted(this.presentation.getDisplay());
        }

        public boolean isPresenting() {
            return this.presentation != null && this.presentation.isShowing();
        }

        public void onDetachedFromWindow() {
            this.displayManager.unregisterDisplayListener(this);
            setDisplay(null);
        }

        @Override
        public void onDisplayAdded(int i) {
            Display display = this.displayManager.getDisplay(i);
            if (isValidExternalDisplay(display)) {
                setDisplay(display);
            }
        }

        @Override
        public void onDisplayChanged(int i) {
        }

        @Override
        public void onDisplayRemoved(int i) {
            if (this.presentation != null && this.presentation.getDisplay().getDisplayId() == i) {
                setDisplay(null);
            }
        }

        public void onPause() {
            this.displayManager.unregisterDisplayListener(this);
        }

        public void onResume() {
            Display display = null;
            this.externalDisplayName = DisplayUtils.getExternalDisplayName(this.context);
            if (this.externalDisplayName == null) {
                setDisplay(null);
                return;
            }
            this.displayManager.registerDisplayListener(this, null);
            Display[] displays = this.displayManager.getDisplays();
            int length = displays.length;
            int i = 0;
            while (true) {
                if (i < length) {
                    Display display2 = displays[i];
                    if (isValidExternalDisplay(display2)) {
                        display = display2;
                        break;
                    }
                    i++;
                } else {
                    break;
                }
            }
            setDisplay(display);
        }

        public void shutdown() {
            this.displayManager.unregisterDisplayListener(this);
            if (this.presentation == null) {
                return;
            }
            this.presentation.cancel();
            this.presentation = null;
            Iterator<PresentationListener> it = this.listeners.iterator();
            while (it.hasNext()) {
                it.next().onPresentationStopped();
            }
        }
    }

    public interface PresentationListener {
        void onPresentationStarted(Display display);

        void onPresentationStopped();
    }

    public GvrLayout(Context context) {
        super(context);
        this.isResumed = false;
        this.videoSurfaceId = -1;
        this.stereoModeEnabled = true;
        this.showRenderingViewsRunnable = new Runnable() {
            @Override
            public void run() {
                GvrLayout.this.updateRenderingViewsVisibility(0);
            }
        };
        init(null, null, null, null);
    }

    public GvrLayout(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
        this.isResumed = false;
        this.videoSurfaceId = -1;
        this.stereoModeEnabled = true;
        this.showRenderingViewsRunnable = new Runnable() {
            @Override
            public void run() {
                GvrLayout.this.updateRenderingViewsVisibility(0);
            }
        };
        init(null, null, null, null);
    }

    GvrLayout(Context context, GvrApi gvrApi, DisplaySynchronizer displaySynchronizer, FadeOverlayView fadeOverlayView, DaydreamUtilsWrapper daydreamUtilsWrapper) {
        super(context);
        this.isResumed = false;
        this.videoSurfaceId = -1;
        this.stereoModeEnabled = true;
        this.showRenderingViewsRunnable = new Runnable() {
            @Override
            public void run() {
                GvrLayout.this.updateRenderingViewsVisibility(0);
            }
        };
        init(gvrApi, displaySynchronizer, fadeOverlayView, daydreamUtilsWrapper);
    }

    private void addScanlineRacingView() {
        if (this.scanlineRacingView == null) {
            this.eglFactory = new EglFactory();
            this.eglFactory.setUsePriorityContext(true);
            this.eglFactory.setUseProtectedBuffers(this.isAsyncReprojectionUsingProtectedBuffers);
            this.eglFactory.setEGLContextClientVersion(2);
            this.scanlineRacingView = new GvrSurfaceView(getContext());
            this.scanlineRacingView.setEGLContextClientVersion(2);
            this.scanlineRacingView.setEGLConfigChooser(new MutableEglConfigChooser());
            this.scanlineRacingView.setZOrderMediaOverlay(true);
            this.scanlineRacingView.setEGLContextFactory(this.eglFactory);
            this.scanlineRacingView.setEGLWindowSurfaceFactory(this.eglFactory);
            if (!this.stereoModeEnabled) {
                Log.w(TAG, "Disabling stereo mode with async reprojection enabled may not work properly.");
                this.scanlineRacingView.setVisibility(View.GONE);
            }
            if (this.scanlineRacingRenderer == null) {
                this.scanlineRacingRenderer = new ScanlineRacingRenderer(this.gvrApi);
            }
            this.scanlineRacingRenderer.setSurfaceView(this.scanlineRacingView);
            this.scanlineRacingView.setRenderer(this.scanlineRacingRenderer);
            this.scanlineRacingView.setSwapMode(1);
            this.presentationLayout.addView(this.scanlineRacingView, 0);
        }
    }

    private void init(GvrApi gvrApi, DisplaySynchronizer displaySynchronizer, FadeOverlayView fadeOverlayView, DaydreamUtilsWrapper daydreamUtilsWrapper) {
        Activity activity = ContextUtils.getActivity(getContext());
        if (activity == null) {
            throw new IllegalArgumentException("An Activity Context is required for VR functionality.");
        }
        TraceCompat.beginSection("GvrLayout.init");
        if (displaySynchronizer == null) {
            try {
                displaySynchronizer = GvrApi.createDefaultDisplaySynchronizer(getContext());
            } finally {
                TraceCompat.endSection();
            }
        }
        if (gvrApi == null) {
            gvrApi = new GvrApi(getContext(), displaySynchronizer);
        }
        if (daydreamUtilsWrapper == null) {
            daydreamUtilsWrapper = new DaydreamUtilsWrapper();
        }
        this.daydreamUtils = daydreamUtilsWrapper;
        this.presentationLayout = new FrameLayout(getContext());
        this.uiLayout = new GvrUiLayout(getContext());
        this.gvrApi = gvrApi;
        this.displaySynchronizer = displaySynchronizer;
        this.presentationHelper = tryCreatePresentationHelper();
        addView(this.presentationLayout, 0);
        addView(this.uiLayout, 1);
        updateUiLayout();
        boolean isDaydreamPhone = daydreamUtilsWrapper.isDaydreamPhone(getContext());
        if (isDaydreamPhone) {
            this.daydreamAlignment = createDaydreamAlignment();
            this.uiLayout.setOnTouchListener(new DaydreamAlignment.DefaultTouchListener(this.daydreamAlignment, gvrApi));
        }
        int activityDaydreamCompatibility = daydreamUtilsWrapper.getActivityDaydreamCompatibility(activity);
        boolean z = activityDaydreamCompatibility != 0;
        if (isDaydreamPhone || (activityDaydreamCompatibility == 2)) {
            if (z) {
                if (fadeOverlayView == null) {
                    fadeOverlayView = new FadeOverlayView(getContext());
                }
                this.fadeOverlayView = fadeOverlayView;
                addView(this.fadeOverlayView, 2);
            }
            this.vrCoreSdkClient = createVrCoreSdkClient(getContext(), gvrApi, daydreamUtilsWrapper, this.fadeOverlayView);
        }
    }

    static void setPresentationFactory(PresentationFactory presentationFactory) {
        sOptionalPresentationFactory = presentationFactory;
    }

    private PresentationHelper tryCreatePresentationHelper() {
        if (Build.VERSION.SDK_INT <= 16) {
            return null;
        }
        String externalDisplayName = DisplayUtils.getExternalDisplayName(getContext());
        if (externalDisplayName != null) {
            return new PresentationHelper(getContext(), this, this.presentationLayout, this.displaySynchronizer, externalDisplayName);
        }
        Log.e(TAG, "HDMI display name could not be found, disabling external presentation support");
        return null;
    }

    private void updateFadeVisibility() {
        boolean z = getWindowVisibility() == 0;
        if (this.fadeOverlayView == null) {
            return;
        }
        if (z && this.isResumed) {
            this.fadeOverlayView.onVisible();
            removeCallbacks(this.showRenderingViewsRunnable);
            postDelayed(this.showRenderingViewsRunnable, 50L);
        } else {
            if (z || this.isResumed) {
                return;
            }
            this.fadeOverlayView.onInvisible();
            updateRenderingViewsVisibility(4);
            removeCallbacks(this.showRenderingViewsRunnable);
        }
    }

    public void updateRenderingViewsVisibility(int i) {
        if (this.presentationView != null) {
            this.presentationView.setVisibility(this.stereoModeEnabled ? i : 0);
        }
        if (this.scanlineRacingView == null) {
            return;
        }
        GvrSurfaceView gvrSurfaceView = this.scanlineRacingView;
        if (!this.stereoModeEnabled) {
            i = 8;
        }
        gvrSurfaceView.setVisibility(i);
    }

    private void updateUiLayout() {
        this.uiLayout.setDaydreamModeEnabled(this.gvrApi.getViewerType() == 1);
    }

    public void addPresentationListener(PresentationListener presentationListener) {
        if (this.presentationHelper == null) {
            return;
        }
        this.presentationHelper.addListener(presentationListener);
    }

    DaydreamAlignment createDaydreamAlignment() {
        return new DaydreamAlignment(getContext(), this.gvrApi);
    }

    protected VrCoreSdkClient createVrCoreSdkClient(Context context, GvrApi gvrApi, DaydreamUtilsWrapper daydreamUtilsWrapper, FadeOverlayView fadeOverlayView) {
        return new VrCoreSdkClient(context, gvrApi, ContextUtils.getActivity(context).getComponentName(), daydreamUtilsWrapper, new Runnable() {
            @Override
            public void run() {
                GvrLayout.this.uiLayout.invokeCloseButtonListener();
            }
        }, fadeOverlayView);
    }

    public boolean enableAsyncReprojectionVideoSurface(ExternalSurfaceListener externalSurfaceListener, Handler handler, boolean isAsyncReprojectionUsingProtectedBuffers) {
        if (!this.daydreamUtils.isDaydreamPhone(getContext())) {
            Log.e(TAG, "Only Daydream devices support async reprojection. Cannot enable video Surface.");
            return false;
        }
        if (this.scanlineRacingView != null) {
            Log.e(TAG, "Async reprojection is already enabled. Cannot call enableAsyncReprojectionVideoSurface after calling setAsyncReprojectionEnabled.");
            return false;
        }
        if (this.gvrApi.usingVrDisplayService()) {
            Log.e(TAG, "Async reprojection video is not supported on this device.");
            return false;
        }
        this.isAsyncReprojectionVideoEnabled = true;
        this.isAsyncReprojectionUsingProtectedBuffers = isAsyncReprojectionUsingProtectedBuffers;
        this.scanlineRacingRenderer = new ScanlineRacingRenderer(this.gvrApi);
        this.videoSurfaceId = this.scanlineRacingRenderer.getExternalSurfaceManager().createExternalSurface(externalSurfaceListener, handler);
        return true;
    }

    public boolean enableCardboardTriggerEmulation(Runnable runnable) {
        if (runnable == null) {
            throw new IllegalArgumentException("The Cardboard trigger listener must not be null.");
        }
        if (this.cardboardEmulator != null) {
            return true;
        }
        if (!this.daydreamUtils.isDaydreamPhone(getContext())) {
            return false;
        }
        this.cardboardEmulator = new CardboardEmulator(getContext(), runnable);
        return true;
    }

    public Surface getAsyncReprojectionVideoSurface() {
        if (!this.isAsyncReprojectionVideoEnabled) {
            Log.w(TAG, "Async reprojection video is not enabled. Did you call enableAsyncReprojectionVideoSurface()?");
            return null;
        }
        if (this.scanlineRacingView == null) {
            Log.w(TAG, "No async reprojection view has been set. Cannot get async reprojection managed Surfaces. Have you called setAsyncReprojectionEnabled()?");
        }
        return this.scanlineRacingRenderer.getExternalSurfaceManager().getSurface(this.videoSurfaceId);
    }

    public int getAsyncReprojectionVideoSurfaceId() {
        if (!this.isAsyncReprojectionVideoEnabled) {
            Log.w(TAG, "Async reprojection video is not enabled. Did you call enableAsyncReprojectionVideoSurface()?");
        }
        return this.videoSurfaceId;
    }

    FadeOverlayView getFadeOverlayView() {
        return this.fadeOverlayView;
    }

    public GvrApi getGvrApi() {
        return this.gvrApi;
    }

    public GvrUiLayout getUiLayout() {
        return this.uiLayout;
    }

    VrCoreSdkClient getVrCoreSdkClient() {
        return this.vrCoreSdkClient;
    }

    public boolean isPresenting() {
        return (this.presentationView == null || this.presentationHelper == null || !this.presentationHelper.isPresenting()) ? false : true;
    }

    public void launchInVr(PendingIntent pendingIntent) {
        if (this.vrCoreSdkClient != null && this.vrCoreSdkClient.launchInVr(pendingIntent)) {
            return;
        }
        try {
            pendingIntent.send();
        } catch (Exception e) {
            Log.e(TAG, "Error launching PendingIntent.", e);
        }
    }

    @Override
    protected void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        this.displaySynchronizer.onConfigurationChanged();
    }

    @Override
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (this.presentationHelper == null) {
            return;
        }
        this.presentationHelper.onDetachedFromWindow();
    }

    public void onPause() {
        TraceCompat.beginSection("GvrLayout.onPause");
        try {
            this.gvrApi.pause();
            if (this.scanlineRacingView != null) {
                this.scanlineRacingView.queueEvent(new Runnable() {
                    @Override
                    public void run() {
                        GvrLayout.this.scanlineRacingRenderer.onPause();
                    }
                });
                this.scanlineRacingView.onPause();
            }
            if (this.presentationHelper != null) {
                this.presentationHelper.onPause();
            }
            this.displaySynchronizer.onPause();
            if (this.vrCoreSdkClient != null) {
                this.vrCoreSdkClient.onPause();
            }
            if (this.cardboardEmulator != null) {
                this.cardboardEmulator.onPause();
            }
            this.isResumed = false;
            updateFadeVisibility();
        } finally {
            TraceCompat.endSection();
        }
    }

    public void onResume() {
        TraceCompat.beginSection("GvrLayout.onResume");
        try {
            this.gvrApi.resume();
            if (this.daydreamAlignment != null) {
                this.daydreamAlignment.refreshViewerProfile();
            }
            this.displaySynchronizer.onResume();
            if (this.presentationHelper != null) {
                this.presentationHelper.onResume();
            }
            if (this.scanlineRacingView != null) {
                this.scanlineRacingView.onResume();
            }
            if (this.vrCoreSdkClient != null) {
                this.vrCoreSdkClient.onResume();
            }
            if (this.cardboardEmulator != null && this.gvrApi.getViewerType() == 1) {
                this.cardboardEmulator.onResume();
            }
            this.isResumed = true;
            updateFadeVisibility();
            updateUiLayout();
        } finally {
            TraceCompat.endSection();
        }
    }

    @Override
    public boolean onTouchEvent(MotionEvent motionEvent) {
        if (this.presentationView != null && isPresenting() && this.presentationView.dispatchTouchEvent(motionEvent)) {
            return true;
        }
        return super.onTouchEvent(motionEvent);
    }

    @Override
    public void onWindowVisibilityChanged(int i) {
        super.onWindowVisibilityChanged(i);
        updateFadeVisibility();
    }

    public boolean setAsyncReprojectionEnabled(boolean asyncReprojectionEnabled2) {
        if (Looper.getMainLooper() != Looper.myLooper()) {
            throw new IllegalStateException("setAsyncReprojectionEnabled may only be called from the UI thread");
        }
        if (this.scanlineRacingView != null && !asyncReprojectionEnabled2) {
            throw new UnsupportedOperationException("Async reprojection cannot be disabled once enabled");
        }
        if (asyncReprojectionEnabled2 && !this.daydreamUtils.isDaydreamPhone(getContext())) {
            return false;
        }
        boolean asyncReprojectionEnabled = this.gvrApi.setAsyncReprojectionEnabled(asyncReprojectionEnabled2);
        if (asyncReprojectionEnabled2) {
            if (!asyncReprojectionEnabled) {
                Log.e(TAG, "Failed to initialize async reprojection, unsupported device.");
                this.isAsyncReprojectionVideoEnabled = false;
                this.scanlineRacingRenderer = null;
            } else if (!this.gvrApi.usingVrDisplayService()) {
                addScanlineRacingView();
            }
        }
        return asyncReprojectionEnabled;
    }

    public void setFixedPresentationSurfaceSize(int i, int i2) {
        this.gvrApi.setSurfaceSize(i, i2);
    }

    public void setPresentationView(View view) {
        if (this.presentationView != null) {
            this.presentationLayout.removeView(this.presentationView);
        }
        this.presentationLayout.addView(view, 0);
        this.presentationView = view;
    }

    public void setStereoModeEnabled(boolean stereoModeEnabled) {
        if (this.stereoModeEnabled != stereoModeEnabled) {
            this.stereoModeEnabled = stereoModeEnabled;
            this.uiLayout.setEnabled(stereoModeEnabled);
            if (this.vrCoreSdkClient != null) {
                this.vrCoreSdkClient.setEnabled(stereoModeEnabled);
            }
            if (this.fadeOverlayView != null) {
                this.fadeOverlayView.setEnabled(stereoModeEnabled);
            }
            if (this.daydreamAlignment != null) {
                this.daydreamAlignment.setEnabled(stereoModeEnabled);
            }
            updateRenderingViewsVisibility(0);
        }
    }

    public void shutdown() {
        TraceCompat.beginSection("GvrLayout.shutdown");
        try {
            this.displaySynchronizer.shutdown();
            if (this.daydreamAlignment != null) {
                this.daydreamAlignment.shutdown();
            }
            removeView(this.presentationLayout);
            removeView(this.uiLayout);
            if (this.scanlineRacingRenderer != null) {
                this.scanlineRacingRenderer.shutdown();
                this.scanlineRacingRenderer = null;
            }
            this.scanlineRacingView = null;
            this.presentationView = null;
            if (this.presentationHelper != null) {
                this.presentationHelper.shutdown();
                this.presentationHelper = null;
            }
            if (this.vrCoreSdkClient != null) {
                this.vrCoreSdkClient.onPause();
                this.vrCoreSdkClient = null;
            }
            if (this.cardboardEmulator != null) {
                this.cardboardEmulator.onPause();
                this.cardboardEmulator = null;
            }
            if (this.gvrApi != null) {
                this.gvrApi.shutdown();
                this.gvrApi = null;
            }
        } finally {
            TraceCompat.endSection();
        }
    }
}
