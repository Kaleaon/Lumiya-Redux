package uk.co.senab.photoview.gestures;

import android.content.Context;

public final class VersionedGestureDetector {
    public static GestureDetector newInstance(Context context, OnGestureListener onGestureListener) {
        GestureDetector detector = new FroyoGestureDetector(context);
        detector.setOnGestureListener(onGestureListener);
        return detector;
    }
}
