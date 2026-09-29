package com.lumiyaviewer.lumiya.ui.chat

import android.content.Context
import android.graphics.Canvas
import android.graphics.Paint
import android.util.AttributeSet
import android.view.View
import com.lumiyaviewer.lumiya.R

class OnlineIndicatorView @JvmOverloads constructor(
    context: Context,
    attributeSet: AttributeSet? = null,
    defStyleAttr: Int = 0,
    defStyleRes: Int = 0
) : View(context, attributeSet, defStyleAttr, defStyleRes) {
    private val innerRingPaint: Paint = Paint()
    private var innerRingThickness: Float = 5.0f
    private var onlineIndicatorColor: Int = -16711936
    private var outerRingGap: Float = 1.0f
    private val outerRingPaint: Paint = Paint()
    private var outerRingThickness: Float = 1.0f

    init {
        if (attributeSet != null) {
            applyAttributes(context, attributeSet, defStyleAttr, defStyleRes)
        }
    }

    private fun applyAttributes(context: Context, attributeSet: AttributeSet, i: Int, i2: Int) {
        val obtainStyledAttributes = context.theme.obtainStyledAttributes(attributeSet, R.styleable.OnlineIndicatorView, i, i2)
        try {
            this.onlineIndicatorColor = obtainStyledAttributes.getColor(0, this.onlineIndicatorColor)
            this.innerRingThickness = obtainStyledAttributes.getDimension(1, this.innerRingThickness)
            this.outerRingGap = obtainStyledAttributes.getDimension(2, this.outerRingGap)
            this.outerRingThickness = obtainStyledAttributes.getDimension(3, this.outerRingThickness)
        } finally {
            obtainStyledAttributes.recycle()
        }
    }

    override fun onAttachedToWindow() {
        super.onAttachedToWindow()
        this.innerRingPaint.color = this.onlineIndicatorColor
        this.innerRingPaint.isAntiAlias = true
        this.innerRingPaint.style = Paint.Style.FILL
        this.outerRingPaint.color = this.onlineIndicatorColor
        this.outerRingPaint.isAntiAlias = true
        this.outerRingPaint.style = Paint.Style.STROKE
        this.outerRingPaint.strokeWidth = this.outerRingThickness
    }

    override fun onDraw(canvas: Canvas) {
        val width = width.toFloat()
        val height = height.toFloat()
        canvas.drawCircle(width / 2.0f, height / 2.0f, this.innerRingThickness / 2.0f, this.innerRingPaint)
        canvas.drawCircle(width / 2.0f, height / 2.0f, ((this.innerRingThickness + this.outerRingGap) + (this.outerRingThickness / 2.0f)) / 2.0f, this.outerRingPaint)
    }
}
