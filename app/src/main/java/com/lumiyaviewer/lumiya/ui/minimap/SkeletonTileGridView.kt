package com.lumiyaviewer.lumiya.ui.minimap

import android.animation.ValueAnimator
import android.content.Context
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import android.graphics.RectF
import android.util.AttributeSet
import android.view.MotionEvent
import android.view.View
import android.view.animation.AccelerateDecelerateInterpolator
import com.lumiyaviewer.lumiya.slproto.modules.SLMinimap

open class SkeletonTileGridView @JvmOverloads constructor(
    context: Context,
    attrs: AttributeSet? = null,
    defStyleAttr: Int = 0
) : View(context, attrs, defStyleAttr) {

    private val gridPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        style = Paint.Style.FILL
    }

    private val borderPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        style = Paint.Style.STROKE
        color = Color.argb(60, 255, 255, 255)
        strokeWidth = 2.0f
    }

    private var shimmerPhase = 0.3f
    private var shimmerAnimator: ValueAnimator? = null

    // Alpha values for sequence IDs 0 through 3 (0.0f = transparent, 1.0f = fully visible)
    private val sequenceAlphas = FloatArray(4) { 1.0f }
    private val sequenceAnimators = arrayOfNulls<ValueAnimator>(4)

    init {
        startShimmerAnimation()
    }

    private fun startShimmerAnimation() {
        if (shimmerAnimator == null) {
            shimmerAnimator = ValueAnimator.ofFloat(0.25f, 0.70f).apply {
                duration = 1000L
                repeatCount = ValueAnimator.INFINITE
                repeatMode = ValueAnimator.REVERSE
                interpolator = AccelerateDecelerateInterpolator()
                addUpdateListener { animator ->
                    shimmerPhase = animator.animatedValue as Float
                    postInvalidateOnAnimation()
                }
            }
        }
        if (shimmerAnimator?.isStarted != true) {
            shimmerAnimator?.start()
        }
    }

    private fun stopShimmerAnimation() {
        shimmerAnimator?.cancel()
    }

    fun updateProgress(progress: SLMinimap.MapLoadingProgress) {
        val received = progress.receivedSequences
        for (sequenceId in 0..3) {
            if (received.contains(sequenceId)) {
                crossFadeSequence(sequenceId)
            }
        }

        if (progress.isComplete) {
            postDelayed({
                visibility = GONE
            }, 350L)
        } else {
            if (visibility != VISIBLE) {
                visibility = VISIBLE
            }
        }
    }

    fun resetGrid() {
        for (i in 0..3) {
            sequenceAnimators[i]?.cancel()
            sequenceAlphas[i] = 1.0f
        }
        visibility = VISIBLE
        startShimmerAnimation()
        invalidate()
    }

    private fun crossFadeSequence(sequenceId: Int) {
        if (sequenceId !in 0..3) return
        if (sequenceAlphas[sequenceId] == 0.0f || sequenceAnimators[sequenceId]?.isRunning == true) {
            return
        }

        val startAlpha = sequenceAlphas[sequenceId]
        val animator = ValueAnimator.ofFloat(startAlpha, 0.0f).apply {
            duration = 350L
            interpolator = AccelerateDecelerateInterpolator()
            addUpdateListener { anim ->
                sequenceAlphas[sequenceId] = anim.animatedValue as Float
                postInvalidateOnAnimation()
            }
        }
        sequenceAnimators[sequenceId] = animator
        animator.start()
    }

    override fun onDraw(canvas: Canvas) {
        super.onDraw(canvas)

        val w = width.toFloat()
        val h = height.toFloat()
        if (w <= 0f || h <= 0f) return

        val cellW = w / 4.0f
        val cellH = h / 4.0f
        val gap = 3.0f

        // Sequence ID to row mapping:
        // Sequence 3 -> Row 0 (top)
        // Sequence 2 -> Row 1
        // Sequence 1 -> Row 2
        // Sequence 0 -> Row 3 (bottom)
        for (row in 0 until 4) {
            val sequenceId = 3 - row
            val seqAlpha = sequenceAlphas[sequenceId]
            if (seqAlpha <= 0.001f) continue

            val combinedAlpha = (shimmerPhase * seqAlpha * 255.0f).toInt().coerceIn(0, 255)
            gridPaint.color = Color.argb(combinedAlpha, 100, 140, 180)

            val borderAlpha = (60.0f * seqAlpha).toInt().coerceIn(0, 255)
            borderPaint.color = Color.argb(borderAlpha, 255, 255, 255)

            for (col in 0 until 4) {
                val left = col * cellW + gap
                val top = row * cellH + gap
                val right = (col + 1) * cellW - gap
                val bottom = (row + 1) * cellH - gap

                val rect = RectF(left, top, right, bottom)
                canvas.drawRoundRect(rect, 8.0f, 8.0f, gridPaint)
                canvas.drawRoundRect(rect, 8.0f, 8.0f, borderPaint)
            }
        }
    }

    override fun onTouchEvent(event: MotionEvent): Boolean {
        // Pass touches through to underlying MinimapView
        return false
    }

    override fun onAttachedToWindow() {
        super.onAttachedToWindow()
        startShimmerAnimation()
    }

    override fun onDetachedFromWindow() {
        stopShimmerAnimation()
        super.onDetachedFromWindow()
    }
}
