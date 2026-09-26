package com.lumiyaviewer.lumiya.ui.chat

import android.content.Context
import android.graphics.PointF
import android.util.DisplayMetrics
import android.util.TypedValue
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.LinearSmoothScroller
import androidx.recyclerview.widget.RecyclerView

class ChatLayoutManager(context: Context, orientation: Int, reverseLayout: Boolean) :
    LinearLayoutManager(context, orientation, reverseLayout) {

    private var isFast = false

    private abstract inner class SmoothScroller(context: Context) : LinearSmoothScroller(context) {
        private val scrollDp = 200.0f

        override fun calculateSpeedPerPixel(displayMetrics: DisplayMetrics): Float {
            return getScrollMs() / TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, scrollDp, displayMetrics)
        }

        override fun computeScrollVectorForPosition(targetPosition: Int): PointF? {
            return this@ChatLayoutManager.computeScrollVectorForPosition(targetPosition)
        }

        protected abstract fun getScrollMs(): Float
    }

    private val smoothScroller = object : SmoothScroller(context) {
        override fun getScrollMs(): Float = SMOOTH_SCROLL_SPEED
    }

    private val fastSmoothScroller = object : SmoothScroller(context) {
        override fun getScrollMs(): Float = SMOOTH_SCROLL_FAST_SPEED
    }

    fun setScrollMode(isFast: Boolean) {
        this.isFast = isFast
    }

    override fun smoothScrollToPosition(recyclerView: RecyclerView, state: RecyclerView.State, position: Int) {
        val scroller = if (isFast) fastSmoothScroller else smoothScroller
        scroller.targetPosition = position
        startSmoothScroll(scroller)
    }

    companion object {
        private const val SMOOTH_SCROLL_FAST_SPEED = 20.0f
        private const val SMOOTH_SCROLL_SPEED = 1000.0f
    }
}
