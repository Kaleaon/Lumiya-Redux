package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * AcceptCallingCard
 *
 * <p>Template: {@code AcceptCallingCard Low 302 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_accept_callingcard()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class AcceptCallingCard extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<FolderData> FolderData_Fields = new ArrayList<>();
    public TransactionBlock TransactionBlock_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block FolderData, Variable. */
    public static class FolderData {
        public UUID FolderID; // LLUUID - place to put calling card.
    }

    /** Block TransactionBlock, Single. */
    public static class TransactionBlock {
        public UUID TransactionID; // LLUUID
    }

    public AcceptCallingCard() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.TransactionBlock_Field = new TransactionBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.FolderData_Fields.size() * 16) + 53;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleAcceptCallingCard(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 302 (AcceptCallingCard).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x2E);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.TransactionBlock_Field.TransactionID);
        byteBuffer.put((byte) this.FolderData_Fields.size());
        Iterator<?> it = this.FolderData_Fields.iterator();
        while (it.hasNext()) {
            packUUID(byteBuffer, ((FolderData) it.next()).FolderID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.TransactionBlock_Field.TransactionID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            FolderData folderData = new FolderData();
            folderData.FolderID = unpackUUID(byteBuffer);
            this.FolderData_Fields.add(folderData);
        }
    }
}
