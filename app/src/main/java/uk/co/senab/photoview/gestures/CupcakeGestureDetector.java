package uk.co.senab.photoview.gestures;

import uk.co.senab.photoview.log.LogManager;
import android.content.Context;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.ViewConfiguration;

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

    @Override
    public boolean isDragging() {
        return this.mIsDragging;
    }

    @Override
    public boolean isScaling() {
        return false;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code restructure failed: missing block: B:3:0x000a, code lost:
    
        return true;
     */
    @Override
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
     public boolean onTouchEvent(MotionEvent motionEvent) {
        switch (motionEvent.getAction()) {
            case 0:
                this.mVelocityTracker = VelocityTracker.obtain();
                if (this.mVelocityTracker == null) {
                    LogManager.getLogger().i(LOG_TAG, "Velocity tracker is null");
                } else {
                    this.mVelocityTracker.addMovement(motionEvent);
                }
                this.mLastTouchX = getActiveX(motionEvent);
                this.mLastTouchY = getActiveY(motionEvent);
                this.mIsDragging = false;
                return true;
            case 1:
                if (this.mIsDragging && this.mVelocityTracker != null) {
                    this.mLastTouchX = getActiveX(motionEvent);
                    this.mLastTouchY = getActiveY(motionEvent);
                    this.mVelocityTracker.addMovement(motionEvent);
                    this.mVelocityTracker.computeCurrentVelocity(1000);
                    float xVelocity = this.mVelocityTracker.getXVelocity();
                    float yVelocity = this.mVelocityTracker.getYVelocity();
                    if (Math.max(Math.abs(xVelocity), Math.abs(yVelocity)) >= this.mMinimumVelocity) {
                        this.mListener.onFling(this.mLastTouchX, this.mLastTouchY, -xVelocity, -yVelocity);
                    }
                }
                if (this.mVelocityTracker != null) {
                    this.mVelocityTracker.recycle();
                    this.mVelocityTracker = null;
                }
                return true;
            case 2:
                float activeX = getActiveX(motionEvent);
                float activeY = getActiveY(motionEvent);
                float f = activeX - this.mLastTouchX;
                float f2 = activeY - this.mLastTouchY;
                if (!this.mIsDragging) {
                    this.mIsDragging = Math.sqrt((double) ((f * f) + (f2 * f2))) >= ((double) this.mTouchSlop);
                }
                if (this.mIsDragging) {
                    this.mListener.onDrag(f, f2);
                    this.mLastTouchX = activeX;
                    this.mLastTouchY = activeY;
                    if (this.mVelocityTracker != null) {
                        this.mVelocityTracker.addMovement(motionEvent);
                    }
                }
                return true;
            case 3:
                if (this.mVelocityTracker != null) {
                    this.mVelocityTracker.recycle();
                    this.mVelocityTracker = null;
                }
                return true;
            default:
                return true;
        }
    }

    @Override
    public void setOnGestureListener(OnGestureListener onGestureListener) {
        this.mListener = onGestureListener;
    }
}
