package com.lumiyaviewer.lumiya.slproto.modules.texfetcher;

import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.render.tex.TexturePriority;
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit;
import com.lumiyaviewer.lumiya.slproto.caps.SLCaps;
import com.lumiyaviewer.lumiya.slproto.handler.SLMessageHandler;
import com.lumiyaviewer.lumiya.slproto.messages.ImageData;
import com.lumiyaviewer.lumiya.slproto.messages.ImageNotInDatabase;
import com.lumiyaviewer.lumiya.slproto.messages.ImagePacket;
import com.lumiyaviewer.lumiya.slproto.modules.SLIdleHandler;
import com.lumiyaviewer.lumiya.slproto.modules.SLModule;
import com.lumiyaviewer.lumiya.utils.PriorityBinQueue;
import java.io.File;
import java.util.ConcurrentModificationException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

public class SLTextureFetcher extends SLModule implements SLIdleHandler {
    private static final int MAX_UDP_TRANSFERS = 2;
    private String agentAppearanceService;
    private String capURL;
    private long lastCheckForStalls;
    private PriorityBinQueue<SLTextureFetchRequest> udpQueue;
    private Map<UUID, TextureUDPTransfer> udpTransfers;

    public SLTextureFetcher(SLAgentCircuit agentCircuit, SLCaps caps, String agentAppearanceService) {
        super(agentCircuit);
        this.capURL = null;
        this.agentAppearanceService = null;
        this.udpTransfers = new ConcurrentHashMap();
        this.udpQueue = new PriorityBinQueue<>(TexturePriority.values().length);
        this.lastCheckForStalls = 0L;
        this.agentAppearanceService = agentAppearanceService;
        this.capURL = caps.getTextureFetchURL();
        Debug.Log("TextureFetcher: capURL = " + this.capURL);
    }

    private synchronized void RunUDPQueue() {
        SLTextureFetchRequest poll;
        if (this.udpTransfers.size() < 2 && (poll = this.udpQueue.poll()) != null) {
            TextureUDPTransfer textureUDPTransfer = new TextureUDPTransfer(poll.destFile, poll);
            this.udpTransfers.put(poll.textureID, textureUDPTransfer);
            textureUDPTransfer.StartTransfer(this.agentCircuit, this.circuitInfo);
        }
    }

    public void BeginFetch(SLTextureFetchRequest textureFetchRequest2) {
        SLTextureFetchRequest textureFetchRequest = null;
        synchronized (this) {
            File file = textureFetchRequest2.destFile;
            if (file.exists()) {
                textureFetchRequest2.outputFile = file;
                textureFetchRequest = textureFetchRequest2;
            } else {
                this.udpQueue.add(textureFetchRequest2);
                RunUDPQueue();
            }
        }
        if (textureFetchRequest == null || textureFetchRequest.onFetchComplete == null) {
            return;
        }
        textureFetchRequest.onFetchComplete.OnTextureFetchComplete(textureFetchRequest2);
    }

    public synchronized void CancelFetch(SLTextureFetchRequest textureFetchRequest) {
        this.udpQueue.remove(textureFetchRequest);
        this.udpTransfers.remove(textureFetchRequest.textureID);
        RunUDPQueue();
    }

    @Override
    public void HandleCloseCircuit() {
        StopFetching();
        super.HandleCloseCircuit();
    }

    @SLMessageHandler
    public void HandleImageData(ImageData imageData) {
        SLTextureFetchRequest textureFetchRequest;
        synchronized (this) {
            textureFetchRequest = null;
            TextureUDPTransfer textureUDPTransfer = this.udpTransfers.get(imageData.ImageID_Field.ID);
            if (textureUDPTransfer != null) {
                textureUDPTransfer.HandleImageData(imageData);
                if (textureUDPTransfer.isCompleted()) {
                    this.udpTransfers.remove(imageData.ImageID_Field.ID);
                    textureFetchRequest = textureUDPTransfer.fetchReq;
                    RunUDPQueue();
                }
            }
        }
        if (textureFetchRequest == null || textureFetchRequest.onFetchComplete == null) {
            return;
        }
        textureFetchRequest.onFetchComplete.OnTextureFetchComplete(textureFetchRequest);
    }

    @SLMessageHandler
    public void HandleImageNotInDatabase(ImageNotInDatabase imageNotInDatabase) {
        SLTextureFetchRequest textureFetchRequest;
        synchronized (this) {
            Debug.Log("TextureUDP: Image not in database: " + imageNotInDatabase.ImageID_Field.ID);
            TextureUDPTransfer remove = this.udpTransfers.remove(imageNotInDatabase.ImageID_Field.ID);
            textureFetchRequest = remove != null ? remove.fetchReq : null;
        }
        if (textureFetchRequest != null && textureFetchRequest.onFetchComplete != null) {
            textureFetchRequest.onFetchComplete.OnTextureFetchComplete(textureFetchRequest);
        }
        RunUDPQueue();
    }

    @SLMessageHandler
    public void HandleImagePacket(ImagePacket imagePacket) {
        SLTextureFetchRequest textureFetchRequest;
        synchronized (this) {
            textureFetchRequest = null;
            TextureUDPTransfer textureUDPTransfer = this.udpTransfers.get(imagePacket.ImageID_Field.ID);
            if (textureUDPTransfer != null) {
                textureUDPTransfer.HandleImagePacket(imagePacket);
                if (textureUDPTransfer.isCompleted()) {
                    this.udpTransfers.remove(imagePacket.ImageID_Field.ID);
                    SLTextureFetchRequest fetchReq = textureUDPTransfer.fetchReq;
                    fetchReq.outputFile = textureUDPTransfer.getOutputFile();
                    RunUDPQueue();
                    textureFetchRequest = fetchReq;
                }
            }
        }
        if (textureFetchRequest == null || textureFetchRequest.onFetchComplete == null) {
            return;
        }
        textureFetchRequest.onFetchComplete.OnTextureFetchComplete(textureFetchRequest);
    }

    @Override
    public void ProcessIdle() {
        HashSet hashSet;
        HashSet hashSet2 = null;
        long currentTimeMillis = System.currentTimeMillis();
        if (currentTimeMillis >= this.lastCheckForStalls + 1000) {
            this.lastCheckForStalls = currentTimeMillis;
            try {
                Iterator<Map.Entry<UUID, TextureUDPTransfer>> it = this.udpTransfers.entrySet().iterator();
                while (it.hasNext()) {
                    Map.Entry<UUID, TextureUDPTransfer> entry = it.next();
                    if (!entry.getValue().hasStalled() || entry.getValue().RetryTransfer(this.agentCircuit, this.circuitInfo)) {
                        hashSet = hashSet2;
                    } else {
                        Debug.Printf("Cannot retry texture %s", entry.getKey().toString());
                        HashSet hashSet3 = hashSet2 == null ? new HashSet() : hashSet2;
                        hashSet3.add(entry.getKey());
                        hashSet = hashSet3;
                    }
                    hashSet2 = hashSet;
                }
                if (hashSet2 != null) {
                    Iterator iterator = hashSet2.iterator();
                    while (iterator.hasNext()) {
                        TextureUDPTransfer remove = this.udpTransfers.remove((UUID) iterator.next());
                        if (remove != null) {
                            SLTextureFetchRequest fetchReq = remove.fetchReq;
                            fetchReq.outputFile = null;
                            if (fetchReq.onFetchComplete != null) {
                                fetchReq.onFetchComplete.OnTextureFetchComplete(fetchReq);
                            }
                        }
                    }
                    RunUDPQueue();
                }
            } catch (ConcurrentModificationException e) {
                Debug.Warning(e);
            }
        }
    }

    public void StopFetching() {
        this.udpQueue.clear();
    }

    public void UpdatePriority(SLTextureFetchRequest textureFetchRequest) {
        this.udpQueue.updatePriority(textureFetchRequest);
    }

    public String getAgentAppearanceService() {
        return this.agentAppearanceService;
    }

    public String getCapURL() {
        return this.capURL;
    }
}
