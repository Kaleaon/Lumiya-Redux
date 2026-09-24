package com.lumiyaviewer.lumiya.slproto.users.manager;

import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.slproto.chat.SLChatTextEvent;
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent;
import com.lumiyaviewer.lumiya.slproto.users.manager.ObjectPopupsManager;
import com.lumiyaviewer.lumiya.slproto.users.manager.UnreadNotificationInfo;
import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicInteger;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public class ObjectPopupsManager {
    private static final int MAX_POPUPS = 99;

    @Nonnull
    private final UserManager userManager;
    private final SubscribableList<SLChatEvent> objectPopups = new SubscribableList<>();
    private final Object listenerLock = new Object();

    @Nullable
    private WeakReference<ObjectPopupListener> objectPopupListener = null;

    @Nullable
    private Executor objectPopupListenerExecutor = null;

    @Nullable
    private SLChatEvent displayedPopupEvent = null;

    @Nullable
    private SLChatEvent lastEvent = null;
    private boolean popupAnimated = false;
    private final AtomicInteger freshPopupsCount = new AtomicInteger(0);
    private final AtomicInteger unreadPopupCount = new AtomicInteger(0);
    private final Set<Object> popupWatchers = Collections.newSetFromMap(new WeakHashMap());

    public interface ObjectPopupListener {
        void onNewObjectPopup(SLChatEvent sLChatEvent);

        void onObjectPopupCountChanged(int i);
    }

    ObjectPopupsManager(@Nonnull UserManager userManager) {
        this.userManager = userManager;
    }

    private void addObjectPopupInternal(SLChatEvent sLChatEvent) {
        this.objectPopups.add(0, sLChatEvent);
        while (this.objectPopups.size() > 99) {
            try {
                this.objectPopups.remove(this.objectPopups.size() - 1);
            } catch (Exception e) {
                Debug.Warning(e);
            }
        }
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ObjectPopupsManager_8558, reason: not valid java name */
    static /* synthetic */ void m347xe63a07b1(ObjectPopupListener objectPopupListener) {
        objectPopupListener.onObjectPopupCountChanged(0);
        objectPopupListener.onNewObjectPopup(null);
    }

    private void notifyCountUpdated() {
        Executor executor;
        ObjectPopupListener objectPopupListener = null;
        synchronized (this.listenerLock) {
            if (this.objectPopupListener != null) {
                objectPopupListener = this.objectPopupListener.get();
                executor = this.objectPopupListenerExecutor;
            } else {
                executor = null;
            }
        }
        if (objectPopupListener != null) {
            final ObjectPopupListener listener = objectPopupListener;
            final int size = this.objectPopups.size();
            if (executor != null) {
                executor.execute(new Runnable() {
                    private final /* synthetic */ void $m$0() {
                        listener.onObjectPopupCountChanged(size);
                    }

                    @Override
                    public final void run() {
                        $m$0();
                    }
                });
            } else {
                objectPopupListener.onObjectPopupCountChanged(size);
            }
        }
    }

    void addObjectPopup(final SLChatEvent sLChatEvent) {
        Executor executor;
        boolean z = false;
        ObjectPopupListener objectPopupListener = null;
        synchronized (this.listenerLock) {
            if (this.objectPopupListener != null) {
                objectPopupListener = this.objectPopupListener.get();
                executor = this.objectPopupListenerExecutor;
                if (objectPopupListener != null && this.displayedPopupEvent == null) {
                    this.displayedPopupEvent = sLChatEvent;
                    this.popupAnimated = false;
                    z = true;
                }
            } else {
                executor = null;
            }
            if (!(!this.popupWatchers.isEmpty())) {
                this.freshPopupsCount.incrementAndGet();
                this.unreadPopupCount.incrementAndGet();
                this.lastEvent = sLChatEvent;
            }
        }
        if (!z) {
            addObjectPopupInternal(sLChatEvent);
            final int size = this.objectPopups.size();
            if (objectPopupListener != null) {
                final ObjectPopupListener listener = objectPopupListener;
                if (executor != null) {
                    executor.execute(new Runnable() {
                        private final /* synthetic */ void $m$0() {
                            listener.onObjectPopupCountChanged(size);
                        }

                        @Override
                        public final void run() {
                            $m$0();
                        }
                    });
                } else {
                    objectPopupListener.onObjectPopupCountChanged(size);
                }
            }
        } else if (executor != null) {
            final ObjectPopupListener listener = objectPopupListener;
            executor.execute(new Runnable() {
                private final /* synthetic */ void $m$0() {
                    listener.onNewObjectPopup(sLChatEvent);
                }

                @Override
                public final void run() {
                    $m$0();
                }
            });
        } else {
            objectPopupListener.onNewObjectPopup(sLChatEvent);
        }
        this.userManager.getUnreadNotificationManager().updateUnreadNotifications();
    }

    public void addPopupWatcher(Object obj) {
        synchronized (this.listenerLock) {
            this.popupWatchers.add(obj);
            this.freshPopupsCount.set(0);
            this.unreadPopupCount.set(0);
        }
        this.userManager.getUnreadNotificationManager().updateUnreadNotifications();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x001f A[Catch: all -> 0x0049, TRY_LEAVE, TryCatch #0 {, blocks: (B:23:0x0006, B:25:0x000a, B:27:0x0011, B:28:0x0019, B:5:0x001b, B:7:0x001f), top: B:22:0x0006 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void cancelObjectPopup(SLChatEvent sLChatEvent) {
        ObjectPopupListener listener = null;
        Executor executor = null;
        synchronized (this.listenerLock) {
            if (sLChatEvent != null) {
                if (sLChatEvent == this.displayedPopupEvent) {
                    this.displayedPopupEvent = null;
                    listener = this.objectPopupListener != null ? this.objectPopupListener.get() : null;
                    executor = this.objectPopupListenerExecutor;
                }
                if (sLChatEvent == this.lastEvent) {
                    this.lastEvent = null;
                }
            }
        }
        final ObjectPopupListener objectPopupListener = listener;
        if (objectPopupListener != null) {
            if (executor != null) {
                executor.execute(new Runnable() {
                    private final /* synthetic */ void $m$0() {
                        ((ObjectPopupsManager.ObjectPopupListener) objectPopupListener).onNewObjectPopup(null);
                    }

                    @Override
                    public final void run() {
                        $m$0();
                    }
                });
            } else {
                objectPopupListener.onNewObjectPopup(null);
            }
        }
        if (this.objectPopups.remove(sLChatEvent)) {
            notifyCountUpdated();
        }
        this.userManager.getUnreadNotificationManager().updateUnreadNotifications();
    }

    void clearObjectPopups() {
        final ObjectPopupListener objectPopupListener;
        Executor executor;
        synchronized (this.listenerLock) {
            this.displayedPopupEvent = null;
            objectPopupListener = this.objectPopupListener != null ? this.objectPopupListener.get() : null;
            executor = this.objectPopupListenerExecutor;
            this.unreadPopupCount.set(0);
            this.freshPopupsCount.set(0);
            this.lastEvent = null;
        }
        this.objectPopups.clear();
        if (objectPopupListener != null) {
            if (executor != null) {
                executor.execute(new Runnable() {
                    private final /* synthetic */ void $m$0() {
                        ObjectPopupsManager.m347xe63a07b1((ObjectPopupsManager.ObjectPopupListener) objectPopupListener);
                    }

                    @Override
                    public final void run() {
                        $m$0();
                    }
                });
            } else {
                objectPopupListener.onObjectPopupCountChanged(0);
                objectPopupListener.onNewObjectPopup(null);
            }
        }
        this.userManager.getUnreadNotificationManager().updateUnreadNotifications();
    }

    public void dismissDisplayedObjectPopup(SLChatEvent sLChatEvent) {
        synchronized (this.listenerLock) {
            if (sLChatEvent == this.displayedPopupEvent) {
                this.displayedPopupEvent = null;
            } else if (sLChatEvent == null) {
                sLChatEvent = this.displayedPopupEvent;
                this.displayedPopupEvent = null;
            } else {
                sLChatEvent = null;
            }
            this.freshPopupsCount.set(0);
            this.unreadPopupCount.set(0);
        }
        if (sLChatEvent != null) {
            addObjectPopupInternal(sLChatEvent);
            notifyCountUpdated();
        }
        this.userManager.getUnreadNotificationManager().updateUnreadNotifications();
    }

    public SLChatEvent getDisplayedObjectPopup() {
        SLChatEvent sLChatEvent;
        synchronized (this.listenerLock) {
            sLChatEvent = this.displayedPopupEvent;
        }
        return sLChatEvent;
    }

    @Nonnull
    UnreadNotificationInfo.ObjectPopupNotification getNotification(boolean z) {
        UnreadNotificationInfo.ObjectPopupNotification create;
        synchronized (this.listenerLock) {
            create = UnreadNotificationInfo.ObjectPopupNotification.create(z ? this.freshPopupsCount.getAndSet(0) : 0, this.unreadPopupCount.get(), this.lastEvent instanceof SLChatTextEvent ? UnreadNotificationInfo.ObjectPopupMessage.create(this.lastEvent.getSource().getSourceName(this.userManager), ((SLChatTextEvent) this.lastEvent).getRawText()) : null);
        }
        return create;
    }

    public int getObjectPopupCount() {
        return this.objectPopups.size();
    }

    public SubscribableList<SLChatEvent> getObjectPopups() {
        return this.objectPopups;
    }

    public boolean mustAnimatePopup(SLChatEvent sLChatEvent) {
        boolean z = false;
        synchronized (this.listenerLock) {
            if (sLChatEvent == this.displayedPopupEvent) {
                z = !this.popupAnimated;
                this.popupAnimated = true;
            }
        }
        return z;
    }

    public void removeObjectPopupListener(ObjectPopupListener objectPopupListener) {
        synchronized (this.listenerLock) {
            if (this.objectPopupListener != null && this.objectPopupListener.get() == objectPopupListener) {
                this.objectPopupListener = null;
                this.objectPopupListenerExecutor = null;
            }
        }
    }

    public void removePopupWatcher(Object obj) {
        synchronized (this.listenerLock) {
            this.popupWatchers.remove(obj);
        }
    }

    public void setObjectPopupListener(ObjectPopupListener objectPopupListener, @Nullable Executor executor) {
        synchronized (this.listenerLock) {
            this.objectPopupListener = new WeakReference<>(objectPopupListener);
            this.objectPopupListenerExecutor = executor;
        }
    }
}
