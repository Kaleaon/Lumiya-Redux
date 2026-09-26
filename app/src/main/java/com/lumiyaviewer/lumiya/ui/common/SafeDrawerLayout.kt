package com.lumiyaviewer.lumiya.ui.common

import android.content.Context
import androidx.drawerlayout.widget.DrawerLayout
import android.util.AttributeSet
import android.view.MotionEvent
import com.lumiyaviewer.lumiya.Debug

class SafeDrawerLayout @JvmOverloads constructor(
    context: Context,
    attrs: AttributeSet? = null,
    defStyle: Int = 0
) : DrawerLayout(context, attrs, defStyle) {

    override fun onInterceptTouchEvent(motionEvent: MotionEvent): Boolean {
        return try {
            super.onInterceptTouchEvent(motionEvent)
        } catch (e: Exception) {
            Debug.Warning(e)
            false
        }
    }
}
