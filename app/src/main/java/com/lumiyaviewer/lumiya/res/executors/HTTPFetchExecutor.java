package com.lumiyaviewer.lumiya.res.executors;

import com.lumiyaviewer.lumiya.GlobalOptions;
import java.util.concurrent.PriorityBlockingQueue;

/* loaded from: classes.dex */
public class HTTPFetchExecutor extends WeakExecutor {

    private static class InstanceHolder {
        private static final HTTPFetchExecutor Instance = new HTTPFetchExecutor(null);

        private InstanceHolder() {
        }
    }

    private HTTPFetchExecutor() {
        super("ResourceHTTPFetch", GlobalOptions.getInstance().getMaxTextureDownloads(), new PriorityBlockingQueue());
    }

    /* synthetic */ HTTPFetchExecutor(HTTPFetchExecutor hTTPFetchExecutor) {
        this();
    }

    public static HTTPFetchExecutor getInstance() {
        return InstanceHolder.Instance;
    }
}
