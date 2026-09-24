package com.lumiyaviewer.lumiya.slproto.dispnames;

import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.dao.UserName;
import com.lumiyaviewer.lumiya.react.AsyncLimitsRequestHandler;
import com.lumiyaviewer.lumiya.react.RequestHandler;
import com.lumiyaviewer.lumiya.react.RequestQueue;
import com.lumiyaviewer.lumiya.react.ResultHandler;
import com.lumiyaviewer.lumiya.react.SimpleRequestHandler;
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit;
import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.caps.SLCaps;
import com.lumiyaviewer.lumiya.slproto.handler.SLMessageHandler;
import com.lumiyaviewer.lumiya.slproto.https.LLSDXMLRequest;
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDException;
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode;
import com.lumiyaviewer.lumiya.slproto.messages.UUIDNameReply;
import com.lumiyaviewer.lumiya.slproto.messages.UUIDNameRequest;
import com.lumiyaviewer.lumiya.slproto.modules.SLModule;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicBoolean;
import javax.annotation.Nonnull;

public class SLDisplayNameFetcher extends SLModule {
    private static final int MAX_BATCH_SIZE = 4;
    private final String capsURL;
    private final Runnable httpThreadRunnable;
    private final RequestHandler<UUID> requestHandler;
    private final RequestQueue<UUID, UserName> requestQueue;
    private final ResultHandler<UUID, UserName> resultHandler;
    private final AtomicBoolean threadMustExit;
    private final boolean useDisplayNames;
    private final UserManager userManager;
    private final Thread workingThread;
    private final LLSDXMLRequest xmlReq;

    public SLDisplayNameFetcher(SLAgentCircuit agentCircuit, SLCaps caps) {
        super(agentCircuit);
        this.threadMustExit = new AtomicBoolean(false);
        this.requestHandler = new AsyncLimitsRequestHandler(this.agentCircuit, new SimpleRequestHandler<UUID>() {
            @Override
            public void onRequest(@Nonnull UUID uuid) {
                UUIDNameRequest uuidNameRequest = new UUIDNameRequest();
                UUIDNameRequest.UUIDNameBlock uuidNameBlock = new UUIDNameRequest.UUIDNameBlock();
                uuidNameBlock.ID = uuid;
                uuidNameRequest.UUIDNameBlock_Fields.add(uuidNameBlock);
                while (uuidNameRequest.UUIDNameBlock_Fields.size() < 4 && SLDisplayNameFetcher.this.requestQueue != null && ((UUID) SLDisplayNameFetcher.this.requestQueue.getNextRequest()) != null) {
                    UUIDNameRequest.UUIDNameBlock uuidNameBlock2 = new UUIDNameRequest.UUIDNameBlock();
                    uuidNameBlock2.ID = uuid;
                    uuidNameRequest.UUIDNameBlock_Fields.add(uuidNameBlock2);
                }
                uuidNameRequest.isReliable = true;
                SLDisplayNameFetcher.this.SendMessage(uuidNameRequest);
            }
        }, false, 3, 15000L);
        this.httpThreadRunnable = new Runnable() {
            @Override
            public void run() {
                UUID nextRequest;
                RequestQueue<UUID, UserName> userNameRequestQueue = SLDisplayNameFetcher.this.userManager.getUserNameRequestQueue();
                HashSet hashSet = new HashSet();
                while (!SLDisplayNameFetcher.this.threadMustExit.get()) {
                    hashSet.clear();
                    try {
                        hashSet.add(userNameRequestQueue.waitForRequest());
                        while (hashSet.size() < 4 && (nextRequest = userNameRequestQueue.getNextRequest()) != null) {
                            hashSet.add(nextRequest);
                        }
                        SLDisplayNameFetcher.this.requestNamesHttp(hashSet, userNameRequestQueue);
                        Iterator it = hashSet.iterator();
                        while (it.hasNext()) {
                            userNameRequestQueue.returnRequest((UUID) it.next());
                        }
                        hashSet.clear();
                    } catch (InterruptedException e) {
                        Debug.Warning(e);
                    }
                }
                Iterator iterator = hashSet.iterator();
                while (iterator.hasNext()) {
                    userNameRequestQueue.returnRequest((UUID) iterator.next());
                }
            }
        };
        this.userManager = UserManager.getUserManager(agentCircuit.circuitInfo.agentID);
        this.requestQueue = this.userManager != null ? this.userManager.getUserNameRequestQueue() : null;
        if (caps.getCapability(SLCaps.SLCapability.GetDisplayNames) == null) {
            this.capsURL = null;
            this.workingThread = null;
            this.xmlReq = null;
            this.useDisplayNames = false;
            this.resultHandler = this.requestQueue != null ? this.requestQueue.attachRequestHandler(this.requestHandler) : null;
            return;
        }
        this.capsURL = caps.getCapability(SLCaps.SLCapability.GetDisplayNames);
        this.useDisplayNames = true;
        this.resultHandler = this.requestQueue != null ? this.requestQueue.getResultHandler() : null;
        this.xmlReq = new LLSDXMLRequest();
        this.workingThread = new Thread(this.httpThreadRunnable, "DisplayNameFetcher");
        this.workingThread.start();
    }

    public void requestNamesHttp(Set<UUID> set, RequestQueue<UUID, UserName> requestQueue) {
        StringBuilder append = new StringBuilder(this.capsURL).append('/');
        boolean z = true;
        for (UUID uuid : set) {
            Debug.Printf("UserName: Requesting name for %s over HTTP", uuid);
            if (z) {
                append.append('?');
            } else {
                append.append('&');
            }
            append.append("ids=").append(uuid.toString());
            z = false;
        }
        try {
            LLSDNode PerformRequest = this.xmlReq.PerformRequest(append.toString(), null);
            if (PerformRequest != null) {
                if (PerformRequest.keyExists("agents")) {
                    LLSDNode byKey = PerformRequest.byKey("agents");
                    for (int i = 0; i < byKey.getCount(); i++) {
                        LLSDNode byIndex = byKey.byIndex(i);
                        UUID asUUID = byIndex.byKey("id").asUUID();
                        UserName userName = new UserName(asUUID, byIndex.byKey("username").asString(), byIndex.byKey("display_name").asString(), false);
                        if (this.resultHandler != null) {
                            this.resultHandler.onResultData(asUUID, userName);
                        }
                        set.remove(asUUID);
                    }
                }
                if (PerformRequest.keyExists("bad_ids")) {
                    LLSDNode byKey2 = PerformRequest.byKey("bad_ids");
                    for (int j = 0; j < byKey2.getCount(); j++) {
                        UUID fromString = UUID.fromString(byKey2.byIndex(j).asString());
                        UserName userName2 = new UserName(fromString, null, null, true);
                        if (this.resultHandler != null) {
                            this.resultHandler.onResultData(fromString, userName2);
                        }
                        set.remove(fromString);
                    }
                }
            }
        } catch (LLSDException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void HandleCloseCircuit() {
        this.threadMustExit.set(true);
        if (this.xmlReq != null) {
            this.xmlReq.InterruptRequest();
        }
        if (this.workingThread != null) {
            this.workingThread.interrupt();
        }
        if (this.requestQueue != null) {
            this.requestQueue.detachRequestHandler(this.requestHandler);
        }
    }

    @SLMessageHandler
    public void HandleUUIDNameReply(UUIDNameReply uuidNameReply) {
        for (UUIDNameReply.UUIDNameBlock uuidNameBlock : uuidNameReply.UUIDNameBlock_Fields) {
            UUID uuid = uuidNameBlock.ID;
            String str = SLMessage.stringFromVariableOEM(uuidNameBlock.FirstName) + " " + SLMessage.stringFromVariableOEM(uuidNameBlock.LastName);
            UserName userName = new UserName(uuid, str, str, false);
            if (this.resultHandler != null) {
                this.resultHandler.onResultData(uuid, userName);
            }
        }
    }
}
