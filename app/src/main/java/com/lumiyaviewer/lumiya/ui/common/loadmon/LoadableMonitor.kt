package com.lumiyaviewer.lumiya.ui.common.loadmon

import androidx.swiperefreshlayout.widget.SwipeRefreshLayout
import com.google.common.base.Strings
import com.lumiyaviewer.lumiya.react.RefreshableOne
import com.lumiyaviewer.lumiya.react.UnsubscribableOne
import com.lumiyaviewer.lumiya.ui.common.LoadingLayout
import java.util.ArrayList
import java.util.Collections

open class LoadableMonitor(vararg loadable: Loadable) : Loadable.LoadableStatusListener, SwipeRefreshLayout.OnRefreshListener {

    private val loadables: MutableList<Loadable> = ArrayList()
    private val optionalLoadables: MutableList<Loadable> = ArrayList()

    private var status: Loadable.Status = Loadable.Status.Idle

    private var onLoadableDataChangedListener: OnLoadableDataChangedListener? = null

    private var loadingLayout: LoadingLayout? = null

    private var swipeRefreshLayout: SwipeRefreshLayout? = null

    private var loadingIdleMessage: String? = null

    private var loadingErrorMessage: String? = null

    private var emptyMessage: String? = null
    private var isExtraLoading = false

    interface OnLoadableDataChangedListener {
        fun onLoadableDataChanged()
    }

    init {
        Collections.addAll(this.loadables, *loadable)
        for (l in this.loadables) {
            l.addLoadableStatusListener(this)
        }
    }

    private fun updateLoadingIndicator() {
        val loadingLayout = this.loadingLayout
        if (loadingLayout != null) {
            when (this.status) {
                Loadable.Status.Error -> {
                    loadingLayout.showMessage(Strings.nullToEmpty(this.loadingErrorMessage))
                }
                Loadable.Status.Idle -> {
                    loadingLayout.showMessage(Strings.nullToEmpty(this.loadingIdleMessage))
                }
                Loadable.Status.Loaded -> {
                    loadingLayout.showContent(this.emptyMessage)
                }
                Loadable.Status.Loading -> {
                    loadingLayout.showLoading()
                }
            }
        }
    }

    private fun recomputeStatus() {
        var z = false
        var z2 = false
        var z3 = false
        for (l in this.loadables) {
            val loadableStatus = l.getLoadableStatus()
            when (loadableStatus) {
                Loadable.Status.Error -> z2 = true
                Loadable.Status.Loading -> z3 = true
                else -> {}
            }
            z = if (loadableStatus != Loadable.Status.Loaded) true else z
        }
        val status2 = if (z3 || this.isExtraLoading) Loadable.Status.Loading else if (z2) Loadable.Status.Error else if (!z) Loadable.Status.Loaded else Loadable.Status.Idle
        if (status2 != this.status) {
            this.status = status2
            updateLoadingIndicator()
        }
        val swipeRefreshLayout = this.swipeRefreshLayout
        if (!z3 && swipeRefreshLayout != null) {
            swipeRefreshLayout.isRefreshing = false
        }
        val onLoadableDataChangedListener = this.onLoadableDataChangedListener
        if (this.status != Loadable.Status.Loaded || onLoadableDataChangedListener == null) {
            return
        }
        onLoadableDataChangedListener.onLoadableDataChanged()
    }

    override fun onLoadableStatusChange(loadable: Loadable, status: Loadable.Status) {
        recomputeStatus()
    }

    override fun onRefresh() {
        for (l in this.loadables) {
            if (l is RefreshableOne) {
                l.requestRefresh()
            }
        }
        for (l in this.optionalLoadables) {
            if (l is RefreshableOne) {
                l.requestRefresh()
            }
        }
    }

    fun setButteryProgressBar(butteryProgressBar: Boolean) {
        val loadingLayout = this.loadingLayout
        if (loadingLayout != null) {
            loadingLayout.setButteryProgressBar(butteryProgressBar)
        }
    }

    fun setEmptyMessage(z: Boolean, emptyMessage: String?) {
        var emptyMessage = emptyMessage
        if (!z) {
            emptyMessage = null
        }
        this.emptyMessage = emptyMessage
        updateLoadingIndicator()
    }

    fun setExtraLoading(isExtraLoading: Boolean) {
        this.isExtraLoading = isExtraLoading
        recomputeStatus()
    }

    fun setLoadingLayout(loadingLayout: LoadingLayout?, loadingIdleMessage: String?, loadingErrorMessage: String?) {
        this.loadingLayout = loadingLayout
        this.loadingIdleMessage = loadingIdleMessage
        this.loadingErrorMessage = loadingErrorMessage
        updateLoadingIndicator()
    }

    fun setSwipeRefreshLayout(swipeRefreshLayout: SwipeRefreshLayout?) {
        this.swipeRefreshLayout = swipeRefreshLayout
        if (swipeRefreshLayout != null) {
            swipeRefreshLayout.setOnRefreshListener(this)
        }
    }

    fun unsubscribeAll() {
        for (l in this.loadables) {
            if (l is UnsubscribableOne) {
                l.unsubscribe()
            }
        }
        for (l in this.optionalLoadables) {
            if (l is UnsubscribableOne) {
                l.unsubscribe()
            }
        }
    }

    fun withDataChangedListener(onLoadableDataChangedListener: OnLoadableDataChangedListener): LoadableMonitor {
        this.onLoadableDataChangedListener = onLoadableDataChangedListener
        return this
    }

    fun withOptionalLoadables(vararg loadable2: Loadable): LoadableMonitor {
        Collections.addAll(this.optionalLoadables, *loadable2)
        for (l in loadable2) {
            l.addLoadableStatusListener(this)
        }
        return this
    }
}
