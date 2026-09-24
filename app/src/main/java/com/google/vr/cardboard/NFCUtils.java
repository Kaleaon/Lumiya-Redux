package com.google.vr.cardboard;

import androidx.core.content.ContextCompat;
import android.app.Activity;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.nfc.NfcAdapter;
import android.nfc.Tag;
import android.util.Log;

public class NFCUtils {
    private static final String TAG = NFCUtils.class.getSimpleName();
    Context context;
    NfcAdapter nfcAdapter;
    BroadcastReceiver nfcBroadcastReceiver;
    IntentFilter[] nfcIntentFilters;

    private IntentFilter createNfcIntentFilter() {
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("android.nfc.action.NDEF_DISCOVERED");
        intentFilter.addAction("android.nfc.action.TECH_DISCOVERED");
        intentFilter.addAction("android.nfc.action.TAG_DISCOVERED");
        return intentFilter;
    }

    protected boolean isNFCEnabled() {
        return this.nfcAdapter != null && this.nfcAdapter.isEnabled();
    }

    public void onCreate(Activity activity) {
        this.context = activity.getApplicationContext();
        this.nfcAdapter = NfcAdapter.getDefaultAdapter(this.context);
        this.nfcBroadcastReceiver = new BroadcastReceiver() {
            @Override
            public void onReceive(Context context, Intent intent) {
                Log.i(NFCUtils.TAG, "Got an NFC tag!");
                NFCUtils.this.onNFCTagDetected((Tag) intent.getParcelableExtra("android.nfc.extra.TAG"));
            }
        };
        IntentFilter createNfcIntentFilter = createNfcIntentFilter();
        createNfcIntentFilter.addDataScheme("cardboard");
        IntentFilter nfcIntentFilter = createNfcIntentFilter();
        nfcIntentFilter.addDataScheme("http");
        nfcIntentFilter.addDataAuthority("goo.gl", null);
        IntentFilter nfcIntentFilter2 = createNfcIntentFilter();
        nfcIntentFilter2.addDataScheme("http");
        nfcIntentFilter2.addDataAuthority("google.com", null);
        nfcIntentFilter2.addDataPath("/cardboard/cfg.*", 2);
        this.nfcIntentFilters = new IntentFilter[]{createNfcIntentFilter, nfcIntentFilter, nfcIntentFilter2};
    }

    protected void onNFCTagDetected(Tag tag) {
    }

    public void onPause(Activity activity) {
        if (isNFCEnabled()) {
            this.nfcAdapter.disableForegroundDispatch(activity);
        }
        activity.unregisterReceiver(this.nfcBroadcastReceiver);
    }

    public void onResume(Activity activity) {
        // Android 14: a receiver for non-system broadcasts must say whether other
        // apps may send to it. The NFC intents arrive through this app's own
        // PendingIntent, so the receiver is not exported.
        ContextCompat.registerReceiver(activity, this.nfcBroadcastReceiver, createNfcIntentFilter(), ContextCompat.RECEIVER_NOT_EXPORTED);
        Intent intent = new Intent("android.nfc.action.NDEF_DISCOVERED");
        intent.setPackage(activity.getPackageName());
        PendingIntent broadcast = PendingIntent.getBroadcast(this.context, 0, intent, PendingIntent.FLAG_MUTABLE);
        if (isNFCEnabled()) {
            this.nfcAdapter.enableForegroundDispatch(activity, broadcast, this.nfcIntentFilters, null);
        }
    }
}
