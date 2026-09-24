package com.google.vr.ndk.base;

import android.content.Context;
import android.os.AsyncTask;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.MotionEvent;
import android.view.View;
import com.google.vr.cardboard.DisplayUtils;
import com.google.vr.cardboard.VrParamsProvider;
import com.google.vr.cardboard.VrParamsProviderFactory;
import com.google.vrtoolkit.cardboard.proto.nano.CardboardDevice;
import com.google.vrtoolkit.cardboard.proto.nano.Phone;

class DaydreamAlignment {
    private static final double MAX_TOUCH_DISTANCE_SQUARED_METERS = 2.25E-4d;
    private static final String TAG = "DaydreamAlignment";
    private float borderSizeMeters;
    private double[] currentMarkerBestDists;
    private DisplayMetrics displayMetrics;
    private boolean enabled;
    private final boolean isDaydreamImageAlignmentEnabled;
    private boolean lastMotionEventInHeadset;
    private int[] markerBestTouch;
    private float[][] markersInPixels;
    private int mostTouchesSeen;
    private float[] pixelTranslation;
    private int[] touchBestMarker;
    private final VrParamsProvider vrParamsProvider;
    private float xMetersPerPixel;
    private float yMetersPerPixel;

    public static class DefaultTouchListener implements View.OnTouchListener {
        private final DaydreamAlignment daydreamAlignment;
        private final GvrApi gvrApi;
        private float[] lastTranslation = new float[2];
        private float[] translation = new float[2];

        public DefaultTouchListener(DaydreamAlignment daydreamAlignment, GvrApi gvrApi) {
            this.daydreamAlignment = daydreamAlignment;
            this.gvrApi = gvrApi;
        }

        @Override
        public boolean onTouch(View view, MotionEvent motionEvent) {
            if (!this.daydreamAlignment.processMotionEvent(motionEvent)) {
                return false;
            }
            if (this.daydreamAlignment.wasLastMotionEventInViewer()) {
                this.daydreamAlignment.getTranslationInScreenSpace(this.translation);
            } else {
                this.translation[0] = 0.0f;
                this.translation[1] = 0.0f;
            }
            if (this.translation[0] != this.lastTranslation[0] || this.translation[1] != this.lastTranslation[1]) {
                this.lastTranslation[0] = this.translation[0];
                this.lastTranslation[1] = this.translation[1];
                this.gvrApi.setLensOffset(this.translation[0], this.translation[1]);
            }
            return true;
        }
    }

    private class FinishInitilizationTask extends AsyncTask<Void, Void, Phone.PhoneParams> {
        public Display display;

        private FinishInitilizationTask() {
        }

        @Override
        public Phone.PhoneParams doInBackground(Void... voidArr) {
            return DaydreamAlignment.this.vrParamsProvider.readPhoneParams();
        }

        @Override
        public void onPostExecute(Phone.PhoneParams phoneParams) {
            DaydreamAlignment.this.init(DisplayUtils.getDisplayMetricsLandscapeWithOverride(this.display, phoneParams), phoneParams);
        }

        @Override
        public void onProgressUpdate(Void... voidArr) {
        }
    }

    private class RefreshViewerProfileTask extends AsyncTask<Void, Void, CardboardDevice.DeviceParams> {
        private RefreshViewerProfileTask() {
        }

        @Override
        public CardboardDevice.DeviceParams doInBackground(Void... voidArr) {
            return DaydreamAlignment.this.vrParamsProvider.readDeviceParams();
        }

        @Override
        public void onPostExecute(CardboardDevice.DeviceParams deviceParams) {
            if (deviceParams == null || deviceParams.daydreamInternal == null || deviceParams.daydreamInternal.alignmentMarkers == null) {
                DaydreamAlignment.this.markersInPixels = null;
                return;
            }
            CardboardDevice.ScreenAlignmentMarker[] screenAlignmentMarkerArr = deviceParams.daydreamInternal.alignmentMarkers;
            DaydreamAlignment.this.markersInPixels = new float[screenAlignmentMarkerArr.length][];
            DaydreamAlignment.this.currentMarkerBestDists = new double[screenAlignmentMarkerArr.length];
            DaydreamAlignment.this.markerBestTouch = new int[screenAlignmentMarkerArr.length];
            for (int i = 0; i < screenAlignmentMarkerArr.length; i++) {
                CardboardDevice.ScreenAlignmentMarker screenAlignmentMarker = screenAlignmentMarkerArr[i];
                DaydreamAlignment.this.markersInPixels[i] = new float[2];
                DaydreamAlignment.this.markersInPixels[i][0] = (DaydreamAlignment.this.displayMetrics.widthPixels / 2) + (screenAlignmentMarker.getHorizontal() / DaydreamAlignment.this.xMetersPerPixel);
                DaydreamAlignment.this.markersInPixels[i][1] = DaydreamAlignment.this.displayMetrics.heightPixels - (((screenAlignmentMarker.getVertical() + deviceParams.getTrayToLensDistance()) - DaydreamAlignment.this.borderSizeMeters) / DaydreamAlignment.this.yMetersPerPixel);
            }
        }

        @Override
        public void onProgressUpdate(Void... voidArr) {
        }
    }

    public DaydreamAlignment(Context context, GvrApi gvrApi) {
        this.pixelTranslation = new float[2];
        this.enabled = true;
        this.isDaydreamImageAlignmentEnabled = gvrApi.getSdkConfigurationParams().daydreamImageAlignment.intValue() != 1;
        this.vrParamsProvider = VrParamsProviderFactory.create(context);
        FinishInitilizationTask finishInitilizationTask = new FinishInitilizationTask();
        finishInitilizationTask.display = DisplayUtils.getDefaultDisplay(context);
        finishInitilizationTask.execute(new Void[0]);
    }

    DaydreamAlignment(VrParamsProvider vrParamsProvider, DisplayMetrics displayMetrics, Phone.PhoneParams phoneParams, boolean isDaydreamImageAlignmentEnabled) {
        this.pixelTranslation = new float[2];
        this.enabled = true;
        this.isDaydreamImageAlignmentEnabled = isDaydreamImageAlignmentEnabled;
        this.vrParamsProvider = vrParamsProvider;
        init(displayMetrics, phoneParams);
    }

    public void init(DisplayMetrics displayMetrics, Phone.PhoneParams phoneParams) {
        this.displayMetrics = displayMetrics;
        this.borderSizeMeters = DisplayUtils.getBorderSizeMeters(phoneParams);
        this.xMetersPerPixel = DisplayUtils.getMetersPerPixelFromDotsPerInch(this.displayMetrics.xdpi);
        this.yMetersPerPixel = DisplayUtils.getMetersPerPixelFromDotsPerInch(this.displayMetrics.ydpi);
        resetTrackingState();
        refreshViewerProfile();
    }

    private void resetTrackingState() {
        this.lastMotionEventInHeadset = false;
        this.pixelTranslation[0] = 0.0f;
        this.pixelTranslation[1] = 0.0f;
        this.mostTouchesSeen = 0;
    }

    void getTranslationInPixels(float[] floats) {
        if (floats.length < 2) {
            throw new IllegalArgumentException("Translation array too small");
        }
        floats[0] = this.pixelTranslation[0];
        floats[1] = this.pixelTranslation[1];
    }

    public void getTranslationInScreenSpace(float[] floats) {
        if (floats.length < 2) {
            throw new IllegalArgumentException("Translation array too small");
        }
        floats[0] = this.pixelTranslation[0] / this.displayMetrics.widthPixels;
        floats[1] = this.pixelTranslation[1] / this.displayMetrics.heightPixels;
        floats[0] = floats[0] * 4.0f;
        floats[1] = floats[1] * (-2.0f);
    }

    boolean isDaydreamImageAlignmentEnabled() {
        return this.isDaydreamImageAlignmentEnabled;
    }

    public boolean processMotionEvent(MotionEvent motionEvent) {
        if (!viewerNeedsTouchProcessing()) {
            this.lastMotionEventInHeadset = false;
            return false;
        }
        if (!isDaydreamImageAlignmentEnabled()) {
            return true;
        }
        int pointerCount = motionEvent.getPointerCount();
        if (pointerCount > this.mostTouchesSeen) {
            this.touchBestMarker = new int[pointerCount];
            this.mostTouchesSeen = pointerCount;
        }
        for (int i = 0; i < this.markersInPixels.length; i++) {
            this.markerBestTouch[i] = -1;
            this.currentMarkerBestDists[i] = 2.25E-4d;
        }
        for (int j = 0; j < pointerCount; j++) {
            double d = MAX_TOUCH_DISTANCE_SQUARED_METERS;
            this.touchBestMarker[j] = -1;
            for (int k = 0; k < this.markersInPixels.length; k++) {
                float x = (this.markersInPixels[k][0] - motionEvent.getX(j)) * this.xMetersPerPixel;
                float y = (this.markersInPixels[k][1] - motionEvent.getY(j)) * this.yMetersPerPixel;
                double d2 = (x * x) + (y * y);
                if (d2 < d) {
                    this.touchBestMarker[j] = k;
                    d = d2;
                }
                if (d2 < this.currentMarkerBestDists[k]) {
                    this.currentMarkerBestDists[k] = d2;
                    this.markerBestTouch[k] = j;
                }
            }
        }
        float f = 0.0f;
        float f2 = 0.0f;
        int i4 = 0;
        for (int m = 0; m < this.markerBestTouch.length; m++) {
            if (this.markerBestTouch[m] != -1) {
                if (this.touchBestMarker[this.markerBestTouch[m]] == m) {
                    i4++;
                    f += motionEvent.getX(this.markerBestTouch[m]) - this.markersInPixels[m][0];
                    f2 += motionEvent.getY(this.markerBestTouch[m]) - this.markersInPixels[m][1];
                } else {
                    this.markerBestTouch[m] = -1;
                }
            }
        }
        if (i4 <= 0) {
            this.lastMotionEventInHeadset = false;
            return true;
        }
        this.lastMotionEventInHeadset = true;
        this.pixelTranslation[0] = f / i4;
        this.pixelTranslation[1] = f2 / i4;
        return true;
    }

    public void refreshViewerProfile() {
        new RefreshViewerProfileTask().execute(new Void[0]);
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
        if (enabled) {
            return;
        }
        resetTrackingState();
    }

    public void shutdown() {
        this.vrParamsProvider.close();
    }

    boolean viewerNeedsTouchProcessing() {
        return this.enabled && this.markersInPixels != null && this.markersInPixels.length > 0;
    }

    public boolean wasLastMotionEventInViewer() {
        return this.lastMotionEventInHeadset;
    }
}
