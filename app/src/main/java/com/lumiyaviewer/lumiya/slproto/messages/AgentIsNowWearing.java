package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * AgentIsNowWearing
 * (a.k.a. "Here's what I'm wearing now.")
 * viewer->sim->dataserver
 * reliable
 *
 * <p>Template: {@code AgentIsNowWearing Low 383 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class AgentIsNowWearing extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<WearableData> WearableData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block WearableData, Variable. */
    public static class WearableData {
        public UUID ItemID; // LLUUID
        public int WearableType; // U8
    }

    public AgentIsNowWearing() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.WearableData_Fields.size() * 17) + 37;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleAgentIsNowWearing(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 383 (AgentIsNowWearing).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x7F);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        byteBuffer.put((byte) this.WearableData_Fields.size());
        for (WearableData wearableData : this.WearableData_Fields) {
            packUUID(byteBuffer, wearableData.ItemID);
            packByte(byteBuffer, (byte) wearableData.WearableType);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            WearableData wearableData = new WearableData();
            wearableData.ItemID = unpackUUID(byteBuffer);
            wearableData.WearableType = unpackByte(byteBuffer) & 0xFF;
            this.WearableData_Fields.add(wearableData);
        }
    }
}
