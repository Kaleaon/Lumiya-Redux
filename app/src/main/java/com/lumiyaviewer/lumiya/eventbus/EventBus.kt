package com.lumiyaviewer.lumiya.eventbus

import android.app.Activity
import android.os.Handler
import java.lang.ref.WeakReference
import java.lang.reflect.Method
import java.util.LinkedList

class EventBus private constructor() {
    private val handlers: MutableList<HandlerInfo> = LinkedList()

    private class EventInvocation(
        private val event: Any,
        private val activity: Activity?,
        private val subscriber: Any,
        private val method: Method,
        private val handler: Handler?
    ) : Runnable {

        override fun run() {
            try {
                method.invoke(subscriber, event)
            } catch (_: Exception) {
            }
        }

        fun runOnUIThread() {
            when {
                activity != null -> activity.runOnUiThread(this)
                handler != null -> handler.post(this)
                else -> run()
            }
        }
    }

    private class HandlerInfo(
        private val eventClass: Class<*>,
        private val method: Method,
        subscriber: Any,
        activity: Activity?,
        handler: Handler?
    ) {
        private val subscriber: WeakReference<Any> = WeakReference(subscriber)
        private val activity: WeakReference<Activity?> = WeakReference(activity)
        private val handler: WeakReference<Handler?> = WeakReference(handler)

        fun getActivity(): Activity? = activity.get()
        fun getHandler(): Handler? = handler.get()
        fun getMethod(): Method = method
        fun getSubscriber(): Any? = subscriber.get()

        fun matchesEvent(obj: Any?): Boolean {
            return obj != null && obj.javaClass == eventClass
        }
    }

    private object InstanceHolder {
        val Instance = EventBus()
    }

    @Synchronized
    fun publish(obj: Any) {
        val toRemove = LinkedList<HandlerInfo>()
        for (handlerInfo in handlers) {
            if (handlerInfo.matchesEvent(obj)) {
                val subscriber = handlerInfo.getSubscriber()
                val activity = handlerInfo.getActivity()
                if (subscriber == null) {
                    toRemove.add(handlerInfo)
                } else {
                    EventInvocation(obj, activity, subscriber, handlerInfo.getMethod(), handlerInfo.getHandler())
                        .runOnUIThread()
                }
            }
        }
        for (info in toRemove) {
            handlers.remove(info)
        }
    }

    @Synchronized
    fun subscribe(activity: Activity) {
        subscribe(activity as Any, activity)
    }

    @Synchronized
    fun subscribe(obj: Any) {
        if (obj is Activity) {
            subscribe(obj, obj)
        } else {
            subscribe(obj, null)
        }
    }

    @Synchronized
    fun subscribe(obj: Any, activity: Activity?) {
        subscribe(obj, activity, null)
    }

    @Synchronized
    fun subscribe(obj: Any, activity: Activity?, handler: Handler?) {
        val toRemove = LinkedList<HandlerInfo>()
        for (handlerInfo in handlers) {
            val subscriber = handlerInfo.getSubscriber()
            if (subscriber === obj) {
                return
            }
            if (subscriber == null) {
                toRemove.add(handlerInfo)
            }
        }
        for (info in toRemove) {
            handlers.remove(info)
        }
        for (method in obj.javaClass.methods) {
            if (method.getAnnotation(EventHandler::class.java) != null) {
                val parameterTypes = method.parameterTypes
                if (parameterTypes.size != 1) {
                    throw IllegalArgumentException("EventHandler methods must specify a single Object paramter.")
                }
                handlers.add(HandlerInfo(parameterTypes[0], method, obj, activity, handler))
            }
        }
    }

    @Synchronized
    fun unsubscribe(obj: Any) {
        val toRemove = LinkedList<HandlerInfo>()
        for (handlerInfo in handlers) {
            val subscriber = handlerInfo.getSubscriber()
            if (subscriber == null || subscriber === obj) {
                toRemove.add(handlerInfo)
            }
        }
        for (info in toRemove) {
            handlers.remove(info)
        }
    }

    @Synchronized
    fun unsubscribeActivity(activity: Activity) {
        val toRemove = LinkedList<HandlerInfo>()
        for (handlerInfo in handlers) {
            if (handlerInfo.getActivity() === activity) {
                toRemove.add(handlerInfo)
            }
        }
        for (info in toRemove) {
            handlers.remove(info)
        }
    }

    companion object {
        @JvmStatic
        fun getInstance(): EventBus = InstanceHolder.Instance
    }
}
