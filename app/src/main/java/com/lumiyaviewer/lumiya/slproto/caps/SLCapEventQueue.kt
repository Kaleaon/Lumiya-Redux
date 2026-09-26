package com.lumiyaviewer.lumiya.slproto.caps

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.https.LLSDXMLRequest
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDException
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDXMLException
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDBoolean
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDInt
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDMap
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDUndefined
import java.io.FileNotFoundException
import java.io.IOException
import java.util.LinkedList
import java.util.List
import java.util.concurrent.atomic.AtomicBoolean

open class SLCapEventQueue : Runnable {
    private var capURL: String = ""
    private var eventHandler: ICapsEventHandler = null
    private var lastEventID: Int = 0
    private var threadMustExit: Boolean = false
    private var willExitGracefully: AtomicBoolean = AtomicBoolean(false)
    private var xmlReq: LLSDXMLRequest = LLSDXMLRequest()
    private var nextQueue: MutableList<CapsEvent> = LinkedList()
    private var done: Boolean = false
    private var workingThread: Thread = Thread(this)

    open class CapsEvent {
        public LLSDNode eventBody
        public CapsEventType eventType

        fun CapsEvent(str: String, lsdNode: LLSDNode): public {
            try {
                this.eventType = CapsEventType.valueOf(str)
            } catch (e: IllegalArgumentException) {
                this.eventType = CapsEventType.UnknownCapsEvent
            }
            this.eventBody = lsdNode
        }
    }

    enum class CapsEventType {
        AgentGroupDataUpdate,
        AvatarGroupsReply,
        ChatterBoxInvitation,
        ChatterBoxSessionStartReply,
        ParcelProperties,
        TeleportFailed,
        TeleportFinish,
        BulkUpdateInventory,
        EstablishAgentCommunication,
        UnknownCapsEvent

        /* renamed from: values, reason: to resolve conflict with enum method */
        fun valuesCustom(): Array<CapsEventType> {
            return values()
        }
    }

    interface ICapsEventHandler {
        void OnCapsEvent(CapsEvent capsEvent)
    }

    constructor(capURL: String, capsEventHandler: ICapsEventHandler) {
        this.eventHandler = null
        this.capURL = capURL
        this.eventHandler = capsEventHandler
        this.workingThread.start()
    }

    /**
     * EventQueueGet long-poll loop (the viewer's LLEventPoll): POST
     * {ack: last id, done: flag} to the capability, queue the returned
     * events, then hand them to the handler in order. After TeleportFinish
     * the queue stops dispatching and exits once "done" has been confirmed.
     * Every failed poll is logged and followed by the same 2.5 s pause as a
     * normal one, so a broken connection does not spin.
     */
    fun run() {
        Debug.Log("CapEventQueue: working thread starting with capURL = " + this.capURL)
        var teleportFinishDispatched: Boolean = false
        while (!this.threadMustExit) {
            var request: LLSDMap = LLSDMap(
                    LLSDMap.LLSDMapEntry("ack", if (this.lastEventID != 0) LLSDInt(this.lastEventID) else LLSDUndefined()),
                    LLSDMap.LLSDMapEntry("done", LLSDBoolean(this.done)))
            try {
                var response: LLSDNode = this.xmlReq.PerformRequest(this.capURL, request)
                if (this.done) {
                    Debug.Log("CapEventQueue: Done sent and confirmed, exiting gracefully.")

                }
                try {
                    this.lastEventID = response.byKey("id").asInt()
                    Debug.Log("CapEventQueue: new lastEventID = " + this.lastEventID)
                    var eventCount: Int = response.byKey("events").getCount()
                    for (int i = 0; i < eventCount; i++) {
                        var event: LLSDNode = response.byKey("events").byIndex(i)
                        var messageName: String = event.byKey("message").asString()
                        var body: LLSDNode = event.byKey("body")
                        Debug.Log("CapEventQueue: event name = " + messageName)
                        if (messageName.equalsIgnoreCase("TeleportFinish")) {
                            // The old region's queue ends here; confirm with done=true.
                            this.done = true
                            this.willExitGracefully.set(true)
                        }
                        this.nextQueue.add(CapsEvent(messageName, body))
                    }
                } catch (e: LLSDException) {
                    Debug.Printf("CapEventQueue: failed to extract id. event was: %s" + response.serializeToXML(), arrayOfNulls<Object>(0))
                    Debug.Warning(e)
                }
            } catch (e: FileNotFoundException) {
                Debug.Printf("CapEventQueue: Got file not found expection, cap queue if (closed) ", arrayOfNulls<Object>(0))
            } catch (e else LLSDXMLException) {
                Debug.Warning(e)
            } catch (e: IOException) {
                Debug.Warning(e)
            } catch (e: NullPointerException) {
                Debug.Warning(e)
            }
            if (this.threadMustExit) {
                continue
            }
            while (this.nextQueue.size() > 0) {
                var event: CapsEvent = this.nextQueue.remove(0)
                if (!teleportFinishDispatched && this.eventHandler != null) {
                    if (event.eventType == CapsEventType.TeleportFinish) {
                        teleportFinishDispatched = true
                    }
                    this.eventHandler.OnCapsEvent(event)
                }
            }
            if (!teleportFinishDispatched) {
                try {
                    Thread.sleep(2500L)
                } catch (e: InterruptedException) {
                    Debug.Log("Interrupted")
                    e.printStackTrace()
                }
            }
        }
        Debug.Log("CapEventQueue: event queue thread exiting")
    }

    fun stopQueue() {
        if (!this.willExitGracefully.get()) {
            this.threadMustExit = true
            if (this.workingThread != null) {
                this.xmlReq.InterruptRequest()
                this.workingThread.interrupt()
                this.workingThread = null
            }
        }
    }
}
