package com.lumiyaviewer.lumiya.ui.minimap

import android.content.Context
import android.graphics.Color
import android.graphics.Typeface
import android.util.AttributeSet
import android.util.TypedValue
import android.view.Gravity
import android.widget.Button
import android.widget.LinearLayout
import android.widget.TextView

open class EmptyStateView @JvmOverloads constructor(
    context: Context,
    attrs: AttributeSet? = null,
    defStyleAttr: Int = 0
) : LinearLayout(context, attrs, defStyleAttr) {

    private val titleView: TextView
    private val messageView: TextView
    private val retryButton: Button

    init {
        orientation = VERTICAL
        gravity = Gravity.CENTER
        setBackgroundColor(Color.argb(220, 20, 24, 30))
        val paddingPx = TypedValue.applyDimension(
            TypedValue.COMPLEX_UNIT_DIP, 24.0f, resources.displayMetrics
        ).toInt()
        setPadding(paddingPx, paddingPx, paddingPx, paddingPx)

        titleView = TextView(context).apply {
            id = generateViewId()
            text = "Map Tile Stalled / Unavailable"
            setTextColor(Color.WHITE)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 18.0f)
            setTypeface(null, Typeface.BOLD)
            gravity = Gravity.CENTER
        }
        val titleParams = LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT).apply {
            bottomMargin = TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, 12.0f, resources.displayMetrics
            ).toInt()
        }
        addView(titleView, titleParams)

        messageView = TextView(context).apply {
            id = generateViewId()
            text = "Map tile packets did not arrive within the timeout period. Please check your network connection and try again."
            setTextColor(Color.LTGRAY)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.0f)
            gravity = Gravity.CENTER
        }
        val messageParams = LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT).apply {
            bottomMargin = TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, 20.0f, resources.displayMetrics
            ).toInt()
        }
        addView(messageView, messageParams)

        retryButton = Button(context).apply {
            id = generateViewId()
            text = "Retry"
            setBackgroundColor(Color.rgb(0, 150, 136))
            setTextColor(Color.WHITE)
            isAllCaps = false
        }
        val buttonParams = LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT)
        addView(retryButton, buttonParams)
    }

    fun setOnRetryClickListener(listener: OnClickListener) {
        retryButton.setOnClickListener(listener)
    }

    fun setMessage(title: String, message: String) {
        titleView.text = title
        messageView.text = message
    }
}
