package com.lumiyaviewer.lumiya.ui.common

import android.animation.Animator
import android.animation.AnimatorListenerAdapter
import android.animation.ValueAnimator
import android.view.MotionEvent
import android.view.VelocityTracker
import android.view.View
import android.view.ViewConfiguration
import com.lumiyaviewer.lumiya.Debug

class SwipeDismissTouchListener(
    private val mView: View,
    private val mToken: Any?,
    private val mCallbacks: DismissCallbacks,
    private val canSwipeUp: Boolean,
    private val canSwipeDown: Boolean,
    private val canSwipeLeft: Boolean,
    private val canSwipeRight: Boolean
) : OnInterceptTouchEventListener {
    private val canSwipeX: Boolean = canSwipeLeft || canSwipeRight
    private val canSwipeY: Boolean = canSwipeUp || canSwipeDown
    private val mAnimationTime: Long
    private var mDownX: Float = 0f
    private var mDownY: Float = 0f
    private val mMaxFlingVelocity: Int
    private val mMinFlingVelocity: Int
    private val mSlop: Int
    private var mSwiping = false
    private var mSwipingSlopX: Int = 0
    private var mSwipingSlopY: Int = 0
    private var mSwipingX = false
    private var mSwipingY = false
    private var mTranslationX: Float = 0f
    private var mTranslationY: Float = 0f
    private var mVelocityTracker: VelocityTracker? = null
    private var mViewWidth = 1
    private var mViewHeight = 1

    interface DismissCallbacks {
        fun canDismiss(obj: Any?): Boolean

        fun onDismiss(view: View, obj: Any?)
    }

    init {
        val viewConfiguration = ViewConfiguration.get(mView.context)
        mSlop = viewConfiguration.scaledTouchSlop
        mMinFlingVelocity = viewConfiguration.scaledMinimumFlingVelocity * 16
        mMaxFlingVelocity = viewConfiguration.scaledMaximumFlingVelocity
        mAnimationTime = mView.context.resources.getInteger(android.R.integer.config_shortAnimTime).toLong()
    }

    fun performDismiss() {
        val layoutParams = mView.layoutParams
        val height = mView.height
        val duration = ValueAnimator.ofInt(height, 1).setDuration(mAnimationTime)
        duration.addListener(object : AnimatorListenerAdapter() {
            override fun onAnimationEnd(animator: Animator) {
                mCallbacks.onDismiss(mView, mToken)
                mView.alpha = 1.0f
                mView.translationX = 0.0f
                mView.translationY = 0.0f
                layoutParams.height = height
                mView.layoutParams = layoutParams
            }
        })
        duration.addUpdateListener { valueAnimator ->
            layoutParams.height = valueAnimator.animatedValue as Int
            mView.layoutParams = layoutParams
        }
        duration.start()
    }

    override fun dispatchTouchEvent(event: MotionEvent): Boolean {
        return false
    }

    override fun onInterceptTouchEvent(event: MotionEvent): Boolean {
        event.offsetLocation(mTranslationX, mTranslationY)
        if (mViewWidth < 2) {
            mViewWidth = mView.width
        }
        if (mViewHeight < 2) {
            mViewHeight = mView.height
        }
        when (event.actionMasked) {
            0 -> {
                mDownX = event.rawX
                mDownY = event.rawY
                Debug.Printf("SwipeSwipe: action down x %f y %f", mDownX, mDownY)
                if (mCallbacks.canDismiss(mToken)) {
                    mVelocityTracker = VelocityTracker.obtain()
                    mVelocityTracker?.addMovement(event)
                }
                return true
            }
            1 -> {
                val velocityTracker = mVelocityTracker
                if (velocityTracker != null) {
                    val rawX = event.rawX - mDownX
                    val rawY = event.rawY - mDownY
                    velocityTracker.addMovement(event)
                    velocityTracker.computeCurrentVelocity(1000)
                    val xVelocity = velocityTracker.xVelocity
                    val yVelocity = velocityTracker.yVelocity
                    val abs = Math.abs(xVelocity)
                    val abs2 = Math.abs(yVelocity)
                    val dismiss: Boolean
                    val translateX: Float
                    val translateY: Float
                    if (mSwiping && mSwipingX && canSwipeRight && rawX > mViewWidth / 2) {
                        dismiss = true
                        translateX = mViewWidth.toFloat()
                        translateY = 0.0f
                    } else if (mSwiping && mSwipingX && canSwipeLeft && rawX < (-(mViewWidth / 2))) {
                        dismiss = true
                        translateX = -mViewWidth.toFloat()
                        translateY = 0.0f
                    } else if (mSwiping && mSwipingY && canSwipeDown && rawY > mViewHeight / 2) {
                        dismiss = true
                        translateY = mViewHeight.toFloat()
                        translateX = 0.0f
                    } else if (mSwiping && mSwipingY && canSwipeUp && rawY < (-(mViewHeight / 2))) {
                        dismiss = true
                        translateY = -mViewHeight.toFloat()
                        translateX = 0.0f
                    } else if (mMinFlingVelocity <= abs && abs <= mMaxFlingVelocity && abs2 < abs && mSwiping && mSwipingX) {
                        dismiss = (xVelocity < 0.0f) == (rawX < 0.0f) && (if (xVelocity < 0.0f) canSwipeLeft else canSwipeRight)
                        translateX = if (xVelocity < 0.0f) -mViewWidth.toFloat() else mViewWidth.toFloat()
                        translateY = 0.0f
                    } else if (mMinFlingVelocity > abs2 || abs2 > mMaxFlingVelocity || abs >= abs2 || !mSwiping) {
                        translateY = 0.0f
                        translateX = 0.0f
                        dismiss = false
                    } else if (mSwipingY) {
                        dismiss = (yVelocity < 0.0f) == (rawY < 0.0f) && (if (yVelocity < 0.0f) canSwipeUp else canSwipeDown)
                        translateY = if (yVelocity < 0.0f) -mViewHeight.toFloat() else mViewHeight.toFloat()
                        translateX = 0.0f
                    } else {
                        translateY = 0.0f
                        translateX = 0.0f
                        dismiss = false
                    }
                    if (dismiss) {
                        mView.animate().translationX(translateX).translationY(translateY).alpha(0.0f).setDuration(mAnimationTime).setListener(object : AnimatorListenerAdapter() {
                            override fun onAnimationEnd(animator: Animator) {
                                performDismiss()
                            }
                        })
                    } else if (mSwiping) {
                        mView.animate().translationX(0.0f).translationY(0.0f).alpha(1.0f).setDuration(mAnimationTime).setListener(null)
                    }
                    velocityTracker.recycle()
                    mVelocityTracker = null
                    mTranslationX = 0.0f
                    mTranslationY = 0.0f
                    mDownX = 0.0f
                    mDownY = 0.0f
                    mSwiping = false
                    mSwipingX = false
                    mSwipingY = false
                }
                return false
            }
            2 -> {
                Debug.Printf("SwipeSwipe: action move x %f y %f", mDownX, mDownY)
                val velocityTracker = mVelocityTracker
                if (velocityTracker != null) {
                    velocityTracker.addMovement(event)
                    val rawX2 = event.rawX - mDownX
                    val rawY2 = event.rawY - mDownY
                    if (!mSwiping) {
                        val z3 = if (rawX2 >= (-mSlop).toFloat() || Math.abs(rawY2) >= Math.abs(rawX2) / 2.0f) false else canSwipeLeft
                        var z4 = if (rawX2 <= mSlop.toFloat() || Math.abs(rawY2) >= Math.abs(rawX2) / 2.0f) false else canSwipeRight
                        val z5 = if (rawY2 >= (-mSlop).toFloat() || Math.abs(rawX2) >= Math.abs(rawY2) / 2.0f) false else canSwipeUp
                        val z6 = if (rawY2 <= mSlop.toFloat() || Math.abs(rawX2) >= Math.abs(rawY2) / 2.0f) false else canSwipeDown
                        if (z3) {
                            z4 = true
                        }
                        val z7 = if (!z5) z6 else true
                        val z: Boolean
                        val z2: Boolean
                        if (!z4) {
                            z = z4
                            z2 = z7
                        } else if (!z7) {
                            z = z4
                            z2 = z7
                        } else if (Math.abs(rawX2) >= Math.abs(rawY2)) {
                            z = z4
                            z2 = false
                        } else {
                            z2 = z7
                            z = false
                        }
                        if (z || z2) {
                            mSwiping = true
                            mSwipingX = z
                            mSwipingY = z2
                            mSwipingSlopX = if (z) (if (rawX2 > 0.0f) mSlop else -mSlop) else 0
                            mSwipingSlopY = if (z2) (if (rawY2 > 0.0f) mSlop else -mSlop) else 0
                            mView.parent.requestDisallowInterceptTouchEvent(true)
                            val obtain = MotionEvent.obtain(event)
                            obtain.action = (event.actionIndex shl 8) or 3
                            mView.onTouchEvent(obtain)
                            obtain.recycle()
                        }
                    }
                    if (mSwiping) {
                        mTranslationX = if (mSwipingX) rawX2 else 0.0f
                        mTranslationY = if (mSwipingY) rawY2 else 0.0f
                        mView.translationX = if (mSwipingX) rawX2 - mSwipingSlopX else 0.0f
                        mView.translationY = if (mSwipingY) rawY2 - mSwipingSlopY else 0.0f
                        if (mSwipingX) {
                            mView.alpha = Math.max(0.0f, Math.min(1.0f, 1.0f - ((Math.abs(rawX2) * 2.0f) / mViewWidth)))
                        } else if (mSwipingY) {
                            mView.alpha = Math.max(0.0f, Math.min(1.0f, 1.0f - ((Math.abs(rawY2) * 2.0f) / mViewHeight)))
                        }
                        return true
                    }
                }
                return false
            }
            3 -> {
                if (mVelocityTracker != null) {
                    mView.animate().translationX(0.0f).translationY(0.0f).alpha(1.0f).setDuration(mAnimationTime).setListener(null)
                    mVelocityTracker?.recycle()
                    mVelocityTracker = null
                    mTranslationX = 0.0f
                    mTranslationY = 0.0f
                    mDownX = 0.0f
                    mDownY = 0.0f
                    mSwiping = false
                    mSwipingX = false
                    mSwipingY = false
                }
                return false
            }
            else -> return false
        }
    }

    override fun onTouchEvent(event: MotionEvent): Boolean {
        return false
    }
}
