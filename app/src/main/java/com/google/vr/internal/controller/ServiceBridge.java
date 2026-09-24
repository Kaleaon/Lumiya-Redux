package com.google.vr.internal.controller;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Parcel;
import android.os.RemoteException;
import android.util.Log;
import com.google.vr.cardboard.annotations.UsedByNative;
import com.google.vr.vrcore.base.api.VrCoreNotAvailableException;
import com.google.vr.vrcore.base.api.VrCoreUtils;
import com.google.vr.vrcore.controller.api.ControllerAccelEvent;
import com.google.vr.vrcore.controller.api.ControllerButtonEvent;
import com.google.vr.vrcore.controller.api.ControllerEventPacket;
import com.google.vr.vrcore.controller.api.ControllerEventPacket2;
import com.google.vr.vrcore.controller.api.ControllerGyroEvent;
import com.google.vr.vrcore.controller.api.ControllerInitResults;
import com.google.vr.vrcore.controller.api.ControllerListenerOptions;
import com.google.vr.vrcore.controller.api.ControllerOrientationEvent;
import com.google.vr.vrcore.controller.api.ControllerServiceConsts;
import com.google.vr.vrcore.controller.api.ControllerTouchEvent;
import com.google.vr.vrcore.controller.api.IControllerListener;
import com.google.vr.vrcore.controller.api.IControllerService;

@UsedByNative
public class ServiceBridge implements ServiceConnection {
    private static final boolean DEBUG = false;
    public static final int FLAG_SUPPORTS_RECENTER = 1;
    static final String LISTENER_KEY = "com.google.vr.internal.controller.LISTENER_KEY";
    private static final int MIN_SERVICE_API_FOR_RECENTERING = 8;
    private static final String TAG = ServiceBridge.class.getSimpleName();
    static final int TARGET_SERVICE_API_VERSION = 10;
    private final Callbacks callbacks;
    private final Context context;
    private boolean isBound;
    private IControllerService service;
    private final ControllerListenerOptions options = new ControllerListenerOptions();
    private final Runnable bindRunnable = new Runnable() {
        @Override
        public void run() {
            ServiceBridge.this.doBind();
        }
    };
    private final Runnable unbindRunnable = new Runnable() {
        @Override
        public void run() {
            ServiceBridge.this.doUnbind();
        }
    };
    private final IControllerListener controllerListener = new IControllerListener.Stub() {
        @Override
        public void deprecatedOnControllerAccelEvent(ControllerAccelEvent controllerAccelEvent) {
            ControllerEventPacket obtain = ControllerEventPacket.obtain();
            Parcel parcel = Parcel.obtain();
            controllerAccelEvent.writeToParcel(parcel, 0);
            parcel.setDataPosition(0);
            obtain.addAccelEvent().readFromParcel(parcel);
            ServiceBridge.this.callbacks.onControllerEventPacket(obtain);
            obtain.recycle();
            parcel.recycle();
        }

        @Override
        public void deprecatedOnControllerButtonEvent(ControllerButtonEvent controllerButtonEvent) {
            ControllerEventPacket obtain = ControllerEventPacket.obtain();
            Parcel parcel = Parcel.obtain();
            controllerButtonEvent.writeToParcel(parcel, 0);
            parcel.setDataPosition(0);
            obtain.addButtonEvent().readFromParcel(parcel);
            ServiceBridge.this.callbacks.onControllerEventPacket(obtain);
            obtain.recycle();
            parcel.recycle();
        }

        @Override
        public boolean deprecatedOnControllerButtonEventV1(ControllerButtonEvent controllerButtonEvent) {
            return true;
        }

        @Override
        public void deprecatedOnControllerGyroEvent(ControllerGyroEvent controllerGyroEvent) {
            ControllerEventPacket obtain = ControllerEventPacket.obtain();
            Parcel parcel = Parcel.obtain();
            controllerGyroEvent.writeToParcel(parcel, 0);
            parcel.setDataPosition(0);
            obtain.addGyroEvent().readFromParcel(parcel);
            ServiceBridge.this.callbacks.onControllerEventPacket(obtain);
            obtain.recycle();
            parcel.recycle();
        }

        @Override
        public void deprecatedOnControllerOrientationEvent(ControllerOrientationEvent controllerOrientationEvent) {
            ControllerEventPacket obtain = ControllerEventPacket.obtain();
            Parcel parcel = Parcel.obtain();
            controllerOrientationEvent.writeToParcel(parcel, 0);
            parcel.setDataPosition(0);
            obtain.addOrientationEvent().readFromParcel(parcel);
            ServiceBridge.this.callbacks.onControllerEventPacket(obtain);
            obtain.recycle();
            parcel.recycle();
        }

        @Override
        public void deprecatedOnControllerTouchEvent(ControllerTouchEvent controllerTouchEvent) {
            ControllerEventPacket obtain = ControllerEventPacket.obtain();
            Parcel parcel = Parcel.obtain();
            controllerTouchEvent.writeToParcel(parcel, 0);
            parcel.setDataPosition(0);
            obtain.addTouchEvent().readFromParcel(parcel);
            ServiceBridge.this.callbacks.onControllerEventPacket(obtain);
            obtain.recycle();
            parcel.recycle();
        }

        @Override
        public int getApiVersion() throws RemoteException {
            return 10;
        }

        @Override
        public ControllerListenerOptions getOptions() throws RemoteException {
            return ServiceBridge.this.options;
        }

        @Override
        public void onControllerEventPacket(ControllerEventPacket controllerEventPacket) throws RemoteException {
            ServiceBridge.this.callbacks.onControllerEventPacket(controllerEventPacket);
            controllerEventPacket.recycle();
        }

        @Override
        public void onControllerEventPacket2(ControllerEventPacket2 controllerEventPacket2) throws RemoteException {
            ServiceBridge.this.callbacks.onControllerEventPacket(controllerEventPacket2);
            controllerEventPacket2.recycle();
        }

        @Override
        public void onControllerRecentered(ControllerOrientationEvent controllerOrientationEvent) {
            ServiceBridge.this.callbacks.onControllerRecentered(controllerOrientationEvent);
        }

        @Override
        public void onControllerStateChanged(int i, int i2) throws RemoteException {
            ServiceBridge.this.callbacks.onControllerStateChanged(i, i2);
        }
    };
    private final Handler mainThreadHandler = new Handler(Looper.getMainLooper());

    @UsedByNative
    public interface Callbacks {
        void onControllerEventPacket(ControllerEventPacket controllerEventPacket);

        void onControllerRecentered(ControllerOrientationEvent controllerOrientationEvent);

        void onControllerStateChanged(int i, int i2);

        void onServiceConnected(int i);

        void onServiceDisconnected();

        void onServiceFailed();

        void onServiceInitFailed(int i);

        void onServiceUnavailable();
    }

    @UsedByNative
    public ServiceBridge(Context context, Callbacks callbacks) {
        this.context = context.getApplicationContext();
        this.callbacks = callbacks;
    }

    public void doBind() {
        ensureOnMainThread();
        if (this.isBound) {
            Log.w(TAG, "Service is already bound.");
            return;
        }
        Intent intent = new Intent(ControllerServiceConsts.BIND_INTENT_ACTION);
        intent.setPackage("com.google.vr.vrcore");
        if (this.context.bindService(intent, this, 1)) {
            this.isBound = true;
        } else {
            Log.w(TAG, "Bind failed. Service is not available.");
            this.callbacks.onServiceUnavailable();
        }
    }

    public void doUnbind() {
        ensureOnMainThread();
        if (!this.isBound) {
            Log.w(TAG, "Service is already unbound.");
            return;
        }
        unregisterListener();
        this.context.unbindService(this);
        this.isBound = false;
    }

    private void ensureOnMainThread() {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            throw new IllegalStateException("This should be running on the main thread.");
        }
    }

    private void unregisterListener() {
        if (this.service != null) {
            try {
                this.service.unregisterListener(LISTENER_KEY);
            } catch (RemoteException e) {
                e.printStackTrace();
                Log.w(TAG, "RemoteException while unregistering listener.");
            }
        }
    }

    protected int getVrCoreClientApiVersion() {
        try {
            return VrCoreUtils.getVrCoreClientApiVersion(this.context);
        } catch (VrCoreNotAvailableException e) {
            Log.w(TAG, "VrCore not available.", e);
            return -1;
        }
    }

    @Override
    public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        int i = 0;
        ensureOnMainThread();
        this.service = IControllerService.Stub.asInterface(iBinder);
        try {
            int initialize = this.service.initialize(10);
            if (initialize != 0) {
                String str = TAG;
                String valueOf = String.valueOf(ControllerInitResults.toString(initialize));
                Log.e(str, valueOf.length() == 0 ? new String("initialize() returned error: ") : "initialize() returned error: ".concat(valueOf));
                this.callbacks.onServiceInitFailed(initialize);
                doUnbind();
                return;
            }
            int vrCoreClientApiVersion = getVrCoreClientApiVersion();
            if (vrCoreClientApiVersion < 0) {
                Log.w(TAG, "Failed to get VrCore client API version.");
                this.callbacks.onServiceFailed();
                doUnbind();
                return;
            }
            if (vrCoreClientApiVersion < 8) {
                Log.w(TAG, new StringBuilder(62).append("Recentering is not supported by VrCore API version ").append(vrCoreClientApiVersion).toString());
            } else {
                i = 1;
            }
            this.callbacks.onServiceConnected(i);
            try {
                if (this.service.registerListener(0, LISTENER_KEY, this.controllerListener)) {
                    return;
                }
                Log.w(TAG, "Failed to register listener.");
                this.callbacks.onServiceFailed();
                doUnbind();
            } catch (RemoteException e) {
                e.printStackTrace();
                Log.w(TAG, "RemoteException while registering listener.");
                this.callbacks.onServiceFailed();
                doUnbind();
            }
        } catch (RemoteException e2) {
            e2.printStackTrace();
            Log.e(TAG, "Failed to call initialize() on controller service (RemoteException).");
            this.callbacks.onServiceFailed();
            doUnbind();
        }
    }

    @Override
    public void onServiceDisconnected(ComponentName componentName) {
        ensureOnMainThread();
        this.service = null;
        this.callbacks.onServiceDisconnected();
    }

    @UsedByNative
    public void requestBind() {
        this.mainThreadHandler.post(this.bindRunnable);
    }

    @UsedByNative
    public void requestUnbind() {
        this.mainThreadHandler.post(this.unbindRunnable);
    }

    @UsedByNative
    public void setAccelEnabled(boolean accelEnabled) {
        this.options.enableAccel = accelEnabled;
    }

    @UsedByNative
    public void setGesturesEnabled(boolean gesturesEnabled) {
        this.options.enableGestures = gesturesEnabled;
    }

    @UsedByNative
    public void setGyroEnabled(boolean gyroEnabled) {
        this.options.enableGyro = gyroEnabled;
    }

    @UsedByNative
    public void setOrientationEnabled(boolean orientationEnabled) {
        this.options.enableOrientation = orientationEnabled;
    }

    @UsedByNative
    public void setTouchEnabled(boolean touchEnabled) {
        this.options.enableTouch = touchEnabled;
    }
}
