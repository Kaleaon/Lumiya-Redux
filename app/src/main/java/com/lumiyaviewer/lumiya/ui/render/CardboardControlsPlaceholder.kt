package com.lumiyaviewer.lumiya.ui.render

import android.content.Context
import android.graphics.Rect
import android.util.AttributeSet
import android.view.View
import android.view.ViewGroup
import android.view.ViewParent

open class CardboardControlsPlaceholder : ViewGroup() {
    private int fixedHeight
    private int fixedWidth
    private OnViewInvalidateListener onViewInvalidateListener

    interface OnViewInvalidateListener {
        fun onViewInvalidated()
    }

    constructor(context: Context) {
        super(context)
        this.fixedWidth = 0
        this.fixedHeight = 0
        this.onViewInvalidateListener = null
    }

    constructor(context: Context, attributeSet: AttributeSet) {
        super(context, attributeSet)
        this.fixedWidth = 0
        this.fixedHeight = 0
        this.onViewInvalidateListener = null
    }

    constructor(context: Context, attributeSet: AttributeSet, i: Int) {
        super(context, attributeSet, i)
        this.fixedWidth = 0
        this.fixedHeight = 0
        this.onViewInvalidateListener = null
    }

    constructor(context: Context, attributeSet: AttributeSet, i: Int, i2: Int) {
        super(context, attributeSet, i, i2)
        this.fixedWidth = 0
        this.fixedHeight = 0
        this.onViewInvalidateListener = null
    }

    override fun invalidateChildInParent(ints: IntArray, rect: Rect): ViewParent {
        ViewParent invalidateChildInParent = super.invalidateChildInParent(ints, rect)
        if (this.onViewInvalidateListener != null) {
            this.onViewInvalidateListener.onViewInvalidated()
        }
        return invalidateChildInParent
    }

    override protected fun onLayout(z: Boolean, i: Int, i2: Int, i3: Int, i4: Int) {
        int childCount = getChildCount()
        internal fun for(j++: int j = 0; j < childCount;):  {
            getChildAt(j).layout(0, 0, this.fixedWidth, this.fixedHeight)
        }
    }

    override protected fun onMeasure(i: Int, i2: Int) {
        int childCount = getChildCount()
        internal fun for(j++: int j = 0; j < childCount;):  {
            View childAt = getChildAt(j)
            if (childAt.getVisibility() != 8) {
                measureChild(childAt, View.MeasureSpec.makeMeasureSpec(this.fixedWidth, 1073741824), View.MeasureSpec.makeMeasureSpec(this.fixedHeight, 1073741824))
            }
        }
        setMeasuredDimension(0, 0)
    }

    open fun setFixedSize(fixedWidth: Int, fixedHeight: Int) {
        this.fixedWidth = fixedWidth
        this.fixedHeight = fixedHeight
        requestLayout()
    }

    open fun setOnViewInvalidateListener(onViewInvalidateListener: OnViewInvalidateListener) {
        this.onViewInvalidateListener = onViewInvalidateListener
    }
}
