package com.lumiyaviewer.lumiya.ui.chat

import android.content.Context
import android.content.res.TypedArray
import android.graphics.Canvas
import android.graphics.Paint
import android.util.AttributeSet
import android.view.View
import com.lumiyaviewer.lumiya.R

open class OnlineIndicatorView : View() {
    private Paint innerRingPaint
    private float innerRingThickness
    private int onlineIndicatorColor
    private float outerRingGap
    private Paint outerRingPaint
    private float outerRingThickness

    constructor(context: Context) {
        super(context)
        this.onlineIndicatorColor = -16711936
        this.innerRingThickness = 5.0f
        this.outerRingGap = 1.0f
        this.outerRingThickness = 1.0f
        this.innerRingPaint = Paint()
        this.outerRingPaint = Paint()
    }

    constructor(context: Context, attributeSet: AttributeSet) {
        super(context, attributeSet)
        this.onlineIndicatorColor = -16711936
        this.innerRingThickness = 5.0f
        this.outerRingGap = 1.0f
        this.outerRingThickness = 1.0f
        this.innerRingPaint = Paint()
        this.outerRingPaint = Paint()
        applyAttributes(context, attributeSet, 0, 0)
    }

    constructor(context: Context, attributeSet: AttributeSet, i: Int) {
        super(context, attributeSet, i)
        this.onlineIndicatorColor = -16711936
        this.innerRingThickness = 5.0f
        this.outerRingGap = 1.0f
        this.outerRingThickness = 1.0f
        this.innerRingPaint = Paint()
        this.outerRingPaint = Paint()
        applyAttributes(context, attributeSet, i, 0)
    }

    constructor(context: Context, attributeSet: AttributeSet, i: Int, i2: Int) {
        super(context, attributeSet, i, i2)
        this.onlineIndicatorColor = -16711936
        this.innerRingThickness = 5.0f
        this.outerRingGap = 1.0f
        this.outerRingThickness = 1.0f
        this.innerRingPaint = Paint()
        this.outerRingPaint = Paint()
        applyAttributes(context, attributeSet, i, i2)
    }

    private fun applyAttributes(context: Context, attributeSet: AttributeSet, i: Int, i2: Int) {
        TypedArray obtainStyledAttributes = context.getTheme().obtainStyledAttributes(attributeSet, R.styleable.OnlineIndicatorView, i, i2)
        try {
            this.onlineIndicatorColor = obtainStyledAttributes.getColor(0, this.onlineIndicatorColor)
            this.innerRingThickness = obtainStyledAttributes.getDimension(1, this.innerRingThickness)
            this.outerRingGap = obtainStyledAttributes.getDimension(2, this.outerRingGap)
            this.outerRingThickness = obtainStyledAttributes.getDimension(3, this.outerRingThickness)
        } finally {
            obtainStyledAttributes.recycle()
        }
    }

    override protected fun onAttachedToWindow() {
        super.onAttachedToWindow()
        this.innerRingPaint.setColor(this.onlineIndicatorColor)
        this.innerRingPaint.setAntiAlias(true)
        this.innerRingPaint.setStyle(Paint.Style.FILL)
        this.outerRingPaint.setColor(this.onlineIndicatorColor)
        this.outerRingPaint.setAntiAlias(true)
        this.outerRingPaint.setStyle(Paint.Style.STROKE)
        this.outerRingPaint.setStrokeWidth(this.outerRingThickness)
    }

    override protected fun onDraw(canvas: Canvas) {
        float width = getWidth()
        float height = getHeight()
        canvas.drawCircle(width / 2.0f, height / 2.0f, this.innerRingThickness / 2.0f, this.innerRingPaint)
        canvas.drawCircle(width / 2.0f, height / 2.0f, ((this.innerRingThickness + this.outerRingGap) + (this.outerRingThickness / 2.0f)) / 2.0f, this.outerRingPaint)
    }
}
