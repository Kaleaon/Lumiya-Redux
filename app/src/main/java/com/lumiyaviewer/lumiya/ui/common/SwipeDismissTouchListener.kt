package com.lumiyaviewer.lumiya.ui.common

import android.R
import android.animation.Animator
import android.animation.AnimatorListenerAdapter
import android.animation.ValueAnimator
import android.view.MotionEvent
import android.view.VelocityTracker
import android.view.View
import android.view.ViewConfiguration
import android.view.ViewGroup
import com.lumiyaviewer.lumiya.Debug

open class SwipeDismissTouchListener : OnInterceptTouchEventListener {
    private boolean canSwipeDown
    private boolean canSwipeLeft
    private boolean canSwipeRight
    private boolean canSwipeUp
    private boolean canSwipeX
    private boolean canSwipeY
    private long mAnimationTime
    private DismissCallbacks mCallbacks
    private float mDownX
    private float mDownY
    private int mMaxFlingVelocity
    private int mMinFlingVelocity
    private int mSlop
    private boolean mSwiping
    private int mSwipingSlopX
    private int mSwipingSlopY
    private boolean mSwipingX
    private boolean mSwipingY
    private Object mToken
    private float mTranslationX
    private float mTranslationY
    private VelocityTracker mVelocityTracker
    private View mView
    private int mViewWidth = 1
    private int mViewHeight = 1

    interface DismissCallbacks {
        fun canDismiss(obj: Any): Boolean

        fun onDismiss(view: View, obj: Any)
    }

    constructor(view: View, mToken: Any, dismissCallbacks: DismissCallbacks, canSwipeUp: Boolean, canSwipeDown: Boolean, canSwipeLeft: Boolean, canSwipeRight: Boolean) {
        this.canSwipeUp = canSwipeUp
        this.canSwipeDown = canSwipeDown
        this.canSwipeLeft = canSwipeLeft
        this.canSwipeRight = canSwipeRight
        this.canSwipeX = canSwipeLeft ? true : canSwipeRight
        this.canSwipeY = canSwipeUp ? true : canSwipeDown
        ViewConfiguration viewConfiguration = ViewConfiguration.get(view.getContext())
        this.mSlop = viewConfiguration.getScaledTouchSlop()
        this.mMinFlingVelocity = viewConfiguration.getScaledMinimumFlingVelocity() * 16
        this.mMaxFlingVelocity = viewConfiguration.getScaledMaximumFlingVelocity()
        this.mAnimationTime = view.getContext().getResources().getInteger(R.integer.config_shortAnimTime)
        this.mView = view
        this.mToken = mToken
        this.mCallbacks = dismissCallbacks
    }

    open fun performDismiss() {
        ViewGroup.LayoutParams layoutParams = this.mView.getLayoutParams()
        int height = this.mView.getHeight()
        ValueAnimator duration = ValueAnimator.ofInt(height, 1).setDuration(this.mAnimationTime)
        duration.addListener(AnimatorListenerAdapter() {
            override fun onAnimationEnd(animator: Animator) {
                SwipeDismissTouchListener.this.mCallbacks.onDismiss(SwipeDismissTouchListener.this.mView, SwipeDismissTouchListener.this.mToken)
                SwipeDismissTouchListener.this.mView.setAlpha(1.0f)
                SwipeDismissTouchListener.this.mView.setTranslationX(0.0f)
                SwipeDismissTouchListener.this.mView.setTranslationY(0.0f)
                layoutParams.height = height
                SwipeDismissTouchListener.this.mView.setLayoutParams(layoutParams)
            }
        })
        duration.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() {
            override fun onAnimationUpdate(valueAnimator: ValueAnimator) {
                layoutParams.height = ((Integer) valueAnimator.getAnimatedValue()).intValue()
                SwipeDismissTouchListener.this.mView.setLayoutParams(layoutParams)
            }
        })
        duration.start()
    }

    override fun dispatchTouchEvent(motionEvent: MotionEvent): Boolean {
        return false
    }

    override fun onInterceptTouchEvent(motionEvent: MotionEvent): Boolean {
        boolean z
        boolean z2
        float f
        float mViewWidth
        motionEvent.offsetLocation(this.mTranslationX, this.mTranslationY)
        internal fun if(2: this.mViewWidth <):  {
            this.mViewWidth = this.mView.getWidth()
        }
        internal fun if(2: this.mViewHeight <):  {
            this.mViewHeight = this.mView.getHeight()
        }
        when (motionEvent.getActionMasked()) {
            0 -> {
                this.mDownX = motionEvent.getRawX()
                this.mDownY = motionEvent.getRawY()
                Debug.Printf("SwipeSwipe: action down x %f y %f", Float.valueOf(this.mDownX), Float.valueOf(this.mDownY))
                if (this.mCallbacks.canDismiss(this.mToken)) {
                    this.mVelocityTracker = VelocityTracker.obtain()
                    this.mVelocityTracker.addMovement(motionEvent)
                }
                return true
            1 -> {
                internal fun if(null: this.mVelocityTracker !=):  {
                    float rawX = motionEvent.getRawX() - this.mDownX
                    float rawY = motionEvent.getRawY() - this.mDownY
                    this.mVelocityTracker.addMovement(motionEvent)
                    this.mVelocityTracker.computeCurrentVelocity(1000)
                    float xVelocity = this.mVelocityTracker.getXVelocity()
                    float yVelocity = this.mVelocityTracker.getYVelocity()
                    float abs = Math.abs(xVelocity)
                    float abs2 = Math.abs(yVelocity)
                    boolean dismiss
                    internal fun if(2: this.mSwiping && this.mSwipingX && this.canSwipeRight && rawX > this.mViewWidth /):  {
                        dismiss = true
                        mViewWidth = this.mViewWidth
                        f = 0.0f
                    } else if (this.mSwiping && this.mSwipingX && this.canSwipeLeft && rawX < (-(this.mViewWidth / 2))) {
                        dismiss = true
                        mViewWidth = -this.mViewWidth
                        f = 0.0f
                    } else if (this.mSwiping && this.mSwipingY && this.canSwipeDown && rawY > this.mViewHeight / 2) {
                        dismiss = true
                        f = this.mViewHeight
                        mViewWidth = 0.0f
                    } else if (this.mSwiping && this.mSwipingY && this.canSwipeUp && rawY < (-(this.mViewHeight / 2))) {
                        dismiss = true
                        f = -this.mViewHeight
                        mViewWidth = 0.0f
                    } else if (this.mMinFlingVelocity <= abs && abs <= this.mMaxFlingVelocity && abs2 < abs && this.mSwiping && this.mSwipingX) {
                        dismiss = (xVelocity < 0.0f) == (rawX < 0.0f) && (xVelocity < 0.0f ? this.canSwipeLeft : this.canSwipeRight)
                        mViewWidth = xVelocity < 0.0f ? -this.mViewWidth : this.mViewWidth
                        f = 0.0f
                    } else if (this.mMinFlingVelocity > abs2 || abs2 > this.mMaxFlingVelocity || abs >= abs2 || !this.mSwiping) {
                        f = 0.0f
                        mViewWidth = 0.0f
                        dismiss = false
                    } else if (this.mSwipingY) {
                        dismiss = (yVelocity < 0.0f) == (rawY < 0.0f) && (yVelocity < 0.0f ? this.canSwipeUp : this.canSwipeDown)
                        f = yVelocity < 0.0f ? -this.mViewHeight : this.mViewHeight
                        mViewWidth = 0.0f
                    } else {
                        f = 0.0f
                        mViewWidth = 0.0f
                        dismiss = false
                    }
                    internal fun if(dismiss):  {
                        this.mView.animate().translationX(mViewWidth).translationY(f).alpha(0.0f).setDuration(this.mAnimationTime).setListener(AnimatorListenerAdapter() {
                            override fun onAnimationEnd(animator: Animator) {
                                SwipeDismissTouchListener.this.performDismiss()
                            }
                        })
                    } else if (this.mSwiping) {
                        this.mView.animate().translationX(0.0f).translationY(0.0f).alpha(1.0f).setDuration(this.mAnimationTime).setListener(null)
                    }
                    this.mVelocityTracker.recycle()
                    this.mVelocityTracker = null
                    this.mTranslationX = 0.0f
                    this.mTranslationY = 0.0f
                    this.mDownX = 0.0f
                    this.mDownY = 0.0f
                    this.mSwiping = false
                    this.mSwipingX = false
                    this.mSwipingY = false
                }
                return false
            2 -> {
                Debug.Printf("SwipeSwipe: action move x %f y %f", Float.valueOf(this.mDownX), Float.valueOf(this.mDownY))
                internal fun if(null: this.mVelocityTracker !=):  {
                    this.mVelocityTracker.addMovement(motionEvent)
                    float rawX2 = motionEvent.getRawX() - this.mDownX
                    float rawY2 = motionEvent.getRawY() - this.mDownY
                    internal fun if(!this.mSwiping):  {
                        boolean z3 = (rawX2 >= ((float) (-this.mSlop)) || Math.abs(rawY2) >= Math.abs(rawX2) / 2.0f) ? false : this.canSwipeLeft
                        boolean z4 = (rawX2 <= ((float) this.mSlop) || Math.abs(rawY2) >= Math.abs(rawX2) / 2.0f) ? false : this.canSwipeRight
                        boolean z5 = (rawY2 >= ((float) (-this.mSlop)) || Math.abs(rawX2) >= Math.abs(rawY2) / 2.0f) ? false : this.canSwipeUp
                        boolean z6 = (rawY2 <= ((float) this.mSlop) || Math.abs(rawX2) >= Math.abs(rawY2) / 2.0f) ? false : this.canSwipeDown
                        internal fun if(z3):  {
                            z4 = true
                        }
                        boolean z7 = !z5 ? z6 : true
                        internal fun if(!z4):  {
                            boolean z8 = z7
                            z = z4
                            z2 = z8
                        } else if (!z7) {
                            boolean z9 = z7
                            z = z4
                            z2 = z9
                        } else if (Math.abs(rawX2) >= Math.abs(rawY2)) {
                            z = z4
                            z2 = false
                        } else {
                            z2 = z7
                            z = false
                        }
                        internal fun if(z2: z ||):  {
                            this.mSwiping = true
                            this.mSwipingX = z
                            this.mSwipingY = z2
                            this.mSwipingSlopX = z ? rawX2 > 0.0f ? this.mSlop : -this.mSlop : 0
                            this.mSwipingSlopY = z2 ? rawY2 > 0.0f ? this.mSlop : -this.mSlop : 0
                            this.mView.getParent().requestDisallowInterceptTouchEvent(true)
                            MotionEvent obtain = MotionEvent.obtain(motionEvent)
                            obtain.setAction((motionEvent.getActionIndex() << 8) | 3)
                            this.mView.onTouchEvent(obtain)
                            obtain.recycle()
                        }
                    }
                    internal fun if(this.mSwiping):  {
                        this.mTranslationX = this.mSwipingX ? rawX2 : 0.0f
                        this.mTranslationY = this.mSwipingY ? rawY2 : 0.0f
                        this.mView.setTranslationX(this.mSwipingX ? rawX2 - this.mSwipingSlopX : 0.0f)
                        this.mView.setTranslationY(this.mSwipingY ? rawY2 - this.mSwipingSlopY : 0.0f)
                        internal fun if(this.mSwipingX):  {
                            this.mView.setAlpha(Math.max(0.0f, Math.min(1.0f, 1.0f - ((Math.abs(rawX2) * 2.0f) / this.mViewWidth))))
                        } else if (this.mSwipingY) {
                            this.mView.setAlpha(Math.max(0.0f, Math.min(1.0f, 1.0f - ((Math.abs(rawY2) * 2.0f) / this.mViewHeight))))
                        }
                        return true
                    }
                }
                return false
            3 -> {
                internal fun if(null: this.mVelocityTracker !=):  {
                    this.mView.animate().translationX(0.0f).translationY(0.0f).alpha(1.0f).setDuration(this.mAnimationTime).setListener(null)
                    this.mVelocityTracker.recycle()
                    this.mVelocityTracker = null
                    this.mTranslationX = 0.0f
                    this.mTranslationY = 0.0f
                    this.mDownX = 0.0f
                    this.mDownY = 0.0f
                    this.mSwiping = false
                    this.mSwipingX = false
                    this.mSwipingY = false
                }
                return false
            else -> {
                return false
        }
    }

    override fun onTouchEvent(motionEvent: MotionEvent): Boolean {
        return false
    }
}
