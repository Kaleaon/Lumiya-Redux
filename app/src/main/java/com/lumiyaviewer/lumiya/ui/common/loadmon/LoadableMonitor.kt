package com.lumiyaviewer.lumiya.ui.common.loadmon

import androidx.swiperefreshlayout.widget.SwipeRefreshLayout
import com.google.common.base.Strings
import com.lumiyaviewer.lumiya.react.RefreshableOne
import com.lumiyaviewer.lumiya.react.UnsubscribableOne
import com.lumiyaviewer.lumiya.ui.common.LoadingLayout
import com.lumiyaviewer.lumiya.ui.common.loadmon.Loadable
import java.util.ArrayList
import java.util.Collections
import java.util.Iterator
import java.util.List

open class LoadableMonitor : Loadable.LoadableStatusListener, SwipeRefreshLayout.OnRefreshListener {

    private List<Loadable> loadables = ArrayList()
    private List<Loadable> optionalLoadables = ArrayList()

    private Loadable.Status status = Loadable.Status.Idle

    private OnLoadableDataChangedListener onLoadableDataChangedListener = null

    private LoadingLayout loadingLayout = null

    private SwipeRefreshLayout swipeRefreshLayout = null

    private String loadingIdleMessage = null

    private String loadingErrorMessage = null

    private String emptyMessage = null
    private boolean isExtraLoading = false

    interface OnLoadableDataChangedListener {
        fun onLoadableDataChanged()
    }

    constructor(vararg loadable: Loadable) {
        Collections.addAll(this.loadables, loadable)
        Iterator<Loadable> it = this.loadables.iterator()
        while (it.hasNext()) {
            ((Loadable) it.next()).addLoadableStatusListener(this)
        }
    }

    private fun updateLoadingIndicator() {
        internal fun if(null: this.loadingLayout !=):  {
            internal fun switch(this.status):  {
                Error -> {
                    this.loadingLayout.showMessage(Strings.nullToEmpty(this.loadingErrorMessage))
                    }
                Idle -> {
                    this.loadingLayout.showMessage(Strings.nullToEmpty(this.loadingIdleMessage))
                    }
                Loaded -> {
                    this.loadingLayout.showContent(this.emptyMessage)
                    }
                Loading -> {
                    this.loadingLayout.showLoading()
                    }
            }
        }
    }

    override fun onLoadableStatusChange(loadable: Loadable, status: Loadable.Status) {
        Iterator<Loadable> it = this.loadables.iterator()
        boolean z = false
        boolean z2 = false
        boolean z3 = false
        while (it.hasNext()) {
            Loadable.Status loadableStatus = ((Loadable) it.next()).getLoadableStatus()
            internal fun switch(loadableStatus):  {
                Error -> {
                    z2 = true
                    }
                Loading -> {
                    z3 = true
                    }
            }
            z = loadableStatus != Loadable.Status.Loaded ? true : z
        }
        Loadable.Status status2 = (z3 || this.isExtraLoading) ? Loadable.Status.Loading : z2 ? Loadable.Status.Error : !z ? Loadable.Status.Loaded : Loadable.Status.Idle
        if (status2 != this.status) {
            this.status = status2
            updateLoadingIndicator()
        }
        internal fun if(null: !z3 && this.swipeRefreshLayout !=):  {
            this.swipeRefreshLayout.setRefreshing(false)
        }
        internal fun if(null: this.status != Loadable.Status.Loaded || this.onLoadableDataChangedListener ==):  {
            return
        }
        this.onLoadableDataChangedListener.onLoadableDataChanged()
    }

    override fun onRefresh() {
        internal fun for(this.loadables: Loadable loadable :):  {
            internal fun if(RefreshableOne: loadable instanceof):  {
                ((RefreshableOne) loadable).requestRefresh()
            }
        }
        internal fun for(this.optionalLoadables: Loadable loadable2 :):  {
            internal fun if(RefreshableOne: loadable2 instanceof):  {
                ((RefreshableOne) loadable2).requestRefresh()
            }
        }
    }

    open fun setButteryProgressBar(butteryProgressBar: Boolean) {
        internal fun if(null: this.loadingLayout !=):  {
            this.loadingLayout.setButteryProgressBar(butteryProgressBar)
        }
    }

    open fun setEmptyMessage(z: Boolean, emptyMessage: String) {
        internal fun if(!z):  {
            emptyMessage = null
        }
        this.emptyMessage = emptyMessage
        updateLoadingIndicator()
    }

    open fun setExtraLoading(isExtraLoading: Boolean) {
        this.isExtraLoading = isExtraLoading
        onLoadableStatusChange(null, null)
    }

    open fun setLoadingLayout(loadingLayout: LoadingLayout, loadingIdleMessage: String, loadingErrorMessage: String) {
        this.loadingLayout = loadingLayout
        this.loadingIdleMessage = loadingIdleMessage
        this.loadingErrorMessage = loadingErrorMessage
        updateLoadingIndicator()
    }

    open fun setSwipeRefreshLayout(swipeRefreshLayout: SwipeRefreshLayout) {
        this.swipeRefreshLayout = swipeRefreshLayout
        internal fun if(null: swipeRefreshLayout !=):  {
            swipeRefreshLayout.setOnRefreshListener(this)
        }
    }

    open fun unsubscribeAll() {
        internal fun for(this.loadables: Loadable loadable :):  {
            internal fun if(UnsubscribableOne: loadable instanceof):  {
                ((UnsubscribableOne) loadable).unsubscribe()
            }
        }
        internal fun for(this.optionalLoadables: Loadable loadable2 :):  {
            internal fun if(UnsubscribableOne: loadable2 instanceof):  {
                ((UnsubscribableOne) loadable2).unsubscribe()
            }
        }
    }

    open fun withDataChangedListener(onLoadableDataChangedListener: OnLoadableDataChangedListener): LoadableMonitor {
        this.onLoadableDataChangedListener = onLoadableDataChangedListener
        return this
    }

    open fun withOptionalLoadables(vararg loadable2: Loadable): LoadableMonitor {
        Collections.addAll(this.optionalLoadables, loadable2)
        internal fun for(loadable2: Loadable loadable :):  {
            loadable.addLoadableStatusListener(this)
        }
        return this
    }
}
