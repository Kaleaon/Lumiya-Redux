package com.google.vr.ndk.base;

import android.app.ActivityManager;
import android.app.AlertDialog;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.os.RemoteException;
import android.util.Log;
import com.google.vr.cardboard.ContextUtils;
import com.google.vr.cardboard.R;
import com.google.vr.cardboard.UiUtils;
import com.google.vr.vrcore.base.api.VrCoreNotAvailableException;
import com.google.vr.vrcore.base.api.VrCoreUtils;
import com.google.vr.vrcore.common.api.HeadTrackingState;
import com.google.vr.vrcore.common.api.IDaydreamListener;
import com.google.vr.vrcore.common.api.IDaydreamManager;
import com.google.vr.vrcore.common.api.IVrCoreSdkService;
import com.google.vr.vrcore.common.api.SdkServiceConsts;
import java.lang.ref.WeakReference;

class VrCoreSdkClient {
    private static final boolean DEBUG = false;
    private static final int FADE_FLUSH_DELAY_FOR_TRACKING_STABILIZATION_MILLIS = 200;
    static final int MIN_VRCORE_API_VERSION = 5;
    private static final String TAG = "VrCoreSdkClient";
    static final int TARGET_VRCORE_API_VERSION = 10;
    private final Runnable closeVrRunnable;
    private final ComponentName componentName;
    private final Context context;
    private final DaydreamListenerImpl daydreamListener;
    private IDaydreamManager daydreamManager;
    private final DaydreamUtilsWrapper daydreamUtils;
    private final FadeOverlayView fadeOverlayView;
    private final GvrApi gvrApi;
    private AlertDialog helpCenterDialog;
    private boolean isBound;
    private boolean isResumed;
    private final boolean shouldBind;
    private IVrCoreSdkService vrCoreSdkService;
    private boolean isEnabled = true;
    private final ServiceConnection serviceConnection = new ServiceConnection() {
        @Override
        public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
            IVrCoreSdkService asInterface = IVrCoreSdkService.Stub.asInterface(iBinder);
            try {
                if (!asInterface.initialize(10)) {
                    Log.e(VrCoreSdkClient.TAG, "Failed to initialize VrCore SDK Service.");
                    VrCoreSdkClient.this.handleBindFailed();
                    return;
                }
                VrCoreSdkClient.this.vrCoreSdkService = asInterface;
                try {
                    VrCoreSdkClient.this.daydreamManager = VrCoreSdkClient.this.vrCoreSdkService.getDaydreamManager();
                    if (VrCoreSdkClient.this.daydreamManager == null) {
                        Log.w(VrCoreSdkClient.TAG, "Failed to obtain DaydreamManager from VrCore SDK Service.");
                        VrCoreSdkClient.this.handleNoDaydreamManager();
                        return;
                    }
                    VrCoreSdkClient.this.daydreamManager.registerListener(VrCoreSdkClient.this.componentName, VrCoreSdkClient.this.daydreamListener);
                    HeadTrackingState trackingToRestore = null;
                    try {
                        HeadTrackingState headTrackingState = VrCoreSdkClient.this.getHeadTrackingState();
                        int prepareVr = VrCoreSdkClient.this.daydreamManager.prepareVr(VrCoreSdkClient.this.componentName, headTrackingState);
                        if (prepareVr != 2) {
                            trackingToRestore = prepareVr == 0 ? headTrackingState : null;
                        } else {
                            Log.e(VrCoreSdkClient.TAG, "Daydream VR preparation failed, closing VR session.");
                            VrCoreSdkClient.this.handlePrepareVrFailed();
                        }
                    } catch (RemoteException e) {
                        String valueOf = String.valueOf(e);
                        Log.w(VrCoreSdkClient.TAG, new StringBuilder(String.valueOf(valueOf).length() + 61).append("Error while registering listener with the VrCore SDK Service:").append(valueOf).toString());
                    } finally {
                        VrCoreSdkClient.this.resumeTracking(trackingToRestore);
                    }
                } catch (RemoteException e2) {
                    String valueOf2 = String.valueOf(e2);
                    Log.w(VrCoreSdkClient.TAG, new StringBuilder(String.valueOf(valueOf2).length() + 57).append("Failed to obtain DaydreamManager from VrCore SDK Service:").append(valueOf2).toString());
                    VrCoreSdkClient.this.handleNoDaydreamManager();
                }
            } catch (RemoteException e3) {
                String valueOf3 = String.valueOf(e3);
                Log.w(VrCoreSdkClient.TAG, new StringBuilder(String.valueOf(valueOf3).length() + 41).append("Failed to initialize VrCore SDK Service: ").append(valueOf3).toString());
                VrCoreSdkClient.this.handleBindFailed();
            }
        }

        @Override
        public void onServiceDisconnected(ComponentName componentName) {
            VrCoreSdkClient.this.vrCoreSdkService = null;
            VrCoreSdkClient.this.daydreamManager = null;
        }
    };

    private static final class DaydreamListenerImpl extends IDaydreamListener.Stub {
        private static final long FADE_SAFEGUARD_DELAY_MILLIS = 3500;
        private static final int MSG_FADE_IN_SAFEGUARD = 2;
        private static final int MSG_TRACKING_RESUME_SAFEGUARD = 1;
        private static final long TRACKING_SAFEGUARD_DELAY_MILLIS = 3000;
        private final WeakReference<FadeOverlayView> fadeOverlayViewWeak;
        private final WeakReference<GvrApi> gvrApiWeak;
        private final Handler safeguardHandler = new Handler() {
            @Override
            public void handleMessage(Message message) {
                switch (message.what) {
                    case 1:
                        Log.w(VrCoreSdkClient.TAG, "Forcing tracking resume: VrCore unresponsive");
                        DaydreamListenerImpl.this.resumeHeadTrackingImpl(null);
                        break;
                    case 2:
                        Log.w(VrCoreSdkClient.TAG, "Forcing fade in: VrCore unresponsive");
                        DaydreamListenerImpl.this.applyFadeImpl(1, 350L);
                        break;
                    default:
                        super.handleMessage(message);
                        break;
                }
            }
        };

        DaydreamListenerImpl(GvrApi gvrApi, FadeOverlayView fadeOverlayView) {
            this.gvrApiWeak = new WeakReference<>(gvrApi);
            this.fadeOverlayViewWeak = new WeakReference<>(fadeOverlayView);
        }

        public final void applyFadeImpl(final int i, final long j) {
            final FadeOverlayView fadeOverlayView = this.fadeOverlayViewWeak.get();
            if (fadeOverlayView != null) {
                cancelSafeguard(2);
                fadeOverlayView.post(new Runnable() {
                    @Override
                    public void run() {
                        fadeOverlayView.startFade(i, j);
                    }
                });
                if (i != 2) {
                    return;
                }
                rescheduleSafeguard(2, FADE_SAFEGUARD_DELAY_MILLIS + j);
            }
        }

        private final void cancelSafeguard(int i) {
            this.safeguardHandler.removeMessages(i);
        }

        private final void rescheduleSafeguard(int i, long j) {
            cancelSafeguard(i);
            this.safeguardHandler.sendEmptyMessageDelayed(i, j);
        }

        public final void resumeHeadTrackingImpl(HeadTrackingState headTrackingState) {
            GvrApi gvrApi = this.gvrApiWeak.get();
            if (gvrApi == null) {
                Log.w(VrCoreSdkClient.TAG, "Invalid resumeHeadTracking() call: GvrApi no longer valid");
            } else {
                cancelSafeguard(1);
                VrCoreSdkClient.resumeTracking(gvrApi, headTrackingState);
            }
        }

        @Override
        public final void applyFade(int i, long j) {
            applyFadeImpl(i, j);
        }

        @Override
        public final void dumpDebugData() throws RemoteException {
            GvrApi gvrApi = this.gvrApiWeak.get();
            if (gvrApi != null) {
                gvrApi.dumpDebugData();
            } else {
                Log.w(VrCoreSdkClient.TAG, "Invalid dumpDebugData() call: GvrApi no longer valid");
            }
        }

        @Override
        public final int getTargetApiVersion() throws RemoteException {
            return 10;
        }

        @Override
        public final void recenterHeadTracking() throws RemoteException {
            GvrApi gvrApi = this.gvrApiWeak.get();
            if (gvrApi != null) {
                gvrApi.recenterTracking();
            } else {
                Log.w(VrCoreSdkClient.TAG, "Invalid recenterHeadTracking() call: GvrApi no longer valid");
            }
        }

        @Override
        public final HeadTrackingState requestStopTracking() throws RemoteException {
            GvrApi gvrApi = this.gvrApiWeak.get();
            if (gvrApi == null) {
                Log.w(VrCoreSdkClient.TAG, "Invalid requestStopTracking() call: GvrApi no longer valid");
                return null;
            }
            byte[] pauseTrackingGetState = gvrApi.pauseTrackingGetState();
            rescheduleSafeguard(1, TRACKING_SAFEGUARD_DELAY_MILLIS);
            if (pauseTrackingGetState == null) {
                return null;
            }
            return new HeadTrackingState(pauseTrackingGetState);
        }

        final void resetSafeguards() {
            this.safeguardHandler.removeCallbacksAndMessages(null);
        }

        @Override
        public final void resumeHeadTracking(HeadTrackingState headTrackingState) {
            resumeHeadTrackingImpl(headTrackingState);
        }
    }

    public VrCoreSdkClient(Context context, GvrApi gvrApi, ComponentName componentName, DaydreamUtilsWrapper daydreamUtilsWrapper, Runnable runnable, FadeOverlayView fadeOverlayView) {
        this.context = context;
        this.gvrApi = gvrApi;
        this.componentName = componentName;
        this.daydreamUtils = daydreamUtilsWrapper;
        this.closeVrRunnable = runnable;
        this.fadeOverlayView = fadeOverlayView;
        this.daydreamListener = new DaydreamListenerImpl(gvrApi, fadeOverlayView);
        this.shouldBind = hasCompatibleSdkService(context);
        gvrApi.setIgnoreManualTrackerPauseResume(true);
    }

    private boolean doBind() {
        if (this.isBound) {
            return true;
        }
        if (this.shouldBind) {
            Intent intent = new Intent(SdkServiceConsts.BIND_INTENT_ACTION);
            intent.setPackage("com.google.vr.vrcore");
            this.isBound = this.context.bindService(intent, this.serviceConnection, 1);
        }
        if (!this.isBound) {
            handleBindFailed();
        }
        return this.isBound;
    }

    private void doUnbind() {
        if (this.isResumed) {
            resumeTracking(null);
        } else {
            this.gvrApi.pauseTrackingGetState();
        }
        if (this.isBound) {
            if (this.daydreamManager != null) {
                try {
                    this.daydreamManager.unregisterListener(this.componentName);
                } catch (RemoteException e) {
                    String valueOf = String.valueOf(e);
                    Log.w(TAG, new StringBuilder(String.valueOf(valueOf).length() + 40).append("Failed to unregister Daydream listener: ").append(valueOf).toString());
                }
                this.daydreamManager = null;
            }
            this.vrCoreSdkService = null;
            this.context.unbindService(this.serviceConnection);
            this.isBound = false;
        }
    }

    public void handleBindFailed() {
        doUnbind();
        warnIfIncompatibleClient();
    }

    public void handleNoDaydreamManager() {
        doUnbind();
        warnIfIncompatibleClient();
    }

    public void handlePrepareVrFailed() {
        doUnbind();
        this.closeVrRunnable.run();
    }

    private static boolean hasCompatibleSdkService(Context context) {
        int vrCoreClientApiVersion;
        try {
            vrCoreClientApiVersion = VrCoreUtils.getVrCoreClientApiVersion(context);
        } catch (VrCoreNotAvailableException e) {
            return false;
        }
        if (vrCoreClientApiVersion >= 5) {
            return true;
        }
        Log.w(TAG, String.format("VrCore service obsolete, GVR SDK requires API %d but found API %d.", 5, Integer.valueOf(vrCoreClientApiVersion)));
        return false;
    }

    public static void resumeTracking(GvrApi gvrApi, HeadTrackingState headTrackingState) {
        byte[] bytes = null;
        if (headTrackingState != null && !headTrackingState.isEmpty()) {
            bytes = headTrackingState.getData();
        }
        gvrApi.resumeTrackingSetState(bytes);
    }

    public void resumeTracking(HeadTrackingState headTrackingState) {
        resumeTracking(this.gvrApi, headTrackingState);
        if (this.fadeOverlayView == null) {
            return;
        }
        this.fadeOverlayView.flushAutoFade(200L);
    }

    private void warnIfIncompatibleClient() {
        if (this.daydreamUtils.isDaydreamPhone(this.context) || !this.daydreamUtils.isDaydreamRequiredActivity(ContextUtils.getActivity(this.context)) || ActivityManager.isRunningInTestHarness()) {
            return;
        }
        if (this.helpCenterDialog == null) {
            this.helpCenterDialog = UiUtils.showDaydreamHelpCenterDialog(this.context, R.string.dialog_title_incompatible_phone, R.string.dialog_message_incompatible_phone, this.closeVrRunnable);
        } else {
            this.helpCenterDialog.show();
        }
    }

    IDaydreamManager getDaydreamManager() {
        return this.daydreamManager;
    }

    HeadTrackingState getHeadTrackingState() {
        return new HeadTrackingState();
    }

    public boolean launchInVr(PendingIntent pendingIntent) {
        if (this.daydreamManager == null) {
            return false;
        }
        try {
            this.daydreamManager.deprecatedLaunchInVr(pendingIntent);
            return true;
        } catch (RemoteException e) {
            String valueOf = String.valueOf(e);
            Log.w(TAG, new StringBuilder(String.valueOf(valueOf).length() + 28).append("Failed to launch app in VR: ").append(valueOf).toString());
            return true;
        }
    }

    public void onPause() {
        this.isResumed = false;
        this.daydreamListener.resetSafeguards();
        if (this.isEnabled) {
            doUnbind();
        }
    }

    public boolean onResume() {
        this.isResumed = true;
        if (this.isEnabled) {
            return doBind();
        }
        return false;
    }

    public void setEnabled(boolean isEnabled) {
        if (this.isEnabled != isEnabled) {
            this.isEnabled = isEnabled;
            this.gvrApi.setIgnoreManualTrackerPauseResume(isEnabled);
            if (this.isResumed) {
                if (this.isEnabled) {
                    doBind();
                } else {
                    doUnbind();
                }
            }
        }
    }
}
