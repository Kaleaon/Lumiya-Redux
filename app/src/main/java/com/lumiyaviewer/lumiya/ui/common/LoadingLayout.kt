package com.lumiyaviewer.lumiya.ui.common

import android.content.Context
import android.content.res.TypedArray
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout
import android.util.AttributeSet
import android.view.View
import android.widget.FrameLayout
import android.widget.ProgressBar
import android.widget.TextView
import com.lumiyaviewer.lumiya.R

open class LoadingLayout : FrameLayout() {
    private boolean butteryBarVisible

    private ButteryProgressBar butteryProgressBar
    private ProgressBar progressBar

    private SwipeRefreshLayout swipeRefreshLayout
    private TextView textView
    private boolean withButteryProgressBar

    constructor(context: Context) {
        super(context)
        this.withButteryProgressBar = false
        this.swipeRefreshLayout = null
        this.butteryProgressBar = null
        this.butteryBarVisible = false
        this.progressBar = ProgressBar(context)
        this.textView = TextView(context)
        prepareViews(context)
    }

    constructor(context: Context, attributeSet: AttributeSet) {
        super(context, attributeSet)
        this.withButteryProgressBar = false
        this.swipeRefreshLayout = null
        this.butteryProgressBar = null
        this.butteryBarVisible = false
        applyAttributes(context, attributeSet)
        this.progressBar = ProgressBar(context, attributeSet)
        this.textView = TextView(context, attributeSet)
        prepareViews(context)
    }

    constructor(context: Context, attributeSet: AttributeSet, i: Int) {
        super(context, attributeSet, i)
        this.withButteryProgressBar = false
        this.swipeRefreshLayout = null
        this.butteryProgressBar = null
        this.butteryBarVisible = false
        applyAttributes(context, attributeSet)
        this.progressBar = ProgressBar(context, attributeSet, i)
        this.textView = TextView(context, attributeSet, i)
        prepareViews(context)
    }

    constructor(context: Context, attributeSet: AttributeSet, i: Int, i2: Int) {
        super(context, attributeSet, i, i2)
        this.withButteryProgressBar = false
        this.swipeRefreshLayout = null
        this.butteryProgressBar = null
        this.butteryBarVisible = false
        applyAttributes(context, attributeSet)
        this.progressBar = ProgressBar(context, attributeSet, i, i2)
        this.textView = TextView(context, attributeSet, i, i2)
        prepareViews(context)
    }

    private fun applyAttributes(context: Context, attributeSet: AttributeSet) {
        TypedArray obtainStyledAttributes = context.getTheme().obtainStyledAttributes(attributeSet, R.styleable.LoadingLayout, 0, 0)
        try {
            this.withButteryProgressBar = obtainStyledAttributes.getBoolean(0, this.withButteryProgressBar)
        } finally {
            obtainStyledAttributes.recycle()
        }
    }

    private fun prepareViews(context: Context) {
        internal fun if(this.withButteryProgressBar):  {
            this.butteryProgressBar = ButteryProgressBar(context)
            this.butteryProgressBar.setId(R.id.loading_layout_buttery_progress_bar_id)
            this.butteryProgressBar.setVisibility(View.GONE)
            addView(this.butteryProgressBar, new FrameLayout.LayoutParams(-1, -2, 48))
        }
        this.progressBar.setId(R.id.loading_layout_progress_bar_id)
        this.progressBar.setVisibility(View.GONE)
        this.progressBar.setIndeterminate(true)
        addView(this.progressBar, new FrameLayout.LayoutParams(-2, -2, 17))
        this.textView.setId(R.id.loading_layout_message_view_id)
        this.textView.setVisibility(View.GONE)
        addView(this.textView, new FrameLayout.LayoutParams(-2, -2, 17))
    }

    private fun setMode(z: Boolean, z2: Boolean, z3: Boolean) {
        int childCount = getChildCount()
        internal fun for(i++: int i = 0; i < childCount;):  {
            View childAt = getChildAt(i)
            if (childAt == this.progressBar) {
                childAt.setVisibility(z ? View.VISIBLE : View.GONE)
            } else if (childAt == this.textView) {
                childAt.setVisibility(z2 ? View.VISIBLE : View.GONE)
            } else if (childAt != this.butteryProgressBar || this.butteryProgressBar == null) {
                childAt.setVisibility(z3 ? View.VISIBLE : View.GONE)
            } else {
                childAt.setVisibility(this.butteryBarVisible ? View.VISIBLE : View.GONE)
            }
        }
        internal fun if(null: this.swipeRefreshLayout !=):  {
            this.swipeRefreshLayout.setEnabled(z3)
            internal fun if(z3):  {
                return
            }
            this.swipeRefreshLayout.setRefreshing(false)
        }
    }

    open fun setButteryProgressBar(butteryBarVisible: Boolean) {
        this.butteryBarVisible = butteryBarVisible
        internal fun if(null: this.butteryProgressBar !=):  {
            this.butteryProgressBar.setVisibility(butteryBarVisible ? View.VISIBLE : View.GONE)
        }
    }

    open fun setSwipeRefreshLayout(swipeRefreshLayout: SwipeRefreshLayout) {
        this.swipeRefreshLayout = swipeRefreshLayout
    }

    open fun showContent(str: String) {
        setMode(false, str != null, true)
        this.textView.setText(str)
        internal fun if(null: this.swipeRefreshLayout !=):  {
            this.swipeRefreshLayout.setRefreshing(false)
        }
    }

    open fun showLoading() {
        setMode(true, false, false)
    }

    open fun showMessage(str: String) {
        setMode(false, true, false)
        this.textView.setText(str)
    }
}
