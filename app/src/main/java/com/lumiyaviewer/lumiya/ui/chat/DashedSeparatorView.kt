package com.lumiyaviewer.lumiya.ui.chat

import android.content.Context
import android.graphics.Canvas
import android.graphics.DashPathEffect
import android.graphics.Paint
import android.graphics.Path
import android.graphics.PathEffect
import android.util.AttributeSet
import android.util.TypedValue
import android.view.View
import com.lumiyaviewer.lumiya.R

class DashedSeparatorView @JvmOverloads constructor(
    context: Context,
    attributeSet: AttributeSet? = null,
    defStyleAttr: Int = 0,
    defStyleRes: Int = 0
) : View(context, attributeSet, defStyleAttr, defStyleRes) {
    private val paint: Paint = Paint()
    private val path: Path = Path()
    private val pathEffect: PathEffect = DashPathEffect(floatArrayOf(1.0f, 10.0f), 0.0f)
    private var separatorColor: Int = -12303292

    init {
        if (attributeSet != null) {
            applyAttributes(context, attributeSet, defStyleAttr, defStyleRes)
        }
    }

    private fun applyAttributes(context: Context, attributeSet: AttributeSet, i: Int, i2: Int) {
        val obtainStyledAttributes = context.theme.obtainStyledAttributes(attributeSet, R.styleable.DashedSeparatorView, i, i2)
        try {
            this.separatorColor = obtainStyledAttributes.getColor(0, this.separatorColor)
        } finally {
            obtainStyledAttributes.recycle()
        }
    }

    override fun onAttachedToWindow() {
        super.onAttachedToWindow()
        this.paint.color = this.separatorColor
        this.paint.style = Paint.Style.STROKE
        this.paint.strokeWidth = TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 1.0f, resources.displayMetrics)
        this.paint.pathEffect = this.pathEffect
    }

    override fun onDraw(canvas: Canvas) {
        this.path.reset()
        this.path.moveTo(0.0f, (height / 2).toFloat())
        this.path.lineTo(width.toFloat(), (height / 2).toFloat())
        canvas.drawPath(this.path, this.paint)
    }
}
