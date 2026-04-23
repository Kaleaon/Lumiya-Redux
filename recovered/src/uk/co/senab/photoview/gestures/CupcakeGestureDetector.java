package uk.co.senab.photoview.gestures;

import android.content.Context;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.ViewConfiguration;

/* loaded from: classes.dex */
public class CupcakeGestureDetector implements GestureDetector {
    private static final String LOG_TAG = "CupcakeGestureDetector";
    private boolean mIsDragging;
    float mLastTouchX;
    float mLastTouchY;
    protected OnGestureListener mListener;
    final float mMinimumVelocity;
    final float mTouchSlop;
    private VelocityTracker mVelocityTracker;

    public CupcakeGestureDetector(Context context) {
        ViewConfiguration viewConfiguration = ViewConfiguration.get(context);
        this.mMinimumVelocity = viewConfiguration.getScaledMinimumFlingVelocity();
        this.mTouchSlop = viewConfiguration.getScaledTouchSlop();
    }

    float getActiveX(MotionEvent motionEvent) {
        return motionEvent.getX();
    }

    float getActiveY(MotionEvent motionEvent) {
        return motionEvent.getY();
    }

    @Override // uk.co.senab.photoview.gestures.GestureDetector
    public boolean isDragging() {
        return this.mIsDragging;
    }

    @Override // uk.co.senab.photoview.gestures.GestureDetector
    public boolean isScaling() {
        return false;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code restructure failed: missing block: B:3:0x000a, code lost:
    
        return true;
     */
    @Override // uk.co.senab.photoview.gestures.GestureDetector
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean onTouchEvent(android.view.MotionEvent r11) {
        /*
            r10 = this;
            r1 = 1
            r0 = 0
            r6 = 0
            int r2 = r11.getAction()
            switch(r2) {
                case 0: goto Lb;
                case 1: goto L83;
                case 2: goto L37;
                case 3: goto L77;
                default: goto La;
            }
        La:
            return r1
        Lb:
            android.view.VelocityTracker r2 = android.view.VelocityTracker.obtain()
            r10.mVelocityTracker = r2
            android.view.VelocityTracker r2 = r10.mVelocityTracker
            if (r2 != 0) goto L31
            uk.co.senab.photoview.log.Logger r2 = uk.co.senab.photoview.log.LogManager.getLogger()
            java.lang.String r3 = "CupcakeGestureDetector"
            java.lang.String r4 = "Velocity tracker is null"
            r2.i(r3, r4)
        L22:
            float r2 = r10.getActiveX(r11)
            r10.mLastTouchX = r2
            float r2 = r10.getActiveY(r11)
            r10.mLastTouchY = r2
            r10.mIsDragging = r0
            goto La
        L31:
            android.view.VelocityTracker r2 = r10.mVelocityTracker
            r2.addMovement(r11)
            goto L22
        L37:
            float r2 = r10.getActiveX(r11)
            float r3 = r10.getActiveY(r11)
            float r4 = r10.mLastTouchX
            float r4 = r2 - r4
            float r5 = r10.mLastTouchY
            float r5 = r3 - r5
            boolean r6 = r10.mIsDragging
            if (r6 == 0) goto L62
        L4b:
            boolean r0 = r10.mIsDragging
            if (r0 == 0) goto La
            uk.co.senab.photoview.gestures.OnGestureListener r0 = r10.mListener
            r0.onDrag(r4, r5)
            r10.mLastTouchX = r2
            r10.mLastTouchY = r3
            android.view.VelocityTracker r0 = r10.mVelocityTracker
            if (r0 == 0) goto La
            android.view.VelocityTracker r0 = r10.mVelocityTracker
            r0.addMovement(r11)
            goto La
        L62:
            float r6 = r4 * r4
            float r7 = r5 * r5
            float r6 = r6 + r7
            double r6 = (double) r6
            double r6 = java.lang.Math.sqrt(r6)
            float r8 = r10.mTouchSlop
            double r8 = (double) r8
            int r6 = (r6 > r8 ? 1 : (r6 == r8 ? 0 : -1))
            if (r6 < 0) goto L74
            r0 = r1
        L74:
            r10.mIsDragging = r0
            goto L4b
        L77:
            android.view.VelocityTracker r0 = r10.mVelocityTracker
            if (r0 == 0) goto La
            android.view.VelocityTracker r0 = r10.mVelocityTracker
            r0.recycle()
            r10.mVelocityTracker = r6
            goto La
        L83:
            boolean r0 = r10.mIsDragging
            if (r0 != 0) goto L94
        L87:
            android.view.VelocityTracker r0 = r10.mVelocityTracker
            if (r0 == 0) goto La
            android.view.VelocityTracker r0 = r10.mVelocityTracker
            r0.recycle()
            r10.mVelocityTracker = r6
            goto La
        L94:
            android.view.VelocityTracker r0 = r10.mVelocityTracker
            if (r0 == 0) goto L87
            float r0 = r10.getActiveX(r11)
            r10.mLastTouchX = r0
            float r0 = r10.getActiveY(r11)
            r10.mLastTouchY = r0
            android.view.VelocityTracker r0 = r10.mVelocityTracker
            r0.addMovement(r11)
            android.view.VelocityTracker r0 = r10.mVelocityTracker
            r2 = 1000(0x3e8, float:1.401E-42)
            r0.computeCurrentVelocity(r2)
            android.view.VelocityTracker r0 = r10.mVelocityTracker
            float r0 = r0.getXVelocity()
            android.view.VelocityTracker r2 = r10.mVelocityTracker
            float r2 = r2.getYVelocity()
            float r3 = java.lang.Math.abs(r0)
            float r4 = java.lang.Math.abs(r2)
            float r3 = java.lang.Math.max(r3, r4)
            float r4 = r10.mMinimumVelocity
            int r3 = (r3 > r4 ? 1 : (r3 == r4 ? 0 : -1))
            if (r3 < 0) goto L87
            uk.co.senab.photoview.gestures.OnGestureListener r3 = r10.mListener
            float r4 = r10.mLastTouchX
            float r5 = r10.mLastTouchY
            float r0 = -r0
            float r2 = -r2
            r3.onFling(r4, r5, r0, r2)
            goto L87
        */
        throw new UnsupportedOperationException("Method not decompiled: uk.co.senab.photoview.gestures.CupcakeGestureDetector.onTouchEvent(android.view.MotionEvent):boolean");
    }

    @Override // uk.co.senab.photoview.gestures.GestureDetector
    public void setOnGestureListener(OnGestureListener onGestureListener) {
        this.mListener = onGestureListener;
    }
}
