package com.lumiyaviewer.lumiya.ui.common.loadmon;

import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;
import com.google.common.base.Strings;
import com.lumiyaviewer.lumiya.react.RefreshableOne;
import com.lumiyaviewer.lumiya.react.UnsubscribableOne;
import com.lumiyaviewer.lumiya.ui.common.LoadingLayout;
import com.lumiyaviewer.lumiya.ui.common.loadmon.Loadable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public class LoadableMonitor implements Loadable.LoadableStatusListener, SwipeRefreshLayout.OnRefreshListener {

    private final List<Loadable> loadables = new ArrayList();
    private final List<Loadable> optionalLoadables = new ArrayList();

    @Nonnull
    private Loadable.Status status = Loadable.Status.Idle;

    @Nullable
    private OnLoadableDataChangedListener onLoadableDataChangedListener = null;

    @Nullable
    private LoadingLayout loadingLayout = null;

    @Nullable
    private SwipeRefreshLayout swipeRefreshLayout = null;

    @Nullable
    private String loadingIdleMessage = null;

    @Nullable
    private String loadingErrorMessage = null;

    @Nullable
    private String emptyMessage = null;
    private boolean isExtraLoading = false;

    public interface OnLoadableDataChangedListener {
        void onLoadableDataChanged();
    }

    public LoadableMonitor(Loadable... loadable) {
        Collections.addAll(this.loadables, loadable);
        Iterator<Loadable> it = this.loadables.iterator();
        while (it.hasNext()) {
            ((Loadable) it.next()).addLoadableStatusListener(this);
        }
    }

    private void updateLoadingIndicator() {
        if (this.loadingLayout != null) {
            switch (this.status) {
                case Error:
                    this.loadingLayout.showMessage(Strings.nullToEmpty(this.loadingErrorMessage));
                    break;
                case Idle:
                    this.loadingLayout.showMessage(Strings.nullToEmpty(this.loadingIdleMessage));
                    break;
                case Loaded:
                    this.loadingLayout.showContent(this.emptyMessage);
                    break;
                case Loading:
                    this.loadingLayout.showLoading();
                    break;
            }
        }
    }

    @Override
    public void onLoadableStatusChange(Loadable loadable, Loadable.Status status) {
        Iterator<Loadable> it = this.loadables.iterator();
        boolean z = false;
        boolean z2 = false;
        boolean z3 = false;
        while (it.hasNext()) {
            Loadable.Status loadableStatus = ((Loadable) it.next()).getLoadableStatus();
            switch (loadableStatus) {
                case Error:
                    z2 = true;
                    break;
                case Loading:
                    z3 = true;
                    break;
            }
            z = loadableStatus != Loadable.Status.Loaded ? true : z;
        }
        Loadable.Status status2 = (z3 || this.isExtraLoading) ? Loadable.Status.Loading : z2 ? Loadable.Status.Error : !z ? Loadable.Status.Loaded : Loadable.Status.Idle;
        if (status2 != this.status) {
            this.status = status2;
            updateLoadingIndicator();
        }
        if (!z3 && this.swipeRefreshLayout != null) {
            this.swipeRefreshLayout.setRefreshing(false);
        }
        if (this.status != Loadable.Status.Loaded || this.onLoadableDataChangedListener == null) {
            return;
        }
        this.onLoadableDataChangedListener.onLoadableDataChanged();
    }

    @Override
    public void onRefresh() {
        for (Loadable loadable : this.loadables) {
            if (loadable instanceof RefreshableOne) {
                ((RefreshableOne) loadable).requestRefresh();
            }
        }
        for (Loadable loadable2 : this.optionalLoadables) {
            if (loadable2 instanceof RefreshableOne) {
                ((RefreshableOne) loadable2).requestRefresh();
            }
        }
    }

    public void setButteryProgressBar(boolean butteryProgressBar) {
        if (this.loadingLayout != null) {
            this.loadingLayout.setButteryProgressBar(butteryProgressBar);
        }
    }

    public void setEmptyMessage(boolean z, @Nullable String emptyMessage) {
        if (!z) {
            emptyMessage = null;
        }
        this.emptyMessage = emptyMessage;
        updateLoadingIndicator();
    }

    public void setExtraLoading(boolean isExtraLoading) {
        this.isExtraLoading = isExtraLoading;
        onLoadableStatusChange(null, null);
    }

    public void setLoadingLayout(@Nullable LoadingLayout loadingLayout, @Nullable String loadingIdleMessage, @Nullable String loadingErrorMessage) {
        this.loadingLayout = loadingLayout;
        this.loadingIdleMessage = loadingIdleMessage;
        this.loadingErrorMessage = loadingErrorMessage;
        updateLoadingIndicator();
    }

    public void setSwipeRefreshLayout(@Nullable SwipeRefreshLayout swipeRefreshLayout) {
        this.swipeRefreshLayout = swipeRefreshLayout;
        if (swipeRefreshLayout != null) {
            swipeRefreshLayout.setOnRefreshListener(this);
        }
    }

    public void unsubscribeAll() {
        for (Loadable loadable : this.loadables) {
            if (loadable instanceof UnsubscribableOne) {
                ((UnsubscribableOne) loadable).unsubscribe();
            }
        }
        for (Loadable loadable2 : this.optionalLoadables) {
            if (loadable2 instanceof UnsubscribableOne) {
                ((UnsubscribableOne) loadable2).unsubscribe();
            }
        }
    }

    public LoadableMonitor withDataChangedListener(OnLoadableDataChangedListener onLoadableDataChangedListener) {
        this.onLoadableDataChangedListener = onLoadableDataChangedListener;
        return this;
    }

    public LoadableMonitor withOptionalLoadables(Loadable... loadable2) {
        Collections.addAll(this.optionalLoadables, loadable2);
        for (Loadable loadable : loadable2) {
            loadable.addLoadableStatusListener(this);
        }
        return this;
    }
}
