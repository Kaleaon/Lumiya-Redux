package com.google.vr.ndk.base;

import android.os.Build;
import android.os.Trace;

/* loaded from: classes.dex */
class TraceCompat {
    TraceCompat() {
    }

    static void beginSection(String str) {
        if (Build.VERSION.SDK_INT < 18) {
            return;
        }
        Trace.beginSection(str);
    }

    static void endSection() {
        if (Build.VERSION.SDK_INT < 18) {
            return;
        }
        Trace.endSection();
    }
}
