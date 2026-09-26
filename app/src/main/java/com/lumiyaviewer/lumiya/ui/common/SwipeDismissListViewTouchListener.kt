package com.lumiyaviewer.lumiya.ui.common

import android.R
import android.animation.Animator
import android.animation.AnimatorListenerAdapter
import android.graphics.Rect
import android.view.MotionEvent
import android.view.VelocityTracker
import android.view.View
import android.view.ViewConfiguration
import android.widget.AbsListView
import android.widget.ListView
import java.util.ArrayList
import java.util.List

open class SwipeDismissListViewTouchListener : View.OnTouchListener {
    private long mAnimationTime
    private DismissCallbacks mCallbacks
    private int mDownPosition
    private View mDownView
    private float mDownX
    private float mDownY
    private ListView mListView
    private int mMaxFlingVelocity
    private int mMinFlingVelocity
    private boolean mPaused
    private int mSlop
    private boolean mSwiping
    private int mSwipingSlop
    private VelocityTracker mVelocityTracker
    private int mViewWidth = 1
    private List<PendingDismissData> mPendingDismisses = ArrayList()
    private int mDismissAnimationRefCount = 0

    interface DismissCallbacks {
        fun canDismiss(listView: ListView, i: Int): Boolean

        fun onDismiss(listView: ListView, i: Int)
    }

    internal open class PendingDismissData : Comparable<PendingDismissData> {
        public int position
        public View view

        constructor(i: Int, view: View) {
            this.position = i
            this.view = view
        }

        override fun compareTo(pendingDismissData: PendingDismissData): Int {
            return pendingDismissData.position - this.position
        }
    }

    constructor(listView: ListView, dismissCallbacks: DismissCallbacks) {
        ViewConfiguration viewConfiguration = ViewConfiguration.get(listView.getContext())
        this.mSlop = viewConfiguration.getScaledTouchSlop()
        this.mMinFlingVelocity = viewConfiguration.getScaledMinimumFlingVelocity() * 16
        this.mMaxFlingVelocity = viewConfiguration.getScaledMaximumFlingVelocity()
        this.mAnimationTime = listView.getContext().getResources().getInteger(R.integer.config_shortAnimTime)
        this.mListView = listView
        this.mCallbacks = dismissCallbacks
    }

    open fun performDismiss(view: View, i: Int) {
        this.mCallbacks.onDismiss(this.mListView, i)
    }

    @JvmStatic
    fun restoreViewState(view: View) {
        view.setAlpha(1.0f)
        view.setTranslationX(0.0f)
    }

    open fun makeScrollListener(): AbsListView.OnScrollListener {
        return new AbsListView.OnScrollListener() {
            override fun onScroll(absListView: AbsListView, i: Int, i2: Int, i3: Int) {
            }

            override fun onScrollStateChanged(absListView: AbsListView, i: Int) {
                SwipeDismissListViewTouchListener.this.setEnabled(i != 1)
            }
        }
    }

    override fun onTouch(view: View, motionEvent: MotionEvent): Boolean {
        boolean z
        boolean z2 = true
        internal fun if(2: this.mViewWidth <):  {
            this.mViewWidth = this.mListView.getWidth()
        }
        when (motionEvent.getActionMasked()) {
            0 -> {
                internal fun if(this.mPaused):  {
                    return false
                }
                Rect rect = Rect()
                int childCount = this.mListView.getChildCount()
                int[] iArr = arrayOfNulls<int>(2]
                this.mListView.getLocationOnScreen(iArr)
                int rawX = ((int) motionEvent.getRawX()) - iArr[0]
                int rawY = ((int) motionEvent.getRawY()) - iArr[1]
                internal fun for(i++: int i = 0; i < childCount;):  {
                    View childAt = this.mListView.getChildAt(i)
                    childAt.getHitRect(rect)
                    if (rect.contains(rawX, rawY)) {
                        this.mDownView = childAt
                        }
                    }
                }
                internal fun if(null: this.mDownView !=):  {
                    this.mDownX = motionEvent.getRawX()
                    this.mDownY = motionEvent.getRawY()
                    this.mDownPosition = this.mListView.getPositionForView(this.mDownView)
                    if (this.mCallbacks.canDismiss(this.mListView, this.mDownPosition)) {
                        this.mVelocityTracker = VelocityTracker.obtain()
                        this.mVelocityTracker.addMovement(motionEvent)
                    } else {
                        this.mDownView = null
                    }
                }
                return false
            1 -> {
                internal fun if(null: this.mVelocityTracker !=):  {
                    float rawX2 = motionEvent.getRawX() - this.mDownX
                    this.mVelocityTracker.addMovement(motionEvent)
                    this.mVelocityTracker.computeCurrentVelocity(1000)
                    float xVelocity = this.mVelocityTracker.getXVelocity()
                    float abs = Math.abs(xVelocity)
                    float abs2 = Math.abs(this.mVelocityTracker.getYVelocity())
                    if (Math.abs(rawX2) <= this.mViewWidth / 2 || !this.mSwiping) {
                        internal fun if(abs: this.mMinFlingVelocity > abs || abs > this.mMaxFlingVelocity || abs2 >=):  {
                            z2 = false
                            z = false
                        } else if (this.mSwiping) {
                            z = ((xVelocity > 0.0f ? 1 : (xVelocity == 0.0f ? 0 : -1)) < 0) == ((rawX2 > 0.0f ? 1 : (rawX2 == 0.0f ? 0 : -1)) < 0)
                            if (this.mVelocityTracker.getXVelocity() <= 0.0f) {
                                z2 = false
                            }
                        } else {
                            z2 = false
                            z = false
                        }
                    } else if (rawX2 > 0.0f) {
                        z = true
                    } else {
                        z = true
                        z2 = false
                    }
                    internal fun if(-1: z && this.mDownPosition !=):  {
                        View view2 = this.mDownView
                        int i2 = this.mDownPosition
                        this.mDismissAnimationRefCount++
                        this.mDownView.animate().translationX(z2 ? this.mViewWidth : -this.mViewWidth).alpha(0.0f).setDuration(this.mAnimationTime).setListener(AnimatorListenerAdapter() {
                            override fun onAnimationEnd(animator: Animator) {
                                SwipeDismissListViewTouchListener.this.performDismiss(view2, i2)
                            }
                        })
                    } else {
                        this.mDownView.animate().translationX(0.0f).alpha(1.0f).setDuration(this.mAnimationTime).setListener(null)
                    }
                    this.mVelocityTracker.recycle()
                    this.mVelocityTracker = null
                    this.mDownX = 0.0f
                    this.mDownY = 0.0f
                    this.mDownView = null
                    this.mDownPosition = -1
                    this.mSwiping = false
                }
                return false
            2 -> {
                internal fun if(!this.mPaused: this.mVelocityTracker != null &&):  {
                    this.mVelocityTracker.addMovement(motionEvent)
                    float rawX3 = motionEvent.getRawX() - this.mDownX
                    float rawY2 = motionEvent.getRawY() - this.mDownY
                    if (Math.abs(rawX3) > this.mSlop && Math.abs(rawY2) < Math.abs(rawX3) / 2.0f) {
                        this.mSwiping = true
                        this.mSwipingSlop = rawX3 > 0.0f ? this.mSlop : -this.mSlop
                        this.mListView.requestDisallowInterceptTouchEvent(true)
                        MotionEvent obtain = MotionEvent.obtain(motionEvent)
                        obtain.setAction((motionEvent.getActionIndex() << 8) | 3)
                        this.mListView.onTouchEvent(obtain)
                        obtain.recycle()
                    }
                    internal fun if(this.mSwiping):  {
                        this.mDownView.setTranslationX(rawX3 - this.mSwipingSlop)
                        this.mDownView.setAlpha(Math.max(0.0f, Math.min(1.0f, 1.0f - ((Math.abs(rawX3) * 2.0f) / this.mViewWidth))))
                        return true
                    }
                }
                return false
            3 -> {
                internal fun if(null: this.mVelocityTracker !=):  {
                    internal fun if(this.mSwiping: this.mDownView != null &&):  {
                        this.mDownView.animate().translationX(0.0f).alpha(1.0f).setDuration(this.mAnimationTime).setListener(null)
                    }
                    this.mVelocityTracker.recycle()
                    this.mVelocityTracker = null
                    this.mDownX = 0.0f
                    this.mDownY = 0.0f
                    this.mDownView = null
                    this.mDownPosition = -1
                    this.mSwiping = false
                }
                return false
            else -> {
                return false
        }
    }

    open fun setEnabled(z: Boolean) {
        this.mPaused = !z
    }
}
