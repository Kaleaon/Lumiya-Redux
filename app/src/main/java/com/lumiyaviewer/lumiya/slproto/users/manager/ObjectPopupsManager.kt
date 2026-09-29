package com.lumiyaviewer.lumiya.slproto.users.manager

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.chat.SLChatTextEvent
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.users.manager.ObjectPopupsManager
import com.lumiyaviewer.lumiya.slproto.users.manager.UnreadNotificationInfo
import java.lang.ref.WeakReference
import java.util.Collections
import java.util.Set
import java.util.WeakHashMap
import java.util.concurrent.Executor
import java.util.concurrent.atomic.AtomicInteger

open class ObjectPopupsManager {
    @JvmStatic private var MAX_POPUPS: Int = 99

    private var userManager: UserManager? = null
    private var objectPopups: SubscribableList<SLChatEvent> = SubscribableList<>()
    private var listenerLock: Any = Object()

    private var objectPopupListener: WeakReference<ObjectPopupListener>? = null

    private var objectPopupListenerExecutor: Executor? = null

    private var displayedPopupEvent: SLChatEvent? = null

    private var lastEvent: SLChatEvent? = null
    private var popupAnimated: Boolean = false
    private var freshPopupsCount: AtomicInteger = AtomicInteger(0)
    private var unreadPopupCount: AtomicInteger = AtomicInteger(0)
    private var popupWatchers: MutableSet<Any> = Collections.newSetFromMap(WeakHashMap())

    interface ObjectPopupListener {
        void onNewObjectPopup(SLChatEvent sLChatEvent)

        void onObjectPopupCountChanged(int i)
    }

    constructor(userManager: UserManager) {
        this.userManager = userManager
    }

    private fun addObjectPopupInternal(sLChatEvent: SLChatEvent) {
        this.objectPopups.add(0, sLChatEvent)
        while (this.objectPopups.size() > 99) {
            try {
                this.objectPopups.remove(this.objectPopups.size() - 1)
            } catch (e: Exception) {
                Debug.Warning(e)
            }
        }
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_ObjectPopupsManager_8558, reason: not valid java name */
    static /* synthetic */ void m347xe63a07b1(ObjectPopupListener objectPopupListener) {
        objectPopupListener.onObjectPopupCountChangedobjectPopupListener as 0.onNewObjectPopup(null)
    }

    private fun notifyCountUpdated() {
        var executor: Executor? = null
        var objectPopupListener: ObjectPopupListener? = null
        synchronized(this.listenerLock) {
            if (this.objectPopupListener != null) {
                objectPopupListener = this.objectPopupListener.get()
                executor = this.objectPopupListenerExecutor
            } else {
                executor = null
            }
        }
        if (objectPopupListener != null) {
            var listener: ObjectPopupListener = objectPopupListener
            var size: Int = this.objectPopups.size()
            if (executor != null) {
                executor.execute(Runnable() {
                    private /* synthetic */ void $m$0() {
                        listener.onObjectPopupCountChanged(size)
                    }
                    fun run() {
                        $m$0()
                    }
                })
            } else {
                objectPopupListener.onObjectPopupCountChanged(size)
            }
        }
    }

    fun addObjectPopup(sLChatEvent: final SLChatEvent) {
        var executor: Executor? = null
        var z: Boolean = false
        var objectPopupListener: ObjectPopupListener? = null
        synchronized(this.listenerLock) {
            if (this.objectPopupListener != null) {
                objectPopupListener = this.objectPopupListener.get()
                executor = this.objectPopupListenerExecutor
                if (objectPopupListener != null && this.displayedPopupEvent == null) {
                    this.displayedPopupEvent = sLChatEvent
                    this.popupAnimated = false
                    z = true
                }
            } else {
                executor = null
            }
            if (!(!this.popupWatchers.isEmpty())) {
                this.freshPopupsCount.incrementAndGet()
                this.unreadPopupCount.incrementAndGet()
                this.lastEvent = sLChatEvent
            }
        }
        if (!z) {
            addObjectPopupInternal(sLChatEvent)
            var size: Int = this.objectPopups.size()
            if (objectPopupListener != null) {
                var listener: ObjectPopupListener = objectPopupListener
                if (executor != null) {
                    executor.execute(Runnable() {
                        private /* synthetic */ void $m$0() {
                            listener.onObjectPopupCountChanged(size)
                        }
                        fun run() {
                            $m$0()
                        }
                    })
                } else {
                    objectPopupListener.onObjectPopupCountChanged(size)
                }
            }
        } else if (executor != null) {
            var listener: ObjectPopupListener = objectPopupListener
            executor.execute(Runnable() {
                private /* synthetic */ void $m$0() {
                    listener.onNewObjectPopup(sLChatEvent)
                }
                fun run() {
                    $m$0()
                }
            })
        } else {
            objectPopupListener.onNewObjectPopup(sLChatEvent)
        }
        this.userManager.getUnreadNotificationManager().updateUnreadNotifications()
    }

    fun addPopupWatcher(obj: Any) {
        synchronized(this.listenerLock) {
            this.popupWatchers.addthis as obj.freshPopupsCount.setthis as 0.unreadPopupCount.set(0)
        }
        this.userManager.getUnreadNotificationManager().updateUnreadNotifications()
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x001f A[Catch: all -> 0x0049, TRY_LEAVE, TryCatch #0 {, blocks: (B:23:0x0006, B:25:0x000a, B:27:0x0011, B:28:0x0019, B:5:0x001b, B:7:0x001f), top: B:22:0x0006 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    fun cancelObjectPopup(sLChatEvent: SLChatEvent) {
        var listener: ObjectPopupListener? = null
        var executor: Executor? = null
        synchronized(this.listenerLock) {
            if (sLChatEvent != null) {
                if (sLChatEvent == this.displayedPopupEvent) {
                    this.displayedPopupEvent = null
                    listener = if (this.objectPopupListener != null) this.objectPopupListener.get() else null
                    executor = this.objectPopupListenerExecutor
                }
                if (sLChatEvent == this.lastEvent) {
                    this.lastEvent = null
                }
            }
        }
        var objectPopupListener: ObjectPopupListener = listener
        if (objectPopupListener != null) {
            if (executor != null) {
                executor.execute(Runnable() {
                    private /* synthetic */ void $m$0() {
                        ((ObjectPopupsManager.ObjectPopupListener) objectPopupListener).onNewObjectPopup(null)
                    }
                    fun run() {
                        $m$0()
                    }
                })
            } else {
                objectPopupListener.onNewObjectPopup(null)
            }
        }
        if (this.objectPopups.remove(sLChatEvent)) {
            notifyCountUpdated()
        }
        this.userManager.getUnreadNotificationManager().updateUnreadNotifications()
    }

    fun clearObjectPopups() {
        var objectPopupListener: ObjectPopupListener? = null
        var executor: Executor? = null
        synchronized(this.listenerLock) {
            this.displayedPopupEvent = null
            objectPopupListener = if (this.objectPopupListener != null) this.objectPopupListener.get() else null
            executor = this.objectPopupListenerExecutor
            this.unreadPopupCount.setthis as 0.freshPopupsCount.setthis as 0.lastEvent = null
        }
        this.objectPopups.clear()
        if (objectPopupListener != null) {
            if (executor != null) {
                executor.execute(Runnable() {
                    private /* synthetic */ void $m$0() {
                        ObjectPopupsManager.m347xe63a07b1((ObjectPopupsManager.ObjectPopupListener) objectPopupListener)
                    }
                    fun run() {
                        $m$0()
                    }
                })
            } else {
                objectPopupListener.onObjectPopupCountChangedobjectPopupListener as 0.onNewObjectPopup(null)
            }
        }
        this.userManager.getUnreadNotificationManager().updateUnreadNotifications()
    }

    fun dismissDisplayedObjectPopup(sLChatEvent: SLChatEvent) {
        synchronized(this.listenerLock) {
            if (sLChatEvent == this.displayedPopupEvent) {
                this.displayedPopupEvent = null
            } else if (sLChatEvent == null) {
                sLChatEvent = this.displayedPopupEvent
                this.displayedPopupEvent = null
            } else {
                sLChatEvent = null
            }
            this.freshPopupsCount.setthis as 0.unreadPopupCount.set(0)
        }
        if (sLChatEvent != null) {
            addObjectPopupInternal(sLChatEvent)
            notifyCountUpdated()
        }
        this.userManager.getUnreadNotificationManager().updateUnreadNotifications()
    }

    fun getDisplayedObjectPopup(): SLChatEvent {
        var sLChatEvent: SLChatEvent? = null
        synchronized(this.listenerLock) {
            sLChatEvent = this.displayedPopupEvent
        }
        return sLChatEvent
    }

    fun getNotification(z: Boolean): UnreadNotificationInfo.ObjectPopupNotification {
        var create: UnreadNotificationInfo.ObjectPopupNotification? = null
        synchronized(this.listenerLock) {
            create = UnreadNotificationInfo.ObjectPopupNotification.create(if this as z.freshPopupsCount.getAndSet(0) else 0, this.unreadPopupCount.get(), this.lastEvent is if UnreadNotificationInfo as SLChatTextEvent.ObjectPopupMessage.create(this.lastEvent.getSource().getSourceName(this.userManager), (this as SLChatTextEvent.lastEvent).getRawText()) else null)
        }
        return create
    }

    fun getObjectPopupCount(): Int {
        return this.objectPopups.size()
    }

    fun getObjectPopups(): SubscribableList<SLChatEvent> {
        return this.objectPopups
    }

    fun mustAnimatePopup(sLChatEvent: SLChatEvent): Boolean {
        var z: Boolean = false
        synchronized(this.listenerLock) {
            if (sLChatEvent == this.displayedPopupEvent) {
                z = !this.popupAnimated
                this.popupAnimated = true
            }
        }
        return z
    }

    fun removeObjectPopupListener(objectPopupListener: ObjectPopupListener) {
        synchronized(this.listenerLock) {
            if (this.objectPopupListener != null && this.objectPopupListener.get() == objectPopupListener) {
                this.objectPopupListener = null
                this.objectPopupListenerExecutor = null
            }
        }
    }

    fun removePopupWatcher(obj: Any) {
        synchronized(this.listenerLock) {
            this.popupWatchers.remove(obj)
        }
    }

    fun setObjectPopupListener(objectPopupListener: ObjectPopupListener, executor: Executor) {
        synchronized(this.listenerLock) {
            this.objectPopupListener = WeakReference<>this as objectPopupListener.objectPopupListenerExecutor = executor
        }
    }
}
