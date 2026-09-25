package com.lumiyaviewer.lumiya.ui.render;

import android.content.Context;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;

public class CardboardControlsPlaceholder extends ViewGroup {
    private int fixedHeight;
    private int fixedWidth;
    private OnViewInvalidateListener onViewInvalidateListener;

    public interface OnViewInvalidateListener {
        void onViewInvalidated();
    }

    public CardboardControlsPlaceholder(Context context) {
        super(context);
        this.fixedWidth = 0;
        this.fixedHeight = 0;
        this.onViewInvalidateListener = null;
    }

    public CardboardControlsPlaceholder(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.fixedWidth = 0;
        this.fixedHeight = 0;
        this.onViewInvalidateListener = null;
    }

    public CardboardControlsPlaceholder(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.fixedWidth = 0;
        this.fixedHeight = 0;
        this.onViewInvalidateListener = null;
    }

    public CardboardControlsPlaceholder(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
        this.fixedWidth = 0;
        this.fixedHeight = 0;
        this.onViewInvalidateListener = null;
    }

    @Override
    public ViewParent invalidateChildInParent(int[] ints, Rect rect) {
        ViewParent invalidateChildInParent = super.invalidateChildInParent(ints, rect);
        if (this.onViewInvalidateListener != null) {
            this.onViewInvalidateListener.onViewInvalidated();
        }
        return invalidateChildInParent;
    }

    @Override
    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        int childCount = getChildCount();
        for (int j = 0; j < childCount; j++) {
            getChildAt(j).layout(0, 0, this.fixedWidth, this.fixedHeight);
        }
    }

    @Override
    protected void onMeasure(int i, int i2) {
        int childCount = getChildCount();
        for (int j = 0; j < childCount; j++) {
            View childAt = getChildAt(j);
            if (childAt.getVisibility() != 8) {
                measureChild(childAt, View.MeasureSpec.makeMeasureSpec(this.fixedWidth, 1073741824), View.MeasureSpec.makeMeasureSpec(this.fixedHeight, 1073741824));
            }
        }
        setMeasuredDimension(0, 0);
    }

    public void setFixedSize(int fixedWidth, int fixedHeight) {
        this.fixedWidth = fixedWidth;
        this.fixedHeight = fixedHeight;
        requestLayout();
    }

    public void setOnViewInvalidateListener(OnViewInvalidateListener onViewInvalidateListener) {
        this.onViewInvalidateListener = onViewInvalidateListener;
    }
}
