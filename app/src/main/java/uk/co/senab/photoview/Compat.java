package uk.co.senab.photoview;

import android.view.MotionEvent;
import android.view.View;

public class Compat {

    public static int getPointerIndex(int i) {
        return (0xFF00 & i) >> 8;
    }

    public static void postOnAnimation(View view, Runnable runnable) {
        view.postOnAnimation(runnable);
    }
}
