package com.lumiyaviewer.lumiya.ui.common

import androidx.coordinatorlayout.widget.CoordinatorLayout
import androidx.core.view.MotionEventCompat
import androidx.core.view.ViewCompat
import androidx.customview.widget.ViewDragHelper
import android.view.MotionEvent
import android.view.View
import android.view.ViewConfiguration
import android.view.ViewGroup
import java.lang.annotation.Retention
import java.lang.annotation.RetentionPolicy

open class SwipeDismissAdvancedBehavior<V extends View> : CoordinatorLayout.Behavior<V>() {
    private static float DEFAULT_ALPHA_END_DISTANCE = 1.0f
    private static float DEFAULT_ALPHA_START_DISTANCE = 0.0f
    private static float DEFAULT_DRAG_DISMISS_THRESHOLD = 1.0f
    public static int STATE_DRAGGING = 1
    public static int STATE_IDLE = 0
    public static int STATE_SETTLING = 2
    public static int SWIPE_DIRECTION_ANY = 15
    public static int SWIPE_DIRECTION_DOWN = 8
    public static int SWIPE_DIRECTION_LEFT = 1
    public static int SWIPE_DIRECTION_RIGHT = 2
    public static int SWIPE_DIRECTION_UP = 4
    public static int SWIPE_DIRECTION_X = 3
    public static int SWIPE_DIRECTION_Y = 12
    private boolean mIgnoreEvents
    private OnDismissListener mListener
    private boolean mSensitivitySet
    private ViewDragHelper mViewDragHelper
    private float mSensitivity = 0.0f
    private int mSwipeDirection = 15
    private float mDragDismissThreshold = 1.0f
    private float mAlphaStartSwipeDistance = 0.0f
    private float mAlphaEndSwipeDistance = 1.0f
    private ViewDragHelper.Callback mDragCallback = new ViewDragHelper.Callback() {
        private int mOriginalCapturedViewLeft
        private int mOriginalCapturedViewTop

        private fun shouldDismiss(view: View, f: Float, f2: Float): Boolean {
            float scaledMinimumFlingVelocity = ViewConfiguration.get(view.getContext()).getScaledMinimumFlingVelocity()
            if (f < (-scaledMinimumFlingVelocity) && (SwipeDismissAdvancedBehavior.this.mSwipeDirection & 1) != 0) {
                return true
            }
            if (f > scaledMinimumFlingVelocity && (SwipeDismissAdvancedBehavior.this.mSwipeDirection & 2) != 0) {
                return true
            }
            if (f2 < (-scaledMinimumFlingVelocity) && (SwipeDismissAdvancedBehavior.this.mSwipeDirection & 4) != 0) {
                return true
            }
            if (f2 > scaledMinimumFlingVelocity && (SwipeDismissAdvancedBehavior.this.mSwipeDirection & 8) != 0) {
                return true
            }
            int left = view.getLeft() - this.mOriginalCapturedViewLeft
            int round = Math.round(view.getWidth() * SwipeDismissAdvancedBehavior.this.mDragDismissThreshold)
            if (left < (-round) && (SwipeDismissAdvancedBehavior.this.mSwipeDirection & 1) != 0) {
                return true
            }
            if (left > round && (SwipeDismissAdvancedBehavior.this.mSwipeDirection & 2) != 0) {
                return true
            }
            int top = view.getTop() - this.mOriginalCapturedViewTop
            int round2 = Math.round(view.getHeight() * SwipeDismissAdvancedBehavior.this.mDragDismissThreshold)
            if (top >= (-round2) || (SwipeDismissAdvancedBehavior.this.mSwipeDirection & 4) == 0) {
                return top > round2 && (SwipeDismissAdvancedBehavior.this.mSwipeDirection & 8) != 0
            }
            return true
        }

        override fun clampViewPositionHorizontal(view: View, i: Int, i2: Int): Int {
            if (view.getTop() != this.mOriginalCapturedViewTop) {
                return this.mOriginalCapturedViewLeft
            }
            return SwipeDismissAdvancedBehavior.clamp(this.mOriginalCapturedViewLeft - ((SwipeDismissAdvancedBehavior.this.mSwipeDirection & 1) != 0 ? view.getWidth() : 0), i, ((SwipeDismissAdvancedBehavior.this.mSwipeDirection & 2) != 0 ? view.getWidth() : 0) + this.mOriginalCapturedViewLeft)
        }

        override fun clampViewPositionVertical(view: View, i: Int, i2: Int): Int {
            if (view.getLeft() != this.mOriginalCapturedViewLeft) {
                return this.mOriginalCapturedViewTop
            }
            return SwipeDismissAdvancedBehavior.clamp(this.mOriginalCapturedViewTop - ((SwipeDismissAdvancedBehavior.this.mSwipeDirection & 4) != 0 ? view.getHeight() : 0), i, ((SwipeDismissAdvancedBehavior.this.mSwipeDirection & 8) != 0 ? view.getHeight() : 0) + this.mOriginalCapturedViewTop)
        }

        override fun getViewHorizontalDragRange(view: View): Int {
            if ((SwipeDismissAdvancedBehavior.this.mSwipeDirection & 3) != 0) {
                return view.getWidth()
            }
            return 0
        }

        override fun getViewVerticalDragRange(view: View): Int {
            if ((SwipeDismissAdvancedBehavior.this.mSwipeDirection & 12) != 0) {
                return view.getWidth()
            }
            return 0
        }

        override fun onViewCaptured(view: View, i: Int) {
            this.mOriginalCapturedViewLeft = view.getLeft()
            this.mOriginalCapturedViewTop = view.getTop()
        }

        override fun onViewDragStateChanged(i: Int) {
            internal fun if(null: SwipeDismissAdvancedBehavior.this.mListener !=):  {
                SwipeDismissAdvancedBehavior.this.mListener.onDragStateChanged(i)
            }
        }

        override fun onViewPositionChanged(view: View, i: Int, i2: Int, i3: Int, i4: Int) {
            int abs = (SwipeDismissAdvancedBehavior.this.mSwipeDirection & 3) != 0 ? Math.abs(i - this.mOriginalCapturedViewLeft) : 0
            int abs2 = (SwipeDismissAdvancedBehavior.this.mSwipeDirection & 12) != 0 ? Math.abs(i2 - this.mOriginalCapturedViewTop) : 0
            internal fun if(0: abs == 0 && abs2 ==):  {
                ViewCompat.setAlpha(view, 1.0f)
            } else {
                ViewCompat.setAlpha(view, 1.0f - Math.max(SwipeDismissAdvancedBehavior.clamp(0.0f, SwipeDismissAdvancedBehavior.fraction(view.getWidth() * SwipeDismissAdvancedBehavior.this.mAlphaStartSwipeDistance, view.getWidth() * SwipeDismissAdvancedBehavior.this.mAlphaEndSwipeDistance, abs), 1.0f), SwipeDismissAdvancedBehavior.clamp(0.0f, SwipeDismissAdvancedBehavior.fraction(view.getHeight() * SwipeDismissAdvancedBehavior.this.mAlphaStartSwipeDistance, view.getHeight() * SwipeDismissAdvancedBehavior.this.mAlphaEndSwipeDistance, abs2), 1.0f)))
            }
        }

        override fun onViewReleased(view: View, f: Float, f2: Float) {
            int left2
            int top2
            boolean z
            int width = view.getWidth()
            int height = view.getHeight()
            int left = view.getLeft()
            int top = view.getTop()
            if (shouldDismiss(view, f, f2)) {
                float scaledMinimumFlingVelocity = ViewConfiguration.get(view.getContext()).getScaledMinimumFlingVelocity()
                if (f < (-scaledMinimumFlingVelocity) && (SwipeDismissAdvancedBehavior.this.mSwipeDirection & 1) != 0) {
                    left = this.mOriginalCapturedViewLeft - width
                } else if (f > scaledMinimumFlingVelocity && (SwipeDismissAdvancedBehavior.this.mSwipeDirection & 2) != 0) {
                    left = this.mOriginalCapturedViewLeft + width
                } else if (f2 < (-scaledMinimumFlingVelocity) && (SwipeDismissAdvancedBehavior.this.mSwipeDirection & 4) != 0) {
                    top = this.mOriginalCapturedViewTop - height
                } else if (f2 > scaledMinimumFlingVelocity && (SwipeDismissAdvancedBehavior.this.mSwipeDirection & 8) != 0) {
                    top = this.mOriginalCapturedViewTop + height
                }
                left2 = left
                top2 = top
                z = true
            } else {
                left2 = this.mOriginalCapturedViewLeft
                top2 = this.mOriginalCapturedViewTop
                z = false
            }
            if (SwipeDismissAdvancedBehavior.this.mViewDragHelper.settleCapturedViewAt(left2, top2)) {
                ViewCompat.postOnAnimation(view, SettleRunnable(view, z))
            } else {
                internal fun if(null: !z || SwipeDismissAdvancedBehavior.this.mListener ==):  {
                    return
                }
                SwipeDismissAdvancedBehavior.this.mListener.onDismiss(view)
            }
        }

        override fun tryCaptureView(view: View, i: Int): Boolean {
            return SwipeDismissAdvancedBehavior.this.canSwipeDismissView(view)
        }
    }

    interface OnDismissListener {
        fun onDismiss(view: View)

        fun onDragStateChanged(i: Int)
    }

    private class SettleRunnable : Runnable {
        private boolean mDismiss
        private View mView

        internal constructor(view: View, mDismiss: Boolean) {
            this.mView = view
            this.mDismiss = mDismiss
        }

        override fun run() {
            if (SwipeDismissAdvancedBehavior.this.mViewDragHelper != null && SwipeDismissAdvancedBehavior.this.mViewDragHelper.continueSettling(true)) {
                ViewCompat.postOnAnimation(this.mView, this)
            } else {
                internal fun if(null: !this.mDismiss || SwipeDismissAdvancedBehavior.this.mListener ==):  {
                    return
                }
                SwipeDismissAdvancedBehavior.this.mListener.onDismiss(this.mView)
            }
        }
    }

    @Retention(RetentionPolicy.SOURCE)
    private @interface SwipeDirection {
    }

    @JvmStatic
    fun clamp(f: Float, f2: Float, f3: Float): Float {
        return Math.min(Math.max(f, f2), f3)
    }

    @JvmStatic
    fun clamp(i: Int, i2: Int, i3: Int): Int {
        return Math.min(Math.max(i, i2), i3)
    }

    private fun ensureViewDragHelper(viewGroup: ViewGroup) {
        internal fun if(null: this.mViewDragHelper ==):  {
            this.mViewDragHelper = this.mSensitivitySet ? ViewDragHelper.create(viewGroup, this.mSensitivity, this.mDragCallback) : ViewDragHelper.create(viewGroup, this.mDragCallback)
        }
    }

    @JvmStatic
    internal fun fraction(f: Float, f2: Float, f3: Float): Float {
        return (f3 - f) / (f2 - f)
    }

    open fun canSwipeDismissView(view: View): Boolean {
        return true
    }

    open fun getDragState(): Int {
        internal fun if(null: this.mViewDragHelper !=):  {
            return this.mViewDragHelper.getViewDragState()
        }
        return 0
    }

    override fun onInterceptTouchEvent(coordinatorLayout: CoordinatorLayout, v: V, motionEvent: MotionEvent): Boolean {
        when (MotionEventCompat.getActionMasked(motionEvent)) {
            1 -> {
            3 -> {
                internal fun if(this.mIgnoreEvents):  {
                    this.mIgnoreEvents = false
                    return false
                }
                }
            2 -> {
            else -> {
                this.mIgnoreEvents = !coordinatorLayout.isPointInChildBounds(v, (int) motionEvent.getX(), (int) motionEvent.getY())
                }
        }
        internal fun if(this.mIgnoreEvents):  {
            return false
        }
        ensureViewDragHelper(coordinatorLayout)
        return this.mViewDragHelper.shouldInterceptTouchEvent(motionEvent)
    }

    override fun onTouchEvent(coordinatorLayout: CoordinatorLayout, v: V, motionEvent: MotionEvent): Boolean {
        internal fun if(null: this.mViewDragHelper ==):  {
            return false
        }
        this.mViewDragHelper.processTouchEvent(motionEvent)
        return true
    }

    open fun setDragDismissDistance(dragDismissDistance: Float) {
        this.mDragDismissThreshold = clamp(0.0f, dragDismissDistance, 1.0f)
    }

    open fun setEndAlphaSwipeDistance(endAlphaSwipeDistance: Float) {
        this.mAlphaEndSwipeDistance = clamp(0.0f, endAlphaSwipeDistance, 1.0f)
    }

    open fun setListener(onDismissListener: OnDismissListener) {
        this.mListener = onDismissListener
    }

    open fun setSensitivity(mSensitivity: Float) {
        this.mSensitivity = mSensitivity
        this.mSensitivitySet = true
    }

    open fun setStartAlphaSwipeDistance(startAlphaSwipeDistance: Float) {
        this.mAlphaStartSwipeDistance = clamp(0.0f, startAlphaSwipeDistance, 1.0f)
    }

    open fun setSwipeDirection(mSwipeDirection: Int) {
        this.mSwipeDirection = mSwipeDirection
    }
}
