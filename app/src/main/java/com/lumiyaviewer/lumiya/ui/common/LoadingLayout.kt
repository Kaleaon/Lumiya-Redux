package com.lumiyaviewer.lumiya.ui.common

import android.content.Context
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout
import android.util.AttributeSet
import android.view.View
import android.widget.FrameLayout
import android.widget.ProgressBar
import android.widget.TextView
import com.lumiyaviewer.lumiya.R

class LoadingLayout @JvmOverloads constructor(
    context: Context,
    attributeSet: AttributeSet? = null,
    defStyleAttr: Int = 0,
    defStyleRes: Int = 0
) : FrameLayout(context, attributeSet, defStyleAttr, defStyleRes) {

    private var butteryBarVisible = false
    private var butteryProgressBar: ButteryProgressBar? = null
    private val progressBar: ProgressBar
    private var swipeRefreshLayout: SwipeRefreshLayout? = null
    private val textView: TextView
    private var withButteryProgressBar = false

    init {
        if (attributeSet != null) {
            applyAttributes(context, attributeSet)
        }
        progressBar = ProgressBar(context, attributeSet, defStyleAttr, defStyleRes)
        textView = TextView(context, attributeSet, defStyleAttr, defStyleRes)
        prepareViews(context)
    }

    private fun applyAttributes(context: Context, attributeSet: AttributeSet) {
        val obtainStyledAttributes = context.theme.obtainStyledAttributes(attributeSet, R.styleable.LoadingLayout, 0, 0)
        try {
            this.withButteryProgressBar = obtainStyledAttributes.getBoolean(0, this.withButteryProgressBar)
        } finally {
            obtainStyledAttributes.recycle()
        }
    }

    private fun prepareViews(context: Context) {
        if (this.withButteryProgressBar) {
            val butteryProgressBar = ButteryProgressBar(context)
            this.butteryProgressBar = butteryProgressBar
            butteryProgressBar.id = R.id.loading_layout_buttery_progress_bar_id
            butteryProgressBar.visibility = View.GONE
            addView(butteryProgressBar, FrameLayout.LayoutParams(-1, -2, 48))
        }
        this.progressBar.id = R.id.loading_layout_progress_bar_id
        this.progressBar.visibility = View.GONE
        this.progressBar.isIndeterminate = true
        addView(this.progressBar, FrameLayout.LayoutParams(-2, -2, 17))
        this.textView.id = R.id.loading_layout_message_view_id
        this.textView.visibility = View.GONE
        addView(this.textView, FrameLayout.LayoutParams(-2, -2, 17))
    }

    private fun setMode(z: Boolean, z2: Boolean, z3: Boolean) {
        val childCount = childCount
        for (i in 0 until childCount) {
            val childAt = getChildAt(i)
            if (childAt == this.progressBar) {
                childAt.visibility = if (z) View.VISIBLE else View.GONE
            } else if (childAt == this.textView) {
                childAt.visibility = if (z2) View.VISIBLE else View.GONE
            } else if (childAt !== this.butteryProgressBar || this.butteryProgressBar == null) {
                childAt.visibility = if (z3) View.VISIBLE else View.GONE
            } else {
                childAt.visibility = if (this.butteryBarVisible) View.VISIBLE else View.GONE
            }
        }
        val swipeRefreshLayout = this.swipeRefreshLayout
        if (swipeRefreshLayout != null) {
            swipeRefreshLayout.isEnabled = z3
            if (z3) {
                return
            }
            swipeRefreshLayout.isRefreshing = false
        }
    }

    fun setButteryProgressBar(butteryBarVisible: Boolean) {
        this.butteryBarVisible = butteryBarVisible
        val butteryProgressBar = this.butteryProgressBar
        if (butteryProgressBar != null) {
            butteryProgressBar.visibility = if (butteryBarVisible) View.VISIBLE else View.GONE
        }
    }

    fun setSwipeRefreshLayout(swipeRefreshLayout: SwipeRefreshLayout?) {
        this.swipeRefreshLayout = swipeRefreshLayout
    }

    fun showContent(str: String?) {
        setMode(false, str != null, true)
        this.textView.text = str
        val swipeRefreshLayout = this.swipeRefreshLayout
        if (swipeRefreshLayout != null) {
            swipeRefreshLayout.isRefreshing = false
        }
    }

    fun showLoading() {
        setMode(true, false, false)
    }

    fun showMessage(str: String) {
        setMode(false, true, false)
        this.textView.text = str
    }
}
