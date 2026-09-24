package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * sim -> viewer
 * initiate upload. primarily used for uploading raw files.
 *
 * <p>Template: {@code InitiateDownload Low 403 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_initiate_download()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class InitiateDownload extends SLMessage {
    public AgentData AgentData_Field;
    public FileData FileData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
    }

    /** Block FileData, Single. */
    public static class FileData {
        public byte[] SimFilename; // Variable 1 - string
        public byte[] ViewerFilename; // Variable 1 - string
    }

    public InitiateDownload() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.FileData_Field = new FileData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.FileData_Field.SimFilename.length + 1 + 1 + this.FileData_Field.ViewerFilename.length + 20;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleInitiateDownload(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 403 (InitiateDownload).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x93);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packVariable(byteBuffer, this.FileData_Field.SimFilename, 1);
        packVariable(byteBuffer, this.FileData_Field.ViewerFilename, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.FileData_Field.SimFilename = unpackVariable(byteBuffer, 1);
        this.FileData_Field.ViewerFilename = unpackVariable(byteBuffer, 1);
    }
}
