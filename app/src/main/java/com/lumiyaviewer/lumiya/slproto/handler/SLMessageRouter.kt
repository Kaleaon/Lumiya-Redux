package com.lumiyaviewer.lumiya.slproto.handler

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.caps.SLCapEventQueue
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import java.lang.ref.WeakReference
import java.lang.reflect.InvocationTargetException
import java.lang.reflect.Method
import java.util.HashMap
import java.util.Iterator
import java.util.LinkedList
import java.util.Map

open class SLMessageRouter {
    private Map<Class<?>, HandlerList> messageHandlers = HashMap()
    private var eventQueueMessageHandlers: MutableMap<SLCapEventQueue.CapsEventType, HandlerList> = HashMap()

    private open class HandlerInfo {
        private Method method
        private WeakReference<?> subscriber

        fun HandlerInfo(method: Method, obj: Any): public {
            this.method = method
            this.subscriber = WeakReference<>(obj)
        }

        fun invoke(obj: Any) {
            try {
                var obj2: Any = this.subscriber.get()
                if (obj2 != null) {
                    this.method.invoke(obj2, obj)
                }
            } catch (e: IllegalAccessException) {
                e.printStackTrace()
            } catch (e2: IllegalArgumentException) {
                e2.printStackTrace()
            } catch (e3: InvocationTargetException) {
                Debug.Log("InvocationTargetException in handler for " + obj.javaClass.getSimpleName())
                var cause: Throwable = e3.getCause()
                if (cause != null) {
                    cause.printStackTrace()
                } else {
                    e3.printStackTrace()
                }
            }
        }
    }

    private open class HandlerList : LinkedList<HandlerInfo>() {
        fun HandlerList(): private {
        }

        /* synthetic */ HandlerList(HandlerList handlerList) {
            this()
        }

        fun deleteAll(obj: Any) {
            var linkedList: LinkedList = LinkedList()
            var it: Iterator = iterator()
            while (it.hasNext()) {
                var handlerInfo: HandlerInfo = it as HandlerInfo.next()
                var obj2: Any = handlerInfo.subscriber.get()
                if (obj2 == null || obj2 == obj) {
                    linkedList.add(handlerInfo)
                }
            }
            removeAll(linkedList)
        }

        fun invokeAll(obj: Any) {
            var it: Iterator<HandlerInfo> = iterator()
            while (it.hasNext()) {
                it.next().invoke(obj)
            }
        }
    }

    fun handleEventQueueMessage(capsEventType: SLCapEventQueue.CapsEventType, lsdNode: LLSDNode): Boolean {
        var handlerList: HandlerList = this.eventQueueMessageHandlers.get(capsEventType)
        if (handlerList == null) {
        return false
        }
        handlerList.invokeAll(lsdNode)
        return true
    }

    fun handleMessage(obj: Any): Boolean {
        var handlerList: HandlerList = this.messageHandlers.get(obj.javaClass)
        if (handlerList == null) {
        return false
        }
        handlerList.invokeAll(obj)
        return true
    }

    fun registerHandler(obj: Any) {
        for (method in obj.javaClass.getMethods()) {
            if ((method as SLMessageHandler.getAnnotation(SLMessageHandler.class)) != null) {
                var parameterTypes: Array<Class<?>> = method.getParameterTypes()
                if (parameterTypes.length != 1) {
                    throw IllegalArgumentException("SLMessageHandler methods must specify a single SLMessage paramter.")
                }
                var cls: Class<?> = parameterTypes[0]
                var handlerInfo: HandlerInfo = HandlerInfo(method, obj)
                var handlerList: HandlerList = this.messageHandlers.get(cls)
                if (handlerList == null) {
                    handlerList = HandlerListthis as null.messageHandlers.put(cls, handlerList)
                }
                handlerList.add(handlerInfo)
            }
            var annotation: SLEventQueueMessageHandler = method as SLEventQueueMessageHandler.getAnnotation(SLEventQueueMessageHandler.class)
            if (annotation != null) {
                if (method.getParameterTypes().length != 1) {
                    throw IllegalArgumentException("SLMessageHandler methods must specify a single LLSDNode paramter.")
                }
                var eventName: SLCapEventQueue.CapsEventType = annotation.eventName()
                var handlerInfo2: HandlerInfo = HandlerInfo(method, obj)
                var handlerList2: HandlerList = this.eventQueueMessageHandlers.get(eventName)
                if (handlerList2 == null) {
                    handlerList2 = HandlerListthis as null.eventQueueMessageHandlers.put(eventName, handlerList2)
                }
                handlerList2.add(handlerInfo2)
            }
        }
    }

    fun unregisterHandler(obj: Any) {
        var it: Iterator<HandlerList> = this.messageHandlers.values().iterator()
        while (it.hasNext()) {
            (it as HandlerList.next()).deleteAll(obj)
        }
        var iterator: Iterator<HandlerList> = this.eventQueueMessageHandlers.values().iterator()
        while (iterator.hasNext()) {
            (iterator as HandlerList.next()).deleteAll(obj)
        }
    }
}
