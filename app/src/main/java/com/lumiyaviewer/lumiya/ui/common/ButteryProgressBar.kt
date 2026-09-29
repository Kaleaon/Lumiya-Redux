package com.lumiyaviewer.lumiya.ui.common

import android.animation.ValueAnimator
import android.content.Context
import android.graphics.Canvas
import android.graphics.Paint
import android.graphics.drawable.GradientDrawable
import android.util.AttributeSet
import android.view.View
import android.view.animation.Interpolator
import androidx.core.content.ContextCompat
import com.lumiyaviewer.lumiya.R

class ButteryProgressBar @JvmOverloads constructor(context: Context, attributeSet: AttributeSet? = null) :
    View(context, attributeSet) {

    companion object {
        private const val BASE_DURATION_MS = 500
        private const val BASE_SEGMENT_COUNT = 5
        private const val BASE_WIDTH_DP = 300
        private const val DEFAULT_BAR_HEIGHT_DP = 4
        private const val DEFAULT_DETENT_WIDTH_DP = 3
    }

    private val mAnimator: ValueAnimator
    private val mBarColor: Int
    private val mDensity: Float = context.resources.displayMetrics.density
    private val mPaint: Paint = Paint()
    private var mSegmentCount: Int = 0
    private val mShadow: GradientDrawable
    private val mSolidBarDetentWidth: Int
    private val mSolidBarHeight: Int

    private class ExponentialInterpolator : Interpolator {
        override fun getInterpolation(f: Float): Float {
            return Math.pow(2.0, f.toDouble()).toFloat() - 1.0f
        }
    }

    init {
        val obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.ButteryProgressBar)
        try {
            mBarColor = obtainStyledAttributes.getColor(0, ContextCompat.getColor(context, android.R.color.holo_blue_light))
            mSolidBarHeight = obtainStyledAttributes.getDimensionPixelSize(1, Math.round(mDensity * 4.0f))
            mSolidBarDetentWidth = obtainStyledAttributes.getDimensionPixelSize(2, Math.round(mDensity * 3.0f))
            mAnimator = ValueAnimator()
            mAnimator.setFloatValues(1.0f, 2.0f)
            mAnimator.repeatCount = -1
            mAnimator.interpolator = ExponentialInterpolator()
            mAnimator.addUpdateListener {
                invalidate()
            }
            mPaint.color = mBarColor
            mShadow = GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, intArrayOf((mBarColor and 0x00FFFFFF) or 570425344.toInt(), 0))
        } finally {
            obtainStyledAttributes.recycle()
        }
    }

    private fun start() {
        mAnimator.start()
    }

    private fun stop() {
        mAnimator.cancel()
    }

    override fun onDraw(canvas: Canvas) {
        if (mAnimator.isStarted) {
            mShadow.draw(canvas)
            val floatValue = mAnimator.animatedValue as Float
            val viewWidth = width
            val widthShift = viewWidth shr (mSegmentCount - 1)
            var i = 0
            while (i < mSegmentCount) {
                val f = floatValue * (viewWidth shr (i + 1))
                canvas.drawRect(
                    (f + mSolidBarDetentWidth) - widthShift,
                    0.0f,
                    (if (i == 0) (viewWidth + widthShift).toFloat() else 2.0f * f) - widthShift,
                    mSolidBarHeight.toFloat(),
                    mPaint
                )
                i++
            }
        }
    }

    override fun onLayout(z: Boolean, i: Int, i2: Int, i3: Int, i4: Int) {
        if (z) {
            val width = width
            mShadow.setBounds(0, mSolidBarHeight, width, height - mSolidBarHeight)
            val f = (width / mDensity) / 300.0f
            mAnimator.duration = ((((f - 1.0f) * 0.3f) + 1.0f) * 500.0f).toLong()
            mSegmentCount = ((((f - 1.0f) * 0.1f) + 1.0f) * 5.0f).toInt()
        }
    }

    override fun onVisibilityChanged(view: View, i: Int) {
        super.onVisibilityChanged(view, i)
        if (i == 0) {
            start()
        } else {
            stop()
        }
    }
}
