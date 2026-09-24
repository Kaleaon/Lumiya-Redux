package com.lumiyaviewer.lumiya.slproto.modules;

import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit;
import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.caps.SLCaps;
import com.lumiyaviewer.lumiya.slproto.handler.SLMessageHandler;
import com.lumiyaviewer.lumiya.slproto.https.LLSDXMLRequest;
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDException;
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode;
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDXMLException;
import com.lumiyaviewer.lumiya.slproto.messages.UUIDNameReply;
import com.lumiyaviewer.lumiya.slproto.messages.UUIDNameRequest;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import com.lumiyaviewer.lumiya.utils.reqset.RequestListener;
import com.lumiyaviewer.lumiya.utils.reqset.WeakPriorityRequestSet;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class SLUserNameFetcher extends SLModule implements RequestListener {
    private static final int MAX_BATCH_SIZE = 4;
    private static final long REPLY_TIMEOUT = 10000;
    private final SLCaps caps;
    private final Condition hasNamesToFetch;
    private boolean isWaitingReply;
    private final Lock lock;
    private volatile boolean threadMustExit;
    private final Runnable threadRunnable;
    private final Object udpLock;
    private final UserManager userManager;
    private final WeakPriorityRequestSet<UUID> userNameRequests;
    private long waitingReplySince;
    private final Thread workingThread;
    private final LLSDXMLRequest xmlReq;

    public SLUserNameFetcher(SLAgentCircuit agentCircuit, SLCaps caps) {
        super(agentCircuit);
        this.lock = new ReentrantLock();
        this.hasNamesToFetch = this.lock.newCondition();
        this.udpLock = new Object();
        this.waitingReplySince = 0L;
        this.threadRunnable = new Runnable() {
            @Override
            public void run() {
                while (!SLUserNameFetcher.this.threadMustExit) {
                    while (SLUserNameFetcher.this.FetchSomeNamesOverHTTP()) {
                        // Drain all currently pending names before sleeping.
                    }
                    SLUserNameFetcher.this.lock.lock();
                    try {
                        SLUserNameFetcher.this.hasNamesToFetch.await();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                        return;
                    } finally {
                        SLUserNameFetcher.this.lock.unlock();
                    }
                }
            }
        };
        this.userManager = UserManager.getUserManager(agentCircuit.circuitInfo.agentID);
        this.caps = caps;
        this.threadMustExit = false;
        if (caps.getCapability(SLCaps.SLCapability.GetDisplayNames) != null) {
            this.xmlReq = new LLSDXMLRequest();
            this.workingThread = new Thread(this.threadRunnable, "DisplayNameFetcher");
            this.workingThread.start();
        } else {
            this.workingThread = null;
            this.xmlReq = null;
        }
        if (this.userManager == null) {
            this.userNameRequests = null;
        } else {
            this.userNameRequests = this.userManager.getUserNameRequests();
            this.userNameRequests.addListener(this);
        }
    }

    public boolean FetchSomeNamesOverHTTP() {
        String str;
        LLSDNode lsdNode;
        List<UUID> uuiDsToFetch = getUUIDsToFetch(4);
        if (uuiDsToFetch.isEmpty()) {
            return false;
        }
        String str2 = this.caps.getCapability(SLCaps.SLCapability.GetDisplayNames) + "/";
        Iterator<UUID> it = uuiDsToFetch.iterator();
        boolean z = true;
        while (true) {
            str = str2;
            if (it.hasNext()) {
                str2 = (z ? str + "?" : str + "&") + "ids=" + ((UUID) it.next()).toString();
                z = false;
            } else {
                break;
            }
        }
        try {
            lsdNode = this.xmlReq.PerformRequest(str, null);
        } catch (LLSDXMLException e) {
            e.printStackTrace();
            lsdNode = null;
        } catch (IOException e) {
            e.printStackTrace();
            lsdNode = null;
        }
        if (lsdNode != null) {
            try {
                if (lsdNode.keyExists("agents")) {
                    LLSDNode byKey = lsdNode.byKey("agents");
                    for (int i = 0; i < byKey.getCount(); i++) {
                        LLSDNode byIndex = byKey.byIndex(i);
                        UUID asUUID = byIndex.byKey("id").asUUID();
                        String asString = byIndex.byKey("display_name").asString();
                        String asString2 = byIndex.byKey("username").asString();
                        if (this.userManager != null) {
                            this.userManager.updateUserNames(asUUID, asString2, asString);
                            this.userNameRequests.completeRequest(asUUID);
                        }
                    }
                }
                if (lsdNode.keyExists("bad_ids")) {
                    LLSDNode byKey2 = lsdNode.byKey("bad_ids");
                    for (int j = 0; j < byKey2.getCount(); j++) {
                        UUID fromString = UUID.fromString(byKey2.byIndex(j).asString());
                        if (this.userManager != null) {
                            this.userManager.setUserBadUUID(fromString);
                            this.userNameRequests.completeRequest(fromString);
                        }
                    }
                }
            } catch (LLSDException e3) {
                e3.printStackTrace();
            }
        }
        return true;
    }

    private void FetchSomeNamesOverUDP() {
        List<UUID> uuiDsToFetch = getUUIDsToFetch(4);
        if (uuiDsToFetch.isEmpty()) {
            this.isWaitingReply = false;
            return;
        }
        UUIDNameRequest uuidNameRequest = new UUIDNameRequest();
        for (UUID uuid : uuiDsToFetch) {
            UUIDNameRequest.UUIDNameBlock uuidNameBlock = new UUIDNameRequest.UUIDNameBlock();
            uuidNameBlock.ID = uuid;
            uuidNameRequest.UUIDNameBlock_Fields.add(uuidNameBlock);
        }
        this.isWaitingReply = true;
        this.waitingReplySince = System.currentTimeMillis();
        uuidNameRequest.isReliable = true;
        SendMessage(uuidNameRequest);
    }

    private List<UUID> getUUIDsToFetch(int i) {
        UUID request;
        ArrayList arrayList = new ArrayList(i);
        if (this.userNameRequests != null) {
            while (arrayList.size() < i && (request = this.userNameRequests.getRequest()) != null) {
                arrayList.add(request);
            }
        }
        return arrayList;
    }

    @Override
    public void HandleCloseCircuit() {
        this.threadMustExit = true;
        if (this.xmlReq != null) {
            this.xmlReq.InterruptRequest();
        }
        if (this.workingThread != null) {
            this.workingThread.interrupt();
        }
        if (this.userNameRequests != null) {
            this.userNameRequests.removeListener(this);
        }
    }

    @SLMessageHandler
    public synchronized void HandleUUIDNameReply(UUIDNameReply uuidNameReply) {
        for (UUIDNameReply.UUIDNameBlock uuidNameBlock : uuidNameReply.UUIDNameBlock_Fields) {
            UUID uuid = uuidNameBlock.ID;
            String str = SLMessage.stringFromVariableOEM(uuidNameBlock.FirstName) + " " + SLMessage.stringFromVariableOEM(uuidNameBlock.LastName);
            if (this.userManager != null) {
                this.userManager.updateUserNames(uuid, str, str);
                this.userNameRequests.completeRequest(uuid);
            }
        }
        synchronized (this.udpLock) {
            this.isWaitingReply = false;
            FetchSomeNamesOverUDP();
        }
    }

    @Override
    public void onNewRequest() {
        if (this.workingThread != null) {
            this.lock.lock();
            try {
                this.hasNamesToFetch.signal();
                return;
            } finally {
                this.lock.unlock();
            }
        }
        synchronized (this.udpLock) {
            if (!this.isWaitingReply || System.currentTimeMillis() > this.waitingReplySince + REPLY_TIMEOUT) {
                FetchSomeNamesOverUDP();
            }
        }
    }
}
