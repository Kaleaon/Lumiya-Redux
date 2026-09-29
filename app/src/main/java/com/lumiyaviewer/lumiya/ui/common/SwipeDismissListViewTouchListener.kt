package com.lumiyaviewer.lumiya.ui.common

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

class SwipeDismissListViewTouchListener(private val mListView: ListView, private val mCallbacks: DismissCallbacks) : View.OnTouchListener {
    private val mAnimationTime: Long =
        mListView.context.resources.getInteger(android.R.integer.config_shortAnimTime).toLong()
    private var mDownPosition: Int = 0
    private var mDownView: View? = null
    private var mDownX: Float = 0f
    private var mDownY: Float = 0f
    private val mMaxFlingVelocity: Int
    private val mMinFlingVelocity: Int
    private var mPaused = false
    private val mSlop: Int
    private var mSwiping = false
    private var mSwipingSlop: Int = 0
    private var mVelocityTracker: VelocityTracker? = null
    private var mViewWidth = 1
    private val mPendingDismisses: MutableList<PendingDismissData> = ArrayList()
    private var mDismissAnimationRefCount = 0

    interface DismissCallbacks {
        fun canDismiss(listView: ListView, i: Int): Boolean

        fun onDismiss(listView: ListView, i: Int)
    }

    inner class PendingDismissData(var position: Int, var view: View) : Comparable<PendingDismissData> {
        override fun compareTo(other: PendingDismissData): Int {
            return other.position - this.position
        }
    }

    init {
        val viewConfiguration = ViewConfiguration.get(mListView.context)
        mSlop = viewConfiguration.scaledTouchSlop
        mMinFlingVelocity = viewConfiguration.scaledMinimumFlingVelocity * 16
        mMaxFlingVelocity = viewConfiguration.scaledMaximumFlingVelocity
    }

    fun performDismiss(view: View?, i: Int) {
        mCallbacks.onDismiss(mListView, i)
    }

    fun makeScrollListener(): AbsListView.OnScrollListener {
        return object : AbsListView.OnScrollListener {
            override fun onScroll(absListView: AbsListView?, i: Int, i2: Int, i3: Int) {
            }

            override fun onScrollStateChanged(absListView: AbsListView?, i: Int) {
                setEnabled(i != 1)
            }
        }
    }

    override fun onTouch(view: View, motionEvent: MotionEvent): Boolean {
        var z: Boolean
        var z2 = true
        if (mViewWidth < 2) {
            mViewWidth = mListView.width
        }
        when (motionEvent.actionMasked) {
            0 -> {
                if (mPaused) {
                    return false
                }
                val rect = Rect()
                val childCount = mListView.childCount
                val iArr = IntArray(2)
                mListView.getLocationOnScreen(iArr)
                val rawX = motionEvent.rawX.toInt() - iArr[0]
                val rawY = motionEvent.rawY.toInt() - iArr[1]
                for (i in 0 until childCount) {
                    val childAt = mListView.getChildAt(i)
                    childAt.getHitRect(rect)
                    if (rect.contains(rawX, rawY)) {
                        mDownView = childAt
                        break
                    }
                }
                val downView = mDownView
                if (downView != null) {
                    mDownX = motionEvent.rawX
                    mDownY = motionEvent.rawY
                    mDownPosition = mListView.getPositionForView(downView)
                    if (mCallbacks.canDismiss(mListView, mDownPosition)) {
                        val tracker = VelocityTracker.obtain()
                        mVelocityTracker = tracker
                        tracker.addMovement(motionEvent)
                    } else {
                        mDownView = null
                    }
                }
                return false
            }
            1 -> {
                val velocityTracker = mVelocityTracker
                if (velocityTracker != null) {
                    val rawX2 = motionEvent.rawX - mDownX
                    velocityTracker.addMovement(motionEvent)
                    velocityTracker.computeCurrentVelocity(1000)
                    val xVelocity = velocityTracker.xVelocity
                    val abs = Math.abs(xVelocity)
                    val abs2 = Math.abs(velocityTracker.yVelocity)
                    if (Math.abs(rawX2) <= mViewWidth / 2 || !mSwiping) {
                        if (mMinFlingVelocity > abs || abs > mMaxFlingVelocity || abs2 >= abs) {
                            z2 = false
                            z = false
                        } else if (mSwiping) {
                            z = (xVelocity < 0.0f) == (rawX2 < 0.0f)
                            if (velocityTracker.xVelocity <= 0.0f) {
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
                    val downView = mDownView
                    if (z && mDownPosition != -1 && downView != null) {
                        val view2 = downView
                        val i2 = mDownPosition
                        mDismissAnimationRefCount++
                        downView.animate().translationX((if (z2) mViewWidth else -mViewWidth).toFloat()).alpha(0.0f)
                            .setDuration(mAnimationTime).setListener(object : AnimatorListenerAdapter() {
                                override fun onAnimationEnd(animator: Animator) {
                                    performDismiss(view2, i2)
                                }
                            })
                    } else {
                        downView?.animate()?.translationX(0.0f)?.alpha(1.0f)?.setDuration(mAnimationTime)?.setListener(null)
                    }
                    velocityTracker.recycle()
                    mVelocityTracker = null
                    mDownX = 0.0f
                    mDownY = 0.0f
                    mDownView = null
                    mDownPosition = -1
                    mSwiping = false
                }
                return false
            }
            2 -> {
                val velocityTracker = mVelocityTracker
                if (velocityTracker != null && !mPaused) {
                    velocityTracker.addMovement(motionEvent)
                    val rawX3 = motionEvent.rawX - mDownX
                    val rawY2 = motionEvent.rawY - mDownY
                    if (Math.abs(rawX3) > mSlop && Math.abs(rawY2) < Math.abs(rawX3) / 2.0f) {
                        mSwiping = true
                        mSwipingSlop = if (rawX3 > 0.0f) mSlop else -mSlop
                        mListView.requestDisallowInterceptTouchEvent(true)
                        val obtain = MotionEvent.obtain(motionEvent)
                        obtain.action = (motionEvent.actionIndex shl 8) or 3
                        mListView.onTouchEvent(obtain)
                        obtain.recycle()
                    }
                    if (mSwiping) {
                        mDownView?.translationX = rawX3 - mSwipingSlop
                        mDownView?.alpha = Math.max(0.0f, Math.min(1.0f, 1.0f - ((Math.abs(rawX3) * 2.0f) / mViewWidth)))
                        return true
                    }
                }
                return false
            }
            3 -> {
                val velocityTracker = mVelocityTracker
                if (velocityTracker != null) {
                    if (mDownView != null && mSwiping) {
                        mDownView?.animate()?.translationX(0.0f)?.alpha(1.0f)?.setDuration(mAnimationTime)?.setListener(null)
                    }
                    velocityTracker.recycle()
                    mVelocityTracker = null
                    mDownX = 0.0f
                    mDownY = 0.0f
                    mDownView = null
                    mDownPosition = -1
                    mSwiping = false
                }
                return false
            }
            else -> return false
        }
    }

    fun setEnabled(z: Boolean) {
        mPaused = !z
    }

    companion object {
        @JvmStatic
        fun restoreViewState(view: View) {
            view.alpha = 1.0f
            view.translationX = 0.0f
        }
    }
}
