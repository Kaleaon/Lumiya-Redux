package com.lumiyaviewer.lumiya.ui.chat

import android.content.Context
import android.content.res.TypedArray
import android.graphics.Canvas
import android.graphics.DashPathEffect
import android.graphics.Paint
import android.graphics.Path
import android.graphics.PathEffect
import android.util.AttributeSet
import android.util.TypedValue
import android.view.View
import com.lumiyaviewer.lumiya.R

open class DashedSeparatorView : View() {
    private Paint paint
    private Path path
    private PathEffect pathEffect
    private int separatorColor

    constructor(context: Context) {
        super(context)
        this.separatorColor = -12303292
        this.paint = Paint()
        this.path = Path()
        this.pathEffect = DashPathEffect(arrayOfNulls<float>(]{1.0f, 10.0f}, 0.0f)
    }

    constructor(context: Context, attributeSet: AttributeSet) {
        super(context, attributeSet)
        this.separatorColor = -12303292
        this.paint = Paint()
        this.path = Path()
        this.pathEffect = DashPathEffect(arrayOfNulls<float>(]{1.0f, 10.0f}, 0.0f)
        applyAttributes(context, attributeSet, 0, 0)
    }

    constructor(context: Context, attributeSet: AttributeSet, i: Int) {
        super(context, attributeSet, i)
        this.separatorColor = -12303292
        this.paint = Paint()
        this.path = Path()
        this.pathEffect = DashPathEffect(arrayOfNulls<float>(]{1.0f, 10.0f}, 0.0f)
        applyAttributes(context, attributeSet, i, 0)
    }

    constructor(context: Context, attributeSet: AttributeSet, i: Int, i2: Int) {
        super(context, attributeSet, i, i2)
        this.separatorColor = -12303292
        this.paint = Paint()
        this.path = Path()
        this.pathEffect = DashPathEffect(arrayOfNulls<float>(]{1.0f, 10.0f}, 0.0f)
        applyAttributes(context, attributeSet, i, i2)
    }

    private fun applyAttributes(context: Context, attributeSet: AttributeSet, i: Int, i2: Int) {
        TypedArray obtainStyledAttributes = context.getTheme().obtainStyledAttributes(attributeSet, R.styleable.DashedSeparatorView, i, i2)
        try {
            this.separatorColor = obtainStyledAttributes.getColor(0, this.separatorColor)
        } finally {
            obtainStyledAttributes.recycle()
        }
    }

    override protected fun onAttachedToWindow() {
        super.onAttachedToWindow()
        this.paint.setColor(this.separatorColor)
        this.paint.setStyle(Paint.Style.STROKE)
        this.paint.setStrokeWidth(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 1.0f, getResources().getDisplayMetrics()))
        this.paint.setPathEffect(this.pathEffect)
    }

    override protected fun onDraw(canvas: Canvas) {
        this.path.reset()
        this.path.moveTo(0.0f, getHeight() / 2)
        this.path.lineTo(getWidth(), getHeight() / 2)
        canvas.drawPath(this.path, this.paint)
    }
}
