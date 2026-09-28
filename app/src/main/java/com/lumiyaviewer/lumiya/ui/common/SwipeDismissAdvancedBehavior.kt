package com.lumiyaviewer.lumiya.ui.common

import androidx.annotation.NonNull
import androidx.coordinatorlayout.widget.CoordinatorLayout
import androidx.core.view.MotionEventCompat
import androidx.core.view.ViewCompat
import androidx.customview.widget.ViewDragHelper
import android.view.MotionEvent
import android.view.View
import android.view.ViewConfiguration
import android.view.ViewGroup

class SwipeDismissAdvancedBehavior<V : View> : CoordinatorLayout.Behavior<V>() {
    companion object {
        private const val DEFAULT_ALPHA_END_DISTANCE = 1.0f
        private const val DEFAULT_ALPHA_START_DISTANCE = 0.0f
        private const val DEFAULT_DRAG_DISMISS_THRESHOLD = 1.0f
        const val STATE_DRAGGING = 1
        const val STATE_IDLE = 0
        const val STATE_SETTLING = 2
        const val SWIPE_DIRECTION_ANY = 15
        const val SWIPE_DIRECTION_DOWN = 8
        const val SWIPE_DIRECTION_LEFT = 1
        const val SWIPE_DIRECTION_RIGHT = 2
        const val SWIPE_DIRECTION_UP = 4
        const val SWIPE_DIRECTION_X = 3
        const val SWIPE_DIRECTION_Y = 12

        @JvmStatic
        fun clamp(f: Float, f2: Float, f3: Float): Float {
            return Math.min(Math.max(f, f2), f3)
        }

        @JvmStatic
        fun clamp(i: Int, i2: Int, i3: Int): Int {
            return Math.min(Math.max(i, i2), i3)
        }

        @JvmStatic
        fun fraction(f: Float, f2: Float, f3: Float): Float {
            return (f3 - f) / (f2 - f)
        }
    }

    private var mIgnoreEvents = false
    private var mListener: OnDismissListener? = null
    private var mSensitivitySet = false
    private var mViewDragHelper: ViewDragHelper? = null
    private var mSensitivity = 0.0f
    private var mSwipeDirection = 15
    private var mDragDismissThreshold = 1.0f
    private var mAlphaStartSwipeDistance = 0.0f
    private var mAlphaEndSwipeDistance = 1.0f

    private val mDragCallback = object : ViewDragHelper.Callback() {
        private var mOriginalCapturedViewLeft = 0
        private var mOriginalCapturedViewTop = 0

        private fun shouldDismiss(view: View, f: Float, f2: Float): Boolean {
            val scaledMinimumFlingVelocity = ViewConfiguration.get(view.context).scaledMinimumFlingVelocity.toFloat()
            if (f < -scaledMinimumFlingVelocity && (mSwipeDirection and 1) != 0) {
                return true
            }
            if (f > scaledMinimumFlingVelocity && (mSwipeDirection and 2) != 0) {
                return true
            }
            if (f2 < -scaledMinimumFlingVelocity && (mSwipeDirection and 4) != 0) {
                return true
            }
            if (f2 > scaledMinimumFlingVelocity && (mSwipeDirection and 8) != 0) {
                return true
            }
            val left = view.left - mOriginalCapturedViewLeft
            val round = Math.round(view.width * mDragDismissThreshold)
            if (left < -round && (mSwipeDirection and 1) != 0) {
                return true
            }
            if (left > round && (mSwipeDirection and 2) != 0) {
                return true
            }
            val top = view.top - mOriginalCapturedViewTop
            val round2 = Math.round(view.height * mDragDismissThreshold)
            if (top >= -round2 || (mSwipeDirection and 4) == 0) {
                return top > round2 && (mSwipeDirection and 8) != 0
            }
            return true
        }

        override fun clampViewPositionHorizontal(view: View, i: Int, i2: Int): Int {
            if (view.top != mOriginalCapturedViewTop) {
                return mOriginalCapturedViewLeft
            }
            return clamp(
                mOriginalCapturedViewLeft - (if ((mSwipeDirection and 1) != 0) view.width else 0),
                i,
                (if ((mSwipeDirection and 2) != 0) view.width else 0) + mOriginalCapturedViewLeft
            )
        }

        override fun clampViewPositionVertical(view: View, i: Int, i2: Int): Int {
            if (view.left != mOriginalCapturedViewLeft) {
                return mOriginalCapturedViewTop
            }
            return clamp(
                mOriginalCapturedViewTop - (if ((mSwipeDirection and 4) != 0) view.height else 0),
                i,
                (if ((mSwipeDirection and 8) != 0) view.height else 0) + mOriginalCapturedViewTop
            )
        }

        override fun getViewHorizontalDragRange(view: View): Int {
            if ((mSwipeDirection and 3) != 0) {
                return view.width
            }
            return 0
        }

        override fun getViewVerticalDragRange(view: View): Int {
            if ((mSwipeDirection and 12) != 0) {
                return view.width
            }
            return 0
        }

        override fun onViewCaptured(view: View, i: Int) {
            mOriginalCapturedViewLeft = view.left
            mOriginalCapturedViewTop = view.top
        }

        override fun onViewDragStateChanged(i: Int) {
            mListener?.onDragStateChanged(i)
        }

        override fun onViewPositionChanged(view: View, i: Int, i2: Int, i3: Int, i4: Int) {
            val abs = if ((mSwipeDirection and 3) != 0) Math.abs(i - mOriginalCapturedViewLeft) else 0
            val abs2 = if ((mSwipeDirection and 12) != 0) Math.abs(i2 - mOriginalCapturedViewTop) else 0
            if (abs == 0 && abs2 == 0) {
                ViewCompat.setAlpha(view, 1.0f)
            } else {
                ViewCompat.setAlpha(
                    view,
                    1.0f - Math.max(
                        clamp(0.0f, fraction(view.width * mAlphaStartSwipeDistance, view.width * mAlphaEndSwipeDistance, abs.toFloat()), 1.0f),
                        clamp(0.0f, fraction(view.height * mAlphaStartSwipeDistance, view.height * mAlphaEndSwipeDistance, abs2.toFloat()), 1.0f)
                    )
                )
            }
        }

        override fun onViewReleased(view: View, f: Float, f2: Float) {
            val left2: Int
            val top2: Int
            val z: Boolean
            val width = view.width
            val height = view.height
            var left = view.left
            var top = view.top
            if (shouldDismiss(view, f, f2)) {
                val scaledMinimumFlingVelocity = ViewConfiguration.get(view.context).scaledMinimumFlingVelocity.toFloat()
                if (f < -scaledMinimumFlingVelocity && (mSwipeDirection and 1) != 0) {
                    left = mOriginalCapturedViewLeft - width
                } else if (f > scaledMinimumFlingVelocity && (mSwipeDirection and 2) != 0) {
                    left = mOriginalCapturedViewLeft + width
                } else if (f2 < -scaledMinimumFlingVelocity && (mSwipeDirection and 4) != 0) {
                    top = mOriginalCapturedViewTop - height
                } else if (f2 > scaledMinimumFlingVelocity && (mSwipeDirection and 8) != 0) {
                    top = mOriginalCapturedViewTop + height
                }
                left2 = left
                top2 = top
                z = true
            } else {
                left2 = mOriginalCapturedViewLeft
                top2 = mOriginalCapturedViewTop
                z = false
            }
            val viewDragHelper = mViewDragHelper
            if (viewDragHelper != null && viewDragHelper.settleCapturedViewAt(left2, top2)) {
                ViewCompat.postOnAnimation(view, SettleRunnable(view, z))
            } else {
                if (!z || mListener == null) {
                    return
                }
                mListener?.onDismiss(view)
            }
        }

        override fun tryCaptureView(view: View, i: Int): Boolean {
            return canSwipeDismissView(view)
        }
    }

    interface OnDismissListener {
        fun onDismiss(view: View)

        fun onDragStateChanged(i: Int)
    }

    private inner class SettleRunnable(private val mView: View, private val mDismiss: Boolean) : Runnable {
        override fun run() {
            val viewDragHelper = mViewDragHelper
            if (viewDragHelper != null && viewDragHelper.continueSettling(true)) {
                ViewCompat.postOnAnimation(mView, this)
            } else {
                if (!mDismiss || mListener == null) {
                    return
                }
                mListener?.onDismiss(mView)
            }
        }
    }

    private fun ensureViewDragHelper(viewGroup: ViewGroup) {
        if (mViewDragHelper == null) {
            mViewDragHelper = if (mSensitivitySet) ViewDragHelper.create(viewGroup, mSensitivity, mDragCallback) else ViewDragHelper.create(viewGroup, mDragCallback)
        }
    }

    fun canSwipeDismissView(@NonNull view: View): Boolean {
        return true
    }

    fun getDragState(): Int {
        val viewDragHelper = mViewDragHelper
        if (viewDragHelper != null) {
            return viewDragHelper.viewDragState
        }
        return 0
    }

    override fun onInterceptTouchEvent(coordinatorLayout: CoordinatorLayout, v: V, motionEvent: MotionEvent): Boolean {
        when (MotionEventCompat.getActionMasked(motionEvent)) {
            1, 3 -> {
                if (mIgnoreEvents) {
                    mIgnoreEvents = false
                    return false
                }
            }
            else -> {
                mIgnoreEvents = !coordinatorLayout.isPointInChildBounds(v, motionEvent.x.toInt(), motionEvent.y.toInt())
            }
        }
        if (mIgnoreEvents) {
            return false
        }
        ensureViewDragHelper(coordinatorLayout)
        return mViewDragHelper?.shouldInterceptTouchEvent(motionEvent) ?: false
    }

    override fun onTouchEvent(coordinatorLayout: CoordinatorLayout, v: V, motionEvent: MotionEvent): Boolean {
        val viewDragHelper = mViewDragHelper ?: return false
        viewDragHelper.processTouchEvent(motionEvent)
        return true
    }

    fun setDragDismissDistance(dragDismissDistance: Float) {
        mDragDismissThreshold = clamp(0.0f, dragDismissDistance, 1.0f)
    }

    fun setEndAlphaSwipeDistance(endAlphaSwipeDistance: Float) {
        mAlphaEndSwipeDistance = clamp(0.0f, endAlphaSwipeDistance, 1.0f)
    }

    fun setListener(onDismissListener: OnDismissListener?) {
        mListener = onDismissListener
    }

    fun setSensitivity(sensitivity: Float) {
        mSensitivity = sensitivity
        mSensitivitySet = true
    }

    fun setStartAlphaSwipeDistance(startAlphaSwipeDistance: Float) {
        mAlphaStartSwipeDistance = clamp(0.0f, startAlphaSwipeDistance, 1.0f)
    }

    fun setSwipeDirection(swipeDirection: Int) {
        mSwipeDirection = swipeDirection
    }
}
