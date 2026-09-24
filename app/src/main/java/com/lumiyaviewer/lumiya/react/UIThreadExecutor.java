package com.lumiyaviewer.lumiya.react;

import android.os.Handler;
import android.os.Looper;
import com.lumiyaviewer.lumiya.Debug;
import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import javax.annotation.Nonnull;

public class UIThreadExecutor implements Executor {
    private final Lock lock = new ReentrantLock();
    private final AtomicBoolean runnablePosted = new AtomicBoolean(false);
    private final Looper mainLooper = Looper.getMainLooper();
    private final Handler handler = new Handler(this.mainLooper);
    private final Queue<Runnable> queue = new ConcurrentLinkedQueue();
    private final Executor serialExecutor = new Executor() {
        @Override
        public void execute(@Nonnull Runnable runnable) {
            try {
                UIThreadExecutor.this.lock.lock();
                UIThreadExecutor.this.queue.add(runnable);
                if (!UIThreadExecutor.this.runnablePosted.getAndSet(true)) {
                    UIThreadExecutor.this.handler.post(UIThreadExecutor.this.queueRunnable);
                }
            } finally {
                UIThreadExecutor.this.lock.unlock();
            }
        }
    };
    private final Runnable queueRunnable = this::m57lambda$com_lumiyaviewer_lumiya_react_UIThreadExecutor_2348;

    private static class InstanceHolder {
        private static final UIThreadExecutor Instance = new UIThreadExecutor();

        private InstanceHolder() {
        }
    }

    @Nonnull
    public static Executor getInstance() {
        return InstanceHolder.Instance;
    }

    @Nonnull
    public static Executor getSerialInstance() {
        return InstanceHolder.Instance.serialExecutor;
    }

    @Override
    public void execute(@Nonnull Runnable runnable) {
        try {
            this.lock.lock();
            if (Looper.myLooper() == this.mainLooper && this.queue.isEmpty()) {
                try {
                    this.lock.unlock();
                    try {
                        runnable.run();
                    } catch (Exception e) {
                        Debug.Warning(e);
                    }
                } finally {
                    this.lock.lock();
                }
            } else {
                this.queue.add(runnable);
                if (!this.runnablePosted.getAndSet(true)) {
                    this.handler.post(this.queueRunnable);
                }
            }
        } finally {
            this.lock.unlock();
        }
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_react_UIThreadExecutor_2348, reason: not valid java name */
    /* synthetic */ void m57lambda$com_lumiyaviewer_lumiya_react_UIThreadExecutor_2348() {
        try {
            this.lock.lock();
            this.runnablePosted.set(false);
            while (true) {
                Runnable poll = this.queue.poll();
                if (poll == null) {
                    return;
                }
                try {
                    this.lock.unlock();
                    try {
                        poll.run();
                    } catch (Exception e) {
                        Debug.Warning(e);
                    }
                } finally {
                }
            }
        } finally {
            this.lock.unlock();
        }
    }
}
