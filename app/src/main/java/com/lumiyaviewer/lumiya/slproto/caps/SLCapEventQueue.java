package com.lumiyaviewer.lumiya.slproto.caps;

import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.slproto.https.LLSDXMLRequest;
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDException;
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode;
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDXMLException;
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDBoolean;
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDInt;
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDMap;
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDUndefined;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

public class SLCapEventQueue implements Runnable {
    private String capURL;
    private ICapsEventHandler eventHandler;
    private int lastEventID = 0;
    private boolean threadMustExit = false;
    private AtomicBoolean willExitGracefully = new AtomicBoolean(false);
    private LLSDXMLRequest xmlReq = new LLSDXMLRequest();
    private List<CapsEvent> nextQueue = new LinkedList();
    private boolean done = false;
    private Thread workingThread = new Thread(this);

    public static class CapsEvent {
        public LLSDNode eventBody;
        public CapsEventType eventType;

        public CapsEvent(String str, LLSDNode lLSDNode) {
            try {
                this.eventType = CapsEventType.valueOf(str);
            } catch (IllegalArgumentException e) {
                this.eventType = CapsEventType.UnknownCapsEvent;
            }
            this.eventBody = lLSDNode;
        }
    }

    public enum CapsEventType {
        AgentGroupDataUpdate,
        AvatarGroupsReply,
        ChatterBoxInvitation,
        ChatterBoxSessionStartReply,
        ParcelProperties,
        TeleportFailed,
        TeleportFinish,
        BulkUpdateInventory,
        EstablishAgentCommunication,
        UnknownCapsEvent;

        /* renamed from: values, reason: to resolve conflict with enum method */
        public static CapsEventType[] valuesCustom() {
            return values();
        }
    }

    public interface ICapsEventHandler {
        void OnCapsEvent(CapsEvent capsEvent);
    }

    public SLCapEventQueue(String str, ICapsEventHandler iCapsEventHandler) {
        this.eventHandler = null;
        this.capURL = str;
        this.eventHandler = iCapsEventHandler;
        this.workingThread.start();
    }

    /**
     * EventQueueGet long-poll loop (the viewer's LLEventPoll): POST
     * {ack: last id, done: flag} to the capability, queue the returned
     * events, then hand them to the handler in order. After TeleportFinish
     * the queue stops dispatching and exits once "done" has been confirmed.
     * Every failed poll is logged and followed by the same 2.5 s pause as a
     * normal one, so a broken connection does not spin.
     */
    @Override
    public void run() {
        Debug.Log("CapEventQueue: working thread starting with capURL = " + this.capURL);
        boolean teleportFinishDispatched = false;
        while (!this.threadMustExit) {
            LLSDMap request = new LLSDMap(
                    new LLSDMap.LLSDMapEntry("ack", this.lastEventID != 0 ? new LLSDInt(this.lastEventID) : new LLSDUndefined()),
                    new LLSDMap.LLSDMapEntry("done", new LLSDBoolean(this.done)));
            try {
                LLSDNode response = this.xmlReq.PerformRequest(this.capURL, request);
                if (this.done) {
                    Debug.Log("CapEventQueue: Done sent and confirmed, exiting gracefully.");
                    break;
                }
                try {
                    this.lastEventID = response.byKey("id").asInt();
                    Debug.Log("CapEventQueue: new lastEventID = " + this.lastEventID);
                    int eventCount = response.byKey("events").getCount();
                    for (int i = 0; i < eventCount; i++) {
                        LLSDNode event = response.byKey("events").byIndex(i);
                        String messageName = event.byKey("message").asString();
                        LLSDNode body = event.byKey("body");
                        Debug.Log("CapEventQueue: event name = " + messageName);
                        if (messageName.equalsIgnoreCase("TeleportFinish")) {
                            // The old region's queue ends here; confirm with done=true.
                            this.done = true;
                            this.willExitGracefully.set(true);
                        }
                        this.nextQueue.add(new CapsEvent(messageName, body));
                    }
                } catch (LLSDException e) {
                    Debug.Printf("CapEventQueue: failed to extract id. event was: %s" + response.serializeToXML(), new Object[0]);
                    Debug.Warning(e);
                }
            } catch (FileNotFoundException e) {
                Debug.Printf("CapEventQueue: Got file not found expection, cap queue closed?", new Object[0]);
            } catch (LLSDXMLException e) {
                Debug.Warning(e);
            } catch (IOException e) {
                Debug.Warning(e);
            } catch (NullPointerException e) {
                Debug.Warning(e);
            }
            if (this.threadMustExit) {
                continue;
            }
            while (this.nextQueue.size() > 0) {
                CapsEvent event = this.nextQueue.remove(0);
                if (!teleportFinishDispatched && this.eventHandler != null) {
                    if (event.eventType == CapsEventType.TeleportFinish) {
                        teleportFinishDispatched = true;
                    }
                    this.eventHandler.OnCapsEvent(event);
                }
            }
            if (!teleportFinishDispatched) {
                try {
                    Thread.sleep(2500L);
                } catch (InterruptedException e) {
                    Debug.Log("Interrupted");
                    e.printStackTrace();
                }
            }
        }
        Debug.Log("CapEventQueue: event queue thread exiting");
    }

    public synchronized void stopQueue() {
        if (!this.willExitGracefully.get()) {
            this.threadMustExit = true;
            if (this.workingThread != null) {
                this.xmlReq.InterruptRequest();
                this.workingThread.interrupt();
                this.workingThread = null;
            }
        }
    }
}
