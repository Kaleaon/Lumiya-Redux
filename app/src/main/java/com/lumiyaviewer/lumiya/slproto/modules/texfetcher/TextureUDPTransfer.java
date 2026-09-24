package com.lumiyaviewer.lumiya.slproto.modules.texfetcher;

import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.render.tex.TextureClass;
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit;
import com.lumiyaviewer.lumiya.slproto.SLCircuitInfo;
import com.lumiyaviewer.lumiya.slproto.messages.ImageData;
import com.lumiyaviewer.lumiya.slproto.messages.ImagePacket;
import com.lumiyaviewer.lumiya.slproto.messages.RequestImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class TextureUDPTransfer {
    private static final int MAX_RETRIES = 2;
    private static final long PACKET_TIMEOUT = 15000;
    public SLTextureFetchRequest fetchReq;
    private File outputFile;
    private FileOutputStream outputStream;
    private int packets;
    private int size;
    private boolean completed = false;
    private boolean headerReceived = false;
    private int nextExpectedPacket = 0;
    private int gotSize = 0;
    private int retries = 0;
    private long lastReceivedPacket = 0;
    private Map<Integer, byte[]> outOfOrderPackets = new HashMap();

    public TextureUDPTransfer(File file, SLTextureFetchRequest textureFetchRequest) {
        this.fetchReq = textureFetchRequest;
        this.outputFile = file;
    }

    private void HandleDataPacket(int i, byte[] bytes) {
        this.lastReceivedPacket = System.currentTimeMillis();
        if (!this.headerReceived || this.nextExpectedPacket != i) {
            this.outOfOrderPackets.put(Integer.valueOf(i), bytes);
            return;
        }
        HandleNextDataPacket(bytes);
        while (true) {
            byte[] remove = this.outOfOrderPackets.remove(Integer.valueOf(this.nextExpectedPacket));
            if (remove == null) {
                return;
            } else {
                HandleNextDataPacket(remove);
            }
        }
    }

    private void HandleNextDataPacket(byte[] bytes) {
        this.lastReceivedPacket = System.currentTimeMillis();
        try {
            if (this.nextExpectedPacket == 0 && this.outputStream == null) {
                this.outputStream = new FileOutputStream(this.outputFile);
            }
            if (this.outputStream != null) {
                this.outputStream.write(bytes);
            }
            this.gotSize += bytes.length;
            if (this.gotSize >= this.size) {
                this.outputStream.close();
                this.completed = true;
                Debug.Log("TextureUDP: completed download, size = " + this.gotSize);
            }
            this.nextExpectedPacket++;
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void HandleImageData(ImageData imageData) {
        this.lastReceivedPacket = System.currentTimeMillis();
        this.headerReceived = true;
        this.size = imageData.ImageID_Field.Size;
        this.packets = imageData.ImageID_Field.Packets;
        Debug.Log("TextureUDP: header received, size = " + this.size + ", packets = " + this.packets + ", initial size = " + imageData.ImageDataData_Field.Data.length);
        HandleDataPacket(0, imageData.ImageDataData_Field.Data);
    }

    public void HandleImagePacket(ImagePacket imagePacket) {
        HandleDataPacket(imagePacket.ImageID_Field.Packet, imagePacket.ImageData_Field.Data);
    }

    public boolean RetryTransfer(SLAgentCircuit agentCircuit, SLCircuitInfo circuitInfo) {
        this.retries++;
        if (this.retries > 2) {
            return false;
        }
        StartTransfer(agentCircuit, circuitInfo);
        return true;
    }

    public void StartTransfer(SLAgentCircuit agentCircuit, SLCircuitInfo circuitInfo) {
        Debug.Log("TextureUDP: starting transfer, image ID = " + this.fetchReq.textureID);
        this.lastReceivedPacket = System.currentTimeMillis();
        RequestImage requestImage = new RequestImage();
        requestImage.AgentData_Field.AgentID = circuitInfo.agentID;
        requestImage.AgentData_Field.SessionID = circuitInfo.sessionID;
        RequestImage.RequestImageData requestImageData = new RequestImage.RequestImageData();
        requestImageData.Image = this.fetchReq.textureID;
        requestImageData.DiscardLevel = 0;
        requestImageData.DownloadPriority = 1013000.0f;
        requestImageData.Packet = 0;
        requestImageData.Type = this.fetchReq.textureClass == TextureClass.Baked ? 1 : 0;
        requestImage.RequestImageData_Fields.add(requestImageData);
        requestImage.isReliable = true;
        agentCircuit.SendMessage(requestImage);
    }

    public File getOutputFile() {
        return this.outputFile;
    }

    public boolean hasStalled() {
        return System.currentTimeMillis() > this.lastReceivedPacket + PACKET_TIMEOUT;
    }

    public boolean isCompleted() {
        return this.completed;
    }
}
