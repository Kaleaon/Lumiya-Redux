package com.google.vr.audio;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.media.AudioManager;
import com.google.vr.cardboard.annotations.UsedByNative;

@UsedByNative
public class DeviceInfo {
    private static final String TAG = "DeviceInfo";
    private final Context context;
    private final BroadcastReceiver headphoneStateReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            if (intent.getAction().equals("android.intent.action.HEADSET_PLUG")) {
                switch (intent.getIntExtra("state", -1)) {
                    case 0:
                        DeviceInfo.this.nativeUpdateHeadphoneStateChange(DeviceInfo.this.nativeObject, 2);
                        break;
                    case 1:
                        DeviceInfo.this.nativeUpdateHeadphoneStateChange(DeviceInfo.this.nativeObject, 1);
                        break;
                    default:
                        DeviceInfo.this.nativeUpdateHeadphoneStateChange(DeviceInfo.this.nativeObject, 0);
                        break;
                }
            }
        }
    };
    private final long nativeObject;

    private static abstract class HeadphoneState {
        public static final int PLUGGEDIN = 1;
        public static final int UNKNOWN = 0;
        public static final int UNPLUGGED = 2;

        private HeadphoneState() {
        }
    }

    private DeviceInfo(long nativeObject, Context context) {
        this.nativeObject = nativeObject;
        this.context = context;
    }

    @UsedByNative
    private static DeviceInfo createDeviceInfo(long j, Context context) {
        return new DeviceInfo(j, context);
    }

    @UsedByNative
    private boolean isHeadphonePluggedIn() {
        return ((AudioManager) this.context.getSystemService("audio")).isWiredHeadsetOn();
    }

    public native void nativeUpdateHeadphoneStateChange(long j, int i);

    @UsedByNative
    private void registerHandlers() {
        this.context.registerReceiver(this.headphoneStateReceiver, new IntentFilter("android.intent.action.HEADSET_PLUG"));
    }

    @UsedByNative
    private void unregisterHandlers() {
        this.context.unregisterReceiver(this.headphoneStateReceiver);
    }
}
