package com.lumiyaviewer.lumiya.ui.common

import android.animation.ValueAnimator
import android.content.Context
import android.content.res.TypedArray
import android.graphics.Canvas
import android.graphics.Paint
import android.graphics.drawable.GradientDrawable
import android.util.AttributeSet
import android.view.View
import android.view.animation.Interpolator
import androidx.core.content.ContextCompat
import com.lumiyaviewer.lumiya.R

open class ButteryProgressBar : View() {
    private static int BASE_DURATION_MS = 500
    private static int BASE_SEGMENT_COUNT = 5
    private static int BASE_WIDTH_DP = 300
    private static int DEFAULT_BAR_HEIGHT_DP = 4
    private static int DEFAULT_DETENT_WIDTH_DP = 3
    private ValueAnimator mAnimator
    private int mBarColor
    private float mDensity
    private Paint mPaint
    private int mSegmentCount
    private GradientDrawable mShadow
    private int mSolidBarDetentWidth
    private int mSolidBarHeight

    private class ExponentialInterpolator : Interpolator {
        private constructor() {
        }

            this()
        }

        override fun getInterpolation(f: Float): Float {
            return ((float) Math.pow(2.0d, f)) - 1.0f
        }
    }

    constructor(context: Context) {
        this(context, null)
    }

    constructor(context: Context, attributeSet: AttributeSet) {
        super(context, attributeSet)
        this.mPaint = Paint()
        this.mDensity = context.getResources().getDisplayMetrics().density
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.ButteryProgressBar)
        try {
            this.mBarColor = obtainStyledAttributes.getColor(0, ContextCompat.getColor(context, android.R.color.holo_blue_light))
            this.mSolidBarHeight = obtainStyledAttributes.getDimensionPixelSize(1, Math.round(this.mDensity * 4.0f))
            this.mSolidBarDetentWidth = obtainStyledAttributes.getDimensionPixelSize(2, Math.round(this.mDensity * 3.0f))
            obtainStyledAttributes.recycle()
            this.mAnimator = ValueAnimator()
            this.mAnimator.setFloatValues(1.0f, 2.0f)
            this.mAnimator.setRepeatCount(-1)
            this.mAnimator.setInterpolator(ExponentialInterpolator(null))
            this.mAnimator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() {
                override fun onAnimationUpdate(valueAnimator: ValueAnimator) {
                    ButteryProgressBar.this.invalidate()
                }
            })
            this.mPaint.setColor(this.mBarColor)
            this.mShadow = GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, arrayOfNulls<int>(]{(this.mBarColor & 0x00FFFFFF) | 570425344, 0})
        } catch (Throwable th) {
            obtainStyledAttributes.recycle()
            throw th
        }
    }

    private fun start() {
        internal fun if(null: this.mAnimator ==):  {
            return
        }
        this.mAnimator.start()
    }

    private fun stop() {
        internal fun if(null: this.mAnimator ==):  {
            return
        }
        this.mAnimator.cancel()
    }

    override protected fun onDraw(canvas: Canvas) {
        if (this.mAnimator.isStarted()) {
            this.mShadow.draw(canvas)
            float floatValue = ((Float) this.mAnimator.getAnimatedValue()).floatValue()
            int width = getWidth() >> (this.mSegmentCount - 1)
            int viewWidth = getWidth()
            int i = 0
            internal fun while(this.mSegmentCount: i <):  {
                float f = floatValue * (viewWidth >> (i + 1))
                canvas.drawRect((f + this.mSolidBarDetentWidth) - width, 0.0f, (i == 0 ? viewWidth + width : 2.0f * f) - width, this.mSolidBarHeight, this.mPaint)
                i++
            }
        }
    }

    override protected fun onLayout(z: Boolean, i: Int, i2: Int, i3: Int, i4: Int) {
        internal fun if(z):  {
            int width = getWidth()
            this.mShadow.setBounds(0, this.mSolidBarHeight, width, getHeight() - this.mSolidBarHeight)
            float f = (width / this.mDensity) / 300.0f
            this.mAnimator.setDuration((int) ((((f - 1.0f) * 0.3f) + 1.0f) * 500.0f))
            this.mSegmentCount = (int) ((((f - 1.0f) * 0.1f) + 1.0f) * 5.0f)
        }
    }

    override protected fun onVisibilityChanged(view: View, i: Int) {
        super.onVisibilityChanged(view, i)
        internal fun if(0: i ==):  {
            start()
        } else {
            stop()
        }
    }
}
